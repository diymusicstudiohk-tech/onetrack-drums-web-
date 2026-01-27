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

# Update index.md to list all students automatically
cat << 'EOF' > "$WEB_DIR/content/index.md"
# 🤖 Onetrack Studio 最新學鼓學生檔案

歡迎使用我們的在線記錄系統。

EOF

# Loop through all students and add them to index
cd "$DEST_DIR"
for file in *.md; do
    if [ "$file" != "index.md" ]; then
        filename="${file%.md}"
        echo "- [[鼓班記錄/$filename|$filename]]" >> "$WEB_DIR/content/index.md"
    fi
done

echo -e "\n\n最後更新時間: $(date)" >> "$WEB_DIR/content/index.md"

# Navigate back to web directory
cd "$WEB_DIR"

# Git operations
git add .
if git diff --staged --quiet; then
    echo "✅ No changes to sync."
else
    echo "📦 Committing changes..."
    git commit -m "Sync drum lesson records and update index: $(date)"
    echo "📤 Pushing to GitHub..."
    git push origin v4
    echo "🎉 Sync complete! Website will update in 1-2 minutes."
fi
