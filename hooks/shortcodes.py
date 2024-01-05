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

log = logging.getLogger(f"mkdocs.plugins.{__name__}")

#
# Hooks
#

def on_page_markdown(markdown: str, *, page: Page, config: MkDocsConfig, files: Files) -> str:
    '''Hook on_page_markdown event.'''

    return module(markdown, page, config, files)

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

        raise RuntimeError(f"Unknown shortcode module:{type}")

    # Replace module shortcodes.
    return re.sub(
        r"<!-- module:(\w+)(.*?) -->",
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
