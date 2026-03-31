# 💎 Portfolio Margin Pro – General Info & Endpoints

> Base URL: `https://api.binance.com` (sapi endpoints)  
> Tài liệu chính: https://developers.binance.com/docs/derivatives/portfolio-margin-pro/general-info

---

## Giới thiệu

Portfolio Margin Pro là sản phẩm nâng cao cho institutional traders, hỗ trợ SPAN margin calculation và tiered collateral rates. Cần đăng ký riêng để sử dụng.

---

## 💎 Portfolio Margin Pro Endpoints (/sapi)

| Method | Endpoint | Mô tả | Từ |
|--------|----------|-------|-----|
| GET | `/sapi/v2/portfolio/account` | PM Pro SPAN Account Info (chỉ cho SPAN users) | 2024-10-15 |
| GET | `/sapi/v1/portfolio/balance` | PM Pro Account Balance Info | 2024-10-15 |
| GET | `/sapi/v2/portfolio/collateralRate` | PM Pro Tiered Collateral Rate | 2024-09-05 |
| POST | `/sapi/v1/portfolio/repay-futures-switch` | Change Auto-repay-futures Status (rate limit 20/ngày từ 2024-11-01) | - |
| POST | `/sapi/v1/portfolio/mint` | BFUSD mint (**Deprecated** từ 2025-11-10) | 2024-12-20 |
| POST | `/sapi/v1/portfolio/redeem` | BFUSD redeem (**Deprecated** từ 2025-11-10) | 2024-12-20 |
| POST | `/sapi/v1/portfolio/delta-mode` | Switch Delta Mode | 2026-01-09 |
| GET | `/sapi/v1/portfolio/delta-mode` | Query Delta Mode status | 2026-01-09 |
| POST | `/sapi/v1/portfolio/earn-asset-transfer` | Transfer LDUSDT | 2025-04-15 |
| GET | `/sapi/v1/portfolio/earn-asset-balance` | Get Earn Asset Balance | 2025-04-15 |

---

## ⚠️ Deprecated Endpoints

| Endpoint | Deprecated từ | Lý do |
|---------|--------------|-------|
| `POST sapi/v1/portfolio/mint` | 2025-11-10 | BFUSD migrate sang Binance Earn |
| `POST sapi/v1/portfolio/redeem` | 2025-11-10 | BFUSD migrate sang Binance Earn |

Sau khi deprecated, gặp error `-21015 ENDPOINT_GONE`.

Hướng dẫn chuyển đổi:
1. Sau migration 2025-08-13, dùng Binance Earn cho BFUSD.
2. Nếu còn BFUSD trong PM wallet, dùng `POST /sapi/v1/portfolio/asset-collection` trước, sau đó transfer ra Spot wallet để redeem.

---

## Delta Mode (từ 2026-01-09)

Cho phép PM PRO / PM RETAIL accounts switch Delta Mode:
- `POST /sapi/v1/portfolio/delta-mode` – Switch mode
- `GET /sapi/v1/portfolio/delta-mode` – Query current mode

---

## Earn Asset as Collateral (từ 2025-04-15)

- `POST /sapi/v1/portfolio/earn-asset-transfer` – Transfer LDUSDT làm collateral
- `GET /sapi/v1/portfolio/earn-asset-balance` – Xem số dư LDUSDT có thể transfer

---

## BFUSD → Binance Earn Migration (2025-08-13)

BFUSD đã được migrate sang Binance Earn. Thay vì dùng API mint/redeem:
1. Truy cập Binance Earn trực tiếp
2. Nếu còn BFUSD trong PM Pro wallet, aggregate trước rồi transfer ra Spot để redeem

---

## Tiered Collateral Rates

`GET /sapi/v2/portfolio/collateralRate` trả về tiered collateral rates theo tài sản và số lượng.

Ví dụ response:
```json
[
  {
    "asset": "BTC",
    "collateralRate": [
      {
        "minUsdValue": "0",
        "maxUsdValue": "100000",
        "discountRate": "0.95"
      }
    ]
  }
]
```

---

## SPAN Account Info

`GET /sapi/v2/portfolio/account` – Chỉ dành cho **PM Pro SPAN users**.

Trả về thông tin về margin requirement, available balance, và SPAN-specific fields.
