# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# NOTES:
# This file implements generation of samples TOC.

import logging
import os
import re

from mkdocs.config.defaults import MkDocsConfig
from mkdocs.structure.files import Files
from mkdocs.structure.pages import Page

log = logging.getLogger(f"mkdocs")

#
# Hooks
#

def on_pre_build(config: MkDocsConfig):
    '''Hook on_pre_build event.'''

    return generate_samples_toc_fragment(config)

def on_page_markdown(markdown: str, *, page: Page, config: MkDocsConfig, files: Files) -> str:
    '''Hook on_page_markdown event.'''

    return samples_shortcode(markdown, page, config, files)

#
# Supporting functions
#

def generate_samples_toc_fragment(config: MkDocsConfig):
    '''Generate a markdown fragment that will be injected into files containing a short code.'''

    # Get the samples directory which is in a parent directory.
    repo_root_dir = os.path.join(config.docs_dir, "..")
    samples_dir = os.path.join(repo_root_dir, "samples", "rules")

    # Get the base repo URI.
    base_repo_uri = config.repo_url
    samples_repo_uri = f"{base_repo_uri}tree/main/samples/rules"

    # Generate the TOC fragment, each sample exists as a README.md file in a subdirectory.
    toc = []
    for root, dirs, _ in os.walk(samples_dir):
        for dir in dirs:
            if dir == "common":
                continue

            current_sample_dir = os.path.join(root, dir)
            title = ""
            description = []
            author = ""
            block = "none"

            # Read the file to get the title and lines until the first empty line.
            with open(os.path.join(current_sample_dir, "README.md"), "r") as f:

                # Read annotations and header.
                for line in f:
                    if (block == "none" or block == "metadata") and line.strip() == "---":
                        if block == "none":
                            block = "metadata"
                        elif block == "metadata":
                            block = "header"

                        continue

                    if block == "metadata" and line.startswith("author:") and line.strip("author:").strip() != "":
                        author = line.strip("author:").strip()
                        author = f"@{author}"
                        continue

                    if block == "metadata":
                        continue

                    if block == "header" or line.startswith("# "):
                        if line.startswith("# "):
                            title = line.strip("# ").strip()
                            block = "header"
                            continue

                        if line.strip() == "":
                            continue

                        # Keep reading until the first H2 heading.
                        if line.startswith("## "):
                            break

                        description.append(line.strip())

            # Write the TOC entry as a row in a markdown table.
            toc.append(f"| [{title}]({'/'.join([samples_repo_uri, dir])}) | {' '.join(description)} | {author} |")

    # Write the TOC to a markdown file in a table with title and description.
    toc_file = os.path.join(repo_root_dir, "out", "samples_toc.md")
    with open(toc_file, "w") as f:
        f.write("| Title | Description | Author |\n")
        f.write("| ----- | ----------- | ------ |\n")
        for entry in toc:
            f.write(f"{entry}\n")

def samples_shortcode(markdown: str, page: Page, config: MkDocsConfig, files: Files) -> str:
    '''Replace samples shortcodes in markdown.'''

    # Callback for regular expression replacement.
    def replace(match: re.Match) -> str:
        type, args = match.groups()
        args = args.strip()
        if type == "rules":
            return _samples_rules_fragment(args, page, config, files)

        raise RuntimeError(f"Unknown shortcode samples:{type}")

    # Replace samples shortcodes.
    return re.sub(
        r"<!-- samples:(\w+)(.*?) -->",
        replace, markdown, flags = re.I | re.M
    )

def _samples_rules_fragment(args: str, page: Page, config: MkDocsConfig, files: Files) -> str:
    '''Replace samples shortcode with rules fragment.'''

    # Get the TOC fragment from the file.
    toc_file = os.path.join(config.docs_dir, "..", "out", "samples_toc.md")
    with open(toc_file, "r") as f:
        return f.read()
