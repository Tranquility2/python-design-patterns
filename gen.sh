#!/bin/bash

# Read the file list.txt line by line
while read line; do
    # if line starts with a [D] create a directory and move into it
    if [[ $line = \[D\]* ]]; then
        dir="${line:3}"
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
