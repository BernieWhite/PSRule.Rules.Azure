# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# NOTES:
# This file implements replacement for shortcodes in markdown using MkDocs native hooks.

import logging
import os
import re
import json
import io

from mkdocs.config.defaults import MkDocsConfig
from mkdocs.structure.files import File, Files
from mkdocs.structure.pages import Page

log = logging.getLogger(f"mkdocs")

#
# Hooks
#

def on_page_markdown(markdown: str, *, page: Page, config: MkDocsConfig, files: Files) -> str:
    '''Hook on_page_markdown event.'''

    return security_note(external(module(markdown, page, config, files), page, config, files), page, config, files)

#
# Supporting functions
#

def module(markdown: str, page: Page, config: MkDocsConfig, files: Files) -> str:
    '''Replace module shortcodes in markdown.'''

    # Callback for regular expression replacement.
    def replace(match: re.Match) -> str:
        type, args = match.groups()
        args = args.strip()
        if type == "version":
            return _badge_for_version(args, page, files)
        elif type == "rule":
            return _badge_for_applies_to_rule(args, page, files)
        elif type == "config":
            return _badge_for_configuration(args, page, files)
        elif type == "resource":
            return ''

        raise RuntimeError(f"Unknown shortcode module:{type}")

    # Replace module shortcodes.
    return re.sub(
        r"<!-- module:(\w+)(.*?) -->",
        replace, markdown, flags = re.I | re.M
    )

def external(markdown: str, page: Page, config: MkDocsConfig, files: Files) -> str:
    '''Replace external shortcodes in markdown.'''

    # Callback for regular expression replacement.
    def replace(match: re.Match) -> str:
        type, args = match.groups()
        args = args.strip()
        if type == "avm":
            return _external_reference_avm(args, page)

        raise RuntimeError(f"Unknown shortcode external:{type}")

    # Replace external shortcodes.
    return re.sub(
        r"<!-- external:(\w+)(.*?) -->",
        replace, markdown, flags = re.I | re.M
    )

def security_note(markdown: str, page: Page, config: MkDocsConfig, files: Files) -> str:
    '''Replace security notes shortcodes in markdown.'''

    # Callback for regular expression replacement.
    def replace(match: re.Match) -> str:
        type, args = match.groups()
        args = args.strip()
        if type == "note":
            return _security_note_block(args, page, config)

        raise RuntimeError(f"Unknown shortcode security:{type}")

    # Replace security note shortcodes.
    return re.sub(
        r"<!-- security:(\w+)(.*?) -->",
        replace, markdown, flags = re.I | re.M
    )

def caf_note(markdown: str, page: Page, config: MkDocsConfig, files: Files) -> str:
    '''Replace CAF notes shortcodes in markdown.'''

    # Callback for regular expression replacement.
    def replace(match: re.Match) -> str:
        type, args = match.groups()
        args = args.strip()
        if type == "note":
            return _caf_note_block(args, page, config)

        raise RuntimeError(f"Unknown shortcode caf:{type}")

    # Replace CAF note shortcodes.
    return re.sub(
        r"<!-- caf:(\w+)(.*?) -->",
        replace, markdown, flags = re.I | re.M
    )

def _relative_uri(path: str, page: Page, files: Files) -> str:
    '''Get relative URI for a file including anchor.'''

    path, anchor, *_ = f"{path}#".split("#")
    path = _relative_path(files.get_file_from_path(path), page)
    return "#".join([path, anchor]) if anchor else path

def _relative_path(file: File, page: Page) -> str:
    '''Get relative source path for a file to a page.'''

    path = os.path.relpath(file.src_uri, page.file.src_uri)
    return os.path.sep.join(path.split(os.path.sep)[1:])

def _badge(icon: str, text: str = "") -> str:
    '''Create span block for a badge.'''

    classes = "badge"
    return "".join([
        f"<span class=\"{classes}\">",
        *([f"<span class=\"badge__icon\">{icon}</span>"] if icon else []),
        *([f"<span class=\"badge__text\">{text}</span>"] if text else []),
        f"</span>",
    ])

def _badge_for_version(text: str, page: Page, files: Files) -> str:
    '''Create badge for minimum version.'''

    # Get place in changelog.
    version = text
    major = version.split('.')[0]
    anchor = version.replace('.', '')
    path = f"changelog.md#{anchor}"

    icon = "octicons-milestone-24"
    href = _relative_uri(path, page, files)
    return _badge(
        icon = f"[:{icon}:]({href} 'Minimum version')",
        text = f"[{text}]({href})"
    )

def _badge_for_applies_to_rule(text: str, page: Page, files: Files) -> str:
    '''Create a badge for linking to a related rule.'''

    path = f"en/rules/{text}.md"

    icon = "octicons-link-24"
    href = _relative_uri(path, page, files)
    return _badge(
        icon = f"[:{icon}:]({href} 'Applies to rule')",
        text = f"[{text}]({href})"
    )

def _badge_for_configuration(text: str, page: Page, files: Files) -> str:
    '''Create a badge for linking to a configuration setting.'''

    config_type = text.split(' ')[0]
    config_value = text.split(' ')[1]
    path = ""
    if config_type == "rule":
        path = f"../../setup/configuring-rules.md#{config_value.lower()}"

    if config_type == "expand":
        path = f"../../setup/configuring-expansion.md#{config_value.lower()}"

    icon = "octicons-gear-24"
    href = path
    text = config_value
    return _badge(
        icon = f"[:{icon}:]({href} 'Applies to configuration setting')",
        text = f"[{text}]({href})"
    )

def _reference_block(style: str, title: str, text: str = "") -> str:
    '''Add an external reference block.'''

    lines = text.replace('\r\n', '\n').replace('\r', '\n').replace('\n', '\n    ').strip()
    return f"!!! {style} \"{title}\"\n    {lines}"

def _external_reference_avm(text: str, page: Page) -> str:
    '''Create a reference to AVM.'''

    # Extract the reference.
    # <path>[:<suggestedVersion>] [<params>,...]
    # avm/res/app/container-app:0.8 ingressExternal

    referenceParts = text.split(' ')
    pathParts = referenceParts[0].split(':')

    avm_path = pathParts[0]

    # Use the suggested version if set.
    avm_suggested_version = ''
    if len(pathParts) > 1:
        avm_suggested_version = pathParts[1]

    # Load latest version from cache.
    avm_latest_version = _avm_module_latest_tag(page, avm_path)

    # Add the reference syntax.
    syntax_body = f"\nTo reference the module, please use the following syntax:{_avm_code_reference(avm_path, None)}"

    # Add suggested version.
    suggestion_body = ''
    if avm_suggested_version != '':
        suggestion_body = f"\n\nFor example:{_avm_code_reference(avm_path, avm_suggested_version)}"

    # Add latest version.
    latest_body = ''
    if avm_latest_version != '':
        latest_body = f"\n\nTo use the latest version:{_avm_code_reference(avm_path, avm_latest_version)}"

    # Add AVM info.
    avm_links_body = f"\n\n---\n\n- [What is Azure Verified Modules?](https://aka.ms/avm)\n- [Usage and parameters for this module](https://github.com/Azure/bicep-registry-modules/tree/main/{avm_path})"

    return _reference_block(
        style = "Example",
        title = f"Configure with [Azure Verified Modules](https://github.com/Azure/bicep-registry-modules/tree/main/{avm_path})",
        text = f"A pre-validated module supported by Microsoft is available from the Azure Bicep public registry.{syntax_body}{suggestion_body}{latest_body}{avm_links_body}"
    )

def _avm_code_reference(path: str, version: str) -> str:
    '''Create a reference to Bicep public registry.'''

    if version == '' or version == None:
        version = '<version>'

    return f"\n\n```text\nbr/public:{path}:{version}\n```"

def _avm_module_latest_tag(page: Page, name: str) -> str:
    '''Load latest AVM module version details for any examples.'''

    log.debug(f"Loading avm module versions page: {page.abs_url}")

    latest = ''

    file: str = os.path.join(os.path.dirname(page.file.abs_src_path), 'avm_versions.json')
    with open(file) as f:
        data = json.load(f)
        if data.get(name, None) != None and data[name].get('Latest', None) != None:
            latest = data[name]['Latest']

    return latest

def _find_include_for_culture(config: MkDocsConfig, culture: str, path: str) -> str:
    '''Find the markdown include file for a specific culture.'''
    defaultCulture = config.theme.locale
    culture = culture.lower()

    # Get the repo root path.
    repo_root_dir = os.path.join(config.docs_dir, "..")

    # Find the include file for the culture.
    includeFile = f"{repo_root_dir}/includes/{culture}/{path}"
    fallbackFile = f"{repo_root_dir}/includes/{defaultCulture}/{path}"

    # If the path exists load the contents from disk.
    if os.path.exists(includeFile) and os.path.isfile(includeFile):
        return io.open(includeFile, 'r', encoding='utf-8').read()

    # If the path does not exist, try the default culture.
    if os.path.exists(fallbackFile) and os.path.isfile(fallbackFile):
        return io.open(fallbackFile, 'r', encoding='utf-8').read()

    raise RuntimeError(f"Unknown include '{path}' not found at '{includeFile}' or '{fallbackFile}'.")

def _get_culture_from_page(page: Page, config: MkDocsConfig) -> str:
    '''Get the culture from the page file path.'''

    culture = config.theme.locale
    if page.file.src_path.startswith('en'):
        culture = 'en'

    elif page.file.src_path.startswith('es'):
        culture = 'es'

    return culture


def _security_note_block(text: str, page: Page, config: MkDocsConfig) -> str:
    '''Create a security note block.'''

    culture = _get_culture_from_page(page, config)
    name = text.split(' ')[0]

    return _find_include_for_culture(config, culture, f"security-notes/{name}.md")


def _caf_note_block(text: str, page: Page, config: MkDocsConfig) -> str:
    '''Create a CAF note block.'''

    culture = _get_culture_from_page(page, config)
    name = text.split(' ')[0]

    return _find_include_for_culture(config, culture, f"caf-notes/{name}.md")
