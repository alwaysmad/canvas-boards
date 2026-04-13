#!/bin/bash

# Updated to your actual directory
cd ~/Documents/canvas_exports || { echo "Directory not found"; exit 1; }

# Check if there are any changes to commit
if [ -z "$(git status --porcelain)" ]; then
    echo "No changes detected. Everything is already up to date."
    exit 0
fi

# Add and commit
git add .
git commit -m "Canvas update: $(date +'%Y-%m-%d %H:%M')"

# Push and check for success
if git push origin main; then
    echo "Push successful. Your canvases will be updated on GitHub Pages in ~1-2 minutes."
else
    echo "Error: Git push failed. Check your connection or repository settings."
    exit 1
fi
