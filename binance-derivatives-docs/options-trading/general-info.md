# ⚙️ Options Trading – General Info & Endpoints

> Base URL: `https://eapi.binance.com`  
> Tài liệu chính: https://developers.binance.com/docs/derivatives/options-trading/general-info

---

## Base URLs

| Môi trường | REST | WebSocket |
|-----------|------|-----------|
| **Production** | `https://eapi.binance.com` | `wss://nbstream.binance.com/eoptions` |
| **Testnet** | `https://testnet.binancefuture.com` | `wss://fstream.binancefuture.com/public/` |

### WebSocket Production URL Paths
- High Performance Market Data: `wss://nbstream.binance.com/eoptions/public/`
- Market Data: `wss://nbstream.binance.com/eoptions/market/`  
- Private Data: `wss://nbstream.binance.com/eoptions/private/`

---

## HTTP Return Codes

Tương tự USDⓈ-M Futures. Xem [General Info USDⓈ-M](../usds-margined-futures/general-info.md).

**Lưu ý:** Đối với `GET` endpoints, parameters phải gửi trong `query string` **không** set content type trong HTTP headers (từ 2023-05-30).

---

## Rate Limits

- Theo `rateLimits` trong `/eapi/v1/exchangeInfo` (field `rateLimits` thêm từ 2022-08-22)
- Header `X-MBX-USED-WEIGHT-*` và `X-MBX-ORDER-COUNT-*`

---

## WebSocket Ping/Pong (sau upgrade 2023-10-19)

| Thông số | Giá trị |
|---------|---------|
| Ping interval | Mỗi 3 phút (trước: 5 phút) |
| Pong timeout | 10 phút (trước: 15 phút) |
| Trailing `/` trong URL | **Không còn hỗ trợ** |

---

## 📊 Market Data Endpoints

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| GET | `/eapi/v1/ping` | Test connectivity |
| GET | `/eapi/v1/time` | Server time |
| GET | `/eapi/v1/exchangeInfo` | Exchange info (field `rateLimits` từ 2022-08-22; xóa `id`, `contractId` từ 2024-10-28) |
| GET | `/eapi/v1/index` | Spot index price |
| GET | `/eapi/v1/depth` | Order book (field `u` updateId từ 2022-12-09) |
| GET | `/eapi/v1/trades` | Recent trades |
| GET | `/eapi/v1/historicalTrades` | Historical trades |
| GET | `/eapi/v1/klines` | Klines |
| GET | `/eapi/v1/mark` | Option mark price |
| GET | `/eapi/v1/ticker` | Option 24hr stats |
| GET | `/eapi/v1/openInterest` | Open interest (từ 2022-11-18) |
| GET | `/eapi/v1/exerciseHistory` | Exercise history (param `underlying` từ 2022-12-09) |
| GET | `/eapi/v1/blockTrades` | Recent block trades (từ 2024-12-17) |

---

## 💼 Account Endpoints

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| GET | `/eapi/v1/account` | Account info (field `riskLevel` từ 2023-08-29) |
| GET | `/eapi/v1/marginAccount` | Margin account info (field `riskLevel` từ 2023-08-29) |
| GET | `/eapi/v1/bill` | Account fund flow |
| GET | `/eapi/v1/income/asyn` | Download Id cho Option Transaction History (từ 2023-07-21) |
| GET | `/eapi/v1/income/asyn/id` | Download Link |
| POST | `/eapi/v1/listenKey` | Start user data stream |
| PUT | `/eapi/v1/listenKey` | Keepalive |
| DELETE | `/eapi/v1/listenKey` | Close |
| GET | `/eapi/v1/commission` | User commission rate (từ 2026-01-07) |

---

## 📈 Trade Endpoints

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| POST | `/eapi/v1/order` | Place order |
| DELETE | `/eapi/v1/order` | Cancel order |
| DELETE | `/eapi/v1/batchOrders` | Batch cancel orders |
| DELETE | `/eapi/v1/allOpenOrders` | Cancel all open orders |
| DELETE | `/eapi/v1/allOpenOrdersByUnderlying` | Cancel all by underlying |
| GET | `/eapi/v1/order` | Query order (từ 2023-01-11) |
| GET | `/eapi/v1/openOrders` | Open orders |
| GET | `/eapi/v1/historyOrders` | Order history (chỉ 5 ngày gần nhất từ 2022-09-14) |
| GET | `/eapi/v1/userTrades` | Trade list (param `symbol` không bắt buộc từ 2022-08-22) |
| GET | `/eapi/v1/exerciseRecord` | Exercise records |
| GET | `/eapi/v1/position` | Current positions |

---

## ⏱️ Kill-Switch Endpoints (từ 2022-11-03)

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| POST | `/eapi/v1/countdownCancelAll` | Set Auto-Cancel All Open Orders config |
| GET | `/eapi/v1/countdownCancelAll` | Get config |
| POST | `/eapi/v1/countdownCancelAllHeartBeat` | Heartbeat |

---

## 🤝 Market Maker Block Trade Endpoints (từ 2024-11-01)

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| POST | `/eapi/v1/block/order/create` | Create block order (RFQ) |
| PUT | `/eapi/v1/block/order/create` | Update block order |
| DELETE | `/eapi/v1/block/order/create` | Delete block order |
| GET | `/eapi/v1/block/order/orders` | Get block orders |
| POST | `/eapi/v1/block/order/execute` | Execute block trade |
| GET | `/eapi/v1/block/order/execute` | Get executed block trades |
| GET | `/eapi/v1/block/user-trades` | User block trade history |

---

## 📡 WebSocket Market Streams

**Base URL:** `wss://nbstream.binance.com/eoptions`

### Streams có sẵn

| Stream | Mô tả |
|--------|-------|
| `<symbol>@trade` | Trade stream (field `X` trade type từ 2024-12-17) |
| `<underlyingAsset>@trade` | All option trades trên underlying (từ 2022-11-16) |
| `<symbol>@depth<levels>` | Partial book depth (field `E` event time từ 2023-07-13) |
| `<symbol>@depth1000` | Full order book (fields `u`, `pu` từ 2022-12-13) |
| `<symbol>@ticker` | Symbol ticker (field `T` transaction time từ 2023-07-13) |
| `<underlyingAsset>@ticker@<expirationDate>` | Ticker by expiry (field `T` từ 2023-07-13) |
| `<underlyingAsset>@markPrice` | Mark price (từ 2022-09-20) |
| `<underlyingAsset>@openInterest@<expirationDate>` | Open interest (từ 2022-11-18) |
| `option_pair` | Option contract info (fields `id`, `cid` **bị xóa** từ 2024-10-28) |

**Deprecated:** `<!miniTicker@arr>` bị deprecated từ 2022-10-30.

---

## 📡 User Data Stream Events

| Event | Mô tả |
|-------|-------|
| `openingAccountInfo` | Account opening update |
| `accountGreeks` | Greeks update |
| `RISK_LEVEL_CHANGE` | Account risk level change (từ 2023-08-29) |

---

## 📋 Exchange Info – Fields quan trọng

Trong `GET /eapi/v1/exchangeInfo`:

- `optionContracts` – Danh sách contracts (**field `id` bị xóa** từ 2024-10-28)
- `optionAssets` – Danh sách assets (**field `id` bị xóa** từ 2024-10-28)
- `optionSymbols` – Danh sách symbols (**fields `id` và `contractId` bị xóa** từ 2024-10-28)
- `rateLimits` – Rate limit info (thêm từ 2022-08-22)
- `strikePrice`, `makerFeeRate`, v.v.: Đổi sang string type (từ 2022-09-14)

---

## 🔷 Options Demo Trading

Từ **2025-11-12**, Options Demo API environment đã ra mắt:
- Demo API: https://demo.binance.com
- Tạo API key: https://demo.binance.com/zh-CN/my/settings/api-management
- Giúp users adapt code với Options system mới trước khi chuyển sang Production

---

## Symbol Format

Options symbols có format: `<underlying>-<expiry>-<strike>-<type>`

Ví dụ: `BTC-210129-40000-C`
- `BTC` – Underlying
- `210129` – Expiry (YYMMDD)
- `40000` – Strike price
- `C` – Call option (hoặc `P` = Put option)
