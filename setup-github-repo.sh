#!/bin/bash
# setup-github-repo.sh
# Script khởi tạo GitHub repo từ các file đã tổng hợp

REPO_NAME="binance-spot-api-docs"

echo "🚀 Khởi tạo Git repository: $REPO_NAME"

git init
git add .
git commit -m "feat: Tổng hợp tài liệu Binance Spot API Changelog (cập nhật 2026-02-12)"

echo ""
echo "✅ Xong! Để push lên GitHub:"
echo ""
echo "  1. Tạo repo mới trên https://github.com/new"
echo "  2. Chạy lệnh sau:"
echo ""
echo "     git remote add origin https://github.com/YOUR_USERNAME/$REPO_NAME.git"
echo "     git branch -M main"
echo "     git push -u origin main"
echo ""
echo "📂 Cấu trúc repo:"
find . -not -path './.git/*' -not -name '.git' | sort
