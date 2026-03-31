# 📖 Binance Derivatives API Docs – Tổng hợp tài liệu

> Repo này tổng hợp và tổ chức lại toàn bộ tài liệu từ [Binance Derivatives API](https://developers.binance.com/docs/derivatives), bao gồm USDⓈ-M Futures, COIN-M Futures, Portfolio Margin, Portfolio Margin Pro và Options Trading.

**Cập nhật lần cuối:** 2026-03-05

---

## 📂 Cấu trúc thư mục

```
binance-derivatives-docs/
├── README.md                          ← File này
├── CHANGELOG.md                       ← Toàn bộ changelog (2020–2026)
├── setup-github-repo.sh               ← Script khởi tạo Git
│
├── usds-margined-futures/
│   ├── general-info.md                ← Thông tin chung, auth, rate limits
│   ├── endpoints-rest.md              ← Danh sách toàn bộ REST endpoints
│   ├── endpoints-websocket-api.md     ← Danh sách WebSocket API endpoints
│   ├── websocket-streams.md           ← Market data streams
│   └── user-data-stream.md            ← User data stream events
│
├── coin-margined-futures/
│   ├── general-info.md                ← Thông tin chung, auth, rate limits
│   ├── endpoints-rest.md              ← Danh sách REST endpoints
│   ├── websocket-streams.md           ← Market data streams
│   └── user-data-stream.md            ← User data stream events
│
├── portfolio-margin/
│   ├── general-info.md                ← Thông tin chung, rate limits
│   ├── endpoints-um.md                ← UM Futures endpoints (/papi)
│   ├── endpoints-cm.md                ← CM Futures endpoints (/papi)
│   └── endpoints-margin.md            ← Margin endpoints (/papi)
│
├── portfolio-margin-pro/
│   ├── general-info.md                ← Thông tin chung
│   └── endpoints.md                   ← Tất cả endpoints (/sapi)
│
├── options-trading/
│   ├── general-info.md                ← Thông tin chung, auth
│   ├── endpoints-rest.md              ← REST API endpoints (/eapi)
│   └── websocket-streams.md           ← WebSocket streams
│
└── summaries/
    ├── changelog-2026.md              ← Thay đổi năm 2026
    ├── changelog-2025.md              ← Thay đổi năm 2025
    ├── changelog-2024.md              ← Thay đổi năm 2024
    └── changelog-2023-and-before.md   ← Thay đổi 2023 và trước đó
```

---

## 🌐 Base URLs tổng hợp

| API | Production URL | Testnet URL |
|-----|---------------|-------------|
| **USDⓈ-M Futures REST** | `https://fapi.binance.com` | `https://demo-fapi.binance.com` |
| **USDⓈ-M Futures WebSocket** | `wss://fstream.binance.com` | `wss://fstream.binancefuture.com` |
| **USDⓈ-M Futures WebSocket API** | `wss://ws-fapi.binance.com/ws-fapi/v1` | - |
| **COIN-M Futures REST** | `https://dapi.binance.com` | `https://testnet.binancefuture.com` |
| **COIN-M Futures WebSocket** | `wss://dstream.binance.com` | `wss://dstream.binancefuture.com` |
| **COIN-M Futures WebSocket API** | `wss://ws-dapi.binance.com/ws-dapi/v1` | - |
| **Portfolio Margin REST** | `https://papi.binance.com` | - |
| **Portfolio Margin Pro REST** | `https://api.binance.com` (sapi) | - |
| **Options REST** | `https://eapi.binance.com` | `https://testnet.binancefuture.com` |
| **Options WebSocket** | `wss://nbstream.binance.com/eoptions` | - |

---

## ⚡ Thay đổi quan trọng gần nhất (2025–2026)

### 🔴 Breaking Changes & Deprecations

| Ngày | API | Thay đổi |
|------|-----|---------|
| 2025-12-09 | USDⓈ-M | Conditional orders (STOP, TAKE_PROFIT, v.v.) chuyển sang Algo Service |
| 2025-12-10 | USDⓈ-M | Event `CONDITIONAL_ORDER_TRIGGER_REJECT` deprecated |
| 2025-11-10 | PM/PM Pro | `POST/POST sapi/v1/portfolio/mint` và `redeem` deprecated (BFUSD → Binance Earn) |
| 2025-10-23 | Tất cả | `priceMatch` enum `OPPONENT_10` và `OPPONENT_20` tạm thời bị xóa |
| 2024-11-15 | USDⓈ-M & COIN-M | `/fapi/v1/pmExchangeInfo` và `/dapi/v1/pmExchangeInfo` deprecated |
| 2024-10-30 | USDⓈ-M & COIN-M | `userTrades` chỉ hỗ trợ query 6 tháng gần nhất |

### ✅ Tính năng mới

| Ngày | API | Tính năng |
|------|-----|----------|
| 2026-01-09 | PM/PM Pro | Switch Delta Mode (`POST/GET /sapi/v1/portfolio/delta-mode`) |
| 2026-01-07 | Options | Query commission rate (`GET /eapi/v1/commission`) |
| 2025-12-11 | USDⓈ-M | TradingSchedule endpoint, TradFi-Perps contract signing |
| 2025-11-25 | USDⓈ-M | RPI (Retail Price Improvement) orders + RPI order book |
| 2025-11-19 | USDⓈ-M | ADL risk rating (`GET /fapi/v1/symbolAdlRisk`) |
| 2025-11-12 | Options | Options Demo API environment |
| 2025-07-02 | USDⓈ-M | Max WebSocket streams tăng 200 → **1024** |
| 2025-04-23 | USDⓈ-M | Insurance fund balance (`GET /fapi/v1/insuranceBalance`) |
| 2025-02-25 | COIN-M | WebSocket API ra mắt |
| 2024-12-19 | PM/PM Pro | BFUSD mint/redeem endpoints |
| 2024-09-03 | USDⓈ-M | `TRADE_LITE` event trong User Data Stream |
| 2024-08-26 | USDⓈ-M | Futures Convert endpoints |
| 2024-08-01 | USDⓈ-M | V3 account/balance/position endpoints |
| 2024-04-01 | USDⓈ-M | WebSocket API ra mắt (`ws-fapi.binance.com`) |

---

## 📋 Rate Limits tổng hợp

| API | IP Rate Limit | Order Rate Limit |
|-----|--------------|-----------------|
| USDⓈ-M Futures | Theo `rateLimits` trong `exchangeInfo` | Theo `X-MBX-ORDER-COUNT-*` header |
| COIN-M Futures | Theo `rateLimits` trong `exchangeInfo` | Theo `X-MBX-ORDER-COUNT-*` header |
| Portfolio Margin | **6,000/phút** | **1,200/phút** |
| Options | Theo `rateLimits` trong `exchangeInfo` | Theo `X-MBX-ORDER-COUNT-*` header |

**HTTP Status Codes quan trọng:**
- `418` – IP bị auto-ban (sau nhiều lần vi phạm 429)
- `429` – Rate limit exceeded
- `503` – Service overload (xem chi tiết trong `general-info.md` của từng API)

---

## 🔗 Links tham khảo

- 📄 [Changelog gốc](https://developers.binance.com/docs/derivatives/change-log)
- 📊 [USDⓈ-M Futures Docs](https://developers.binance.com/docs/derivatives/usds-margined-futures/general-info)
- 🔵 [COIN-M Futures Docs](https://developers.binance.com/docs/derivatives/coin-margined-futures/general-info)
- 💼 [Portfolio Margin Docs](https://developers.binance.com/docs/derivatives/portfolio-margin/general-info)
- 💎 [Portfolio Margin Pro Docs](https://developers.binance.com/docs/derivatives/portfolio-margin-pro/general-info)
- ⚙️ [Options Trading Docs](https://developers.binance.com/docs/derivatives/options-trading/general-info)
- 🐍 [Python SDK](https://github.com/binance/binance-connector-python)
- ☕ [Java SDK](https://github.com/binance/binance-connector-java)
- 📮 [Postman Collection](https://github.com/binance-exchange/binance-api-postman)
