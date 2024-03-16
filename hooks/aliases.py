# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# NOTES:
# This file implements replacement for shortcodes in markdown using MkDocs native hooks.

import logging
import os

from mkdocs.config.defaults import MkDocsConfig
from mkdocs.structure.files import File, Files
from mkdocs.structure.pages import Page

log = logging.getLogger(f"mkdocs")
rule_redirects = []

RULE_REDIRECT_TEMPLATE = """
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Redirecting...</title>
    <link rel="canonical" href="{url}">
    <meta name="robots" content="noindex">
    <script>var anchor=window.location.hash.substr(1);location.href="{url}"+(anchor?"#"+anchor:"")</script>
    <meta http-equiv="refresh" content="0; url={url}">
</head>
<body>
Redirecting...
</body>
</html>
"""

#
# Hooks
#

def on_page_markdown(markdown: str, page: Page, config: MkDocsConfig, files: Files) -> str:
    '''Hook on_page_markdown event.'''

    map_rule_redirects(page)
    return markdown

def on_post_build(config: MkDocsConfig):
    '''Hook on_post_build event.'''

    return generate_rule_redirects(config)



#
# Supporting functions
#

def map_rule_redirects(page: Page):
    '''Maps rule pages that has aliases and will require a redirect.'''

    if page.__annotations__.get('__psrule__', None) != None and page.__annotations__['__psrule__'].get('alias', None) != None:
        aliases = page.__annotations__['__psrule__']['alias']
        rule = page.__annotations__['__psrule__']['rule']

        for alias in aliases:
          if alias != None:
            log.warning(f"Mapping rule redirect: {alias} -> {rule}")
            rule_redirects.append(
                {
                  "url": page.url,
                  "rule": rule,
                  "alias": alias
                }
            )

def generate_rule_redirects(config: MkDocsConfig):
    '''Create redirects for rules.'''

    for redirect in rule_redirects:
        url = redirect['url']
        rule = redirect['rule']
        alias = redirect['alias']

        old_path = f"{url.replace(rule, alias)}/index.html"
        new_path = f"../{rule}/"

        write_redirect_html(config["site_dir"], old_path, new_path)


def write_redirect_html(site_dir: str, old_path: str, new_path: str):
    '''Add redirects.'''

    # Determine all relevant paths.
    old_path_abs = os.path.join(site_dir, old_path)
    old_dir = os.path.dirname(old_path)
    old_dir_abs = os.path.dirname(old_path_abs)

    # Create parent directories if they don't exist.
    if not os.path.exists(old_dir_abs):
        log.debug(f"Creating directory '{old_dir}'")
        os.makedirs(old_dir_abs)

    # Write the HTML redirect file.
    log.debug(f"Creating redirect: '{old_path}' -> '{new_path}'")
    content = RULE_REDIRECT_TEMPLATE.format(url=new_path)
    with open(old_path_abs, "w", encoding="utf-8") as f:
        f.write(content)
