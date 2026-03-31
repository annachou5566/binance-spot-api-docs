# 🟡 USDⓈ-M Futures – General Info

> Tài liệu chính: https://developers.binance.com/docs/derivatives/usds-margined-futures/general-info

---

## Base URLs

| Môi trường | REST | WebSocket Streams | WebSocket API |
|-----------|------|-------------------|--------------|
| **Production** | `https://fapi.binance.com` | `wss://fstream.binance.com` | `wss://ws-fapi.binance.com/ws-fapi/v1` |
| **Testnet** | `https://demo-fapi.binance.com` | `wss://fstream.binancefuture.com` | - |

---

## HTTP Return Codes

| Code | Ý nghĩa |
|------|---------|
| `4XX` | Malformed request (lỗi phía client) |
| `403` | WAF Limit bị vi phạm |
| `408` | Timeout khi chờ response từ backend |
| `429` | Rate limit bị vi phạm |
| `418` | IP bị auto-ban (sau nhiều lần 429) |
| `503` | Service overload (xem chi tiết bên dưới) |
| `5XX` | Internal error (lỗi phía Binance) |

### HTTP 503 – Chi tiết xử lý

#### A. "Unknown error, please check your request or try again later."
- **Execution status: UNKNOWN** (có thể đã thành công)
- **Xử lý:** Verify qua WebSocket updates hoặc query orderId trước khi retry
- Trong peak time, nên dùng single orders thay vì batch

#### B. "Service Unavailable."
- **100% Failure**
- **Xử lý:** Retry với exponential backoff (200ms → 400ms → 800ms, tối đa 3–5 lần)
- Rate limit: **Không tính**

#### C. "Request throttled by system-level protection." (code `-1008`)
- **100% Failure** – Node vượt quá concurrency tối đa
- **Xử lý:** Retry với backoff, giảm concurrency
- **Applicable endpoints:** `POST /fapi/v1/order`, `POST /fapi/v1/batchOrders`, `POST /fapi/v1/order/test`
- Rate limit: **Không tính**
- **Exception:** Reduce-only/close-position orders **không bị ảnh hưởng** (được ưu tiên để giảm risk)

---

## Rate Limits

### IP Limits
- Mỗi request trả về header `X-MBX-USED-WEIGHT-(intervalNum)(intervalLetter)` trong response
- Vi phạm 429 → cần back off ngay
- Liên tục vi phạm → IP ban (HTTP 418), từ 2 phút đến 3 ngày
- **Rate limit dựa trên IP, không phải API key**

### Order Rate Limits
- Mỗi order response trả về header `X-MBX-ORDER-COUNT-(intervalNum)(intervalLetter)`
- **Rate limit tính theo account**
- Orders bị reject không đảm bảo có header này

### Khuyến nghị
**Dùng WebSocket streams thay vì polling REST API** để giảm pressure và đảm bảo real-time data.

---

## SDKs

| Ngôn ngữ | Link | Pip/Maven |
|---------|------|-----------|
| Python | https://github.com/binance/binance-connector-python | `pip install binance-sdk-derivatives-trading-usds-futures` |
| Java | https://github.com/binance/binance-connector-java | `git clone https://github.com/binance/binance-connector-java.git` |

---

## Endpoint Security Types

| Security Type | Mô tả |
|--------------|-------|
| `NONE` | Truy cập tự do |
| `TRADE` | Cần API-Key + signature |
| `USER_DATA` | Cần API-Key + signature |
| `USER_STREAM` | Cần API-Key |
| `MARKET_DATA` | Cần API-Key |

- API-Key gửi qua header: `X-MBX-APIKEY`
- API-keys và secret-keys **case sensitive**

---

## SIGNED Endpoints

### Timing Security

```
if (timestamp < serverTime + 1000 && serverTime - timestamp <= recvWindow) {
  // process request
} else {
  // reject request
}
```

- `recvWindow` mặc định: **5000ms**
- Khuyến nghị: `recvWindow` ≤ 5000ms

### HMAC SHA256 Signature (Example)

```bash
# Parameters
symbol=BTCUSDT&side=BUY&type=LIMIT&quantity=1&price=9000&timeInForce=GTC&recvWindow=5000&timestamp=1591702613943

# Compute signature
echo -n "symbol=BTCUSDT&side=BUY&type=LIMIT&quantity=1&price=9000&timeInForce=GTC&recvWindow=5000&timestamp=1591702613943" \
  | openssl dgst -sha256 -hmac "YOUR_SECRET_KEY"

# Send request  
curl -H "X-MBX-APIKEY: YOUR_API_KEY" \
  -X POST 'https://fapi.binance.com/fapi/v1/order' \
  -d 'symbol=BTCUSDT&side=BUY&type=LIMIT&quantity=1&price=9000&timeInForce=GTC&recvWindow=5000&timestamp=1591702613943&signature=SIGNATURE'
```

### RSA Keys
- Hỗ trợ `PKCS#8`
- Upload RSA Public Key để nhận API key tương ứng
- Sign bằng RSASSA-PKCS1-v1_5 với SHA-256
- Encode output thành base64, URL encode kết quả

---

## WebSocket API General Info

- Base URL: `wss://ws-fapi.binance.com/ws-fapi/v1`
- Ra mắt: **2024-04-01**
- Requests gửi dưới dạng JSON text frames (1 request/frame)
- Tương đương REST API về tính năng, filter, rate limit
- Cần 2 WebSocket connections riêng: 1 cho API, 1 cho market data streams

### Session Authentication

```json
// Logon (sau đó có thể bỏ apiKey và signature cho các requests tiếp theo)
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

---

## Postman Collection

https://github.com/binance-exchange/binance-api-postman
