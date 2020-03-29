#!/usr/bin/env python3
from sys import argv
from sys import stdin


def author_fix(authors):
    authors = authors.split("and")
    for i, author in enumerate(authors):
        author = author.split(",")
        author.reverse()
        first_name = author[0].strip()
        last_name = author[1].strip()
        # Account for multiple last names
        # Make LaTeX recognize them as one
        if " " in last_name:
            last_name = "{" + last_name + "}"
        authors[i] = first_name + " " + last_name

    # Construct new string
    new_author_str = ""
    for author in authors:
        new_author_str += author
        new_author_str += " and "
    new_author_str = new_author_str[:-4]
    return new_author_str


def main():
    if not stdin.isatty():
        authors = stdin.read()
    else:
        authors = argv[1]
    authors = author_fix(authors)
    print(authors)


if __name__ == "__main__":
    main()
