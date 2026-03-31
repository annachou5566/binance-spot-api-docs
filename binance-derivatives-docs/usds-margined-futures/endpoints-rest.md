# 🟡 USDⓈ-M Futures – REST API Endpoints

> Base URL: `https://fapi.binance.com`  
> Tài liệu chính: https://developers.binance.com/docs/derivatives/usds-margined-futures/market-data/rest-api

---

## 📊 Market Data Endpoints

| Method | Endpoint | Weight | Mô tả |
|--------|----------|--------|-------|
| GET | `/fapi/v1/ping` | 1 | Test connectivity |
| GET | `/fapi/v1/time` | 1 | Server time |
| GET | `/fapi/v1/exchangeInfo` | 1 | Exchange trading rules & symbol info |
| GET | `/fapi/v1/depth` | 2–10 | Order book |
| GET | `/fapi/v1/trades` | 5 | Recent trades |
| GET | `/fapi/v1/historicalTrades` | 20 | Old trade lookup |
| GET | `/fapi/v1/aggTrades` | 20 | Compressed/aggregate trades |
| GET | `/fapi/v1/klines` | 1–10 | Kline/candlestick data |
| GET | `/fapi/v1/continuousKlines` | 1–10 | Continuous contract kline |
| GET | `/fapi/v1/indexPriceKlines` | 1–10 | Index price kline |
| GET | `/fapi/v1/markPriceKlines` | 1–10 | Mark price kline |
| GET | `/fapi/v1/premiumIndexKlines` | 1–10 | Premium index kline |
| GET | `/fapi/v1/premiumIndex` | 1 | Mark price và funding rate |
| GET | `/fapi/v1/fundingRate` | 1 | Funding rate history |
| GET | `/fapi/v1/fundingInfo` | 0 | Adjusted funding info |
| GET | `/fapi/v1/ticker/24hr` | 1/40 | 24hr price change stats |
| GET | `/fapi/v1/ticker/price` | 1/2 | Symbol price ticker |
| GET | `/fapi/v2/ticker/price` | 0/0 | Latest price (v2, low latency) |
| GET | `/fapi/v1/ticker/bookTicker` | 2/5 | Best bid/ask |
| GET | `/fapi/v1/openInterest` | 1 | Open interest |
| GET | `/fapi/v1/constituents` | 0 | Index constituents (thêm field `price`, `weight` từ 2025-04-23) |
| GET | `/fapi/v1/assetIndex` | 1/10 | Asset index (Multi-Assets mode) |
| GET | `/futures/data/openInterestHist` | 1 | Open interest statistics |
| GET | `/futures/data/topLongShortAccountRatio` | 1 | Top long/short account ratio |
| GET | `/futures/data/topLongShortPositionRatio` | 1 | Top long/short position ratio |
| GET | `/futures/data/globalLongShortAccountRatio` | 1 | Global long/short ratio |
| GET | `/futures/data/takerlongshortRatio` | 1 | Taker long/short ratio |
| GET | `/futures/data/basis` | 1 | Basis data |
| GET | `/futures/data/delivery-price` | 1 | Quarterly contract settlement price |
| GET | `/fapi/v1/tradingSchedule` | - | Trading session schedules (mới 2025-12-11) |
| GET | `/fapi/v1/rpiDepth` | - | RPI order book (mới 2025-11-25) |
| GET | `/fapi/v1/insuranceBalance` | - | Insurance fund balance (mới 2025-04-23) |
| GET | `/fapi/v1/symbolAdlRisk` | - | ADL risk rating (mới 2025-11-19) |

---

## 💼 Account Endpoints

| Method | Endpoint | Weight | Mô tả |
|--------|----------|--------|-------|
| GET | `/fapi/v2/balance` ⚠️ | 10 | Balance (deprecated → dùng v3) |
| GET | `/fapi/v2/account` ⚠️ | 10 | Account info (deprecated → dùng v3) |
| GET | `/fapi/v2/positionRisk` ⚠️ | 10 | Position risk (deprecated → dùng v3) |
| GET | `/fapi/v3/balance` | - | Account balance (V3, từ 2024-07-24) |
| GET | `/fapi/v3/account` | - | Account info (V3, từ 2024-07-24) |
| GET | `/fapi/v3/positionRisk` | - | Position risk (V3, từ 2024-07-24) |
| GET | `/fapi/v1/symbolConfig` | - | Symbol configuration (từ 2024-07-24) |
| GET | `/fapi/v1/accountConfig` | - | Account configuration (từ 2024-07-24) |
| GET | `/fapi/v1/income` | 30 | Income history |
| GET | `/fapi/v1/income/asyn` | 1000 | Download Id cho income history |
| GET | `/fapi/v1/income/asyn/id` | 10 | Download link cho income history |
| GET | `/fapi/v1/order/asyn` | 1000 | Download Id cho order history |
| GET | `/fapi/v1/order/asyn/id` | 10 | Download link cho order history |
| GET | `/fapi/v1/trade/asyn` | 1000 | Download Id cho trade history |
| GET | `/fapi/v1/trade/asyn/id` | 10 | Download link cho trade history |
| GET | `/fapi/v1/rateLimit/order` | - | User order rate limits (từ 2024-03-11) |
| GET | `/fapi/v1/adlQuantile` | 5 | Position ADL quantile estimation |
| GET | `/fapi/v1/positionMargin/history` | 1 | Position margin history (≤30 ngày) |
| GET | `/fapi/v1/forceOrders` | 20/50 | Liquidation orders |
| POST | `/fapi/v1/feeBurn` | - | Toggle BNB Burn (từ 2024-05-22) |
| GET | `/fapi/v1/feeBurn` | - | BNB Burn status |
| GET | `/fapi/v1/commissionRate` | 20 | User commission rate |
| GET | `/fapi/v1/apiTradingStatus` | 1 | Account trading status |
| GET | `/fapi/v1/tradingStatus` | 1 | Futures trading quantitative rules |
| GET | `/fapi/v1/pmAccountInfo` ⚠️ | 1 | Portfolio Margin account info (deprecated) |

---

## 📈 Trade Endpoints

| Method | Endpoint | Weight | Mô tả |
|--------|----------|--------|-------|
| POST | `/fapi/v1/order` | 0 | New order |
| POST | `/fapi/v1/order/test` | 0 | Test new order |
| GET | `/fapi/v1/order` | 1 | Query order (≤3 tháng) |
| PUT | `/fapi/v1/order` | 1 | Modify order (từ 2023-05-05) |
| DELETE | `/fapi/v1/order` | 1 | Cancel order |
| DELETE | `/fapi/v1/allOpenOrders` | 1 | Cancel all open orders |
| POST | `/fapi/v1/batchOrders` | 0 | Place multiple orders |
| PUT | `/fapi/v1/batchOrders` | 1 | Modify multiple orders |
| DELETE | `/fapi/v1/batchOrders` | 1 | Cancel multiple orders |
| GET | `/fapi/v1/openOrder` | 1 | Query current open order |
| GET | `/fapi/v1/openOrders` | 1/40 | All current open orders |
| GET | `/fapi/v1/allOrders` | 20 | All orders (≤3 tháng) |
| GET | `/fapi/v1/orderAmendment` | 1 | Order modify history (từ 2023-05-05) |
| GET | `/fapi/v1/userTrades` | 20 | Account trade list (≤6 tháng) |
| POST | `/fapi/v1/countdown/cancelAll` | 10 | Auto-Cancel All Open Orders (Kill-Switch) |
| GET | `/fapi/v1/countdownCancelAll` | 10 | Kill-Switch config |
| POST | `/fapi/v1/listenKey` | 1 | Start user data stream |
| PUT | `/fapi/v1/listenKey` | 1 | Keepalive user data stream |
| DELETE | `/fapi/v1/listenKey` | 1 | Close user data stream |
| POST | `/fapi/v1/leverage` | 1 | Change initial leverage |
| POST | `/fapi/v1/marginType` | 1 | Change margin type |
| POST | `/fapi/v1/positionMargin` | 1 | Modify isolated position margin |
| POST | `/fapi/v1/positionSide/dual` | 1 | Change position mode |
| GET | `/fapi/v1/positionSide/dual` | 30 | Get current position mode |
| POST | `/fapi/v1/multiAssetsMargin` | 1 | Change Multi-Assets margin mode |
| GET | `/fapi/v1/multiAssetsMargin` | 30 | Get Multi-Assets margin mode |

---

## ⚡ Algo Order Endpoints (từ 2025-11-06, hiệu lực 2025-12-09)

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| POST | `/fapi/v1/algoOrder` | Place algo order (STOP, TAKE_PROFIT, TRAILING_STOP, v.v.) |
| DELETE | `/fapi/v1/algoOrder` | Cancel algo order |
| DELETE | `/fapi/v1/algoOpenOrders` | Cancel all open algo orders |
| GET | `/fapi/v1/algoOrder` | Query algo order |
| GET | `/fapi/v1/openAlgoOrders` | Query open algo orders |
| GET | `/fapi/v1/allAlgoOrders` | Query all algo orders |

---

## 🔄 Convert Endpoints (từ 2024-08-26)

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| GET | `/fapi/v1/convert/exchangeInfo` | List all convert pairs |
| POST | `/fapi/v1/convert/getQuote` | Request quote (rate limit: 360/giờ, 500/ngày) |
| POST | `/fapi/v1/convert/acceptQuote` | Accept quote |
| GET | `/fapi/v1/convert/orderStatus` | Order status |

---

## 📜 Exchange Info – Các fields quan trọng

Từ `GET /fapi/v1/exchangeInfo`:
- `rateLimits` – Rate limit thông tin
- `symbols` – Symbol info với `filters`
- `assets` – Asset info (thêm từ 2021-05-06)
- `sors` – Không có cho FAPI (chỉ Spot)
- `liquidationFee` – Liquidation fee rate (thêm 2021-07-06)
- `marketTakeBound` – Max price difference cho market orders (thêm 2021-07-06)
- Field `MAX_NUM_ALGO_ORDERS` filter **bị xóa** từ 2025-12-29 (conditional order limit = 200)

---

## 🏷️ Order Types

- `LIMIT`
- `MARKET`
- `STOP` (→ Algo Service từ 2025-12-09)
- `STOP_MARKET` (→ Algo Service từ 2025-12-09)
- `TAKE_PROFIT` (→ Algo Service từ 2025-12-09)
- `TAKE_PROFIT_MARKET` (→ Algo Service từ 2025-12-09)
- `TRAILING_STOP_MARKET` (→ Algo Service từ 2025-12-09)
- `LIQUIDATION` (chỉ hệ thống)

---

## ⏱️ Time In Force

| TIF | Mô tả |
|-----|-------|
| `GTC` | Good Till Cancel (max 1 năm từ 2024-04-09) |
| `IOC` | Immediate or Cancel |
| `FOK` | Fill or Kill (rejected trực tiếp nếu không fill được từ 2023-03-22) |
| `GTX` | Post-Only (rejected trực tiếp nếu không fill được từ 2023-03-22) |
| `GTD` | Good Till Date |
| `GTE_GTC` | Good Till Expiry - Good Till Cancel (dùng cho Algo/conditional orders) |
| `RPI` | Retail Price Improvement (từ 2025-11-18) |

---

## 💰 Price Match Modes

| Mode | Mô tả |
|------|-------|
| `NONE` | Không dùng price match |
| `OPPONENT` | Best price phía đối diện |
| `OPPONENT_5` | 5th best price phía đối diện |
| `OPPONENT_10` | 10th best price (tạm thời bị xóa từ 2025-10-23) |
| `OPPONENT_20` | 20th best price (tạm thời bị xóa từ 2025-10-23) |
| `QUEUE` | Best price cùng phía |
| `QUEUE_5` | 5th best price cùng phía |
| `QUEUE_10` | 10th best price cùng phía |
| `QUEUE_20` | 20th best price cùng phía |

---

## 🛡️ Self-Trade Prevention Modes

| Mode | Mô tả |
|------|-------|
| `NONE` | Không có STP |
| `EXPIRE_TAKER` | Expire taker order khi trigger |
| `EXPIRE_BOTH` | Expire cả taker và maker |
| `EXPIRE_MAKER` | Expire maker order khi trigger |

Order status mới: `EXPIRED_IN_MATCH` (order expired do STP)
