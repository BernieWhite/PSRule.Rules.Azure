# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# NOTES:
# This file implements replacement for shortcodes in markdown using MkDocs native hooks.

import logging
import os
import re

from mkdocs.config.defaults import MkDocsConfig
from mkdocs.structure.files import File, Files
from mkdocs.structure.pages import Page

log = logging.getLogger(f"mkdocs")

#
# Hooks
#

def on_page_markdown(markdown: str, *, page: Page, config: MkDocsConfig, files: Files) -> str:
    '''Hook on_page_markdown event.'''

    return external(module(markdown, page, config, files), page, config, files)

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
            return _external_reference_avm(args)

        raise RuntimeError(f"Unknown shortcode external:{type}")

    # Replace external shortcodes.
    return re.sub(
        r"<!-- external:(\w+)(.*?) -->",
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
    path = f"CHANGELOG-{major}.md#{anchor}"

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

def _external_reference_avm(text: str) -> str:
    '''Create a reference to AVM.'''

    avm_path = text.split(' ')[0]

    return _reference_block(
        style = "Example",
        title = f"Configure with [Azure Verified Modules](https://github.com/Azure/bicep-registry-modules/tree/main/{avm_path})",
        text = f"A pre-built module is avilable on the Azure Bicep public registry.\nTo reference the module, please use the following syntax:\n\n```text\nbr/public:{avm_path}:<version>\n```"
    )
