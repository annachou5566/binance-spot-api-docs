# ⚠️ Error Codes – Tổng hợp

> Tổng hợp các error codes quan trọng từ tất cả Derivatives APIs

---

## USDⓈ-M Futures Error Codes

### General Errors

| Code | Message | Ghi chú |
|------|---------|---------|
| `-1008` | Request throttled by system-level protection. Reduce-only/close-position orders are exempt. | HTTP 503 overload. Từ 2025-10-14 message được cập nhật. |
| `-1121` | Invalid symbol. | - |
| `-5021` | Due to the order could not be filled immediately, the FOK order has been rejected. | Từ 2023-03-22, FOK rejected không tạo order. |
| `-5022` | Due to the order could not be executed as maker, the Post Only order will be rejected. | Từ 2023-03-22, GTX rejected không tạo order. |
| `-5028` | Timestamp for this request is outside of the ME recvWindow | Từ 2023-04-18, check `recvWindow` tại matching engine. |

### Order Errors

| Code | Message | Ghi chú |
|------|---------|---------|
| `-4109` | This account is inactive. Please activate it before trading. | Từ 2025-07-25. Transfer bất kỳ asset để activate. |
| `-4116` | ClientOrderId is duplicated. | Từ 2024-12-03. |
| `-4117` | Stop order is in triggering process. Please try again later. | Từ 2024-12-03. |
| `-4120` | STOP_ORDER_SWITCH_ALGO | Từ 2025-12-09. Dùng Algo Service cho conditional orders. |
| `-4188` | Timestamp for this request is outside of the ME recvWindow | COIN-M version của `-5028`. |

### Portfolio Margin Errors

| Code | Message | Ghi chú |
|------|---------|---------|
| `-21015` | ENDPOINT_GONE | Khi dùng deprecated endpoints (e.g., BFUSD mint/redeem). |

---

## HTTP Status Codes

| HTTP | Mô tả | Hành động |
|------|-------|-----------|
| `200` | Thành công | - |
| `4XX` | Malformed request (lỗi client) | Kiểm tra request params |
| `403` | WAF Limit bị vi phạm | Giảm request frequency |
| `408` | Timeout từ backend | Retry |
| `418` | IP bị auto-ban | Đợi hết thời gian ban |
| `429` | Rate limit bị vi phạm | Back off ngay |
| `503 (A)` | Unknown error | Verify via WebSocket/orderId, có thể đã thành công |
| `503 (B)` | Service Unavailable | 100% failure, retry với exponential backoff |
| `503 (C)` | Request throttled (-1008) | 100% failure, giảm concurrency |
| `5XX` | Internal error | Retry later |

---

## IP Ban Policy

- Vi phạm 429 liên tục → HTTP 418 (IP ban)
- Ban duration scale theo số lần vi phạm: **2 phút → 3 ngày**
- Rate limits dựa trên IP, không phải API key

---

## Portfolio Margin Error Codes

| Code | Message |
|------|---------|
| `-21015` | ENDPOINT_GONE |

---

## Options Trading Error Codes

Xem: https://developers.binance.com/docs/derivatives/options-trading/error-code

---

## Lưu ý về Error Handling

### FOK/GTX Orders (từ 2023-03-22)
Trước: Tạo order với status NEW, sau đó EXPIRED.
Sau: Rejected trực tiếp với error response, **không tạo order**.

### recvWindow tại Matching Engine (từ 2023-04-18)
Có thêm kiểm tra `recvWindow` khi request đến matching engine:
- USDⓈ-M: error `-5028`
- COIN-M: error `-4188`

### 503 Handling Best Practices
```
503-A (Unknown): 
  1. Đừng treat là failure ngay
  2. Query orderId qua REST hoặc WebSocket
  3. Nếu không tìm thấy order → thử lại

503-B (Service Unavailable):
  1. 100% failure
  2. Retry: 200ms → 400ms → 800ms (tối đa 3–5 lần)

503-C (-1008 Throttled):
  1. 100% failure
  2. Reduce concurrency
  3. Retry với backoff
  4. Exception: reduce-only/close-position orders được ưu tiên
```
