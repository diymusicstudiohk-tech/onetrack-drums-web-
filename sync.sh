#!/bin/bash
# Targeted Sync for Drum Lesson Records

SOURCE_DIR="/Users/benzonkpchan/obsidian/personal/鼓班記錄"
DEST_DIR="/Users/benzonkpchan/onetrack-drums-web/content/鼓班記錄"
WEB_DIR="/Users/benzonkpchan/onetrack-drums-web"

echo "🚀 Syncing Drum Lesson Records to Quartz..."

# 1. Ensure target directory exists
mkdir -p "$DEST_DIR"

# 2. Sync ONLY the 鼓班記錄 folder (including its attachments subfolder)
# -a: preserve attributes, -v: verbose, --delete: remove files at dest not at source
rsync -av --delete --exclude='.DS_Store' "$SOURCE_DIR/" "$DEST_DIR/"

# 3. Update index.md to list all students
cat << 'EOF' > "$WEB_DIR/content/index.md"
# 🤖 Onetrack Studio 最新學鼓學生檔案

歡迎使用我們的在線記錄系統。

EOF

# Loop through all students and add them to index
cd "$DEST_DIR"
for file in *.md; do
    if [[ "$file" != "index.md" && "$file" != "Viobe 的學鼓檔案.md" && "$file" != "Judy 學鼓檔案.md" && "$file" != "Hana 學鼓檔案.md" ]]; then
        # Handle cases where I might have missed specific files in the hardcoded list above
        :
    fi
    if [[ "$file" == *.md && "$file" != "index.md" ]]; then
        filename="${file%.md}"
        echo "- [[鼓班記錄/$filename|$filename]]" >> "$WEB_DIR/content/index.md"
    fi
done

echo -e "\n\n最後更新時間: $(date)" >> "$WEB_DIR/content/index.md"

# 4. Navigate back to web directory
cd "$WEB_DIR"

# 5. Git operations
git add .
if git diff --staged --quiet; then
    echo "✅ No changes to sync."
else
    echo "📦 Committing changes..."
    git commit -m "Targeted sync: $(date)"
    echo "📤 Pushing to GitHub..."
    git push origin v4
    echo "🎉 Sync complete! Website will update in 1-2 minutes."
fi
