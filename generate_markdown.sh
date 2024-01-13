#!/bin/bash
# Generate markdown files from a list.txt file

read -p "Are you sure you want to generate the markdown files? [y/N] " -n 1 -r
printf "\nGenerating markdown files...\n"

# make sure docs directory exists
mkdir -p docs

# Read the file list.txt line by line
while read line; do
    # if line starts with a [D] create a directory and move into it
    if [[ $line = \[D\]* ]]; then
        dir="${line:3}"
        # convert to lowercase and replace spaces with underscores
        dir=$(echo "$dir" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')
        mkdir -p "$dir"
        cd "$dir"
        # write header to markdown file
        echo "# ${line:3}" >> ../README.md
    fi
    # if line starts with a [F] save the file name
    if [[ $line = \[F\]* ]]; then
        file="${line:3}"
        # convert to lowercase and replace spaces with underscores and add suffix
        file=$(echo "$file" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' | sed 's/$/.md/')
        # create the file from the template
        cp ../template.md "$file"
        # write link to file in markdown file
        echo "- [${line:3}]($dir/$file)" >> ../README.md
    fi
    # if line is empty, move up a directory
    [[ -z $line ]] && cd ..
done < list.txt

# copy all generated markdown files (without README.md) to the docs directory
find . -name "*.md" ! -name "README.md" -exec cp {} docs/ \;
