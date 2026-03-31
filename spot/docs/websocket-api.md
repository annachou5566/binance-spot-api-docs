# 🔌 WebSocket API – Thay đổi theo thời gian

> Tài liệu chính: https://developers.binance.com/docs/binance-spot-api-docs/websocket-api/general-api-information

---

## Methods quan trọng & lịch sử thay đổi

### Methods bị deprecated / xóa

| Method | Trạng thái | Thay thế |
|--------|-----------|---------|
| `userDataStream.start` | ❌ Xóa 2026-02-20 | `userDataStream.subscribe` |
| `userDataStream.ping` | ❌ Xóa 2026-02-20 | `userDataStream.subscribe` |
| `userDataStream.stop` | ❌ Xóa 2026-02-20 | `userDataStream.unsubscribe` |
| `orderList.place` | ⚠️ Deprecated (2024-04-02) | `orderList.place.oco` |

### Methods mới theo thời gian

#### 2025
- `userDataStream.subscribe` – Subscribe User Data Stream (2024-12-09 / 2025-08-12 mở rộng)
- `userDataStream.subscribe.signature` – Subscribe không cần login (2025-08-12, hỗ trợ mọi key type)
- `userDataStream.unsubscribe` – Unsubscribe (hỗ trợ nhiều subscriptions)
- `session.subscriptions` – Liệt kê active subscriptions (2025-08-12)
- `myFilters` – Lấy filters của account (2025-09-29)
- `orderList.place.opo` – OPO orders (2025-12-18)
- `orderList.place.opoco` – OPOCO orders (2025-12-18)
- `order.amend.keepPriority` – Order Amend (2025-04-24 → 2025-05-07)

#### 2024
- `account.commission` (2023-12-04)
- `ticker.tradingDay` (2023-12-04)
- `orderList.place.oto` – OTO orders (2024-06-11)
- `orderList.place.otoco` – OTOCO orders (2024-06-11)
- `orderList.place.oco` – OCO mới (2024-04-02)

#### 2023
- `session.logon` / `session.logout` / `session.status` (2023-12-04, chỉ Ed25519)
- `myPreventedMatches` – Query STP (2023-01-19)
- `sor.order.place` – Smart Order Routing (2023-08-08)
- `sor.order.test` – SOR test
- `myAllocations` – Xem allocations từ SOR

---

## Session Authentication (Ed25519)

Từ 2023-12-04, WebSocket API hỗ trợ session authentication:

```json
// session.logon
{
  "id": "1",
  "method": "session.logon",
  "params": {
    "apiKey": "...",
    "signature": "...",
    "timestamp": 1234567890
  }
}
```

Từ 2025-08-12, `userDataStream.subscribe.signature` cho phép subscribe mà không cần login, hỗ trợ **HMAC, RSA, Ed25519**.

---

## User Data Stream qua WebSocket API

> **Khuyến nghị:** Dùng cách này thay vì listenKey cũ (đã bị xóa 2026-02-20)

```json
// Subscribe
{ "id": "1", "method": "userDataStream.subscribe" }

// Unsubscribe (tất cả)
{ "id": "2", "method": "userDataStream.unsubscribe" }

// Unsubscribe theo ID
{ "id": "3", "method": "userDataStream.unsubscribe", "params": { "subscriptionId": "abc123" } }
```

- Một connection có thể subscribe **nhiều accounts** (mỗi account tối đa 1 subscription).
- Events có thêm field `subscriptionId` để phân biệt (từ 2025-08-12).

---

## Rate Limits

| Loại | Giới hạn | Ngày thay đổi |
|------|---------|--------------|
| CONNECTIONS | 300/5 phút (per IP) | 2023-08-25 |
| REQUEST_WEIGHT | 6,000/phút | 2023-08-25 |
| Chi phí kết nối | 2 weight | 2023-08-25 |

---

## Ping/Pong

| Thông số | Trước 2025 | Từ 2025-02-03 |
|---------|-----------|--------------|
| Ping interval | 3 phút | **20 giây** |
| Pong delay tối đa | 10 phút | **1 phút** |

---

## Timestamp & Time Unit

- `timeUnit` parameter trong connection URL (từ 2024-12-17): `millisecond` hoặc `microsecond`
- Timestamp params hỗ trợ cả milliseconds lẫn microseconds.
