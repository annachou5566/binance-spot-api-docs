# 🔵 COIN-M Futures – General Info & Endpoints

> Base URL: `https://dapi.binance.com`  
> Tài liệu chính: https://developers.binance.com/docs/derivatives/coin-margined-futures/general-info

---

## Base URLs

| Môi trường | REST | WebSocket Streams | WebSocket API |
|-----------|------|-------------------|--------------|
| **Production** | `https://dapi.binance.com` | `wss://dstream.binance.com` | `wss://ws-dapi.binance.com/ws-dapi/v1` |
| **Testnet** | `https://testnet.binancefuture.com` | `wss://dstream.binancefuture.com` | - |

**WebSocket API ra mắt 2025-02-25.**

---

## Rate Limits

Tương tự USDⓈ-M Futures:
- IP limits theo `rateLimits` trong `/dapi/v1/exchangeInfo`
- Header `X-MBX-USED-WEIGHT-(intervalNum)(intervalLetter)` trong response
- Header `X-MBX-ORDER-COUNT-(intervalNum)(intervalLetter)` trong order response
- IP ban: HTTP 418, từ 2 phút đến 3 ngày

---

## Endpoint Security

Tương tự USDⓈ-M, xem [General Info USDⓈ-M](../usds-margined-futures/general-info.md)

Ký hiệu example với COIN-M:
```bash
# Parameters
symbol=BTCUSD_200925&side=BUY&type=LIMIT&quantity=1&price=9000&timeInForce=GTC&recvWindow=5000&timestamp=1591702613943

# Signature
echo -n "symbol=BTCUSD_200925..." | openssl dgst -sha256 -hmac "YOUR_SECRET_KEY"
```

---

## Common Definitions

### Contract Types
- `PERPETUAL`
- `CURRENT_QUARTER`
- `NEXT_QUARTER`
- `CURRENT_QUARTER_DELIVERING` (chỉ dùng khi đang DELIVERING)
- `NEXT_QUARTER_DELIVERING` (chỉ dùng khi đang DELIVERING)
- `PERPETUAL_DELIVERING`

### Contract Status
`PENDING_TRADING` | `TRADING` | `PRE_DELIVERING` | `DELIVERING` | `DELIVERED`

### Symbol Types
`DELIVERY_CONTRACT` | `PERPETUAL_CONTRACT`

### Order Types
`LIMIT` | `MARKET` | `STOP` | `STOP_MARKET` | `TAKE_PROFIT` | `TAKE_PROFIT_MARKET` | `TRAILING_STOP_MARKET`

### Time In Force
`GTC` | `IOC` | `FOK` | `GTX` | `GTD` | `GTE_GTC`

---

## 📊 Market Data Endpoints

| Method | Endpoint | Weight | Mô tả |
|--------|----------|--------|-------|
| GET | `/dapi/v1/ping` | 1 | Test connectivity |
| GET | `/dapi/v1/time` | 1 | Server time |
| GET | `/dapi/v1/exchangeInfo` | 1 | Exchange info |
| GET | `/dapi/v1/depth` | 2–10 | Order book |
| GET | `/dapi/v1/trades` | 5 | Recent trades |
| GET | `/dapi/v1/historicalTrades` | 20 | Historical trades (max 500, default 100 từ 2025-01-14) |
| GET | `/dapi/v1/aggTrades` | 20 | Aggregate trades (≤1 năm) |
| GET | `/dapi/v1/klines` | 1–10 | Klines |
| GET | `/dapi/v1/continuousKlines` | 1–10 | Continuous contract klines |
| GET | `/dapi/v1/indexPriceKlines` | 1–10 | Index price klines |
| GET | `/dapi/v1/markPriceKlines` | 1–10 | Mark price klines |
| GET | `/dapi/v1/premiumIndex` | 10 | Mark price & funding |
| GET | `/dapi/v1/fundingRate` | 1 | Funding rate history (field `markPrice` từ 2023-11-01) |
| GET | `/dapi/v1/fundingInfo` | 0 | Adjusted funding info (từ 2023-09-25) |
| GET | `/dapi/v1/ticker/24hr` | 1/40 | 24hr stats |
| GET | `/dapi/v1/ticker/price` | 1/2 | Price ticker |
| GET | `/dapi/v1/ticker/bookTicker` | 2/5 | Best bid/ask (field `lastUpdateId` từ 2023-09-20) |
| GET | `/dapi/v1/openInterest` | 1 | Open interest |
| GET | `/dapi/v1/constituents` | 0 | Index constituents (từ 2023-10-16) |
| GET | `/futures/data/openInterestHist` | 1 | Open interest stats |
| GET | `/futures/data/topLongShortAccountRatio` | 1 | Top long/short account ratio |
| GET | `/futures/data/topLongShortPositionRatio` | 1 | Top long/short position ratio |
| GET | `/futures/data/globalLongShortAccountRatio` | 1 | Global long/short ratio |
| GET | `/futures/data/takerlongshortRatio` | 1 | Taker long/short ratio |
| GET | `/futures/data/delivery-price` | 1 | Quarterly settlement price (từ 2023-10-19) |

---

## 📈 Trade Endpoints

| Method | Endpoint | Weight | Mô tả |
|--------|----------|--------|-------|
| POST | `/dapi/v1/order` | 0 | New order |
| GET | `/dapi/v1/order` | 1 | Query order (≤3 tháng) |
| PUT | `/dapi/v1/order` | 1 | Modify order |
| DELETE | `/dapi/v1/order` | 1 | Cancel order |
| DELETE | `/dapi/v1/allOpenOrders` | 1 | Cancel all open orders |
| POST | `/dapi/v1/batchOrders` | 0 | Place batch orders |
| PUT | `/dapi/v1/batchOrders` | 1 | Modify batch orders |
| DELETE | `/dapi/v1/batchOrders` | 1 | Cancel batch orders |
| GET | `/dapi/v1/openOrder` | 1 | Query open order |
| GET | `/dapi/v1/openOrders` | 1/40 | All open orders |
| GET | `/dapi/v1/allOrders` | 20 | All orders (≤3 tháng, default 7 ngày, max 7 ngày từ 2024-10-08) |
| GET | `/dapi/v1/orderAmendment` | 1 | Order modify history |
| GET | `/dapi/v1/userTrades` | 20 | Trade list (≤6 tháng, default 7 ngày, max 7 ngày) |
| POST | `/dapi/v1/leverage` | 1 | Change leverage |
| POST | `/dapi/v1/marginType` | 1 | Change margin type |
| POST | `/dapi/v1/positionMargin` | 1 | Modify isolated position margin |
| POST | `/dapi/v1/positionSide/dual` | 1 | Change position mode |
| GET | `/dapi/v1/positionSide/dual` | 30 | Get position mode |
| POST | `/dapi/v1/listenKey` | 1 | Start user data stream |
| PUT | `/dapi/v1/listenKey` | 1 | Keepalive |
| DELETE | `/dapi/v1/listenKey` | 1 | Close |

---

## 💼 Account Endpoints

| Method | Endpoint | Weight | Mô tả |
|--------|----------|--------|-------|
| GET | `/dapi/v1/account` | 5 | Account info (field `positionAmt` từ 2021-08-18, `updateTime` từ 2021-07-23) |
| GET | `/dapi/v1/balance` | 1 | Balance |
| GET | `/dapi/v1/positionRisk` | 5 | Position risk (field `breakEvenPrice` từ 2023-07-12) |
| GET | `/dapi/v1/income` | 20 | Income history (parameter `page` từ 2023-08-14) |
| GET | `/dapi/v1/income/asyn` | 1000 | Download Id cho income history (từ 2023-09-07) |
| GET | `/dapi/v1/income/asyn/id` | 10 | Download link |
| GET | `/dapi/v1/order/asyn` | - | Download Id cho order history (từ 2024-10-21) |
| GET | `/dapi/v1/order/asyn/id` | - | Download link |
| GET | `/dapi/v1/trade/asyn` | - | Download Id cho trade history |
| GET | `/dapi/v1/trade/asyn/id` | - | Download link |
| GET | `/dapi/v2/leverageBracket` | 1 | Leverage bracket (field `notionalCoef` từ 2023-07-19) |
| GET | `/dapi/v1/adlQuantile` | 5 | ADL quantile estimation |
| GET | `/dapi/v1/forceOrders` | 20/50 | Liquidation orders |
| GET | `/dapi/v1/commissionRate` | 20 | User commission rate |
| GET | `/dapi/v1/pmAccountInfo` ⚠️ | 1 | Portfolio Margin account info (deprecated từ 2024-08-06) |

---

## 🔵 Self-Trade Prevention (từ 2024-10-11)

Modes: `NONE`, `EXPIRE_TAKER`, `EXPIRE_BOTH`, `EXPIRE_MAKER`
Order status mới: `EXPIRED_IN_MATCH`
Field `V` (STP mode) trong `ORDER_TRADE_UPDATE`

---

## 🔵 Price Match (từ 2024-10-11)

Modes: `NONE`, `OPPONENT`, `OPPONENT_5`, `OPPONENT_10`, `OPPONENT_20`, `QUEUE`, `QUEUE_5`, `QUEUE_10`, `QUEUE_20`
> `OPPONENT_10` và `OPPONENT_20` tạm thời bị xóa từ 2025-10-23

Field `pm` trong `ORDER_TRADE_UPDATE`

---

## WebSocket Streams

**Base URL:** `wss://dstream.binance.com`

Streams tương tự USDⓈ-M nhưng dùng prefix:
- `<symbol>@` cho contract symbols (e.g., `BTCUSD_PERP@trade`)
- `<pair>@` cho underlying pairs (e.g., `BTCUSD@markPrice`)

### Mark Price Stream
```
<symbol>@markPrice
<pair>@markPrice
```
Field `i` (quote asset/index price) từ 2023-06-14

### Contract Info Stream
```
!contractInfo
```

### User Data Stream Events
- `ORDER_TRADE_UPDATE` – Order/trade updates (field `V`, `pm`, `er`)
- `ACCOUNT_UPDATE` – Balance/position updates (field `bc`)
- `ACCOUNT_CONFIG_UPDATE` – Leverage change (từ 2022-04-14)
- `STRATEGY_UPDATE` – Strategy updates (từ 2022-11-29)
- `GRID_UPDATE` – Grid order fill (từ 2022-11-29)
