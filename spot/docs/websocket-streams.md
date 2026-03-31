# 📊 WebSocket Streams – Tổng hợp

> Tài liệu chính: https://developers.binance.com/docs/binance-spot-api-docs/web-socket-streams  
> Base URL: `wss://stream.binance.com:9443` hoặc `wss://data-stream.binance.vision`

---

## Streams có sẵn

| Stream | Format | Ghi chú |
|--------|--------|---------|
| `<symbol>@trade` | JSON | Buyer/Seller ID đã bị xóa từ 2024-06-18 |
| `<symbol>@depth` | JSON / SBE | SBE từ 2025-03-18, 50ms từ 2025-11-26 |
| `<symbol>@depth20` | JSON / SBE | SBE từ 2025-03-18, 50ms từ 2025-11-26 |
| `<symbol>@kline_<interval>` | JSON | - |
| `<symbol>@kline_<interval>@+08:00` | JSON | UTC+8 offset (từ 2024-05-30) |
| `<symbol>@ticker` | JSON | Thay thế cho `!ticker@arr` |
| `<symbol>@miniTicker` | JSON | - |
| `!miniTicker@arr` | JSON | - |
| `!ticker@arr` | JSON | ❌ **Deprecated 2025-11-14**, sẽ bị xóa |
| `<symbol>@bookTicker` | JSON / SBE | SBE từ 2025-03-18 |
| `<symbol>@avgPrice` | JSON | Thêm 2023-12-04 |
| `<symbol>@aggTrade` | JSON | - |
| SBE Market Data | SBE binary | Từ 2025-03-18 |
| `!ticker@arr` (All Market Tickers) | JSON | ❌ **Deprecated** |

---

## Thay đổi theo thời gian

### 2025-12-02
- Hỗ trợ **URL-encoded URLs** trong WebSocket Market Streams.

### 2025-11-26
- `<symbol>@depth` và `<symbol>@depth20` update speed: **50ms** (từ 100ms).

### 2025-11-14
- `!ticker@arr` bị deprecated → Dùng `<symbol>@ticker` hoặc `!miniTicker@arr`.

### 2025-07-08
- WebSocket Streams nâng cấp (có thể disconnect trong ~2 giờ).

### 2025-03-18
- **SBE Market Data Streams** ra mắt.

### 2024-06-18
- Xóa buyer order ID (`b`) và seller order ID (`a`) khỏi `<symbol>@trade`.

### 2024-05-30
- Kline streams hỗ trợ UTC+8 offset: `btcusdt@kline_1d@+08:00`.

### 2024-07-22
- Fix bug timestamps sai trong klines khi dùng `timeZone`.

### 2023-12-04
- Stream mới: `<symbol>@avgPrice`.
- `id` hỗ trợ 64-bit signed integer, alphanumeric string (max 36 ký tự), `null`.

### 2023-05-24
- URL mới: `data-stream.binance.vision` (thay `data-stream.binance.com`).

---

## Ping/Pong

| Thông số | Trước 2025 | Từ 2025-02-03 |
|---------|-----------|--------------|
| Ping interval | 3 phút | **20 giây** |
| Pong delay tối đa | 10 phút | **1 phút** |

---

## Kết nối đồng thời

- Rate limit: **300 kết nối mới/5 phút** (per IP, từ 2023-02-17).

---

## Time Unit (từ 2024-12-17)

Thêm `timeUnit` vào connection URL:
```
wss://stream.binance.com:9443/stream?streams=btcusdt@trade&timeUnit=microsecond
```

---

## UTF-8 (từ 2025-12-15)

- Nếu request chứa symbol có tên non-ASCII → stream events có thể chứa UTF-8.
- `!miniTicker@arr` và rolling window stats streams cũng có thể chứa UTF-8.

---

## How to manage a local order book (cập nhật 2025-11-12)

Tài liệu về cách duy trì order book cục bộ đã được sửa. Xem hướng dẫn mới nhất tại:  
https://developers.binance.com/docs/binance-spot-api-docs/web-socket-streams#how-to-manage-a-local-order-book-correctly
