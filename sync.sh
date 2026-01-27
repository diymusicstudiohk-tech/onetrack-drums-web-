#!/bin/bash
# STRICT Sync for Drum Lesson Records ONLY

VAULT_DIR="/Users/benzonkpchan/obsidian/personal"
WEB_CONTENT_DIR="/Users/benzonkpchan/onetrack-drums-web/content"
WEB_DIR="/Users/benzonkpchan/onetrack-drums-web"

echo "🚀 Syncing ONLY Student Records to Quartz..."

# 1. Clean up existing content to ensure strictness
rm -rf "$WEB_CONTENT_DIR/鼓班記錄"
rm -rf "$WEB_CONTENT_DIR/Recipes"
rm -f "$WEB_CONTENT_DIR"/*.md

# 2. Re-create directories
mkdir -p "$WEB_CONTENT_DIR/鼓班記錄"

# 3. Copy ONLY Student Records and their attachments
# Using rsync to copy the specific folder
rsync -av --delete --exclude='.DS_Store' "$VAULT_DIR/鼓班記錄/" "$WEB_CONTENT_DIR/鼓班記錄/"

# 4. Create a clean index.md
cat << 'EOF' > "$WEB_CONTENT_DIR/index.md"
# 🤖 Onetrack Studio 最新學鼓學生檔案

歡迎使用我們的在線記錄系統。

## 🥁 學生檔案
EOF

# Loop through students and add them to index
cd "$WEB_CONTENT_DIR/鼓班記錄"
for file in *.md; do
    if [[ "$file" != "index.md" ]]; then
        filename="${file%.md}"
        echo "- [[鼓班記錄/$filename|$filename]]" >> "$WEB_CONTENT_DIR/index.md"
    fi
done

echo -e "\n\n最後更新時間: $(date)" >> "$WEB_CONTENT_DIR/index.md"

# 5. Navigate back to web directory
cd "$WEB_DIR"

# 6. Git operations
git add .
# Force remove untracked files from git that were deleted from content/
git add -u
if git diff --staged --quiet; then
    echo "✅ No changes to sync."
else
    echo "📦 Committing changes..."
    git commit -m "Strict student-only sync: $(date)"
    echo "📤 Pushing to GitHub..."
    git push origin v4
    echo "🎉 Sync complete! Website will update in 1-2 minutes."
fi
