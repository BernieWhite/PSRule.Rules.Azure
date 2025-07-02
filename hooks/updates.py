# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# NOTES:
# This file implements dynamic navigation for updates using MkDocs native hooks.

import logging
import re
import semver

from mkdocs.config.defaults import MkDocsConfig
from mkdocs.structure.files import Files
from mkdocs.structure.pages import Page
from mkdocs.structure.nav import Section, Navigation, _add_parent_links

log = logging.getLogger(f"mkdocs")

#
# Hooks
#


def on_nav(nav: Navigation, config: MkDocsConfig, files: Files) -> Navigation:
    '''Hook on_nav event.'''

    log.info("Adding updates to nav.")
    add_updates_to_nav(nav, config, files)

    return nav


def on_page_markdown(markdown: str, page: Page, config: MkDocsConfig, files: Files) -> str:
    '''Hook on_page_markdown event.'''
    if not is_update_page(page.canonical_url):
        return markdown

    return update_shortcodes(add_update_version_to_title(markdown, page), page)

#
# Supporting functions
#


def add_updates_to_nav(nav: Navigation, config: MkDocsConfig, files: Files):
    '''Add updates to the nav.'''

    section: Section = next(
        x for x in nav if x.title == "Updates")

    # Get the list of files that are update pages.
    children = []
    for f in files:
        if not f.is_documentation_page():
            continue

        # Check if the page already exists in section children that are Page.
        if any(isinstance(child, Page) and child.file.src_path == f.src_path for child in section.children):
            continue

        destPath = f._get_dest_path(False)
        if not is_update_page(destPath):
            continue

        # Preview the metadata to check if the page is a draft.
        p = Page(None, f, config)
        p.read_source(config)
        if p.meta.get('draft', False) == True:
            log.info(f"Skipping {f.src_path} because it is a draft.")
            continue

        children.append(f)

    # Sort by semver version string.
    children.sort(key=lambda x: semver.VersionInfo.parse(
        x.src_path.split('/')[-1].replace(".md", ".0").replace("v", "")), reverse=False)

    # Add the more recent 10 updates to the nav.
    for child in children[:10]:
        log.info(f"Added {child.src_path} to list of updates.")
        section.children.insert(0, Page(None, child, config))

    # _add_parent_links(nav)


def add_update_version_to_title(markdown: str, page: Page) -> str:
    '''Add version to title of update pages.'''

    if not is_update_page(page.canonical_url):
        return markdown

    version = page.meta.get('version', None)
    if not version:
        return markdown

    title = re.search(r"^# (.+)$", markdown, flags=re.M).group(1)
    page.title = F"{title} (version {version})"

    if not page.meta.get('description', None):
        page.meta['description'] = f"Learn what is new in PSRule for Azure release {version}."

    # Append the version number to the first H1 title of the page
    return markdown.replace(f"# {title}", f"# {title} (version {version})")


def update_shortcodes(markdown: str, page: Page) -> str:
    '''Update shortcodes in the markdown for update pages.'''

    if not is_update_page(page.canonical_url):
        return markdown

    # Callback for regular expression replacement.
    def replace(match: re.Match) -> str:
        type, args = match.groups()
        args = args.strip()
        if type == "fix":
            return _note_for_fix(args, page)

        raise RuntimeError(f"Unknown shortcode update:{type}")

    # Replace update shortcodes.
    return re.sub(
        r"<!-- update:(\w+)(.*?) -->",
        replace, markdown, flags = re.I | re.M
    )

def is_update_page(path: str) -> bool:
    return path.__contains__("updates/v")


def _note_for_fix(version: str, page: Page) -> str:
    '''Generate a note for a fix.'''

    if not version:
        return ""

    return f"[:octicons-diff-modified-24: Update **{version}** addresses these issues.](https://github.com/Azure/PSRule.Rules.Azure/issues?q=milestone%3Av{version}%20is%3Aissue)\n\n"
