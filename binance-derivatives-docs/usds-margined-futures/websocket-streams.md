# 🟡 USDⓈ-M Futures – WebSocket Market Streams

> Base URL: `wss://fstream.binance.com`  
> Tài liệu chính: https://developers.binance.com/docs/derivatives/usds-margined-futures/websocket-market-streams

---

## Kết nối

- Streams: `/ws/<streamName>` hoặc combined: `/stream?streams=<stream1>/<stream2>`
- Trailing `/` ở cuối URL **không được hỗ trợ** (từ 2023-08-19)
- URL format `/ws?<streamName>` không được hỗ trợ
- JSON không hợp lệ → disconnect
- Max streams per connection: **1024** (tăng từ 200, từ 2025-07-02)
- GTC orders max validity: **1 năm**

## Ping/Pong

| Thông số | Giá trị |
|---------|---------|
| Ping interval | Mỗi 3 phút |
| Pong timeout | 10 phút |
| Xử lý | Phải gửi pong với copy payload của ping ngay lập tức |
| Unsolicited pong | Được phép nhưng **không prevent disconnection** |

---

## Danh sách Streams

### Aggregate Trade Stream
```
<symbol>@aggTrade
```
- Aggregate trades mỗi 100ms (chỉ market trades)
- Field `nq` (non-RPI quantity) từ 2025-12-31: Chỉ aggregate normal trades (không gồm RPI)

### Mark Price Stream
```
<symbol>@markPrice
<symbol>@markPrice@1s
!markPrice@arr
!markPrice@arr@1s
```
- Mark price và funding rate
- Field `P` (estimated settle price) từ 2020-12-08

### Kline/Candlestick Stream
```
<symbol>@kline_<interval>
<pair>_<contractType>@continuousKline_<interval>
```
- Intervals: `1m`, `3m`, `5m`, `15m`, `30m`, `1h`, `2h`, `4h`, `6h`, `8h`, `12h`, `1d`, `3d`, `1w`, `1M`

### Individual Symbol Mini Ticker
```
<symbol>@miniTicker
!miniTicker@arr
```

### Individual Symbol Ticker
```
<symbol>@ticker
!ticker@arr
```

### Book Ticker
```
<symbol>@bookTicker
!bookTicker
```
- `!bookTicker` update speed: **mỗi 5 giây** (từ 2023-12-20; trước đây real-time)
- `<symbol>@bookTicker`: Vẫn real-time

### Liquidation Order Stream
```
<symbol>@forceOrder
!forceOrder@arr
```
- **Không còn real-time** (từ 2021-04-27): Snapshot data, tối đa 1 push/giây

### Partial Book Depth Stream
```
<symbol>@depth<levels>
<symbol>@depth<levels>@500ms
<symbol>@depth<levels>@250ms
<symbol>@depth<levels>@100ms
```
- Levels: 5, 10, 20

### Diff. Book Depth Stream
```
<symbol>@depth
<symbol>@depth@500ms
<symbol>@depth@250ms
<symbol>@depth@100ms
<symbol>@depth@0ms
```
- `@0ms` update interval được điều chỉnh động theo traffic (từ 2020-11-13)

### Trade Stream
```
<symbol>@trade
```
- Field `IsRPITrade` (boolean) từ 2025-11-18 để phân biệt RPI trades

### RPI Order Book Stream (từ 2025-11-25)
```
<symbol>@rpiDepth@500ms
```
- Riêng cho RPI (Retail Price Improvement) orders

### Contract Info Stream (từ 2022-12-16)
```
!contractInfo
```
- Symbol information update

### Asset Index Stream (từ 2023-06-14)
```
!assetIndex@arr
<assetSymbol>@assetIndex
```
- Multi-assets mode asset index update

### Composite Index Stream
```
<symbol>@compositeIndex
```
- Fields `q` (quote asset) và `i` (index price) từ 2021-06-15

---

## User Data Streams

### Kết nối
```
wss://fstream.binance.com/ws/<listenKey>
```

### Events

#### ORDER_TRADE_UPDATE
Khi có thay đổi order/trade.

Fields quan trọng:
- `V` – selfTradePreventionMode (từ 2023-09-05)
- `pm` – priceMatch mode (từ 2023-09-05)
- `gtd` – goodTillDate (từ 2023-09-05)
- `er` – orderExpireReason (từ 2025-10-23)

Execution types:
- `NEW` – Order mới
- `PARTIALLY_FILLED` – Partial fill
- `FILLED` – Đã fill đầy
- `CANCELED` – Đã cancel
- `EXPIRED` – Đã expire
- `TRADE` – Trade execution
- `AMENDMENT` – Order modification (từ 2023-05-05)

#### ACCOUNT_UPDATE
Khi balance hoặc position thay đổi.

Reason types: `DEPOSIT`, `WITHDRAW`, `ORDER`, `FUNDING_FEE`, `WITHDRAW_REJECT`, `ADJUSTMENT`, `INSURANCE_CLEAR`, `ADMIN_DEPOSIT`, `ADMIN_WITHDRAW`, `MARGIN_TRANSFER`, `MARGIN_BUY`, `AUTO_EXCHANGE`

Field `bc` (balance change) từ 2021-04-22

#### ACCOUNT_CONFIG_UPDATE
Leverage update hoặc Multi-Assets margin status update (từ 2021-01-26).

#### MARGIN_CALL
Margin call notification.

#### CONDITIONAL_ORDER_TRIGGER_REJECT (deprecated từ 2025-12-15)
Lý do reject cho triggered TP/SL orders → thay bằng `ALGO_UPDATE`.

#### ALGO_UPDATE (từ 2025-12-09)
Update cho algo orders (conditional orders trên Algo Service).

#### STRATEGY_UPDATE (từ 2022-11-29)
Khi strategy được tạo/cancel/expire.

#### GRID_UPDATE (từ 2022-11-29)
Khi sub-order của grid được fill.

#### TRADE_LITE (từ 2024-09-03)
Latency thấp hơn ORDER_TRADE_UPDATE, chỉ cho TRADE execution type.
