# 🛒 Ecommerce Analytics with dbt

Data transformation project built with **dbt** to model ecommerce data into clean, reliable, and analytics-ready datasets.

---

## 🚀 Overview

This project transforms raw data into a structured model for:

* Sales analysis
* Customer insights
* Product performance

---

## 🧱 Data Model

The pipeline follows a layered approach:

* **Staging (`stg_`)** → cleaning and standardization
* **Intermediate (`int_`)** → joins and business logic
* **Marts (`fct_`, `dim_`)** → final analytical tables

---

## 📊 Models

* `fct_orders` → 1 row per order
* `fct_order_items` → 1 row per product per order
* `dim_customers`
* `dim_products`

---

## 🧪 Testing

Includes data quality checks:

* `not_null`, `unique`
* `relationships`
* `accepted_range`
* composite keys

---

## ⚙️ Run

```bash
dbt deps
dbt build
```

---

## 📚 Docs

```bash
dbt docs generate
dbt docs serve
```

---

## 👨‍💻 Author

Mauricio Lancheros
Data Engineer
