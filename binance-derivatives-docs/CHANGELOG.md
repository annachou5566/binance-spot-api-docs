# 📋 Binance Derivatives API – Full CHANGELOG

> Nguồn: https://developers.binance.com/docs/derivatives/change-log  
> Bao gồm tất cả thay đổi từ 2020 đến 2026.

---

## 2026-03-05

USDⓈ-M Futures – WebSocket
- Thêm thông báo quan trọng về thay đổi WebSocket. Thêm URL PATH section cho tất cả websocket market stream pages (`/public`, `/market`). Thêm URL PATH section cho user data stream event pages (`/private`).

---

## 2026-01-09

Portfolio Margin và Portfolio Margin Pro
- Endpoint mới để switch Delta Mode:
  - `POST /sapi/v1/portfolio/delta-mode` – Switch Delta Mode cho PM PRO / PM RETAIL accounts
  - `GET /sapi/v1/portfolio/delta-mode` – Query Delta mode status

---

## 2026-01-07

Options
- REST API mới:
  - `GET /eapi/v1/commission` – Query user commission rate

---

## 2025-12-29

USDⓈ-M Futures
- Xóa parameter `"filterType": "MAX_NUM_ALGO_ORDERS"` khỏi `GET /fapi/v1/exchangeInfo`. Conditional order limit là 200 across tất cả symbols.
- Từ 2025-12-31, field `nq` sẽ có trong `<symbol>@aggTrade` stream. Field này chỉ aggregate normal market trades (không bao gồm RPI orders).

---

## 2025-12-11

USDⓈ-M Futures
- REST API mới:
  - `GET /fapi/v1/tradingSchedule` – Query trading session schedules cho 1 tuần
  - `POST /fapi/v1/stock/contract` – Sign TradFi-Perps agreement contract
- WebSocket API mới:
  - `tradingSession` – Query current trading session information

---

## 2025-12-10

- Event `CONDITIONAL_ORDER_TRIGGER_REJECT` sẽ bị deprecated từ **2025-12-15** vì conditional orders đã migrate sang Algo Service. Lý do reject được cung cấp trong `ALGO_UPDATE` event.

---

## 2025-12-09

COIN-M Futures
- Từ 2025-12-10, field `er` (order expire reason) sẽ có trong stream `ORDER_TRADE_UPDATE`.

---

## 2025-11-25

USDⓈ-M Futures
- Từ **2025-11-26**: RPI commission fee trong response của `GET /fapi/v1/commissionRate`.
- Endpoint mới để fetch RPI order book:
  - REST: `GET /fapi/v1/rpiDepth`
  - WebSocket: `<symbol>@rpiDepth@500ms`

---

## 2025-11-19

USDⓈ-M Futures
- REST API mới:
  - `GET /fapi/v1/symbolAdlRisk` – Query ADL risk rating

---

## 2025-11-18

USDⓈ-M Futures – **RPI (Retail Price Improvement) Orders ra mắt**
- Time-in-force ENUM mới `RPI` được hỗ trợ trong `POST /fapi/v1/order`, `POST /fapi/v1/batchOrders`, WebSocket `order.place`
- Field `IsRPITrade` (boolean) trong response của `GET /fapi/v1/trades`, `GET /fapi/v1/historicalTrades`
- RPI orders **không xuất hiện** trong order book (`depth`, `bookTicker`, `<symbol>@depth`, v.v.)
- Chi tiết: https://www.binance.com/en/support/faq/92c83c53173947c4a44f9a7277c3b9ce

---

## 2025-11-12

- Options Demo API environment ra mắt.
- Tạo API key tại: https://demo.binance.com/zh-CN/my/settings/api-management

---

## 2025-11-10

- `POST sapi/v1/portfolio/mint` và `POST sapi/v1/portfolio/redeem` bị **deprecated** (BFUSD đã migrate sang Binance Earn từ 2025-08-13). Error code `-21015 ENDPOINT_GONE`.

---

## 2025-11-06

USDⓈ-M Futures – **Conditional Orders migrate sang Algo Service** (hiệu lực 2025-12-09)

Các order types bị ảnh hưởng: `STOP_MARKET`, `TAKE_PROFIT_MARKET`, `STOP`, `TAKE_PROFIT`, `TRAILING_STOP_MARKET`

- REST Algo Order endpoints mới:
  - `POST fapi/v1/algoOrder` – Place algo order
  - `DELETE /fapi/v1/algoOrder` – Cancel algo order
  - `DELETE fapi/v1/algoOpenOrders` – Cancel all open algo orders
  - `GET /fapi/v1/algoOrder` – Query algo order
  - `GET /fapi/v1/openAlgoOrders` – Query algo open orders
  - `GET /fapi/v1/allAlgoOrders` – Query all algo orders
- Sau migration, các endpoints sau sẽ reject requests cho order types trên (error `-4120 STOP_ORDER_SWITCH_ALGO`):
  - `POST /fapi/v1/order`, `POST /fapi/v1/batchOrders`
- WebSocket User Stream: Event mới `ALGO_UPDATE`
- WebSocket API: `algoOrder.place`, `algoOrder.cancel`
- **Lưu ý sau migration:**
  - Không check margin trước khi conditional order được trigger
  - GTE_GTC orders chỉ phụ thuộc vào positions, không phụ thuộc open orders phía đối diện
  - Không hỗ trợ modify untriggered conditional orders

---

## 2025-10-21

**Tất cả APIs** – `priceMatch` enum `OPPONENT_10` và `OPPONENT_20` tạm thời bị xóa khỏi place/amend flows (hiệu lực 2025-10-23).

Affected endpoints:
- USDⓈ-M: `POST/PUT /fapi/v1/order`, `POST/PUT /fapi/v1/batchOrders`
- COIN-M: `POST/PUT /dapi/v1/order`, `POST/PUT /dapi/v1/batchOrders`
- PM: `POST/PUT /papi/v1/um/order`, `POST /papi/v1/um/conditional/order`, `POST/PUT /papi/v1/cm/order`, `POST /papi/v1/cm/conditional/order`

---

## 2025-10-20

USDⓈ-M Futures
- Từ 2025-10-23, field `er` (order expire reason) sẽ có trong stream `ORDER_TRADE_UPDATE`.

---

## 2025-10-14

Error code `-1008` message được cập nhật:
```json
{
  "code": -1008,
  "msg": "Request throttled by system-level protection. Reduce-only/close-position orders are exempt. Please try again."
}
```

---

## 2025-10-09

- Futures hỗ trợ symbol bằng **tiếng Trung**. Ví dụ: `"symbol": "测试USDT"`.
- Khi dùng symbol có ký tự Trung Quốc qua API, **phải URL-encode (UTF-8 percent-encoding)**.
- WebSocket/User Data Stream push messages cũng có thể chứa ký tự Trung Quốc → đảm bảo client xử lý được.

---

## 2025-08-11

- BFUSD migrate sang Binance Earn ngày 2025-08-13.
- Endpoints bị deprecated: `POST/POST sapi/v1/portfolio/mint`, `POST sapi/v1/portfolio/redeem`

---

## 2025-07-25

- Error code mới `-4109`: *This account is inactive. Please activate it before trading.* (account bị archive do không hoạt động. Transfer bất kỳ amount nào để activate lại USDM Futures account)

---

## 2025-07-02

USDⓈ-M Futures
- `GET /futures/data/openInterestHist`: Thêm field `CMCCirculatingSupply` trong response
- WebSocket Market Streams: Giới hạn streams/connection tăng từ **200 → 1024**

---

## 2025-04-23

USDⓈ-M Futures
- `GET /fapi/v1/insuranceBalance` – Query insurance fund balance snapshot
- `GET /fapi/v1/constituents`: Thêm fields `price` và `weight` trong response

---

## 2025-04-15

Portfolio Margin và Portfolio Margin Pro
- Endpoint mới cho Earn Asset transfer as collateral:
  - `POST /sapi/v1/portfolio/earn-asset-transfer` – Transfer LDUSDT cho Portfolio Margin
  - `GET /sapi/v1/portfolio/earn-asset-balance` – Get Transferable Earn Asset Balance

---

## 2025-02-28

Portfolio Margin
- `GET /sapi/v1/portfolio/pmloan-history` – Query user pmloan repay record

---

## 2025-02-20

COIN-M Futures – **WebSocket API ra mắt** (2025-02-25)
- URL: `wss://ws-dapi.binance.com/ws-dapi/v1`
- Tương đương REST API về tính năng, filter, rate limit.
- Cần 2 WebSocket connections riêng: 1 cho API, 1 cho market data.

---

## 2025-01-20

Portfolio Margin
- `GET /papi/v1/portfolio/negative-balance-exchange-record` – Query negative balance auto exchange records (ra mắt 2025-01-22)

---

## 2025-01-13

USDⓈ-M Futures & COIN-M Futures (hiệu lực 2025-01-14)
- `GET /fapi/v1/historicalTrades` và `GET /dapi/v1/historicalTrades`:
  - `limit` maximum: 1000 → **500**
  - `limit` default: 500 → **100**

---

## 2025-01-06

Portfolio Margin
- `GET papi/v1/rateLimit/order` – Query user rate limit

---

## 2024-12-19

Portfolio Margin Pro & Portfolio Margin (ra mắt 2024-12-20)
- `POST sapi/v1/portfolio/mint` – BFUSD mint
- `POST sapi/v1/portfolio/redeem` – BFUSD redeem

---

## 2024-12-17

Options
- REST: `GET /eapi/v1/blockTrades` – Get recent block trades
- WebSocket: Thêm field `X` trong `<symbol>@trade` và `<underlyingAsset>@trade` để show trade type

---

## 2024-12-02

USDⓈ-M Futures (hiệu lực 2024-12-03)
- Error codes mới:
  - `-4116`: ClientOrderId is duplicated
  - `-4117`: Stop order is in triggering process. Please try again later.

---

## 2024-11-04

- `GET /fapi/v1/pmExchangeInfo` và `GET /dapi/v1/pmExchangeInfo` bị deprecated từ **2024-11-15**

---

## 2024-11-01

Options – Block Trade endpoints mới:
- `POST eapi/v1/block/order/create`
- `PUT eapi/v1/block/order/create`
- `DELETE eapi/v1/block/order/create`
- `GET eapi/v1/block/order/orders`
- `POST eapi/v1/block/order/execute`
- `GET eapi/v1/block/order/execute`
- `GET eapi/v1/block/user-trades`

---

## 2024-10-29

- Rate limit `POST /sapi/v1/portfolio/repay-futures-switch` và `POST /papi/v1/repay-futures-switch`: điều chỉnh thành **20/ngày** (từ 2024-11-01)

---

## 2024-10-24

Options (hiệu lực 2024-10-28)
- `GET /eapi/v1/exchangeInfo`: Xóa field `id` khỏi `optionContracts`, `optionAssets`; xóa `contractId` và `id` khỏi `optionSymbols`
- WebSocket stream `option_pair`: Xóa fields `id` và `cid`

---

## 2024-10-21

USDⓈ-M Futures & COIN-M Futures (hiệu lực 2024-10-30)
- `GET /fapi/v1/userTrades` và `GET /dapi/v1/userTrades`: Chỉ hỗ trợ query **6 tháng** gần nhất

COIN-M Futures – Endpoint mới cho historical data download:
- `GET /dapi/v1/order/asyn` – Download Id cho Futures Order History
- `GET /dapi/v1/order/asyn/id` – Download Link cho Futures Order History
- `GET /dapi/v1/trade/asyn` – Download Id cho Futures Trade History
- `GET /dapi/v1/trade/asyn/id` – Download Link cho Futures Trade History

---

## 2024-10-15

Portfolio Margin Pro (ra mắt 2024-10-18)
- `GET /sapi/v2/portfolio/account` – PM Pro SPAN Account Info (chỉ cho PM Pro SPAN users)
- `GET /sapi/v1/portfolio/balance` – PM Pro Account Balance Info

Portfolio Margin – Bulk download endpoints:
- UM Trade/Order/Transaction history asynchronous download (`/papi/v1/um/trade/asyn`, `asyn/id`, `order/asyn`, `asyn/id`, `income/asyn`, `asyn/id`)

---

## 2024-10-14

USDⓈ-M Futures (hiệu lực 2024-10-19)
- `POST /fapi/v1/convert/getQuote`: Rate limit → **360/giờ, 500/ngày**; `validTime` chỉ có thể set là `10s`

---

## 2024-10-11

COIN-M Futures – **Self-Trade Prevention (STP)** ra mắt
- Ngăn orders match với orders cùng account (hoặc cùng `tradeGroupId`)
- Modes: `NONE`, `EXPIRE_TAKER`, `EXPIRE_BOTH`, `EXPIRE_MAKER`
- Order status mới: `EXPIRED_IN_MATCH`
- Parameter mới `selfTradePreventionMode` cho `POST /dapi/v1/order`, `POST /dapi/v1/batchOrders`
- Field `V` (STP mode) trong `ORDER_TRADE_UPDATE`

**Price Match** cho COIN-M ra mắt
- Modes: `NONE`, `OPPONENT`, `OPPONENT_5`, `OPPONENT_10`, `OPPONENT_20`, `QUEUE`, `QUEUE_5`, `QUEUE_10`, `QUEUE_20`
- Field `pm` (price match) trong `ORDER_TRADE_UPDATE`

---

## 2024-10-10

- `GET /fapi/v1/aggTrades` và `GET /dapi/v1/aggTrades`: Hỗ trợ query đến **1 năm** (hiệu lực 2024-10-17)
- `GET /fapi/v1/positionMargin/history`: Hỗ trợ query **30 ngày** gần nhất (hiệu lực 2024-10-16)

---

## 2024-10-08

COIN-M Futures
- `GET /dapi/v1/allOrders` và `GET /dapi/v1/userTrades`: Mặc định trả về **7 ngày** gần nhất, query period tối đa 7 ngày
- `GET /dapi/v1/order` và `GET /dapi/v1/allOrders`: Chỉ giữ data **3 tháng** gần nhất

---

## 2024-09-27

USDⓈ-M & COIN-M Futures – WebSocket User Data Requests bị deprecated:
- `<listenkey>@account`
- `<listenkey>@balance`
- `<listenkey>@position`

---

## 2024-09-19

Portfolio Margin
- `POST /papi/v1/margin/repay-debt` – Repay debt for a margin loan

---

## 2024-09-06

Portfolio Margin
- `POST /papi/v1/um/order`: Thêm `priceMatch` parameter
- `POST /papi/v1/um/conditional/order`: Thêm `priceMatch` parameter
- `PUT /papi/v1/um/order`: Thêm `priceMatch` parameter
- Field `pm` (priceMatch) trong `ORDER_TRADE_UPDATE` và `CONDITIONAL_ORDER_TRADE_UPDATE`

---

## 2024-09-05

Portfolio Margin Pro
- `GET /sapi/v2/portfolio/collateralRate` – Query PM Pro Tiered Collateral Rate

---

## 2024-09-03

USDⓈ-M Futures – **`TRADE_LITE` event** trong User Data Stream
- Designed để giảm latency, chỉ focus vào `TRADE` execution type với ít fields hơn

---

## 2024-08-26

USDⓈ-M Futures – **Futures Convert** endpoints:
- `GET /fapi/v1/convert/exchangeInfo`
- `POST /fapi/v1/convert/getQuote`
- `POST /fapi/v1/convert/acceptQuote`
- `GET /fapi/v1/convert/orderStatus`

---

## 2024-08-23

Portfolio Margin
- `POST /papi/v1/um/feeBurn` – Toggle BNB Burn trên UM Futures Trade
- `GET /papi/v1/um/feeBurn` – Get BNB Burn status
- `GET /papi/v1/um/accountConfig` – Query UM account configuration
- `GET /papi/v1/um/symbolConfig` – Query symbol configuration
- `GET /papi/v2/um/account` – Improved account info (chỉ trả về symbols có position/open orders)

---

## 2024-08-07

USDⓈ-M Futures (hiệu lực 2024-09-03)
- IP weight tăng từ 5→10 cho:
  - `GET /fapi/v2/balance`, `GET /fapi/v2/account`, `GET /fapi/v2/positionRisk`
  - WebSocket: `account.status`, `account.balance`, `account.position`

---

## 2024-07-24

USDⓈ-M Futures – **V3 Account endpoints** mới:
- `GET /fapi/v1/symbolConfig` – User symbol configuration
- `GET /fapi/v1/accountConfig` – User account configuration
- `GET /fapi/v3/account` – Improved account info (chỉ trả về symbols có position/open orders)
- `GET /fapi/v3/balance` – Account balance
- `GET /fapi/v3/positionRisk` – Improved position risk (chỉ trả về symbols có position/open orders)
- WebSocket API V2: `v2/account.status`, `v2/account.balance`, `v2/account.position`

**Deprecated** (sẽ thông báo ngày xóa sau):
- `GET /fapi/v2/balance`, `GET /fapi/v2/account`, `GET /fapi/v2/positionRisk`
- WebSocket: `account.status`, `account.balance`, `account.position`

---

## 2024-06-19

USDⓈ-M Futures
- Field `marginAsset` bị xóa khỏi response `GET /fapi/v1/userTrades` (từ 2024-06-25)

---

## 2024-05-22

USDⓈ-M Futures
- `POST /fapi/v1/feeBurn` – Toggle BNB Burn on Futures Trade
- `GET /fapi/v1/feeBurn` – Get BNB Burn status

---

## 2024-04-19

USDⓈ-M Futures (hiệu lực 2024-04-25)
- `PUT /fapi/v1/listenKey` response và WebSocket `userDataStream.ping` sẽ trả về field `listenKey`

---

## 2024-04-09

USDⓈ-M Futures / COIN-M Futures / Portfolio Margin
- GTC (Good-Till-Cancel) orders có hiệu lực tối đa **1 năm** sau khi đặt. GTC orders dài hơn 1 năm sẽ bị tự động cancel.

---

## 2024-04-01

USDⓈ-M Futures – **WebSocket API ra mắt**
- URL: `wss://ws-fapi.binance.com/ws-fapi/v1`
- Cho phép place/cancel orders qua WebSocket connection
- Tương đương REST API về tính năng, filter, rate limit

---

## 2024-03-11

USDⓈ-M Futures
- `GET /fapi/v1/rateLimit/order` – Query user order rate limits

---

## 2024-02-09

USDⓈ-M Futures – WebSocket Service upgrade
- Ping frame: mỗi 3 phút
- Nếu không nhận pong trong 10 phút → disconnect
- Khi nhận ping **phải** gửi pong với copy payload của ping ngay lập tức
- Unsolicited pong frames được phép nhưng **sẽ không prevent disconnection**. Khuyến nghị payload trống cho pong frames.

---

## 2024-01-24

USDⓈ-M Futures
- Testnet WebSocket URL cập nhật thành: `wss://fstream.binancefuture.com`

---

## 2024-01-19

Portfolio Margin
- `PUT /papi/v1/um/order` và `PUT /papi/v1/cm/order` – UM/CM limit order modification
- `GET /papi/v1/um/orderAmendment` và `GET /papi/v1/cm/orderAmendment` – Order modify history

---

## 2024-01-11

Portfolio Margin – **Self-Trade Prevention (STP)** ra mắt
- Modes: `NONE`, `EXPIRE_TAKER`, `EXPIRE_BOTH`, `EXPIRE_MAKER`
- `GET /papi/v1/um/account`: Thêm field `tradeGroupId`
- `selfTradePreventionMode` parameter cho order placement endpoints
- Field `V` (STP mode) trong `ORDER_TRADE_UPDATE` và `CONDITIONAL_ORDER_TRADE_UPDATE`

**Good Till Date (GTD)** TIF ra mắt cho Portfolio Margin
- Parameter `goodTillDate` cho `POST /papi/v1/um/order` và conditional orders
- Field `gtd` trong `ORDER_TRADE_UPDATE` và `CONDITIONAL_ORDER_TRADE_UPDATE`

**Breakeven Price** ra mắt
- Field `breakEvenPrice` trong `GET /papi/v1/um/account`, `positionRisk`, CM counterparts
- Field `bep` trong `ACCOUNT_UPDATE` event (WebSocket)

---

## 2024-01-08

USDⓈ-M Futures
- `PUT /fapi/v1/order` và `PUT /fapi/v1/batchOrders`: Thêm `priceMatch` parameter cho order modification
- Order modification giữ nguyên `selfTradePreventionMode` gốc

---

## 2023-12-12

USDⓈ-M Futures
- Stream `!bookTicker` update speed: real-time → **mỗi 5 giây** (từ 2023-12-20)
- `<symbol>@bookticker` không bị ảnh hưởng

---

## 2023-11-15

USDⓈ-M Futures
- `GET /fapi/v2/ticker/price` – Endpoint mới, giống v1 nhưng latency thấp hơn, weight nhỏ hơn

USDⓈ-M WebSocket
- Domain `wss://fstream-auth.binance.com` bị retire từ **2023-12-15 06:00**. Chuyển sang `wss://fstream.binance.com`.

---

## 2023-11-01

COIN-M & USDⓈ-M Futures
- `GET dapi/v1/fundingRate` và `GET /fapi/v1/fundingRate`: Thêm field `markPrice` trong response

USDⓈ-M Futures
- `GET /futures/data/basis` – Query basis data

---

## 2023-10-19

COIN-M & USDⓈ-M Futures
- `GET /futures/data/delivery-price` – Query quarterly contract settlement price
- Rate limit 1000/5min/IP cho market data endpoints (openInterestHist, topLongShortAccountRatio, v.v.)
- Rate limit 500/5min/IP cho `GET /fapi/v1/fundingRate`, `GET /fapi/v1/fundingInfo`

European Options – WebSocket upgrade
- Ping: mỗi 3 phút (trước là 5 phút)
- Pong timeout: 10 phút (trước là 15 phút)
- URL path `/` ở cuối không còn được hỗ trợ

---

## 2023-10-16

COIN-M & USDⓈ-M Futures
- `GET /dapi/v1/constituents` và `GET /fapi/v1/constituents` – Query index constituents

---

## 2023-10-11

USDⓈ-M Futures – IP Weight cập nhật:
- `GET /fapi/v1/income/asyn`, `order/asyn`, `trade/asyn`: 5 → **1000**
- `GET /fapi/v1/income/asyn/id`, `order/asyn/id`, `trade/asyn/id`: 5 → **10**

---

## 2023-09-25

COIN-M & USDⓈ-M Futures
- `GET /dapi/v1/fundingInfo` và `GET /fapi/v1/fundingInfo` – Query adjusted funding info

---

## 2023-09-22

Portfolio Margin
- `GET /papi/v1/um/positionRisk` và `GET /papi/v1/cm/positionRisk`: Thêm `liquidationPrice`
- `GET /papi/v1/um/leverageBracket` và `GET /papi/v1/cm/leverageBracket`: Thêm `notionalCoef`
- WebSocket User Data: `outboundAccountPosition` và `balanceUpdate` events thêm field `U` (updateId)

---

## 2023-09-20

COIN-M & USDⓈ-M Futures
- `GET /dapi/v1/ticker/bookTicker`: Thêm `lastUpdateId`
- `GET /dapi/v1/account`: Thêm `updateTime` trong `assets`
- `GET /fapi/v1/ticker/bookTicker`: Thêm `lastUpdateId`

---

## 2023-09-19

USDⓈ-M Futures – Error code `-1008` mới cho HTTP 503 khi server overloaded

---

## 2023-09-07

COIN-M Futures
- `GET /dapi/v1/income/asyn` – Download Id cho Futures Transaction History
- `GET /dapi/v1/income/asyn/id` – Download Link cho Futures Transaction History

---

## 2023-09-05

USDⓈ-M Futures
- **Self Trade Prevention** enabled tại **2023-09-05**
- **Price Match**, **Good Till Date TIF**, **Breakeven Price** ra mắt tại **2023-09-05**

---

## 2023-09-04

Portfolio Margin
- Order rate limit giảm từ **2400/phút → 1200/phút**

---

## 2023-08-31

COIN-M & USDⓈ-M Futures – WebSocket upgrade:
- Ping: mỗi 3 phút (trước là 5 phút)
- Pong timeout: 10 phút (trước là 15 phút)

---

## 2023-08-29

European Options
- `GET /eapi/v1/account` và `GET /eapi/v1/marginAccount`: Thêm field `riskLevel`
- WebSocket User Data Stream: Event mới `RISK_LEVEL_CHANGE`

USDⓈ-M Futures – **Self-Trade Prevention được announce** (ngày release TBD lúc đó)
- Modes: `NONE`, `EXPIRE_TAKER`, `EXPIRE_BOTH`, `EXPIRE_MAKER`
- Order status mới: `EXPIRED_IN_MATCH`

---

## 2023-08-25

COIN-M Futures – WebSocket upgrade:
- URL không còn hỗ trợ trailing `/`
- URL path không hợp lệ trước `/ws` và `/stream` không được hỗ trợ

---

## 2023-08-19

USDⓈ-M Futures – WebSocket upgrade tương tự COIN-M

---

## 2023-08-18

Portfolio Margin – Order query endpoints mới:
- `GET /papi/v1/margin/order`
- `GET /papi/v1/margin/openOrders`
- `GET /papi/v1/margin/allOrders`
- `GET /papi/v1/margin/orderList`, `allOrderList`, `openOrderList`
- `GET /papi/v1/margin/myTrades`

---

## 2023-08-14

COIN-M & USDⓈ-M Futures
- `GET /dapi/v1/income` và `GET /fapi/v1/income`: Thêm parameter `page` cho pagination

---

## 2023-07-28

Portfolio Margin
- `POST /papi/v1/asset-collection` – Fund Collection by Asset

---

## 2023-07-21

European Options
- `GET /eapi/v1/income/asyn` – Download Id cho Option Transaction History
- `GET /eapi/v1/income/asyn/id` – Download Link

---

## 2023-07-20

Portfolio Margin
- `GET /papi/v1/um/adlQuantile` – UM Position ADL Quantile
- `GET /papi/v1/cm/adlQuantile` – CM Position ADL Quantile

---

## 2023-07-19

COIN-M Futures
- `GET /dapi/v2/leverageBracket`: Thêm `notionalCoef`

---

## 2023-07-18

Portfolio Margin
- `POST /papi/v1/repay-futures-switch` – Change Auto-repay-futures Status
- `GET /papi/v1/repay-futures-switch` – Get Auto-repay-futures Status
- `POST /papi/v1/repay-futures-negative-balance` – Repay futures Negative Balance

USDⓈ-M Futures
- `GET /fapi/v1/leverageBracket`: Thêm `notionalCoef`

---

## 2023-07-13

European Options
- Stream `<symbol>@ticker` và `<underlyingAsset>@ticker@<expirationDate>`: Thêm field `T` (transaction time)
- Stream `<symbol>@depth<levels>`: Thêm field `E` (event time)

Portfolio Margin
- User Data Stream event mới: `riskLevelChange` (từ 2023-07-14)

---

## 2023-07-12

COIN-M Futures
- `GET /dapi/v1/account` và `GET /dapi/v1/positionRisk`: Thêm `breakEvenPrice`
- WebSocket: Field `bep` (Break-Even Price) trong `ACCOUNT_UPDATE` event

---

## 2023-07-11

Portfolio Margin
- `POST /papi/v1/ping` – Connectivity test

---

## 2023-07-04

USDⓈ-M Futures
- `GET /fapi/v1/order` và `GET /fapi/v1/allOrders`: Chỉ giữ **3 tháng** gần nhất (hiệu lực 2023-07-27)
- Endpoints mới để download lịch sử:
  - `GET /fapi/v1/order/asyn`, `order/asyn/id` – Order history
  - `GET /fapi/v1/trade/asyn`, `trade/asyn/id` – Trade history

---

## 2023-06-28

USDⓈ-M Futures (từ 2023-07-15)
- Xóa v1 account endpoints:
  - `GET /fapi/v1/account` → dùng `GET /fapi/v2/account`
  - `GET /fapi/v1/balance` → dùng `GET /fapi/v2/balance`
  - `GET /fapi/v1/positionRisk` → dùng `GET /fapi/v2/positionRisk`

---

## 2023-06-22

COIN-M & USDⓈ-M Futures – WebSocket restrictions:
- URL format `/ws?<streamName>` không còn được hỗ trợ
- JSON không hợp lệ sẽ bị disconnect với error code 3

---

## 2023-06-19

Portfolio Margin
- `POST /papi/v1/um/conditional/order` và `POST /papi/v1/cm/conditional/order`: Thêm `CONTRACT_PRICE`, `priceProtect`

---

## 2023-06-16

USDⓈ-M Futures – HTTP request format requirements:
- Phải dùng `%22` thay vì `\x22` cho escape quotes
- JSON nested không hợp lệ không được hỗ trợ
- Data types phải đúng (LIST<LONG> phải là integers, không phải strings)
- Whitespace trong params không được phép
- Empty values trong params không được phép

---

## 2023-06-14

COIN-M Futures
- Streams `<symbol>@markPrice` và `<pair>@markPrice`: Thêm field `i` (quote asset/index price)

USDⓈ-M Futures
- Stream mới: `!assetIndex@arr` hoặc `<assetSymbol>@assetIndex` (multi-assets mode)

---

## 2023-06-01

Portfolio Margin
- `GET /papi/v1/um/income` và `GET /papi/v1/cm/income` – Query UM/CM income history
- `GET /papi/v1/um/account` và `GET /papi/v1/cm/account` – Query UM/CM account history

---

## 2023-05-31

USDⓈ-M Futures
- User Data Stream event mới: `CONDITIONAL_ORDER_TRIGGER_REJECT` (lý do reject cho triggered TP/SL orders)

---

## 2023-05-05

USDⓈ-M Futures – **Order Modification**:
- `PUT /fapi/v1/order` – Modify single order
- `PUT /fapi/v1/batchOrders` – Batch modify orders
- `GET /fapi/v1/orderAmendment` – Order modify history
- WebSocket `ORDER_TRADE_UPDATE`: Execution type mới `AMENDMENT`

---

## 2023-04-17

COIN-M Futures – `recvWindow` check tại matching engine
- Error code: `-4188`
- Affected: `POST/PUT /dapi/v1/order`, `POST/PUT /dapi/v1/batchOrders`

USDⓈ-M Futures (release 2023-04-18) – `recvWindow` check tại matching engine
- Error code: `-5028`
- Affected: `POST/PUT /fapi/v1/order`, `POST/PUT /fapi/v1/batchOrders`

---

## 2023-03-28

USDⓈ-M Futures
- Referral rebates được aggregate mỗi **20 phút** (trước đây: real-time mỗi trade)

---

## 2023-03-08

USDⓈ-M Futures (release 2023-03-22)
- FOK/GTX orders không thể fill → **rejected trực tiếp** với error response, không tạo order nào
- Error codes: `-5021` (FOK), `-5022` (Post Only/GTX)
- Order **không xuất hiện** trong `GET /fapi/v1/order` hoặc `GET /fapi/v1/allOrders`

---

## 2023-02-02

European Options
- `POST /eapi/v1/transfer` bị disabled

---

## 2023-01-11

European Options
- `GET /eapi/v1/order` – Check order status

---

## 2023-01-04

USDⓈ-M Futures
- Xóa Order Status `NEW_INSURANCE` và `NEW_ADL` khỏi Order Update Event

---

## 2022-12-16

COIN-M & USDⓈ-M Futures
- WebSocket stream mới: `!contractInfo` – Symbol information update

---

## 2022-12-13

European Options
- Stream `<symbol>@depth1000`: Thêm `u` và `pu` (diff orderbook update)

---

## 2022-12-09

European Options
- `GET /eapi/v1/depth`: Thêm `updateId` field `u`
- `GET /eapi/v1/exerciseHistory`: Thêm parameter `underlying`

---

## 2022-11-29

COIN-M & USDⓈ-M Futures – User Data Stream events mới:
- `STRATEGY_UPDATE` – Khi strategy được tạo/cancel/expire
- `GRID_UPDATE` – Khi sub-order của grid được fill/partially fill

---

## 2022-11-18

European Options
- `GET /eapi/v1/openInterest` – Options open interest cho underlying và expiration date
- WebSocket stream: `<underlyingAsset>@openInterest@<expirationDate>`

---

## 2022-11-16

European Options
- WebSocket stream mới: `<underlyingAsset>@trade` – Tất cả option trades trên underlying asset
- Format của stream `option_pair` được điều chỉnh

---

## 2022-11-03

European Options (ra mắt 2022-11-07) – Kill-Switch endpoints:
- `POST /eapi/v1/countdownCancelAll` – Set Auto-Cancel All Open Orders
- `GET /eapi/v1/countdownCancelAll` – Get Config
- `POST /eapi/v1/countdownCancelAllHeartBeat` – Heartbeat

---

## 2022-10-13

COIN-M & USDⓈ-M Futures (hiệu lực 2022-10-17)
- `GET /dapi/v1/ticker/bookTicker` và `GET /fapi/v1/ticker/bookTicker`:
  - Weight: **2** cho single symbol; **5** khi omit symbol parameter

---

## 2022-09-22

COIN-M & USDⓈ-M Futures
- `GET /dapi/v1/pmAccountInfo` và `GET /fapi/v1/pmAccountInfo` – Portfolio Margin account info
- `GET /fapi/v1/income`: Hỗ trợ thêm incomeType

---

## 2022-09-20

European Options
- Streams mới: `<underlyingAsset>@markPrice`, `<underlyingAsset>@ticker@<expirationDate>`
- `<!miniTicker@arr>` deprecated từ 2022-10-30

---

## 2022-09-14

European Options
- `GET /eapi/v1/exchangeInfo`: Điều chỉnh nhiều fields sang string type
- `GET /eapi/v1/historyOrders`: Chỉ query finished orders trong **5 ngày**

---

## 2022-07-27

COIN-M & USDⓈ-M Futures
- `GET /dapi/v1/trades` và `GET /fapi/v1/trades`: Weight cập nhật thành **5**

---

## 2022-06-28

COIN-M & USDⓈ-M Futures
- `GET /dapi/v1/pmExchangeInfo` và `GET /fapi/v1/pmExchangeInfo` – Portfolio Margin exchange info

---

## 2022-04-28

COIN-M Futures – **Order Modification**:
- `PUT /dapi/v1/order` và `PUT /dapi/v1/batchOrders`
- `GET /dapi/v1/orderAmendment`
- WebSocket: Execution type `AMENDMENT`

---

## 2022-04-14

COIN-M Futures
- User Data Stream: `ACCOUNT_CONFIG_UPDATE` event cho leverage change

---

## 2022-03-01

USDⓈ-M Futures
- `GET /fapi/v1/income/asyn` – Download Id cho Transaction History
- `GET /fapi/v1/income/asyn/id` – Download Link

---

## 2022-02-18

COIN-M Futures
- `GET /dapi/v1/userTrades` limit tối đa: **1000**

---

## 2022-02-10

USDⓈ-M Futures
- `GET /fapi/v2/account`: Multi-Assets Margin mode – Tất cả assets được tính vào các margin fields (hiển thị dưới dạng USD value)

---

## 2021-12-30

USDⓈ-M Futures – WebSocket connection method mới:
- Base URL: `wss://fstream-auth.binance.com`
- Raw streams: `/ws/<streamName>?listenKey=<validateListenKey>`
- Combined streams: `/stream?streams=<streamName1>/...&listenKey=<validateListenKey>`
- (Domain này đã bị retire vào 2023-12-15)

---

## 2021-11-02

USDⓈ-M Futures
- `GET /fapi/v1/assetIndex` – Asset index cho Multi-Assets mode margin asset

---

## 2021-08-18

COIN-M Futures
- `GET /dapi/v1/account`: Thêm field `positionAmt`

---

## 2021-08-17

COIN-M Futures – Order Modification:
- `PUT /dapi/v1/order`, `PUT /dapi/v1/batchOrders`, `GET /dapi/v1/orderAmendment`
- WebSocket: Execution type `AMENDMENT`

---

## 2021-07-23

COIN-M Futures
- `GET /dapi/v1/account` và `GET /dapi/v1/positionRisk`: Thêm `updateTime`

---

## 2021-07-06

COIN-M Futures
- `GET /dapi/v1/exchangeInfo`: Thêm `liquidationFee`, `marketTakeBound`

USDⓈ-M Futures
- `GET /fapi/v2/account` và `GET /fapi/v2/positionRisk`: Thêm `updateTime`
- `GET /fapi/v1/exchangeInfo`: Thêm `liquidationFee`, `marketTakeBound`

---

## 2021-06-15

USDⓈ-M Futures
- WebSocket stream `<symbol>@compositeIndex`: Thêm `q` (quote asset) và `i` (index price)
- `GET /fapi/v1/indexInfo`: Thêm `component` và `quoteAsset`

---

## 2021-05-06

COIN-M & USDⓈ-M Futures
- WebSocket `ACCOUNT_UPDATE` event: Thêm field `bc` (balance change)

USDⓈ-M Futures
- `ACCOUNT_CONFIG_UPDATE` event mở rộng: Bao gồm cả leverage update và Multi-Assets margin status update
- `ACCOUNT_UPDATE` event: Thêm reason type `AUTO_EXCHANGE` cho Multi-Assets margin auto-exchange
- `POST /fapi/v1/multiAssetsMargin` – Change Multi-Assets margin mode
- `GET /fapi/v1/multiAssetsMargin` – Check Multi-Assets margin mode
- `GET /fapi/v1/exchangeInfo`: Thêm object `assets`
- `GET /fapi/v2/balance` và `GET /fapi/v2/account`: Thêm `marginAvailable`

---

## 2021-04-27

COIN-M & USDⓈ-M Futures
- Liquidation order streams `<symbol>@forceOrder` và `!forceOrder@arr`: Chuyển sang snapshot data, tối đa 1 push/giây (không còn real-time)
- `GET /dapi/v1/allForceOrders` và `GET /fapi/v1/allForceOrders`: Không còn được maintain

---

## 2021-04-22

USDⓈ-M Futures
- WebSocket `ACCOUNT_UPDATE`: Thêm field `bc` (balance change)

---

## 2021-03-10

COIN-M Futures
- `GET /dapi/v1/allForceOrders`: Query period phải < 7 ngày (default 7 ngày gần nhất)

---

## 2021-03-02

USDⓈ-M Futures
- `GET /fapi/v1/indexPriceKlines` – Index price kline data
- `GET /fapi/v1/markPriceKlines` – Mark price kline data

---

## 2021-02-24

USDⓈ-M Futures
- `GET /fapi/v2/balance`: Weight → **5**
- `GET /fapi/v2/positionRisk`: Weight → **5**

---

## 2021-02-22

USDⓈ-M Futures
- `GET /fapi/v1/income`: Weight → **30**
- `GET /fapi/v1/allOrders`: Query period phải < 7 ngày
- `GET /fapi/v1/allForceOrders`: Query period phải trong 7 ngày gần nhất

---

## 2021-01-26

COIN-M Futures
- `GET /dapi/v1/allForceOrders` và `GET /dapi/v1/forceOrders`: Weight → **20** (có symbol) / **50** (không có symbol)

USDⓈ-M Futures
- WebSocket User Data: `ACCOUNT_CONFIG_UPDATE` event cho leverage change
- `GET /fapi/v1/allForceOrders` và `GET /fapi/v1/forceOrders`: Weight → **20**/**50**
- Filter mới `MIN_NOTIONAL` trong `/fapi/v1/exchangeInfo`

---

## 2021-01-21

COIN-M & USDⓈ-M Futures
- Regex rule cho `newClientOrderId` cập nhật: `^[\.A-Z\:/a-z0-9_-]{1,36}$`

---

## 2021-01-04

USDⓈ-M Futures
- `GET /fapi/v1/klines` và `GET /fapi/v1/continuousKlines`: Weight dựa trên parameter `LIMIT`
- `GET /fapi/v1/historicalTrades`, `allForceOrders`, `forceOrders`, `aggTrades`: Weight → **20**

---

## 2020-12-30

COIN-M Futures
- `GET /dapi/v1/klines`, `continuousKlines`, `indexPriceKlines`, `markPriceKlines`: Weight dựa trên `LIMIT`
- `GET /dapi/v1/historicalTrades`, `allForceOrders`, `forceOrders`, `aggTrades`: Weight → **20**

---

## 2020-12-08

USDⓈ-M Futures
- Streams `<symbol>@bookTicker` và `!bookTicker`: Thêm field `e` (event type)
- Streams `<symbol>@markPrice` v.v.: Thêm field `P` (estimated settle price)
- Stream mới: `<pair>_<contractType>@continuousKline_<interval>`
- `GET /fapi/v1/premiumIndex`: Thêm `estimatedSettlePrice`
- `GET /fapi/v1/exchangeInfo`: Thêm `pair`, `contractType`, `deliveryDate`, `onboardDate`
- `GET /fapi/v1/continuousKlines` – Continuous contract kline data
- Contract types: PERPETUAL, CURRENT_MONTH, NEXT_MONTH, CURRENT_QUARTER, NEXT_QUARTER

---

## 2020-11-27

COIN-M & USDⓈ-M Futures
- `GET /dapi/v1/commissionRate` và `GET /fapi/v1/commissionRate` – User commission rate

---

## 2020-11-13

USDⓈ-M Futures
- Update time của `<symbol>@depth@0ms` và `<symbol>@depth<level>@0ms` được điều chỉnh động theo traffic
