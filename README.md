# Online Store Database - SQL Project

A beginner SQL project to build a small e-commerce database and answer real business questions using SQL.

## Project Overview
Created a database for an online store to manage customers, products, orders, and payments.

## Database Tables
- **customers** - Stores customer details (customer_id, name, email, city)
- **products** - Stores product details (product_id, name, category, price, stock)
- **orders** - Stores one row per order (order_id, customer_id, order_date, status)
- **order_items** - Stores products in each order (order_id, product_id, quantity)
- **payments** - Stores payment details (order_id, amount, payment_method, status)

## What I Did
- Created 5 tables with PRIMARY KEY and FOREIGN KEY relationships
- Inserted sample data for customers, products, and orders
- Used JOIN to combine customers, orders, and order items
- Used GROUP BY + SUM() to find top customers and best-selling products
- Used WHERE + ORDER BY to find low-stock products and filter orders
- Used LEFT JOIN to find products that were never ordered

## Business Questions Answered
- Who is the top customer by total spending?
- Which product is the best-selling product?
- What is the total revenue excluding cancelled orders?
- Which products are low in stock?

## Skills Used
SQL,  JOIN, LEFT JOIN, GROUP BY, SUM(), COUNT(), WHERE, ORDER BY, UPDATE.
