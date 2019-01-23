#!/usr/bin/env python3

"""Script to generate Alloy files from the template."""

import argparse
import jinja2
import re


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--name")
    parser.add_argument("--fc", action="store_true")
    parser.add_argument("--path", action="store_true")
    args = parser.parse_args()

    env = jinja2.Environment(
        loader=jinja2.FileSystemLoader(searchpath="./"),
        trim_blocks=True,
        lstrip_blocks=True,
    )
    template = env.get_template("template.als")
    result = template.render(name=args.name, fc=args.fc, path=args.path)
    result = re.sub(r"\n\n+", "\n\n", result)
    print(result)


if __name__ == "__main__":
    main()
