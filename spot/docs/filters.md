# 🔧 Filters – Tổng hợp

> Tài liệu chính: https://developers.binance.com/docs/binance-spot-api-docs/filters

---

## Danh sách Filters & Lịch sử

### Symbol Filters

| Filter | Mô tả | Ghi chú |
|--------|--------|---------|
| `PRICE_FILTER` | Giới hạn giá (min, max, tick size) | - |
| `PERCENT_PRICE` | Giới hạn giá theo % so với giá trung bình | - |
| `PERCENT_PRICE_BY_SIDE` | Giới hạn giá theo % riêng cho buy/sell | - |
| `LOT_SIZE` | Giới hạn quantity (min, max, step) | Cách tính stepSize thay đổi 2023-03-13 |
| `MIN_NOTIONAL` | Giá trị giao dịch tối thiểu | - |
| `NOTIONAL` | Giá trị giao dịch (min, max) | - |
| `ICEBERG_PARTS` | Số phần iceberg | Tăng lên 25 (2025-12-18), tăng lên 50 (2026-02-11) |
| `MARKET_LOT_SIZE` | Giới hạn qty cho market orders | - |
| `MAX_NUM_ORDERS` | Số orders tối đa | - |
| `MAX_ALGO_ORDERS` | Số algo orders tối đa | - |
| `MAX_ICEBERG_ORDERS` | Số iceberg orders tối đa | - |
| `MAX_POSITION` | Vị thế tối đa | - |
| `TRAILING_DELTA` | Giới hạn trailing delta | - |
| `MAX_NUM_ORDER_LISTS` | Số order lists tối đa = **20** | Mới, 2025-08-28 |
| `MAX_NUM_ORDER_AMENDS` | Số lần amend tối đa/order = **10** | Mới, 2025-08-28 |
| `MAX_ASSET` | Tài sản tối đa trong tài khoản | Mới, documented 2025-09-29 |

### Exchange Filters

| Filter | Mô tả |
|--------|--------|
| `EXCHANGE_MAX_NUM_ORDERS` | Tổng số orders tối đa toàn sàn |
| `EXCHANGE_MAX_ALGO_ORDERS` | Tổng số algo orders tối đa |
| `EXCHANGE_MAX_ICEBERG_ORDERS` | Tổng số iceberg orders tối đa |
| `EXCHANGE_MAX_NUM_ORDER_LISTS` | Tổng số order lists tối đa |

---

## Thay đổi quan trọng

### LOT_SIZE / MARKET_LOT_SIZE stepSize (2023-03-13)
- Cũ: `(quantity - minQty) % stepSize == 0`
- Mới: `quantity % stepSize == 0`

### ICEBERG_PARTS
- Mặc định ban đầu: 10
- 2025-12-18: Tăng lên **25** cho tất cả symbols
- 2026-02-11: Tăng lên **50** cho tất cả symbols

### MAX_NUM_ORDER_LISTS (mới 2025-08-28)
- Giới hạn **20 order lists** đang mở trên một symbol.

### MAX_NUM_ORDER_AMENDS (mới 2025-08-28)
- Giới hạn tối đa **10 lần amend** cho mỗi order.

### MAX_ASSET (mới, documented 2025-09-29)
- Chỉ hiển thị qua `GET /api/v3/myFilters` / `myFilters` (WebSocket API).
- Cho biết tài sản tối đa account được phép nắm giữ.

---

## Query Filters

Để xem filters áp dụng cho tài khoản của bạn trên một symbol cụ thể:

```
# REST API
GET /api/v3/myFilters?symbol=BTCUSDT

# WebSocket API
{ "id": "1", "method": "myFilters", "params": { "symbol": "BTCUSDT" } }
```
