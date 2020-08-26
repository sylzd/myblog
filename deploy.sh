#!/bin/sh

# If a command fails then the deploy stops
set -e

#printf "\033[0;32mGit push blog to GitHub...\033[0m\n"
#git add .
#git commit -am "add blog"
#git push

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo -t even # if using a theme, replace with `hugo -t <YOURTHEME>`

#rsync -av /Users/lzd/Dropbox/blog/content/post /Users/lzd/Dropbox/blog/public/post

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
