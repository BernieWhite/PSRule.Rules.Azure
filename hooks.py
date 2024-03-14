# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

import json
import os
import re
import shutil
import logging
import mkdocs.config
import mkdocs.config.config_options
import mkdocs.plugins
import mkdocs.structure.files
import mkdocs.structure.nav
import mkdocs.structure.pages

from mkdocs.structure.files import File, Files
from mkdocs.structure.pages import Page

log = logging.getLogger(f"mkdocs.plugins.{__name__}")
rulesItem: mkdocs.structure.nav.Section = mkdocs.structure.nav.Section("Rules", [])

# Replace MAML headers
def replace_maml(markdown: str, page: mkdocs.structure.nav.Page, config: mkdocs.config.Config, files: mkdocs.structure.files.Files, **kwargs) -> str:
    markdown = markdown.replace("## about_PSRule_Azure_Configuration", "")
    markdown = markdown.replace("# PSRule_Azure_Configuration", "# Configuration options")

    if page.canonical_url.__contains__("/rules/") or page.canonical_url.__contains__("/baselines/") or page.canonical_url.__contains__("/concepts/") or page.canonical_url.__contains__("/commands/") or page.canonical_url.__contains__("/selectors/"):
        # Rules
        markdown = markdown.replace("## SYNOPSIS", "")
        markdown = markdown.replace("## DESCRIPTION", "## Description")
        markdown = markdown.replace("## RECOMMENDATION", "## Recommendation")
        markdown = markdown.replace("## NOTES", "## Notes")
        markdown = markdown.replace("## EXAMPLES", "## Examples")
        markdown = markdown.replace("## LINKS", "## Links")

        # Conceptual topics
        markdown = markdown.replace("## SHORT DESCRIPTION", "")
        markdown = markdown.replace("## LONG DESCRIPTION", "## Description")
        markdown = re.sub("(\#\#\s+(NOTE|KEYWORDS)\s+(.|\s{1,2}(?!\#))+)", "", markdown)

    if page.meta.get('link_users', 'false') != 'false':
        markdown = re.sub(r"\@([\w-]*)", r"[@\g<1>](https://github.com/\g<1>)", markdown)

    markdown = add_tags(markdown)

    if markdown.__contains__("<!-- EXPERIMENTAL -->"):
        page.meta['experimental'] = 'true'

    if markdown.__contains__("<!-- OBSOLETE -->"):
        page.meta['obsolete'] = 'true'

    if page.canonical_url.__contains__("/baselines/"):
        page.meta['template'] = 'reference.html'
        page.meta['generated'] = 'true'
        page.meta['type'] = 'baseline'
        if page.meta.get('experimental', 'false') == 'true':
            markdown = markdown.replace("<!-- EXPERIMENTAL -->", "!!! Experimental\r    This baseline is experimental and subject to change.")

        if page.meta.get('obsolete', 'false') == 'true':
            markdown = markdown.replace("<!-- OBSOLETE -->", "!!! Warning\r    This baseline is obsolete.\r    Consider switching to a newer baseline.")

        if page.meta.get('moduleVersion', 'None') != 'None':
            markdown = markdown.replace("<!-- TAGS -->", f"{_badge_for_version(page.meta['moduleVersion'], page, files)}<!-- TAGS -->")

        markdown = markdown.replace("```json\r", "```json title=\"Azure Template snippet\"\r")
        markdown = markdown.replace("```powershell\r", "```powershell title=\"Azure PowerShell snippet\"\r")
        markdown = markdown.replace("```bash\r", "```bash title=\"Azure CLI snippet\"\r")
        markdown = markdown.replace("```xml\r", "```xml title=\"API Management policy\"\r")

    if page.canonical_url.__contains__("/rules/") and page.meta.get("pillar", "None") != "None":
        page.meta['rule'] = page.canonical_url.split("/")[-2]
        read_metadata(page)

    if page.meta.get('rule', 'None') != 'None':
        markdown = markdown.replace('<!-- TAGS -->', '<nav class="md-tags"><rule/><ref/><level/></nav>\r<!-- TAGS -->')
        markdown = markdown.replace('<rule/>', '<span class="md-tag">' + page.meta['rule'] + '</span>')
        markdown = markdown.replace('<level/>', '<span class="md-tag">' + page.meta['level'] + '</span>')
        if page.meta.get('ref', 'None') != 'None':
            markdown = markdown.replace('<ref/>', '<span class="md-tag">' + page.meta['ref'] + '</span>')
        if page.meta.get('ref', 'None') == 'None':
            markdown = markdown.replace('<ref/>', '')

    if page.canonical_url.__contains__("/rules/") and page.meta.get("pillar", "None") != "None":
        markdown = markdown.replace("<!-- TAGS -->", "[:octicons-diamond-24: " + page.meta['pillar'] + "](module.md#" + page.meta['pillar'].lower().replace(" ", "-") + ")\r<!-- TAGS -->")

    if page.meta.get("resource", "None") != "None":
        markdown = markdown.replace("<!-- TAGS -->", " · [:octicons-container-24: " + page.meta['resource'] + "](resource.md#" + page.meta['resource'].lower().replace(" ", "-") + ")\r<!-- TAGS -->")

    if page.meta.get('source', 'None') != 'None':
        markdown = markdown.replace("<!-- TAGS -->", " · [:octicons-file-code-24: Rule](" + page.meta['source'] + ")\r<!-- TAGS -->")

    if page.meta.get('release', 'None') == 'preview':
        markdown = markdown.replace("<!-- TAGS -->", " · :octicons-beaker-24: Preview\r<!-- TAGS -->")

    if page.meta.get('ruleSet', 'None') != 'None':
        markdown = markdown.replace("<!-- TAGS -->", " · :octicons-tag-24: " + page.meta['ruleSet'] + "\r<!-- TAGS -->")

    return markdown.replace("<!-- TAGS -->", "")

def add_tags(markdown: str) -> str:
    lines = markdown.splitlines()
    converted = []
    foundHeader = False
    for l in lines:
        converted.append(l)
        if l.startswith("# ") and not foundHeader:
            converted.append("<!-- TAGS -->")
            foundHeader = True

    return "\r".join(converted)

def read_metadata(page: mkdocs.structure.nav.Page):
    file: str = os.path.join(os.path.dirname(page.file.abs_src_path), 'metadata.json')
    tags = []
    with open(file) as f:
        data = json.load(f)
        name = page.meta['rule']
        tags.append(name)
        if page.meta.get('rule', '') != '' and data.get(name, None) != None and data[name].get('Ref', None) != None and data[name]['Ref'].get('Name', None) != None:
            page.meta['ref'] = data[name]['Ref']['Name']
            tags.append(page.meta['ref'])

        if page.meta.get('rule', '') != '' and data.get(name, None) != None and data[name].get('Release', None) != None:
            page.meta['release'] = data[name]['Release']

        if page.meta.get('rule', '') != '' and data.get(name, None) != None and data[name].get('RuleSet', None) != None:
            page.meta['ruleSet'] = data[name]['RuleSet']

        if page.meta.get('rule', '') != '' and data.get(name, None) != None and data[name].get('Level', None) != None:
            page.meta['level'] = data[name]['Level']

        if page.meta.get('rule', '') != '' and data.get(name, None) != None and data[name].get('Synopsis', None) != None:
            description = data[name]['Synopsis']
            page.meta['description'] = description

        if page.meta.get('rule', '') != '' and data.get(name, None) != None and data[name].get('Source', None) != None:
            page.meta['source'] = data[name]['Source']


    page.meta['tags'] = tags


# Dynamically build reference nav
def build_reference_nav(nav: mkdocs.structure.nav.Navigation, config: mkdocs.config.Config, files: mkdocs.structure.files.Files) -> mkdocs.structure.nav.Navigation:
    build_rule_nav(nav, config, files)
    build_baseline_nav(nav, config, files)
    build_selector_nav(nav, config, files)
    return nav

# Build Rules list
def build_rule_nav(nav: mkdocs.structure.nav.Navigation, config: mkdocs.config.Config, files: mkdocs.structure.files.Files):
    children = []
    item: mkdocs.structure.nav.Section = mkdocs.structure.nav.Section("Rules", children)

    for f in files:
        if not f.is_documentation_page():
            continue

        if not f._get_stem().startswith("Azure."):
            continue

        if f._get_dest_path(False).__contains__("/rules/"):
            children.append(mkdocs.structure.pages.Page(f._get_stem(), f, config))

    referenceItem: mkdocs.structure.nav.Section = next(x for x in nav if x.title == "Reference")
    referenceItem.children.append(item)
    mkdocs.structure.nav._add_parent_links(nav)

# Build Baselines list
def build_baseline_nav(nav: mkdocs.structure.nav.Navigation, config: mkdocs.config.Config, files: mkdocs.structure.files.Files):
    children = []
    item: mkdocs.structure.nav.Section = mkdocs.structure.nav.Section("Baselines", children)

    for f in files:
        if not f.is_documentation_page():
            continue

        if f._get_dest_path(False).__contains__("/baselines/"):
            children.append(mkdocs.structure.pages.Page(f._get_stem(), f, config))

    referenceItem: mkdocs.structure.nav.Section = next(x for x in nav if x.title == "Reference")
    referenceItem.children.append(item)
    mkdocs.structure.nav._add_parent_links(nav)

# Build Selectors list
def build_selector_nav(nav: mkdocs.structure.nav.Navigation, config: mkdocs.config.Config, files: mkdocs.structure.files.Files):
    children = []
    item: mkdocs.structure.nav.Section = mkdocs.structure.nav.Section("Selectors", children)

    for f in files:
        if not f.is_documentation_page():
            continue

        if f._get_dest_path(False).__contains__("/selectors/"):
            children.append(mkdocs.structure.pages.Page(f._get_stem(), f, config))

    referenceItem: mkdocs.structure.nav.Section = next(x for x in nav if x.title == "Reference")
    referenceItem.children.append(item)
    mkdocs.structure.nav._add_parent_links(nav)

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

def _relative_uri(path: str, page: Page, files: Files) -> str:
    '''Get relative URI for a file including anchor.'''

    path, anchor, *_ = f"{path}#".split("#")
    path = _relative_path(files.get_file_from_path(path), page)
    return "#".join([path, anchor]) if anchor else path

def _relative_path(file: File, page: Page) -> str:
    '''Get relative source path for a file to a page.'''

    path = os.path.relpath(file.src_uri, page.file.src_uri)
    return os.path.sep.join(path.split(os.path.sep)[1:])
