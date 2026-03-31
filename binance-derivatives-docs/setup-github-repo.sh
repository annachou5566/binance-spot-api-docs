#!/bin/bash
# setup-github-repo.sh
# Script khởi tạo GitHub repo từ tài liệu Binance Derivatives API

REPO_NAME="binance-derivatives-docs"

echo "🚀 Khởi tạo Git repository: $REPO_NAME"
git init
git add .
git commit -m "feat: Tổng hợp tài liệu Binance Derivatives API (cập nhật 2026-03-05)

Bao gồm:
- USDⓈ-M Futures (REST + WebSocket API + Streams)
- COIN-M Futures (REST + WebSocket API + Streams)
- Portfolio Margin (UM/CM/Margin endpoints)
- Portfolio Margin Pro
- Options Trading (REST + Streams)
- Full CHANGELOG từ 2020-2026
- Yearly summaries (2023, 2024, 2025, 2026)
- Error codes reference"

echo ""
echo "✅ Xong! Để push lên GitHub:"
echo ""
echo "  1. Tạo repo mới tại https://github.com/new"
echo "  2. Chạy:"
echo ""
echo "     git remote add origin https://github.com/YOUR_USERNAME/$REPO_NAME.git"
echo "     git branch -M main"
echo "     git push -u origin main"
echo ""
echo "📂 Cấu trúc files:"
find . -not -path './.git/*' -not -name '.git' -type f | sort
