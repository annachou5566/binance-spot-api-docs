# 📖 Binance Spot API Docs – Tổng hợp tài liệu

> Repo này tổng hợp và tổ chức lại toàn bộ tài liệu changelog từ [Binance Spot API](https://developers.binance.com/docs/binance-spot-api-docs/CHANGELOG), bao gồm các thay đổi từ 2022 đến 2026.

---

## 📂 Cấu trúc thư mục

```
binance-spot-api-docs/
├── README.md                  ← File này
├── CHANGELOG.md               ← Toàn bộ changelog gốc (đầy đủ)
├── docs/
│   ├── rest-api.md            ← Tóm tắt thay đổi REST API
│   ├── websocket-api.md       ← Tóm tắt thay đổi WebSocket API
│   ├── fix-api.md             ← Tóm tắt thay đổi FIX API
│   ├── websocket-streams.md   ← Tóm tắt WebSocket Streams
│   ├── user-data-stream.md    ← Tóm tắt User Data Stream
│   ├── sbe.md                 ← Simple Binary Encoding (SBE)
│   └── filters.md             ← Bộ lọc (Filters)
└── summaries/
    ├── 2026.md                ← Tóm tắt các thay đổi năm 2026
    ├── 2025.md                ← Tóm tắt các thay đổi năm 2025
    ├── 2024.md                ← Tóm tắt các thay đổi năm 2024
    └── 2023.md                ← Tóm tắt các thay đổi năm 2023
```

---

## 🚀 Các API chính

| API | Mô tả | Link chính thức |
|-----|--------|-----------------|
| **REST API** | API HTTP truyền thống | [docs](https://developers.binance.com/docs/binance-spot-api-docs/rest-api/general-api-information) |
| **WebSocket API** | API 2 chiều qua WebSocket | [docs](https://developers.binance.com/docs/binance-spot-api-docs/websocket-api/general-api-information) |
| **FIX API** | Giao thức FIX cho trading tốc độ cao | [docs](https://developers.binance.com/docs/binance-spot-api-docs/fix-api) |
| **WebSocket Streams** | Luồng dữ liệu thị trường real-time | [docs](https://developers.binance.com/docs/binance-spot-api-docs/web-socket-streams) |
| **User Data Stream** | Luồng dữ liệu tài khoản cá nhân | [docs](https://developers.binance.com/docs/binance-spot-api-docs/user-data-stream) |
| **SBE Market Data** | Dữ liệu thị trường nhị phân (hiệu suất cao) | [docs](https://developers.binance.com/docs/binance-spot-api-docs/sbe-market-data-streams) |

---

## ⚡ Thay đổi quan trọng gần nhất (2026)

### 🔴 Sắp bị xóa (Deprecations)
- **`2026-02-20`**: Các endpoint/method listenKey bị xóa hoàn toàn:
  - REST: `POST/PUT/DELETE /api/v3/userDataStream`
  - WebSocket: `userDataStream.start/ping/stop`
- **`2026-02-19`**: SBE schema `3:0` bị retire (đã deprecated từ 2025-08-12)

### ✅ Tính năng mới
- **Demo Mode** ra mắt (`2026-01-29`)
- **ICEBERG_PARTS** tăng lên 50 cho tất cả symbols (`2026-02-11`)
- **`recvWindow`** được thêm vào `userDataStream.subscribe.signature`

### ⚠️ Breaking Changes
- Percent-encode payload **trước** khi tính signature (từ `2026-01-15`)

---

## 📋 Timeline thay đổi lớn (Tóm tắt)

| Ngày | Thay đổi |
|------|---------|
| 2026-01-29 | Demo Mode ra mắt |
| 2025-12-18 | FIX SBE, OPO orders, SBE schema 3:2 |
| 2025-10-28 | Thêm `symbolStatus` filter cho nhiều endpoints |
| 2025-08-28 | Pegged Orders, `recvWindow` microseconds, MAX_NUM_ORDER_LISTS |
| 2025-08-12 | WebSocket multi User Data Stream, `session.subscriptions`, SBE 3:1 |
| 2025-04-07 | Order Amend Keep Priority, STP Decrement, FIX limits |
| 2025-03-10 | SBE Market Data Streams, FIX message limits |
| 2024-12-09 | User Data Stream qua WebSocket API, microsecond support, OCO mở rộng |
| 2024-10-17 | `showPermissionSets`, `symbolStatus` cho exchangeInfo |
| 2024-08-01 | FIX API & Drop Copy Sessions ra mắt |
| 2024-06-11 | OTO & OTOCO orders |
| 2024-04-02 | `permissionSets`, SBE schema 2:0, OCO endpoint mới |
| 2024-02-28 | SBE ra mắt trên live exchange |
| 2023-08-08 | Smart Order Routing (SOR) |
| 2023-07-18 | Ed25519 API keys |
| 2023-01-26 | Self-Trade Prevention (STP) |

---

## 🔗 Links tham khảo

- 📄 [Changelog gốc](https://developers.binance.com/docs/binance-spot-api-docs/CHANGELOG)
- 🐙 [GitHub chính thức của Binance](https://github.com/binance/binance-spot-api-docs)
- 📦 [SBE Schemas](https://github.com/binance/binance-spot-api-docs/tree/master/sbe/schemas)
- 🔧 [FIX Schemas](https://github.com/binance/binance-spot-api-docs/tree/master/fix/schemas)
- ❓ [FAQs](https://developers.binance.com/docs/binance-spot-api-docs/faqs/spot_glossary)

---

> **Cập nhật lần cuối:** 2026-02-12  
> **Nguồn:** https://developers.binance.com/docs/binance-spot-api-docs/CHANGELOG
