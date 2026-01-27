#!/bin/bash
# Full Sync (Safe) for Obsidian Vault to Quartz Website

VAULT_DIR="/Users/benzonkpchan/obsidian/personal"
WEB_CONTENT_DIR="/Users/benzonkpchan/onetrack-drums-web/content"
WEB_DIR="/Users/benzonkpchan/onetrack-drums-web"

echo "🚀 Syncing ALL SAFE Obsidian notes to Quartz..."

# 1. Sync EVERYTHING except sensitive files to avoid GitHub Push Protection blocks
# Excluded: .obsidian, .DS_Store, API-keys.md, login info, and personal shopping logs
rsync -av --delete \
  --exclude='.obsidian' \
  --exclude='.DS_Store' \
  --exclude='.trash' \
  --exclude='API-keys.md' \
  --exclude='Claude code CC login.md' \
  --exclude='個人購物記錄.md' \
  "$VAULT_DIR/" "$WEB_CONTENT_DIR/"

# 2. Update index.md to list all students in the 鼓班記錄 folder
cat << 'EOF' > "$WEB_CONTENT_DIR/index.md"
# 🤖 Onetrack Studio 最新學鼓學生檔案

歡迎使用我們的在線記錄系統。

## 🥁 學生檔案
EOF

# Loop through all students and add them to index
cd "$WEB_CONTENT_DIR/鼓班記錄"
for file in *.md; do
    if [[ "$file" != "index.md" ]]; then
        filename="${file%.md}"
        echo "- [[鼓班記錄/$filename|$filename]]" >> "$WEB_CONTENT_DIR/index.md"
    fi
done

echo -e "\n## 👨‍🍳 職人食譜" >> "$WEB_CONTENT_DIR/index.md"
cd "$WEB_CONTENT_DIR/Recipes"
for file in *.md; do
    filename="${file%.md}"
    echo "- [[Recipes/$filename|$filename]]" >> "$WEB_CONTENT_DIR/index.md"
done

echo -e "\n\n最後更新時間: $(date)" >> "$WEB_CONTENT_DIR/index.md"

# 3. Navigate back to web directory
cd "$WEB_DIR"

# 4. Git operations
git add .
if git diff --staged --quiet; then
    echo "✅ No changes to sync."
else
    echo "📦 Committing changes..."
    git commit -m "Full safe sync: $(date)"
    echo "📤 Pushing to GitHub..."
    git push origin v4
    echo "🎉 Sync complete! Website will update in 1-2 minutes."
fi
