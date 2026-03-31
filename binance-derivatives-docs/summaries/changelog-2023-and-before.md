# 📅 Thay đổi năm 2023 và trước đó

> Nguồn: https://developers.binance.com/docs/derivatives/change-log

---

## 2023-12-12

**USDⓈ-M Futures**
- `!bookTicker` update speed: real-time → **mỗi 5 giây** (từ 2023-12-20). `<symbol>@bookTicker` không bị ảnh hưởng.

---

## 2023-11-15

**USDⓈ-M Futures**
- `GET /fapi/v2/ticker/price` – Endpoint mới, latency thấp hơn v1, weight nhỏ hơn. V1 sẽ deprecated trong tương lai.
- Domain `wss://fstream-auth.binance.com` bị retire từ **2023-12-15 06:00**. Chuyển sang `wss://fstream.binance.com`.

---

## 2023-11-01

**COIN-M & USDⓈ-M Futures**
- `GET dapi/v1/fundingRate` và `GET /fapi/v1/fundingRate`: Thêm field `markPrice`
- USDⓈ-M: `GET /futures/data/basis` – Query basis data

---

## 2023-10-19

**COIN-M & USDⓈ-M Futures**
- `GET /futures/data/delivery-price` – Query quarterly contract settlement price
- Rate limit 1000/5min/IP cho market data endpoints
- Rate limit 500/5min/IP cho `fundingRate`, `fundingInfo` (USDⓈ-M only)

**European Options – WebSocket upgrade**
- Ping: 3 phút (trước: 5 phút); Pong timeout: 10 phút (trước: 15 phút)
- Trailing `/` không còn hỗ trợ
- URL path không hợp lệ trước `/ws` không được hỗ trợ

---

## 2023-10-16

**COIN-M & USDⓈ-M Futures**
- `GET /dapi/v1/constituents` và `GET /fapi/v1/constituents` – Query index constituents

---

## 2023-10-11

**USDⓈ-M Futures – IP Weight update**
- `income/asyn`, `order/asyn`, `trade/asyn`: 5 → **1000**
- `income/asyn/id`, `order/asyn/id`, `trade/asyn/id`: 5 → **10**

---

## 2023-09-25

**COIN-M & USDⓈ-M Futures**
- `GET /dapi/v1/fundingInfo` và `GET /fapi/v1/fundingInfo` – Query adjusted funding info

---

## 2023-09-22

**Portfolio Margin**
- `positionRisk` (UM & CM): Thêm `liquidationPrice`
- `leverageBracket` (UM & CM): Thêm `notionalCoef`
- WebSocket User Data: `outboundAccountPosition` và `balanceUpdate` thêm field `U` (updateId)

---

## 2023-09-20

**COIN-M Futures**
- `GET /dapi/v1/ticker/bookTicker`: Thêm `lastUpdateId`
- `GET /dapi/v1/account`: Thêm `updateTime` trong `assets`

**USDⓈ-M Futures**
- `GET /fapi/v1/ticker/bookTicker`: Thêm `lastUpdateId`

---

## 2023-09-19

**USDⓈ-M Futures**
- Error code `-1008` mới cho HTTP 503 khi server overloaded

---

## 2023-09-07

**COIN-M Futures**
- `GET /dapi/v1/income/asyn` và `asyn/id` – Download income history

---

## 2023-09-05

**USDⓈ-M Futures – Tính năng lớn ra mắt**
- **Self Trade Prevention** enabled
- **Price Match** enabled
- **Good Till Date TIF** enabled
- **Breakeven Price** enabled

---

## 2023-09-04

**Portfolio Margin**
- Order rate limit: **2400/phút → 1200/phút**

---

## 2023-08-31

**COIN-M & USDⓈ-M Futures – WebSocket upgrade**
- Ping: 3 phút (trước: 5 phút)
- Pong timeout: 10 phút (trước: 15 phút)

---

## 2023-08-29

**European Options**
- `account` và `marginAccount`: Thêm `riskLevel`
- WebSocket: Event mới `RISK_LEVEL_CHANGE`

**USDⓈ-M Futures – STP được announce** (ra mắt sau)
- Modes: `NONE`, `EXPIRE_TAKER`, `EXPIRE_BOTH`, `EXPIRE_MAKER`
- Order status mới: `EXPIRED_IN_MATCH`

---

## 2023-08-25

**COIN-M Futures – WebSocket upgrade**
- Trailing `/` không còn hỗ trợ
- URL path không hợp lệ trước `/ws` và `/stream` không được hỗ trợ

---

## 2023-08-19

**USDⓈ-M Futures – WebSocket upgrade tương tự**

---

## 2023-08-18

**Portfolio Margin – Order Query endpoints mới**
- `GET /papi/v1/margin/order`, `openOrders`, `allOrders`
- `GET /papi/v1/margin/orderList`, `allOrderList`, `openOrderList`
- `GET /papi/v1/margin/myTrades`

---

## 2023-08-14

**COIN-M & USDⓈ-M Futures**
- `GET /dapi/v1/income` và `GET /fapi/v1/income`: Thêm parameter `page` cho pagination

---

## 2023-07-28

**Portfolio Margin**
- `POST /papi/v1/asset-collection` – Fund Collection by Asset

---

## 2023-07-21

**European Options**
- `GET /eapi/v1/income/asyn` và `asyn/id` – Download income history

---

## 2023-07-20

**Portfolio Margin**
- `GET /papi/v1/um/adlQuantile` – UM Position ADL Quantile
- `GET /papi/v1/cm/adlQuantile` – CM Position ADL Quantile

---

## 2023-07-19

**COIN-M Futures**
- `GET /dapi/v2/leverageBracket`: Thêm `notionalCoef`

---

## 2023-07-18

**Portfolio Margin**
- `POST /papi/v1/repay-futures-switch` – Toggle Auto-repay-futures
- `GET /papi/v1/repay-futures-switch` – Get status
- `POST /papi/v1/repay-futures-negative-balance` – Repay Negative Balance

**USDⓈ-M Futures**
- `GET /fapi/v1/leverageBracket`: Thêm `notionalCoef`

---

## 2023-07-13

**European Options**
- Stream `<symbol>@ticker` và `<underlyingAsset>@ticker@<expirationDate>`: Thêm field `T` (transaction time)
- Stream `<symbol>@depth<levels>`: Thêm field `E` (event time)

**Portfolio Margin**
- User Data Stream event mới: `riskLevelChange` (từ 2023-07-14)

---

## 2023-07-12

**COIN-M Futures**
- `GET /dapi/v1/account` và `positionRisk`: Thêm `breakEvenPrice`
- WebSocket: Field `bep` trong `ACCOUNT_UPDATE`

---

## 2023-07-11

**Portfolio Margin**
- `POST /papi/v1/ping` – Connectivity test

---

## 2023-07-04

**USDⓈ-M Futures**
- `GET /fapi/v1/order` và `allOrders`: Chỉ giữ **3 tháng** gần nhất (từ 2023-07-27)
- Endpoints download lịch sử: `order/asyn`, `order/asyn/id`, `trade/asyn`, `trade/asyn/id`

---

## 2023-06-28

**USDⓈ-M Futures** (từ 2023-07-15)
- `GET /fapi/v1/account` → dùng `GET /fapi/v2/account`
- `GET /fapi/v1/balance` → dùng `GET /fapi/v2/balance`
- `GET /fapi/v1/positionRisk` → dùng `GET /fapi/v2/positionRisk`

---

## 2023-06-22

**COIN-M & USDⓈ-M Futures**
- URL format `/ws?<streamName>` không được hỗ trợ
- JSON không hợp lệ → disconnect với error code 3

---

## 2023-06-19

**Portfolio Margin**
- Conditional orders: Thêm `CONTRACT_PRICE`, `priceProtect`

---

## 2023-06-16

**USDⓈ-M Futures – HTTP Request Format Requirements**
- Phải dùng `%22` thay vì `\x22` cho escape quotes
- JSON nested không hợp lệ không được hỗ trợ
- Data types phải đúng (LIST<LONG> phải là integers, không phải strings)
- Whitespace trong params không được phép
- Empty values trong params không được phép

---

## 2023-06-14

**COIN-M Futures**
- `<symbol>@markPrice` và `<pair>@markPrice`: Thêm field `i` (quote asset/index price)

**USDⓈ-M Futures**
- Stream mới: `!assetIndex@arr` hoặc `<assetSymbol>@assetIndex`

---

## 2023-06-01

**Portfolio Margin**
- `GET /papi/v1/um/income` và `GET /papi/v1/cm/income` – UM/CM income history
- `GET /papi/v1/um/account` và `GET /papi/v1/cm/account` – UM/CM account history

---

## 2023-05-31

**USDⓈ-M Futures**
- User Data Stream event mới: `CONDITIONAL_ORDER_TRIGGER_REJECT`

---

## 2023-05-05

**USDⓈ-M Futures – Order Modification**
- `PUT /fapi/v1/order` – Modify single order
- `PUT /fapi/v1/batchOrders` – Batch modify
- `GET /fapi/v1/orderAmendment` – Order modify history
- WebSocket `ORDER_TRADE_UPDATE`: Execution type mới `AMENDMENT`

---

## 2023-05-04

**Portfolio Margin**
- API documentation ra mắt

---

## 2023-04-17

**COIN-M Futures**
- `recvWindow` check tại matching engine. Error: `-4188`
- Affected: `POST/PUT /dapi/v1/order`, `POST/PUT /dapi/v1/batchOrders`

**USDⓈ-M Futures** (release 2023-04-18)
- `recvWindow` check tại matching engine. Error: `-5028`
- Affected: `POST/PUT /fapi/v1/order`, `POST/PUT /fapi/v1/batchOrders`

---

## 2023-03-28

**USDⓈ-M Futures**
- Referral rebates được aggregate mỗi **20 phút** (trước: real-time mỗi trade)

---

## 2023-03-08

**USDⓈ-M Futures** (release 2023-03-22)
- FOK/GTX orders không fill → **rejected trực tiếp** với error response
- Không tạo order, không xuất hiện trong order history
- Error codes: `-5021` (FOK), `-5022` (GTX/Post Only)

---

## 2023-02-02

**European Options**
- `POST /eapi/v1/transfer` bị disabled

---

## 2023-01-11

**European Options**
- `GET /eapi/v1/order` – Check order status

---

## 2023-01-04

**USDⓈ-M Futures**
- Xóa Order Status `NEW_INSURANCE` và `NEW_ADL` khỏi Order Update Event

---

# Trước 2023

---

## 2022-12-16

**COIN-M & USDⓈ-M Futures**
- Stream mới: `!contractInfo` – Symbol information update

---

## 2022-12-13

**European Options**
- Stream `<symbol>@depth1000`: Thêm `u` và `pu` (diff orderbook update)

---

## 2022-12-09

**European Options**
- `GET /eapi/v1/depth`: Thêm `updateId` field `u`
- `GET /eapi/v1/exerciseHistory`: Thêm parameter `underlying`

---

## 2022-11-29

**COIN-M & USDⓈ-M Futures**
- User Data Stream events mới: `STRATEGY_UPDATE`, `GRID_UPDATE`

---

## 2022-11-18

**European Options**
- `GET /eapi/v1/openInterest` – Options open interest
- Stream: `<underlyingAsset>@openInterest@<expirationDate>`

---

## 2022-11-16

**European Options**
- Stream mới: `<underlyingAsset>@trade`
- Format của stream `option_pair` được điều chỉnh

---

## 2022-11-03

**European Options** (ra mắt 2022-11-07)
- Kill-Switch endpoints: `POST/GET /eapi/v1/countdownCancelAll`, `POST /eapi/v1/countdownCancelAllHeartBeat`

---

## 2022-10-13

**COIN-M & USDⓈ-M Futures** (hiệu lực 2022-10-17)
- `GET /dapi/v1/ticker/bookTicker` và `GET /fapi/v1/ticker/bookTicker`: Weight **2** (single), **5** (all)

---

## 2022-09-22

**COIN-M & USDⓈ-M Futures**
- `GET /dapi/v1/pmAccountInfo` và `GET /fapi/v1/pmAccountInfo` – Portfolio Margin account info
- USDⓈ-M: `GET /fapi/v1/income` hỗ trợ thêm incomeType

---

## 2022-09-20

**European Options**
- Streams mới: `<underlyingAsset>@markPrice`, `<underlyingAsset>@ticker@<expirationDate>`
- `<!miniTicker@arr>` deprecated từ 2022-10-30

---

## 2022-09-14

**European Options**
- Các fields trong `exchangeInfo` đổi sang string type
- `historyOrders`: Chỉ query **5 ngày** gần nhất

---

## 2022-07-27

**COIN-M & USDⓈ-M Futures**
- `GET /dapi/v1/trades` và `GET /fapi/v1/trades`: Weight → **5**

---

## 2022-06-28

**COIN-M & USDⓈ-M Futures**
- `GET /dapi/v1/pmExchangeInfo` và `GET /fapi/v1/pmExchangeInfo` – PM exchange info

---

## 2022-04-28

**COIN-M Futures – Order Modification**
- `PUT /dapi/v1/order`, `PUT /dapi/v1/batchOrders`, `GET /dapi/v1/orderAmendment`
- WebSocket: Execution type `AMENDMENT`

---

## 2022-04-14

**COIN-M Futures**
- User Data Stream: `ACCOUNT_CONFIG_UPDATE` event (leverage change)

---

## 2022-03-01

**USDⓈ-M Futures**
- `GET /fapi/v1/income/asyn` và `asyn/id` – Download income history

---

## 2022-02-18

**COIN-M Futures**
- `GET /dapi/v1/userTrades` limit tối đa: **1000**

---

## 2022-02-10

**USDⓈ-M Futures**
- `GET /fapi/v2/account`: Multi-Assets Margin mode – Tất cả assets được tính vào margin fields (USD value)

---

## 2021-12-30

**USDⓈ-M Futures**
- Connection method mới: `wss://fstream-auth.binance.com` (đã bị retire 2023-12-15)

---

## 2021-11-02

**USDⓈ-M Futures**
- `GET /fapi/v1/assetIndex` – Asset index cho Multi-Assets mode

---

## 2021-08-17–18

**COIN-M Futures**
- Order Modification: `PUT /dapi/v1/order`, `PUT /dapi/v1/batchOrders`
- `GET /dapi/v1/orderAmendment`
- `GET /dapi/v1/account`: Thêm field `positionAmt`

---

## 2021-07-06–23

**COIN-M & USDⓈ-M Futures**
- `exchangeInfo`: Thêm `liquidationFee`, `marketTakeBound`
- `account` và `positionRisk`: Thêm `updateTime`

---

## 2021-06-15

**USDⓈ-M Futures**
- `<symbol>@compositeIndex`: Thêm `q` (quote asset) và `i` (index price)
- `GET /fapi/v1/indexInfo`: Thêm `component`, `quoteAsset`

---

## 2021-05-06

**USDⓈ-M Futures**
- `ACCOUNT_CONFIG_UPDATE` event: Bao gồm cả Multi-Assets margin status update
- `ACCOUNT_UPDATE`: Reason type mới `AUTO_EXCHANGE`
- `POST /fapi/v1/multiAssetsMargin` – Change Multi-Assets margin mode
- `GET /fapi/v1/multiAssetsMargin` – Check mode
- `exchangeInfo`: Thêm object `assets`
- `balance` và `account`: Thêm `marginAvailable`

**COIN-M Futures**
- `ACCOUNT_UPDATE`: Thêm field `bc` (balance change)

---

## 2021-04-27

**COIN-M & USDⓈ-M Futures**
- Liquidation streams: Snapshot data, tối đa 1 push/giây (không còn real-time)
- `allForceOrders` endpoint ngừng maintenance

---

## 2021-03-02

**USDⓈ-M Futures**
- `GET /fapi/v1/indexPriceKlines` – Index price klines
- `GET /fapi/v1/markPriceKlines` – Mark price klines

---

## 2021-01-26

**USDⓈ-M Futures**
- `ACCOUNT_CONFIG_UPDATE` event trong User Data Stream (leverage change)
- Filter mới `MIN_NOTIONAL` trong `exchangeInfo`

**COIN-M & USDⓈ-M Futures**
- `allForceOrders`, `forceOrders`: Weight → **20** (symbol) / **50** (no symbol)

---

## 2021-01-21

**COIN-M & USDⓈ-M Futures**
- Regex rule `newClientOrderId`: `^[\.A-Z\:/a-z0-9_-]{1,36}$`

---

## 2021-01-04

**USDⓈ-M Futures**
- `klines`, `continuousKlines`: Weight dựa trên parameter `LIMIT`
- `historicalTrades`, `allForceOrders`, `forceOrders`, `aggTrades`: Weight → **20**

---

## 2020-12-30

**COIN-M Futures**
- `klines`, `continuousKlines`, `indexPriceKlines`, `markPriceKlines`: Weight theo `LIMIT`
- Nhiều endpoints: Weight → **20**

---

## 2020-12-08

**USDⓈ-M Futures**
- Streams `bookTicker` và `!bookTicker`: Thêm field `e` (event type)
- Streams `markPrice`: Thêm field `P` (estimated settle price)
- Stream mới: `<pair>_<contractType>@continuousKline_<interval>`
- `GET /fapi/v1/continuousKlines` – Continuous contract klines
- `exchangeInfo`: Thêm `pair`, `contractType`, `deliveryDate`, `onboardDate`
- Contract types: PERPETUAL, CURRENT_MONTH, NEXT_MONTH, CURRENT_QUARTER, NEXT_QUARTER

---

## 2020-11-27

**COIN-M & USDⓈ-M Futures**
- `GET /dapi/v1/commissionRate` và `GET /fapi/v1/commissionRate` – User commission rate

---

## 2020-11-13

**USDⓈ-M Futures**
- `<symbol>@depth@0ms` và `<symbol>@depth<level>@0ms`: Update interval điều chỉnh động theo traffic
