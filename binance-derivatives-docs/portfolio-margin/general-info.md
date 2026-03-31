# 💼 Portfolio Margin – General Info & Endpoints

> Base URL: `https://papi.binance.com`  
> Tài liệu chính: https://developers.binance.com/docs/derivatives/portfolio-margin/general-info

---

## Base URLs

| Môi trường | REST |
|-----------|------|
| **Production** | `https://papi.binance.com` |
| **Testnet** | Không có |

---

## Rate Limits

| Loại | Giới hạn |
|------|---------|
| IP Rate Limit | **6,000 requests/phút** |
| Order Rate Limit | **1,200 orders/phút** (giảm từ 2,400/phút từ 2023-09-04) |

- Header: `X-MBX-USED-WEIGHT-(intervalNum)(intervalLetter)`
- Header: `X-MBX-ORDER-COUNT-(intervalNum)(intervalLetter)`
- IP ban: HTTP 418, từ 2 phút đến 3 ngày
- `recvWindow` mặc định: 5000ms, tối đa: **60,000ms**

---

## Endpoint Security

| Security Type | Mô tả |
|--------------|-------|
| `NONE` | Truy cập tự do |
| `TRADE` | Cần API-Key + signature |
| `USER_DATA` | Cần API-Key + signature |
| `USER_STREAM` | Cần API-Key + signature |

API-Key gửi qua header `X-MBX-APIKEY`. Signature theo HMAC SHA256 hoặc RSA PKCS#8.

---

## 📈 UM Futures Endpoints (USDⓈ-M side)

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| POST | `/papi/v1/um/order` | Place UM order (STP, priceMatch, GTD, RPI support) |
| GET | `/papi/v1/um/order` | Query UM order |
| PUT | `/papi/v1/um/order` | Modify UM limit order (từ 2024-01-19) |
| DELETE | `/papi/v1/um/order` | Cancel UM order |
| DELETE | `/papi/v1/um/allOpenOrders` | Cancel all UM open orders |
| GET | `/papi/v1/um/openOrder` | Query UM open order |
| GET | `/papi/v1/um/openOrders` | All UM open orders |
| GET | `/papi/v1/um/allOrders` | All UM orders |
| GET | `/papi/v1/um/orderAmendment` | UM order modify history (từ 2024-01-19) |
| GET | `/papi/v1/um/userTrades` | UM trade list (field `marginAsset` xóa từ 2024-07-17) |
| GET | `/papi/v1/um/positionRisk` | UM position risk (field `liquidationPrice` từ 2023-09-22, `breakEvenPrice` từ 2024-01-11) |
| POST | `/papi/v1/um/leverage` | Change UM leverage |
| POST | `/papi/v1/um/marginType` | Change UM margin type |
| POST | `/papi/v1/um/positionSide/dual` | Change UM position mode |
| GET | `/papi/v1/um/positionSide/dual` | Get UM position mode |
| GET | `/papi/v1/um/adlQuantile` | UM ADL quantile (từ 2023-07-20) |
| GET | `/papi/v1/um/leverageBracket` | UM leverage bracket (field `notionalCoef` từ 2023-09-22) |
| GET | `/papi/v1/um/account` | UM account info (field `tradeGroupId`, `breakEvenPrice` từ 2024-01-11) |
| GET | `/papi/v2/um/account` | UM account info V2 - chỉ trả về active symbols (từ 2024-08-23) |
| GET | `/papi/v1/um/accountConfig` | UM account configuration (từ 2024-08-23) |
| GET | `/papi/v1/um/symbolConfig` | UM symbol configuration (từ 2024-08-23) |
| POST | `/papi/v1/um/feeBurn` | Toggle BNB Burn cho UM trade (từ 2024-08-23) |
| GET | `/papi/v1/um/feeBurn` | BNB Burn status |
| GET | `/papi/v1/um/income` | UM income history (từ 2023-06-01) |
| GET | `/papi/v1/um/trade/asyn` | Download Id cho UM trade history (từ 2024-10-15) |
| GET | `/papi/v1/um/trade/asyn/id` | UM trade download link |
| GET | `/papi/v1/um/order/asyn` | Download Id cho UM order history (từ 2024-10-15) |
| GET | `/papi/v1/um/order/asyn/id` | UM order download link |
| GET | `/papi/v1/um/income/asyn` | Download Id cho UM transaction history (từ 2024-10-15) |
| GET | `/papi/v1/um/income/asyn/id` | UM income download link |

---

## UM Conditional Orders

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| POST | `/papi/v1/um/conditional/order` | Place UM conditional order (priceMatch, GTD, STP support) |
| DELETE | `/papi/v1/um/conditional/order` | Cancel UM conditional order |
| GET | `/papi/v1/um/conditional/openOrder` | Query UM conditional open order |
| GET | `/papi/v1/um/conditional/openOrders` | All UM conditional open orders |
| GET | `/papi/v1/um/conditional/orderHistory` | UM conditional order history |
| GET | `/papi/v1/um/conditional/allOrders` | All UM conditional orders |

---

## 🔵 CM Futures Endpoints (COIN-M side)

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| POST | `/papi/v1/cm/order` | Place CM order |
| GET | `/papi/v1/cm/order` | Query CM order |
| PUT | `/papi/v1/cm/order` | Modify CM limit order (từ 2024-01-19) |
| DELETE | `/papi/v1/cm/order` | Cancel CM order |
| DELETE | `/papi/v1/cm/allOpenOrders` | Cancel all CM open orders |
| GET | `/papi/v1/cm/openOrder` | Query CM open order |
| GET | `/papi/v1/cm/openOrders` | All CM open orders |
| GET | `/papi/v1/cm/allOrders` | All CM orders |
| GET | `/papi/v1/cm/orderAmendment` | CM order modify history (từ 2024-01-19) |
| GET | `/papi/v1/cm/userTrades` | CM trade list |
| GET | `/papi/v1/cm/positionRisk` | CM position risk (field `liquidationPrice` từ 2023-09-22, `breakEvenPrice` từ 2024-01-11) |
| POST | `/papi/v1/cm/leverage` | Change CM leverage |
| POST | `/papi/v1/cm/marginType` | Change CM margin type |
| POST | `/papi/v1/cm/positionSide/dual` | Change CM position mode |
| GET | `/papi/v1/cm/positionSide/dual` | Get CM position mode |
| GET | `/papi/v1/cm/adlQuantile` | CM ADL quantile (từ 2023-07-20) |
| GET | `/papi/v1/cm/leverageBracket` | CM leverage bracket (field `notionalCoef` từ 2023-09-22) |
| GET | `/papi/v1/cm/account` | CM account info (field `breakEvenPrice` từ 2024-01-11) |
| GET | `/papi/v1/cm/income` | CM income history (từ 2023-06-01) |

---

## CM Conditional Orders

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| POST | `/papi/v1/cm/conditional/order` | Place CM conditional order |
| DELETE | `/papi/v1/cm/conditional/order` | Cancel CM conditional order |
| GET | `/papi/v1/cm/conditional/openOrder` | Query CM conditional open order |
| GET | `/papi/v1/cm/conditional/openOrders` | All CM conditional open orders |
| GET | `/papi/v1/cm/conditional/orderHistory` | CM conditional order history |
| GET | `/papi/v1/cm/conditional/allOrders` | All CM conditional orders |

---

## 💰 Margin Endpoints

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| POST | `/papi/v1/margin/order` | Place margin order (STP support từ 2024-01-11) |
| DELETE | `/papi/v1/margin/order` | Cancel margin order |
| DELETE | `/papi/v1/margin/allOpenOrders` | Cancel all margin open orders |
| POST | `/papi/v1/margin/order/oco` | Place margin OCO order |
| DELETE | `/papi/v1/margin/orderList` | Cancel margin OCO order |
| GET | `/papi/v1/margin/order` | Query margin order (từ 2023-08-18) |
| GET | `/papi/v1/margin/openOrders` | Current margin open orders (từ 2023-08-18) |
| GET | `/papi/v1/margin/allOrders` | All margin orders (từ 2023-08-18) |
| GET | `/papi/v1/margin/orderList` | Margin OCO (từ 2023-08-18) |
| GET | `/papi/v1/margin/allOrderList` | All margin OCOs (từ 2023-08-18) |
| GET | `/papi/v1/margin/openOrderList` | Open margin OCOs (từ 2023-08-18) |
| GET | `/papi/v1/margin/myTrades` | Margin trade list (từ 2023-08-18) |
| POST | `/papi/v1/margin/repay-debt` | Repay margin debt (từ 2024-09-19) |

---

## 🏦 Account Endpoints

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| GET | `/papi/v1/account` | Portfolio margin account info |
| GET | `/papi/v1/balance` | Balance |
| GET | `/papi/v1/maxBorrowable` | Max borrow amount |
| GET | `/papi/v1/maxWithdraw` | Max withdraw amount |
| GET | `/papi/v1/portfolio/interest-history` | Interest history |
| POST | `/papi/v1/auto-collection` | Fund auto-collection |
| POST | `/papi/v1/asset-collection` | Fund Collection by Asset (từ 2023-07-28) |
| POST | `/papi/v1/portfolio/asset-collection` | Aggregate balance collection |
| POST | `/papi/v1/repay-futures-switch` | Change Auto-repay-futures Status (từ 2023-07-18, rate limit 20/ngày từ 2024-11-01) |
| GET | `/papi/v1/repay-futures-switch` | Get Auto-repay-futures Status |
| POST | `/papi/v1/repay-futures-negative-balance` | Repay futures Negative Balance (từ 2023-07-18) |
| GET | `/papi/v1/portfolio/negative-balance-exchange-record` | Negative balance auto exchange records (từ 2025-01-20) |
| GET | `/papi/v1/rateLimit/order` | User rate limit (từ 2025-01-06) |
| GET | `/papi/v1/portfolio/pmloan-history` | PM loan repay records (từ 2025-02-28) |
| POST | `/sapi/v1/portfolio/earn-asset-transfer` | Transfer LDUSDT cho PM (từ 2025-04-15) |
| GET | `/sapi/v1/portfolio/earn-asset-balance` | Get transferable Earn asset balance (từ 2025-04-15) |
| POST | `/sapi/v1/portfolio/delta-mode` | Switch Delta Mode (từ 2026-01-09) |
| GET | `/sapi/v1/portfolio/delta-mode` | Query Delta Mode status (từ 2026-01-09) |
| POST | `/papi/v1/ping` | Connectivity test (từ 2023-07-11) |

---

## 📊 Market Data

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| GET | `/papi/v1/um/exchangeInfo` | UM exchange info |
| GET | `/papi/v1/cm/exchangeInfo` | CM exchange info |

---

## 👁️ User Data Streams Events

Kết nối tới: `wss://fstream.binance.com/pm/ws/<listenKey>`

### Events Portfolio Margin

| Event | Mô tả |
|-------|-------|
| `ACCOUNT_UPDATE` | Balance và position update (field `U` updateId từ 2023-09-22, `bep` breakeven từ 2024-01-11) |
| `ORDER_TRADE_UPDATE` | Order/trade update (fields `V` STP, `pm` priceMatch, `gtd` goodTillDate) |
| `CONDITIONAL_ORDER_TRADE_UPDATE` | Conditional order update |
| `outboundAccountPosition` | Account position update (field `U` updateId từ 2023-09-22) |
| `balanceUpdate` | Balance update (field `U` updateId từ 2023-09-22) |
| `executionReport` | Margin order execution (STP fields: `u`, `v`, `U`, `A`, `B` từ 2024-01-11) |
| `listStatus` | OCO list status |
| `riskLevelChange` | Account risk level change (từ 2023-07-13) |

---

## 🛡️ Self-Trade Prevention (từ 2024-01-11)

Supported modes: `NONE`, `EXPIRE_TAKER`, `EXPIRE_BOTH`, `EXPIRE_MAKER`

Supported endpoints:
- `POST /papi/v1/um/order`
- `POST /papi/v1/um/conditional/order`
- `POST /papi/v1/margin/order`
- `POST /papi/v1/margin/order/oco`

---

## 💡 Price Match (từ 2024-09-06)

Parameter `priceMatch` cho UM orders.
Field `pm` trong `ORDER_TRADE_UPDATE` và `CONDITIONAL_ORDER_TRADE_UPDATE`.

Modes: `NONE`, `OPPONENT`, `OPPONENT_5`, `OPPONENT_10`, `OPPONENT_20`, `QUEUE`, `QUEUE_5`, `QUEUE_10`, `QUEUE_20`
> `OPPONENT_10` và `OPPONENT_20` tạm thời bị xóa từ 2025-10-23
