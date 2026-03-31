# 📅 Thay đổi năm 2024

> Nguồn: https://developers.binance.com/docs/derivatives/change-log

---

## 2024-12-19

**Portfolio Margin Pro & Portfolio Margin** (ra mắt 2024-12-20)
- `POST sapi/v1/portfolio/mint` – BFUSD mint
- `POST sapi/v1/portfolio/redeem` – BFUSD redeem

---

## 2024-12-17

**Options Trading**
- REST: `GET /eapi/v1/blockTrades` – Recent block trades
- WebSocket: Field `X` (trade type) trong `<symbol>@trade` và `<underlyingAsset>@trade`

---

## 2024-12-02

**USDⓈ-M Futures** (hiệu lực 2024-12-03)
- Error code `-4116`: ClientOrderId is duplicated
- Error code `-4117`: Stop order is in triggering process

---

## 2024-11-04

- `GET /fapi/v1/pmExchangeInfo` và `GET /dapi/v1/pmExchangeInfo` bị deprecated từ **2024-11-15**

---

## 2024-11-01

**Options Trading – Block Trade endpoints**
- `POST eapi/v1/block/order/create`
- `PUT eapi/v1/block/order/create`
- `DELETE eapi/v1/block/order/create`
- `GET eapi/v1/block/order/orders`
- `POST eapi/v1/block/order/execute`
- `GET eapi/v1/block/order/execute`
- `GET eapi/v1/block/user-trades`

---

## 2024-10-29

- Rate limit của `POST /sapi/v1/portfolio/repay-futures-switch` và `POST /papi/v1/repay-futures-switch` điều chỉnh thành **20/ngày** (từ 2024-11-01)

---

## 2024-10-24

**Options** (hiệu lực 2024-10-28)
- `GET /eapi/v1/exchangeInfo`: Xóa field `id` khỏi `optionContracts`, `optionAssets`; xóa `contractId` và `id` khỏi `optionSymbols`
- WebSocket `option_pair`: Xóa fields `id` và `cid`

---

## 2024-10-21

**USDⓈ-M & COIN-M Futures** (hiệu lực 2024-10-30)
- `GET /fapi/v1/userTrades` và `GET /dapi/v1/userTrades`: Chỉ query **6 tháng** gần nhất

**COIN-M Futures – Download endpoints mới**
- `GET /dapi/v1/order/asyn` và `asyn/id`
- `GET /dapi/v1/trade/asyn` và `asyn/id`

---

## 2024-10-15

**Portfolio Margin Pro** (ra mắt 2024-10-18)
- `GET /sapi/v2/portfolio/account` – PM Pro SPAN Account Info
- `GET /sapi/v1/portfolio/balance` – PM Pro Account Balance Info

**Portfolio Margin – Download endpoints mới**
- UM trade/order/income: `GET /papi/v1/um/trade/asyn`, `asyn/id`, `order/asyn`, `asyn/id`, `income/asyn`, `asyn/id`

---

## 2024-10-14

**USDⓈ-M Futures** (hiệu lực 2024-10-19)
- `POST /fapi/v1/convert/getQuote`: Rate limit → **360/giờ, 500/ngày**; `validTime` chỉ có thể là `10s`

---

## 2024-10-11

**COIN-M Futures – STP và Price Match ra mắt**

STP modes: `NONE`, `EXPIRE_TAKER`, `EXPIRE_BOTH`, `EXPIRE_MAKER`
- Parameter `selfTradePreventionMode` cho `POST /dapi/v1/order`, `POST /dapi/v1/batchOrders`
- Field `V` (STP mode) trong `ORDER_TRADE_UPDATE`

Price Match modes: `NONE`, `OPPONENT`, `OPPONENT_5`, `OPPONENT_10`, `OPPONENT_20`, `QUEUE`, `QUEUE_5`, `QUEUE_10`, `QUEUE_20`
- Parameter `priceMatch` cho order và batch order endpoints
- Field `pm` trong `ORDER_TRADE_UPDATE`

---

## 2024-10-10

- `GET /fapi/v1/aggTrades` và `/dapi/v1/aggTrades`: Hỗ trợ query đến **1 năm** (từ 2024-10-17)
- `GET /fapi/v1/positionMargin/history`: Hỗ trợ query **30 ngày** gần nhất (từ 2024-10-16)

---

## 2024-10-08

**COIN-M Futures**
- `GET /dapi/v1/allOrders` và `GET /dapi/v1/userTrades`: Default 7 ngày, max 7 ngày, chỉ giữ **3 tháng** data

---

## 2024-09-27

- WebSocket User Data requests bị deprecated: `<listenkey>@account`, `<listenkey>@balance`, `<listenkey>@position` (cả USDⓈ-M và COIN-M)

---

## 2024-09-19

**Portfolio Margin**
- `POST /papi/v1/margin/repay-debt` – Repay margin debt

---

## 2024-09-06

**Portfolio Margin – priceMatch support**
- `POST /papi/v1/um/order`, conditional/order, `PUT /papi/v1/um/order`: Thêm `priceMatch`
- Field `pm` trong `ORDER_TRADE_UPDATE` và `CONDITIONAL_ORDER_TRADE_UPDATE`

---

## 2024-09-05

**Portfolio Margin Pro**
- `GET /sapi/v2/portfolio/collateralRate` – PM Pro Tiered Collateral Rate

---

## 2024-09-03

**USDⓈ-M Futures – TRADE_LITE event**
- Event mới trong User Data Stream: `TRADE_LITE` – Latency thấp hơn, chỉ cho TRADE execution type

---

## 2024-08-26

**USDⓈ-M Futures – Futures Convert**
- `GET /fapi/v1/convert/exchangeInfo`
- `POST /fapi/v1/convert/getQuote`
- `POST /fapi/v1/convert/acceptQuote`
- `GET /fapi/v1/convert/orderStatus`

---

## 2024-08-23

**Portfolio Margin – BNB Burn & Account Config**
- `POST /papi/v1/um/feeBurn` – Toggle BNB Burn
- `GET /papi/v1/um/feeBurn` – BNB Burn status
- `GET /papi/v1/um/accountConfig` – UM account configuration
- `GET /papi/v1/um/symbolConfig` – UM symbol configuration
- `GET /papi/v2/um/account` – Improved account info V2

---

## 2024-08-07

**USDⓈ-M Futures** (hiệu lực 2024-09-03)
- IP weight tăng từ 5→10 cho: `GET /fapi/v2/balance`, `account`, `positionRisk` và WebSocket equivalents

---

## 2024-08-06

**COIN-M Futures**
- `GET /dapi/v1/pmExchangeInfo` deprecated do xóa `notionalLimit` restriction

---

## 2024-07-24

**USDⓈ-M Futures – V3 Account Endpoints**
- `GET /fapi/v1/symbolConfig` – Symbol configuration
- `GET /fapi/v1/accountConfig` – Account configuration
- `GET /fapi/v3/account` – Improved (chỉ active symbols)
- `GET /fapi/v3/balance` – Account balance
- `GET /fapi/v3/positionRisk` – Improved position risk

WebSocket API V2:
- `v2/account.status`, `v2/account.balance`, `v2/account.position`

**Deprecated** (sẽ thông báo ngày xóa): `GET /fapi/v2/balance`, `v2/account`, `v2/positionRisk` và WebSocket v1 equivalents

---

## 2024-07-17

**Portfolio Margin**
- Field `marginAsset` bị xóa khỏi `GET /papi/v1/um/userTrades`

---

## 2024-06-19

**USDⓈ-M Futures**
- Field `marginAsset` bị xóa khỏi `GET /fapi/v1/userTrades` (từ 2024-06-25)

---

## 2024-05-22

**USDⓈ-M Futures – BNB Burn**
- `POST /fapi/v1/feeBurn` – Toggle BNB Burn on Futures Trade
- `GET /fapi/v1/feeBurn` – Get BNB Burn status

---

## 2024-04-19

**USDⓈ-M Futures** (hiệu lực 2024-04-25)
- `PUT /fapi/v1/listenKey` và WebSocket `userDataStream.ping` trả về field `listenKey` trong response

---

## 2024-04-09

**USDⓈ-M / COIN-M / Portfolio Margin**
- GTC orders có hiệu lực tối đa **1 năm**. GTC orders dài hơn bị tự động cancel.

---

## 2024-04-01

**USDⓈ-M Futures – WebSocket API ra mắt**
- URL: `wss://ws-fapi.binance.com/ws-fapi/v1`
- Đặt/cancel orders qua WebSocket, tương đương REST API

---

## 2024-03-11

**USDⓈ-M Futures**
- `GET /fapi/v1/rateLimit/order` – Query user order rate limits

---

## 2024-02-09

**USDⓈ-M Futures – WebSocket Service upgrade**
- Ping: mỗi 3 phút
- Pong timeout: 10 phút
- Khi nhận ping **phải** gửi pong với copy payload của ping
- Unsolicited pong **không prevent disconnection**; khuyến nghị payload trống

---

## 2024-01-24

**USDⓈ-M Futures**
- Testnet WebSocket URL: `wss://fstream.binancefuture.com`

---

## 2024-01-19

**Portfolio Margin – Order Modification**
- `PUT /papi/v1/um/order` – Modify UM limit order
- `PUT /papi/v1/cm/order` – Modify CM limit order
- `GET /papi/v1/um/orderAmendment` – UM order modify history
- `GET /papi/v1/cm/orderAmendment` – CM order modify history

---

## 2024-01-11

**Portfolio Margin – 3 tính năng ra mắt cùng lúc**

**1. Self-Trade Prevention (STP)**
- Modes: `NONE`, `EXPIRE_TAKER`, `EXPIRE_BOTH`, `EXPIRE_MAKER`
- `GET /papi/v1/um/account`: Thêm `tradeGroupId`
- `selfTradePreventionMode` cho UM/CM/Margin order endpoints
- Field `V` trong `ORDER_TRADE_UPDATE` và `CONDITIONAL_ORDER_TRADE_UPDATE`
- Fields STP cho `executionReport`: `u`, `v`, `U`, `A`, `B`

**2. Good Till Date (GTD) TIF**
- Parameter `goodTillDate` cho UM order và conditional order endpoints
- Field `gtd` trong `ORDER_TRADE_UPDATE` và `CONDITIONAL_ORDER_TRADE_UPDATE`

**3. Breakeven Price**
- Field `breakEvenPrice` cho `GET /papi/v1/um/account`, `positionRisk`, `cm/account`, `cm/positionRisk`
- Field `bep` trong `ACCOUNT_UPDATE` event

---

## 2024-01-08

**USDⓈ-M Futures**
- `PUT /fapi/v1/order` và `PUT /fapi/v1/batchOrders`: Thêm `priceMatch` cho order modification
- Order modification giữ nguyên `selfTradePreventionMode` gốc
