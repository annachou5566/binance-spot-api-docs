# ⚡ FIX API – Thay đổi theo thời gian

> Tài liệu chính: https://developers.binance.com/docs/binance-spot-api-docs/fix-api  
> QuickFIX Schemas: https://github.com/binance/binance-spot-api-docs/tree/master/fix/schemas

---

## Timeline ra mắt

| Ngày | Sự kiện |
|------|---------|
| 2024-08-08 | FIX Order Entry & Drop Copy Sessions ra mắt |
| 2025-01-16 | FIX Market Data ra mắt |
| 2025-12-18 | FIX SBE ra mắt |

---

## Connection Limits

| Session | Limit hiện tại | Ngày thay đổi |
|---------|---------------|--------------|
| FIX Order Entry | 10 connections đồng thời/account | 2025-04-21 |
| FIX Order Entry | 15 connection attempts/30 giây | 2025-04-21 |
| FIX Drop Copy | 15 connection attempts/30 giây | 2025-04-21 |
| FIX Market Data | 100 connections (tăng từ 5) | 2025-01-16 |
| FIX Market Data | 300 connection attempts/300 giây | 2025-04-21 |
| FIX Drop Copy | 60 messages/phút | 2025-03-13 |
| FIX Market Data | 2000 messages/phút | 2025-03-13 |

---

## Message Changes

### Mới được thêm
- `News <B>` (2024-12-09) – Thông báo trước khi connection bị đóng, gửi **mỗi 10 giây trong 10 phút**
- **OrderAmendKeepPriorityRequest** và **OrderAmendReject** (2025-04-24)
- `AggressorSide (2446)` trong Trade Stream (2025-02-26)

### Thay đổi messages
- `OrderCancelRequest <F>` và `<XCN>`: Hỗ trợ cả `orderId` lẫn `clientOrderId` (2025-04-07)
- FIX API không gửi lại `Reject <3>` khi client gửi reject (2025-08-12)
- `LastFragment (893)` deprecated (2025-12-18) – MarketIncrementalRefresh `<X>` không còn bị fragment
- `ListStatus <N>` không còn emit optional `symbol` field (2025-12-18)

### Unicode Support (từ 2025-12-02)
Các tags sau được phép dùng Unicode UTF-8:
- `Currency (15)`
- `MiscFeeCurr (138)`
- `Symbol (55)`
- `SecondarySymbol (25019)`
- `CounterSymbol (25028)`
- `SecurityDesc (107)`

---

## FIX SBE

- Ra mắt **2025-12-18**
- Schema: [spot-fixsbe-1_0.xml](https://github.com/binance/binance-spot-api-docs/blob/master/sbe/schemas/spot-fixsbe-1_0.xml)
- Tài liệu: [FIX vs FIX SBE](https://developers.binance.com/docs/binance-spot-api-docs/fix-api#fix-vs-fix-sbe-schema)

---

## Pegged Orders trong FIX (từ 2025-08-28)

- `OrdType(40)` hỗ trợ giá trị mới `P(PEGGED)`
- Tags mới trong `NewOrderSingle <D>`, `NewOrderList <E>`, `<XCN>`:
  - `PegOffsetValue(211)`
  - `PegPriceType(1094)`
  - `PegMoveType(835)`
  - `PegOffsetType(836)`
- Response `ExecutionReport <8>` echo lại `PegInstructions` + optional `PeggedPrice (839)`

---

## `recvWindow`

- Hỗ trợ microseconds (tối đa 3 chữ số thập phân) từ **2025-08-28**
- Ví dụ: `recvWindow=6000.346`
- Kiểm tra thứ 3 được thêm trước khi forward tới Matching Engine (từ **2025-06-06**)

---

## FIX Drop Copy

- Dữ liệu bị delay **1 giây** (đã có từ đầu, chỉ mới được document vào 2026-02-02)

---

## FIX API Security

- `EncryptMethod(98)` phải = 0 tại Logon `<A>` (enforce từ 2025-04-21)
- Error messages rõ ràng hơn cho invalid/missing tags (2025-08-12):
  ```json
  { "code": -1169, "msg": "Invalid tag number." }
  { "code": -1177, "msg": "Tag specified without a value." }
  { "code": -1102, "msg": "Field value was empty or malformed." }
  ```
