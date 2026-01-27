#!/bin/bash
# Sync Obsidian Drum Lesson Records to Quartz Website

SOURCE_DIR="/Users/benzonkpchan/obsidian/personal/鼓班記錄"
DEST_DIR="/Users/benzonkpchan/onetrack-drums-web/content/鼓班記錄"
WEB_DIR="/Users/benzonkpchan/onetrack-drums-web"

echo "🚀 Syncing Obsidian files to Quartz..."

# Ensure target directory exists
mkdir -p "$DEST_DIR"

# Copy files (only if changed)
cp -R "$SOURCE_DIR/" "$DEST_DIR/"

# Navigate to web directory
cd "$WEB_DIR"

# Git operations
git add .
if git diff --staged --quiet; then
    echo "✅ No changes to sync."
else
    echo "📦 Committing changes..."
    git commit -m "Sync drum lesson records from Obsidian: $(date)"
    echo "📤 Pushing to GitHub..."
    git push origin v4
    echo "🎉 Sync complete! Website will update in 1-2 minutes."
fi
