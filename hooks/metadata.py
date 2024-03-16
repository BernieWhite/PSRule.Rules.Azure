# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# NOTES:
# This file implements loading of external metadata for pages.

import logging
import os
import json

from mkdocs.config.defaults import MkDocsConfig
from mkdocs.structure.files import File, Files
from mkdocs.structure.pages import Page

log = logging.getLogger(f"mkdocs")

#
# Hooks
#

def on_pre_page(page: Page, config: MkDocsConfig, files: Files) -> Page:
    '''Hook on_pre_page event.'''

    return load_metadata(page)



#
# Supporting functions
#

def load_metadata(page: Page) -> Page:
    '''Load built metadata for a page from JSON.'''

    if page.canonical_url.__contains__('/rules/'):
        name = page.canonical_url.split("/")[-2]
        if name != None:
          return read_metadata(page, name)

    return page


def read_metadata(page: Page, name: str) -> Page:
    '''Read the metadata for a rule.'''

    log.debug(f"Loading metadata for page: {page.abs_url}")

    meta = {}
    meta['rule'] = name

    file: str = os.path.join(os.path.dirname(page.file.abs_src_path), 'metadata.json')
    with open(file) as f:
        data = json.load(f)
        if data.get(name, None) != None and data[name].get('Ref', None) != None and data[name]['Ref'].get('Name', None) != None:
            meta['ref'] = data[name]['Ref']['Name']

        if data.get(name, None) != None and data[name].get('Release', None) != None:
            meta['release'] = data[name]['Release']

        if data.get(name, None) != None and data[name].get('RuleSet', None) != None:
            meta['ruleSet'] = data[name]['RuleSet']

        if data.get(name, None) != None and data[name].get('Level', None) != None:
            meta['level'] = data[name]['Level']

        if data.get(name, None) != None and data[name].get('Synopsis', None) != None:
            description = data[name]['Synopsis']
            meta['description'] = description

        if data.get(name, None) != None and data[name].get('Source', None) != None:
            meta['source'] = data[name]['Source']

        if data.get(name, None) != None and data[name].get('Alias', None) != None and len(data[name]['Alias']) > 0:
            log.debug(f"Found page alias {data[name]['Alias']} for: {page.abs_url}")
            aliases = []
            for alias in data[name]['Alias']:
                aliases.append(alias)

            meta['alias'] = aliases

    page.__annotations__['__psrule__'] = meta
    return page
