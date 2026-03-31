# 📅 Thay đổi năm 2025

> Nguồn: https://developers.binance.com/docs/derivatives/change-log

---

## 2025-12-29

**USDⓈ-M Futures**
- Xóa `MAX_NUM_ALGO_ORDERS` filter khỏi `GET /fapi/v1/exchangeInfo`. Conditional order limit = **200 across tất cả symbols**.
- Từ **2025-12-31**: Field `nq` trong `<symbol>@aggTrade` – Chỉ aggregate normal market trades (không gồm RPI orders).

---

## 2025-12-11

**USDⓈ-M Futures – TradFi/Trading Schedule**
- `GET /fapi/v1/tradingSchedule` – Query trading session schedules (1 tuần)
- `POST /fapi/v1/stock/contract` – Sign TradFi-Perps agreement contract
- WebSocket API: `tradingSession` method

---

## 2025-12-10

- Event `CONDITIONAL_ORDER_TRIGGER_REJECT` **deprecated từ 2025-12-15** (conditional orders đã sang Algo Service). Dùng `ALGO_UPDATE` thay thế.

---

## 2025-12-09

**COIN-M Futures**
- Field `er` (order expire reason) có trong `ORDER_TRADE_UPDATE` stream từ **2025-12-10**.

---

## 2025-11-25

**USDⓈ-M Futures – RPI Order Book**
- Từ **2025-11-26**: RPI commission fee trong `GET /fapi/v1/commissionRate`.
- REST: `GET /fapi/v1/rpiDepth`
- WebSocket: `<symbol>@rpiDepth@500ms`

---

## 2025-11-19

**USDⓈ-M Futures**
- `GET /fapi/v1/symbolAdlRisk` – Query ADL risk rating

---

## 2025-11-18

**USDⓈ-M Futures – RPI (Retail Price Improvement) Orders ra mắt**
- Time-in-force ENUM `RPI` cho `POST /fapi/v1/order`, batch orders, WebSocket `order.place`
- Field `IsRPITrade` trong trades response
- RPI orders **không xuất hiện** trong order book và bookTicker streams
- Chi tiết: https://www.binance.com/en/support/faq/92c83c53173947c4a44f9a7277c3b9ce

---

## 2025-11-12

- Options Demo API environment ra mắt
- Tạo API key: https://demo.binance.com/zh-CN/my/settings/api-management

---

## 2025-11-10

- `POST sapi/v1/portfolio/mint` và `POST sapi/v1/portfolio/redeem` bị **deprecated** (BFUSD → Binance Earn)
- Error: `-21015 ENDPOINT_GONE`

---

## 2025-11-06

**USDⓈ-M Futures – Conditional Orders → Algo Service (hiệu lực 2025-12-09)**

Order types bị ảnh hưởng: `STOP_MARKET`, `TAKE_PROFIT_MARKET`, `STOP`, `TAKE_PROFIT`, `TRAILING_STOP_MARKET`

REST Algo Order endpoints mới:
- `POST /fapi/v1/algoOrder`
- `DELETE /fapi/v1/algoOrder`
- `DELETE /fapi/v1/algoOpenOrders`
- `GET /fapi/v1/algoOrder`
- `GET /fapi/v1/openAlgoOrders`
- `GET /fapi/v1/allAlgoOrders`

Sau migration, `POST /fapi/v1/order` với các order types trên → error `-4120 STOP_ORDER_SWITCH_ALGO`.

WebSocket User Stream: Event mới `ALGO_UPDATE`.
WebSocket API: `algoOrder.place`, `algoOrder.cancel`.

**Lưu ý quan trọng sau migration:**
- Không check margin trước khi trigger
- GTE_GTC chỉ phụ thuộc positions, không phụ thuộc open orders phía đối diện
- Không hỗ trợ modify untriggered conditional orders

---

## 2025-10-21

**Tất cả APIs** – `priceMatch` OPPONENT_10 và OPPONENT_20 tạm thời bị xóa (hiệu lực 2025-10-23):
- USDⓈ-M: `POST/PUT /fapi/v1/order`, `POST/PUT /fapi/v1/batchOrders`
- COIN-M: `POST/PUT /dapi/v1/order`, `POST/PUT /dapi/v1/batchOrders`
- PM: UM/CM order và conditional order endpoints

---

## 2025-10-20

**USDⓈ-M Futures**
- Field `er` (order expire reason) trong `ORDER_TRADE_UPDATE` từ **2025-10-23**

---

## 2025-10-14

Error code `-1008` message được cập nhật với nội dung rõ ràng hơn.

---

## 2025-10-09

- Futures hỗ trợ **symbol tiếng Trung** (Unicode UTF-8). Ví dụ: `"symbol": "测试USDT"`
- Symbol có ký tự Trung Quốc trong API request phải **URL-encode** (percent-encoding)
- WebSocket/User Data Stream push messages cũng có thể chứa ký tự Trung Quốc

---

## 2025-08-11

- Thông báo: BFUSD migrate sang Binance Earn ngày **2025-08-13**
- `POST sapi/v1/portfolio/mint` và `redeem` sẽ bị deprecated sau migration

---

## 2025-07-25

- Error code mới `-4109`: Account inactive. Transfer bất kỳ asset nào để activate USDM Futures account.

---

## 2025-07-02

**USDⓈ-M Futures**
- `GET /futures/data/openInterestHist`: Thêm field `CMCCirculatingSupply`
- WebSocket Market Streams: Max streams/connection: **200 → 1024**

---

## 2025-04-23

**USDⓈ-M Futures**
- `GET /fapi/v1/insuranceBalance` – Insurance fund balance snapshot
- `GET /fapi/v1/constituents`: Thêm fields `price` và `weight`

---

## 2025-04-15

**Portfolio Margin & Portfolio Margin Pro – Earn Asset Collateral**
- `POST /sapi/v1/portfolio/earn-asset-transfer` – Transfer LDUSDT
- `GET /sapi/v1/portfolio/earn-asset-balance` – Xem số dư

---

## 2025-02-28

**Portfolio Margin**
- `GET /sapi/v1/portfolio/pmloan-history` – PM loan repay records

---

## 2025-02-20

**COIN-M Futures – WebSocket API ra mắt (2025-02-25)**
- URL: `wss://ws-dapi.binance.com/ws-dapi/v1`
- Tương đương REST API về tính năng

---

## 2025-01-20

**Portfolio Margin**
- `GET /papi/v1/portfolio/negative-balance-exchange-record` – Negative balance auto exchange records (ra mắt 2025-01-22)

---

## 2025-01-13

**USDⓈ-M & COIN-M Futures** (hiệu lực 2025-01-14)
- `GET /fapi/v1/historicalTrades` và `GET /dapi/v1/historicalTrades`:
  - `limit` maximum: 1000 → **500**
  - `limit` default: 500 → **100**

---

## 2025-01-06

**Portfolio Margin**
- `GET papi/v1/rateLimit/order` – Query user rate limit
