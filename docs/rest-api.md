# 🌐 REST API – Thay đổi theo thời gian

> Tài liệu chính: https://developers.binance.com/docs/binance-spot-api-docs/rest-api/general-api-information

---

## Endpoints quan trọng & lịch sử thay đổi

### Endpoints bị deprecated / xóa

| Endpoint | Trạng thái | Thay thế |
|----------|-----------|---------|
| `POST /api/v3/userDataStream` | ❌ Xóa 2026-02-20 | WebSocket API User Data Stream |
| `PUT /api/v3/userDataStream` | ❌ Xóa 2026-02-20 | WebSocket API User Data Stream |
| `DELETE /api/v3/userDataStream` | ❌ Xóa 2026-02-20 | WebSocket API User Data Stream |
| `POST /api/v3/order/oco` | ⚠️ Deprecated (2024-04-02) | `POST /api/v3/orderList/oco` |

### Endpoints mới được thêm (theo năm)

#### 2026
- (Không có endpoint mới)

#### 2025
- `GET /api/v3/myFilters` – Lấy filters của account trên một symbol

#### 2024
- `GET /api/v3/account/commission` (2023-12-04)
- `GET /api/v3/ticker/tradingDay` (2023-12-04)
- `POST /api/v3/orderList/oto` – OTO orders (2024-06-11)
- `POST /api/v3/orderList/otoco` – OTOCO orders (2024-06-11)
- `POST /api/v3/orderList/oco` – OCO mới (thay thế `order/oco`)
- `POST /api/v3/orderList/opo` – OPO orders (2025-12-18)
- `POST /api/v3/orderList/opoco` – OPOCO orders (2025-12-18)
- `PUT /api/v3/order/amend/keepPriority` – Order Amend Keep Priority

#### 2023
- `GET /api/v3/myPreventedMatches` – Query STP prevented matches
- `POST /api/v3/sor/order` – Smart Order Routing
- `POST /api/v3/sor/order/test` – SOR test
- `GET /api/v3/myAllocations` – Xem allocations từ SOR

---

## Request Weight thay đổi

| Endpoint | Trước | Sau | Ngày |
|----------|-------|-----|------|
| `GET /api/v3/aggTrades` | 2 | 4 | 2025-03-10 |
| `GET /api/v3/trades` | 2 | 10 | 2023-10-19 |
| `PUT /api/v3/order/amend/keepPriority` | 1 | 4 | 2025-04-25 |
| `GET /api/v3/myTrades` (với orderId) | 20 | 5 | 2025-04-07 |
| `GET /api/v3/myTrades` (không orderId) | 20 | 20 | - |
| `GET /api/v3/trades` / `historicalTrades` | 10 | 25 | 2024-04-02 |
| `GET /api/v3/depth` (1-100) | 1→2 | 5 | 2023-10-19 |
| `GET /api/v3/depth` (101-500) | 5→10 | 25 | 2023-10-19 |
| `GET /api/v3/exchangeInfo` | 10 | 20 | 2023-08-25 |
| `GET /api/v3/account` | 10 | 20 | 2023-08-25 |
| `GET /api/v3/order` | 2 | 4 | 2023-08-25 |

---

## Thay đổi tham số quan trọng

### `GET /api/v3/exchangeInfo`
- `showPermissionSets` (2024-10-17) – Ẩn permissions để giảm payload
- `symbolStatus` (2024-10-17) – Lọc symbols theo trạng thái
- `otoAllowed` trong response (2024-04-25) – Cho biết symbol có hỗ trợ OTO
- `opoAllowed` trong response (2025-12-18) – Cho biết symbol có hỗ trợ OPO
- `amendAllowed` trong response (2025-04-24) – Cho biết symbol có hỗ trợ Order Amend
- `sors` trong response (2023-08-08) – Danh sách SORs

### `GET /api/v3/account`
- `omitZeroBalances` (2024-04-02) – Ẩn các balance bằng 0
- `preventSor` trong response (2023-07-11)
- `uid` trong response (2023-07-11)

### Timestamp parameters
- `startTime` == `endTime` được chấp nhận (từ 2023-03-13)
- Timestamp trước 2017-01-01 bị reject (từ 2024-12-09)
- Timestamp > 10 giây trong tương lai bị reject (từ 2024-12-09)
- Hỗ trợ **microseconds** qua header `X-MBX-TIME-UNIT` (từ 2024-12-17)

### Signing (Request Security)
- **Phải percent-encode payload TRƯỚC khi tính signature** (từ 2026-01-15)
- Hỗ trợ Ed25519, RSA, HMAC keys

---

## Base URLs

| URL | Ghi chú |
|-----|---------|
| `https://api.binance.com` | Chính thức, ổn định nhất |
| `https://api1.binance.com` | Cao hơn hiệu suất, ít ổn định hơn |
| `https://api2.binance.com` | Tương tự api1 |
| `https://api3.binance.com` | Tương tự api1 |
| `https://api4.binance.com` | Thêm vào 2023-01-23 |
| `https://api-gcp.binance.com` | GCP CDN, thêm 2023-06-06 |
| `https://data-api.binance.vision` | Market data (thay `data.binance.com`) |
