# 📡 User Data Stream – Tổng hợp

> Tài liệu chính: https://developers.binance.com/docs/binance-spot-api-docs/user-data-stream

---

## ⚠️ Migration Guide: listenKey → WebSocket API

> **`listenKey` trên `wss://stream.binance.com` đã bị xóa vào 2026-02-20!**

### Cũ (đã bị xóa)
```bash
# 1. Tạo listenKey
POST /api/v3/userDataStream

# 2. Kết nối stream
wss://stream.binance.com:9443/ws/<listenKey>

# 3. Keepalive
PUT /api/v3/userDataStream

# 4. Đóng
DELETE /api/v3/userDataStream
```

### Mới (khuyến nghị) – WebSocket API
```json
// 1. Kết nối WebSocket API
wss://ws-api.binance.com:443/ws-api/v3

// 2. Subscribe (không cần login)
{
  "id": "1",
  "method": "userDataStream.subscribe.signature",
  "params": {
    "apiKey": "YOUR_API_KEY",
    "signature": "...",
    "timestamp": 1234567890
  }
}

// Hoặc login trước (chỉ Ed25519), rồi subscribe
{ "id": "2", "method": "userDataStream.subscribe" }

// 3. Unsubscribe
{ "id": "3", "method": "userDataStream.unsubscribe" }
```

**Lợi ích:** Độ trễ thấp hơn, không cần quản lý listenKey, hỗ trợ mọi loại API key.

---

## Events

### outboundAccountPosition
Gửi khi balance thay đổi.

### balanceUpdate
Gửi khi tiền được nạp/rút.

### executionReport
Gửi khi có thay đổi với order.

**Fields thêm vào theo thời gian:**

| Field | Mô tả | Thêm từ |
|-------|--------|---------|
| `b` (matchType) | Loại match (cho SOR) | 2023-08-08 |
| `a` (allocId) | ID allocation từ SOR | 2023-08-08 |
| `k` (workingFloor) | Floor đang xử lý (SOR) | 2023-08-08 |
| `Cs` (counterSymbol) | Symbol phía đối (STP) | 2023-08-08 |
| `u` (tradeGroupId) | Trade group ID (STP) | 2023-01-19 |
| `v` (preventedMatchId) | ID prevented match | 2023-01-19 |
| `U` (counterOrderId) | Order ID đối diện (STP) | 2023-01-19 |
| `A` (preventedQuantity) | Qty bị ngăn | 2023-01-19 |
| `B` (lastPreventedQuantity) | Qty bị ngăn lần cuối | 2023-01-19 |
| `pl`, `pL`, `pY` | Prevented exec qty/price/notional | 2023-12-04 |
| `subscriptionId` | ID của subscription | 2025-08-12 |

**Execution Types:**
- `TRADE_PREVENTION` – Order bị STP (thêm 2023-01-19)

**Order Statuses:**
- `EXPIRED_IN_MATCH` – Order expired do STP (thêm 2023-01-19)

### listenKeyExpired (2024-04-02)
Gửi khi `listenKey` hết hạn. *(Không còn áp dụng khi dùng WebSocket API subscription)*

### eventStreamTerminated (2024-12-09)
Gửi khi bạn logout hoặc unsubscribe khỏi User Data Stream.

### externalLockUpdate (2024-12-09)
Gửi khi spot wallet balance bị lock/unlock bởi hệ thống bên ngoài.

---

## UTF-8 Support (từ 2025-12-15)

User Data Stream events có thể chứa ký tự UTF-8 nếu bạn sở hữu hoặc giao dịch assets có tên non-ASCII. Đảm bảo code xử lý được UTF-8.

---

## SBE Support

Cần schema **2:1 trở lên** để dùng User Data Stream trong SBE format qua WebSocket API.

Các messages SBE cho User Data Stream (thêm từ schema 2:1):
- `UserDataStreamSubscribeResponse`
- `UserDataStreamUnsubscribeResponse`
- `BalanceUpdateEvent`
- `EventStreamTerminatedEvent`
- `ExecutionReportEvent`
- `ExternalLockUpdateEvent`
- `ListStatusEvent`
- `OutboundAccountPositionEvent`
