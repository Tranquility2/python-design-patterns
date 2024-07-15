import os
import shutil
from subprocess import run

CSS_HEADER = '<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">'

# Validate src directory exists
if not os.path.isdir("guide"):
    print("Error: guide directory does not exist")
    exit(1)

# Remove docs directory (if it exists)
shutil.rmtree("docs", ignore_errors=True)  # Safe removal

print("Generating HTML files")
print("---------------------")

# Make sure web directory exists
os.makedirs("docs", exist_ok=True)  # Create directory if missing

# Process Markdown files
for src_file in os.listdir("guide"):
    for subdir, _, files in os.walk(os.path.join("guide", src_file)):
        for filename in files:
            if not filename.endswith(".md"):
                continue

            src_path = os.path.join(subdir, filename)
            # Create directory in web directory without the guide directory
            dir_name = os.path.relpath(subdir, "guide")
            # Remove md extension from filename
            dest_file = os.path.splitext(filename)[0]
            # Create directory
            os.makedirs(os.path.join("docs", dir_name), exist_ok=True)

            # Extract header from the markdown file
            with open(src_path, "r") as f:
                header = f.readline().strip()

            # Remove #, * from the header
            header = header.replace("#", "").replace("*", "")

            # Print what is being generated
            print(f"Generating {header} using {src_path}")

            # Convert to HTML using pandoc
            command = ["pandoc", src_path, "-f", "markdown", "-t", "slidy", "-so", os.path.join("docs", dir_name, dest_file + ".html"), "--quiet"]
            run(command, check=True)

# Convert README.md to index.html
command = ["pandoc", "README.md", "-f", "markdown", "-t", "html", "-o", "docs/index.html"]
run(command, check=True)

# Replace links to HTML files and update from src to web directory
with open("docs/index.html", "r+") as f:
    content = f.read()
    content = content.replace(".md", ".html")
    content = content.replace("guide/", "")
    content = content.replace("", "")
    f.seek(0)
    f.write(content)

# Prefix CSS header to index.html
with open("docs/index.html", "r+") as f:
    content = f.read()
    content = CSS_HEADER + "\n" + content
    f.seek(0)
    f.write(content)

# Update image paths relative one level up
with open("docs/index.html", "r+") as f:
    content = f.read()
    content = content.replace('src="image', 'src="../image', 1)  # Replace only first occurrence
    f.seek(0)
    f.write(content)

print("Conversion complete!")
