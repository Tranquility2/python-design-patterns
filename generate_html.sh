#!/bin/bash
# Generate html files from a markdown files in docs directory in the web directory

CSS_HEADER='<link rel="stylesheet" href="https:\/\/www\.w3schools\.com\/w3css\/4\/w3\.css">'

# validate src directory exists
if [ ! -d "guide" ]; then
    echo "Error: guide directory does not exist"
    exit 1
fi

rm -rf docs
echo "Generating HTML files"
echo "---------------------"

# make sure web directory exists
mkdir -p docs

# Read the files in guide directory
for src_file in guide/*/*.md; do
    # create directory in web directory without the guide directory
    dir=$(dirname "${src_file#guide/}")
    # remove md extension from filename
    dest_file="${src_file%.md}"
    # create directory
    mkdir -p "docs/$dir"
    # extrect the header from the markdown file
    header=$(head -n 1 "$src_file")
    # remove #, * from the header
    header=$(echo "$header" | sed 's/#//g' | sed 's/\*//g')
    # remove prefix and suffix spaces
    header=$(echo "$header" | sed 's/^[ \t]*//;s/[ \t]*$//')
    # print what is being generated
    echo "Generating $header using $src_file"
    # convert to html
    pandoc "$src_file" -f markdown -t slidy -so "docs/${dest_file#guide/}.html" --quiet
done

# convert README.md to index.html basic html
pandoc README.md -f markdown -t html -o docs/index.html
# replace links to html files and update from src to web directory
sed -i 's/\.md/\.html/g' docs/index.html
# remove guide directory from links
sed -i 's/guide\///g' docs/index.html
# remove any line in index.html that contains the char 🔗
sed -i '/🔗/d' docs/index.html
# prefix css header to index.html
sed -i "1s/^/${CSS_HEADER}\n/" docs/index.html
# update images paths releative one level up
sed -i 's/src="image/src="\.\.\/image/g' docs/index.html
