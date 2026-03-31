# 🟡 USDⓈ-M Futures – WebSocket API Endpoints

> Base URL: `wss://ws-fapi.binance.com/ws-fapi/v1`  
> Ra mắt: **2024-04-01**  
> Tài liệu chính: https://developers.binance.com/docs/derivatives/usds-margined-futures/websocket-api-general-info

---

## Kết nối

- Mỗi request gửi dưới dạng JSON text frame
- Một request per frame
- Tương đương REST API về tính năng, filter, rate limit
- Cần 2 WebSocket connections riêng: 1 cho API, 1 cho market data streams

---

## Cấu trúc Request/Response

```json
// Request
{
  "id": "unique-id",
  "method": "order.place",
  "params": {
    "symbol": "BTCUSDT",
    "side": "BUY",
    "type": "LIMIT",
    "timeInForce": "GTC",
    "quantity": "0.1",
    "price": "50000",
    "apiKey": "YOUR_API_KEY",
    "signature": "...",
    "timestamp": 1234567890
  }
}

// Response
{
  "id": "unique-id",
  "status": 200,
  "result": { ... },
  "rateLimits": [ ... ]
}
```

---

## 📊 Market Data Methods

| Method | Mô tả |
|--------|-------|
| `time` | Server time |
| `exchangeInfo` | Exchange info |
| `depth` | Order book |
| `trades.recent` | Recent trades |
| `trades.historical` | Historical trades |
| `trades.aggregate` | Aggregate trades |
| `klines` | Kline data |
| `klines.continuous` | Continuous klines |
| `klines.index` | Index price klines |
| `klines.mark` | Mark price klines |
| `klines.premiumIndex` | Premium index klines |
| `ticker.24hr` | 24hr ticker |
| `ticker.price` | Price ticker |
| `ticker.book` | Book ticker |
| `openInterest` | Open interest |
| `tradingSession` | Trading session info (từ 2025-12-11) |

---

## 📈 Trade Methods

| Method | Mô tả |
|--------|-------|
| `order.place` | Place order |
| `order.status` | Query order |
| `order.modify` | Modify order |
| `order.cancel` | Cancel order |
| `order.cancelAll` | Cancel all open orders |
| `order.openStatus` | Query open order |
| `order.openOrders` | All open orders |
| `order.allOrders` | All orders |
| `batch.order.place` | Place batch orders |
| `batch.order.modify` | Modify batch orders |
| `batch.order.cancel` | Cancel batch orders |
| `algoOrder.place` | Place algo order (từ 2025-12-09) |
| `algoOrder.cancel` | Cancel algo order |

---

## 💼 Account Methods

| Method | Mô tả |
|--------|-------|
| `account.status` ⚠️ | Account info (deprecated → dùng v2) |
| `account.balance` ⚠️ | Balance (deprecated → dùng v2) |
| `account.position` ⚠️ | Position risk (deprecated → dùng v2) |
| `v2/account.status` | Improved account info (từ 2024-07-24) |
| `v2/account.balance` | Balance (từ 2024-07-24) |
| `v2/account.position` | Improved position risk (từ 2024-07-24) |
| `account.income` | Income history |
| `account.forceOrders` | Liquidation orders |
| `account.rateLimits.orders` | Order rate limits |
| `account.tradeList` | Trade list |
| `userDataStream.start` | Start User Data Stream |
| `userDataStream.ping` | Keepalive (trả về `listenKey` từ 2024-04-25) |
| `userDataStream.stop` | Close User Data Stream |

---

## 🔐 Authentication trong WebSocket API

### Per-request auth
Mỗi request gửi kèm `apiKey`, `signature`, `timestamp`.

### Session Auth (từ 2024-04-01)
```json
// Login (hỗ trợ Ed25519 keys)
{
  "id": "1",
  "method": "session.logon",
  "params": {
    "apiKey": "YOUR_API_KEY",
    "signature": "...",
    "timestamp": 1234567890
  }
}
```

Sau khi login, các requests tiếp theo không cần gửi lại `apiKey` và `signature`.

---

## Rate Limits trong WebSocket API

Giống REST API:
- Mỗi response trả về `rateLimits` array với IP weight usage
- Order count headers tương đương

---

## Lưu ý quan trọng

- WebSocket API **không thể** nhận market data streams. Cần kết nối riêng tới `wss://fstream.binance.com` cho streams.
- GTC orders max validity: **1 năm** (từ 2024-04-09)
- Conditional order types (`STOP`, `TAKE_PROFIT`, v.v.) → Dùng `algoOrder.place` từ 2025-12-09
