# 📦 Simple Binary Encoding (SBE) – Tổng hợp

> Tài liệu chính: https://developers.binance.com/docs/binance-spot-api-docs/faqs/sbe_faq  
> Schemas: https://github.com/binance/binance-spot-api-docs/tree/master/sbe/schemas

---

## Lịch sử SBE Schemas

| Schema | Ra mắt | Deprecated | Retired | Ghi chú |
|--------|--------|-----------|---------|---------|
| `1:0` | 2024-02-28 | 2024-04-10 | 2024-10-25 | - |
| `2:0` | 2024-04-10 | 2024-12-09 | 2025-06-12 | Thêm `permissionSets` |
| `2:1` | 2024-12-09 | 2025-04-07 | 2025-10-24 | Thêm User Data Stream support |
| `3:0` | 2025-04-07 | 2025-08-12 | 2026-02-19 | Order Amend, STP Decrement |
| `3:1` | 2025-08-12 | 2025-12-02 | ~2026-06 | Pegged Orders, subscriptionId |
| `3:2` | 2025-12-18 | - | - | STP TRANSFER mode |

> **Chính sách:** Schema deprecated sẽ bị retire sau **6 tháng**.

---

## SBE Market Data Streams (từ 2025-03-18)

Streams có định dạng SBE với payload nhỏ hơn và độ trễ thấp hơn JSON:

| Stream | Update Speed |
|--------|-------------|
| Trade stream | Real-time |
| Best bid/ask | Real-time |
| Diff. depth | 100ms → **50ms** (từ 2025-11-26) |
| Partial book depth | 100ms → **50ms** (từ 2025-11-26) |

---

## FIX SBE (từ 2025-12-18)

- Schema: [spot-fixsbe-1_0.xml](https://github.com/binance/binance-spot-api-docs/blob/master/sbe/schemas/spot-fixsbe-1_0.xml)

---

## Thay đổi chi tiết theo schema

### Schema 3:2 (2025-12-18)
- Enum mới `TRANSFER` cho `selfTradePreventionMode` và `allowedSelfTradePreventionModes`.
- Schemas cũ hơn 3:1 không thể represent response chứa STP mode `TRANSFER`.

### Schema 3:1 (2025-08-12)
- `ExchangeInfoResponse`: Thêm field `pegInstructionsAllowed`
- `ExecutionReportEvent`: Thêm `pricePeg`, `pricePegOffsetLevel`, `peggedPrice`
- `UserDataStreamSubscribeResponse`: Thêm `subscriptionId`
- Tất cả user data stream events có `subscriptionId`
- `WebSocketSessionLogonResponse` v.v.: Field `apiKey` đổi tên → `loggedOnApiKey`
- `OrderTestWithCommissionsResponse`: Thêm `specialCommissionForOrderMaker/Taker`
- `AccountCommissionResponse`: Thêm 4 fields `specialCommission*`
- Hỗ trợ filters `EXCHANGE_MAX_NUM_ORDER_LISTS`, `MAX_NUM_ORDER_LISTS`, `MAX_NUM_ORDER_AMENDS`
- `NonRepresentableMessage`: Message mới khi data không thể represent trong schema

### Schema 3:0 (2025-04-07)
- Thêm `amendAllowed` trong `ExchangeInfoResponse`
- Messages mới: `OrderAmendmentsResponse`, `OrderAmendKeepPriorityResponse`
- Tất cả enums có variant `NON_REPRESENTABLE`
- Enum mới `DECREMENT` cho STP
- `symbolStatus` enum: Xóa `AUCTION_MATCH`, `PRE_TRADING`, `POST_TRADING`
- `orderCreationTime` trong `ExecutionReportEvent` → optional

### Schema 2:1 (2024-12-09)
- Thêm `origQuoteOrderQty` trong order responses
- WebSocket API: Thêm field `userDataStream` trong session responses
- Messages mới cho User Data Stream: `UserDataStreamSubscribeResponse`, `BalanceUpdateEvent`, `ExecutionReportEvent`, `ExternalLockUpdateEvent`, `ListStatusEvent`, `OutboundAccountPositionEvent`

### Schema 2:0 (2024-04-10)
- `ExchangeInfoResponse`: `permissions` group → `permissionSets` group
- Hỗ trợ OCO requests mới

### Schema 1:0 (2024-02-28)
- Schema đầu tiên cho REST API
- WebSocket API support thêm vào 2024-02-08 (Testnet), 2024-02-28 (live)

---

## Lifecycle File

[sbe_schema_lifecycle_prod.json](https://github.com/binance/binance-spot-api-docs/blob/master/sbe/schemas/sbe_schema_lifecycle_prod.json) – Theo dõi trạng thái của từng schema trên Production.

---

## Lưu ý NonRepresentable

Khi response không thể encode trong schema đang dùng:
- Schema 3:1+: Trả về `NonRepresentableMessage`
- Schema cũ hơn: Trả về error

Ví dụ: Dùng schema 3:0 với STP mode `TRANSFER` → error.
