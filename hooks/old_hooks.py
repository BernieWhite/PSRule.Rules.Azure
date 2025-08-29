# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

import logging
import os
import re

from mkdocs.config.defaults import MkDocsConfig
from mkdocs.structure.files import File, Files
from mkdocs.structure.pages import Page
from mkdocs.structure.nav import Section, Navigation, _add_parent_links
from mkdocs.utils import meta

log = logging.getLogger(f"mkdocs")
rulesItem: Section = Section("Rules", [])

# Dynamically build reference nav
def on_nav(nav: Navigation, config: MkDocsConfig, files: Files) -> Navigation:
    log.info("Adding rules to nav.")

    build_rule_nav(nav, config, files)
    build_baseline_nav(nav, config, files)
    build_selector_nav(nav, config, files)
    return nav

# Replace MAML headers
def on_page_markdown(markdown: str, page: Page, config: MkDocsConfig, files: Files) -> str:
    markdown = markdown.replace("## about_PSRule_Azure_Configuration", "")
    markdown = markdown.replace("# PSRule_Azure_Configuration", "# Configuration options")

    if is_rule_page(page) or page.canonical_url.__contains__("/baselines/") or page.canonical_url.__contains__("/concepts/") or page.canonical_url.__contains__("/commands/") or page.canonical_url.__contains__("/selectors/"):
        # Rules
        markdown = markdown.replace("## SYNOPSIS", "")
        markdown = markdown.replace("## DESCRIPTION", "## Description")
        markdown = markdown.replace("## RECOMMENDATION", "## Recommendation")
        markdown = markdown.replace("## NOTES", "## Notes")
        markdown = markdown.replace("## EXAMPLES", "## Examples")
        markdown = markdown.replace("## LINKS", "## Links")
        markdown = markdown.replace("## DEPRECATION\n\n", "")

        # Conceptual topics
        markdown = markdown.replace("## SHORT DESCRIPTION", "")
        markdown = markdown.replace("## LONG DESCRIPTION", "## Description")
        markdown = re.sub("(## +(NOTE|KEYWORDS) +(.| {1,2}(?!#))+)", "", markdown)

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

        markdown = markdown.replace("<!-- TAGS -->", f"{_badge_for_baseline_csv(markdown, page)}<!-- TAGS -->")

    if is_rule_page(page) and page.meta.get("pillar", "None") != "None":
        page.meta['rule'] = page.canonical_url.split("/")[-2]
        read_metadata(page)

    if page.meta.get('rule', None) != None:
        markdown = markdown.replace('<!-- TAGS -->', '<nav class="md-tags"><rule/><ref/><level/></nav>\r<!-- TAGS -->')
        markdown = markdown.replace('<rule/>', '<span class="md-tag">' + page.meta['rule'] + '</span>')
        markdown = markdown.replace('<level/>', '<span class="md-tag">' + page.meta['level'] + '</span>')
        if page.meta.get('ref', 'None') != 'None':
            markdown = markdown.replace('<ref/>', '<span class="md-tag">' + page.meta['ref'] + '</span>')
        if page.meta.get('ref', 'None') == 'None':
            markdown = markdown.replace('<ref/>', '')

        markdown = markdown.replace("```bicep\r", "```bicep title=\"Azure Bicep snippet\"\r")
        markdown = markdown.replace("```json\r", "```json title=\"Azure Template snippet\"\r")
        markdown = markdown.replace("```powershell\r", "```powershell title=\"Azure PowerShell snippet\"\r")
        markdown = markdown.replace("```bash\r", "```bash title=\"Azure CLI snippet\"\r")
        markdown = markdown.replace("```xml\r", "```xml title=\"API Management policy\"\r")

    if is_rule_page(page) and page.meta.get("pillar", "None") != "None":
        markdown = markdown.replace("<!-- TAGS -->", "[:octicons-diamond-24: " + page.meta['pillar'] + "](module.md#" + page.meta['pillar'].lower().replace(" ", "-") + ")\r<!-- TAGS -->")

    if page.meta.get("resource", "None") != "None":
        markdown = markdown.replace("<!-- TAGS -->", " · [:octicons-container-24: " + page.meta['resource'] + "](resource.md#" + page.meta['resource'].lower().replace(" ", "-") + ")\r<!-- TAGS -->")

    if page.meta.get('source', 'None') != 'None':
        markdown = markdown.replace("<!-- TAGS -->", " · [:octicons-file-code-24: Rule](" + page.meta['source'] + ")\r<!-- TAGS -->")

    if page.meta.get('release', 'None') == 'preview':
        markdown = markdown.replace("<!-- TAGS -->", " · :octicons-beaker-24: Preview\r<!-- TAGS -->")

    if page.meta.get('ruleSet', 'None') != 'None':
        markdown = markdown.replace("<!-- TAGS -->", " · :octicons-tag-24: " + page.meta['ruleSet'] + "\r<!-- TAGS -->")

    if page.meta.get('severity', 'None') != 'None':
        markdown = markdown.replace("<!-- TAGS -->", " · :octicons-bell-24: " + page.meta['severity'] + "\r<!-- TAGS -->")

    return markdown.replace("<!-- TAGS -->", "")

def is_rule_page(page: Page) -> bool:
    '''Check if the page is a rule page.'''

    if page.canonical_url.__contains__('/rules/') and not page.canonical_url.__contains__('/contribute/'):
        return True

    return False

def is_deprecated_page(page: Page) -> bool:
    '''Check if the page is deprecated.'''

    if page.meta.get('deprecated', 'false') != 'false':
        return True

    return False

def is_rule_dest_path(dest_path: str) -> bool:
    '''Check if the destination path is a rule page.'''

    if dest_path.__contains__('/rules/') and not dest_path.__contains__('/contribute/'):
        return True

    return False

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

def read_metadata(page: Page):
    meta = page.__annotations__['__psrule__']
    name = meta.get('rule', None)
    if name == None:
      return

    tags = []

    page.meta['rule'] = name
    tags.append(name)

    if meta.get('ref', None) != None:
        page.meta['ref'] = meta['ref']
        tags.append(meta['ref'])

    if meta.get('release', None) != None:
        page.meta['release'] = meta['release']

    if meta.get('ruleSet', None) != None:
        page.meta['ruleSet'] = meta['ruleSet']

    if meta.get('level', None) != None:
        page.meta['level'] = meta['level']

    if meta.get('description', None) != None:
        page.meta['description'] = meta['description']

    if meta.get('source', None) != None:
        page.meta['source'] = meta['source']

    page.meta['tags'] = tags


# Build Rules list
def build_rule_nav(nav: Navigation, config: MkDocsConfig, files: Files):
    children = []
    item: Section = Section("Rules", children)

    for f in files:
        if not f.is_documentation_page():
            continue

        if not f._get_stem().startswith("Azure."):
            continue

        # Deprecated rules are not included in the nav.
        meta = _load_meta(f)
        if meta.get('deprecated', 'false') != 'false':
            continue

        if is_rule_dest_path(f._get_dest_path(False)):
            children.append(Page(f._get_stem(), f, config))

    referenceItem: Section = next(x for x in nav if x.title == "Reference")
    referenceItem.children.append(item)
    _add_parent_links(nav)

# Build Baselines list
def build_baseline_nav(nav: Navigation, config: MkDocsConfig, files: Files):
    children = []
    item: Section = Section("Baselines", children)

    for f in files:
        if not f.is_documentation_page():
            continue

        if f._get_dest_path(False).__contains__("/baselines/"):
            children.append(Page(f._get_stem(), f, config))

    referenceItem: Section = next(x for x in nav if x.title == "Reference")
    referenceItem.children.append(item)
    _add_parent_links(nav)

# Build Selectors list
def build_selector_nav(nav: Navigation, config: MkDocsConfig, files: Files):
    children = []
    item: Section = Section("Selectors", children)

    for f in files:
        if not f.is_documentation_page():
            continue

        if f._get_dest_path(False).__contains__("/selectors/"):
            children.append(Page(f._get_stem(), f, config))

    referenceItem: Section = next(x for x in nav if x.title == "Reference")
    referenceItem.children.append(item)
    _add_parent_links(nav)

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

def _badge_for_baseline_csv(markdown: str, page: Page) -> str:
    '''Add CSV download link to baseline markdown.'''

    log.debug(f"Adding CSV download link for baseline page: {page.file.src_path}")

    # Extract baseline name from file path (e.g., en/baselines/Azure.GA_2025_06.md -> Azure.GA_2025_06)
    baseline_name = os.path.splitext(os.path.basename(page.file.src_path))[0]
    csv_filename = f"{baseline_name}.csv"

    icon = "octicons-desktop-download-24"
    return _badge(
        icon = f"[:{icon}:]({csv_filename} 'CSV')",
        text = f"[Download CSV]({csv_filename})"
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

def _load_meta(file) -> dict[str, any]:
    '''Read load metadata from frontmatter in a file.'''

    try:
        with open(file.abs_src_path, encoding="utf-8-sig", errors="strict") as f:
            source = f.read()
        _, file_meta = meta.get_data(source)
        return file_meta
    except OSError:
        log.error(f"File not found: {file.src_path}")
        raise
    except ValueError:
        log.error(f"Encoding error reading file: {file.src_path}")
        raise
