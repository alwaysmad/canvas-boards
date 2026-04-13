#!/bin/bash

# Ensure the script runs in the correct directory regardless of where you call it from
cd /home/pasha/Documents/canvas_exports || { echo "Directory not found"; exit 1; }

# Check if there are any changes to commit
if [ -z "$(git status --porcelain)" ]; then
    echo "No changes detected. Everything is already up to date."
    exit 0
fi

# Add all changed, deleted, and new files
git add .

# Commit with a timestamp
git commit -m "Canvas update: $(date +'%Y-%m-%d %H:%M')"

# Push to the main branch
git push origin main

echo "Push successful. Your canvases will be updated on GitHub Pages in ~1-2 minutes."
