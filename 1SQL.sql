create database online_store;
use online_store;

create table customers(customer_id INT primary key,
name varchar(100) not null,
email varchar(150) UNIQUE NOT NULL,
city varchar(80),
DATE DATE
);

CREATE  TABLE PRODUCTS(
PRODUCT_ID INT PRIMARY KEY,
NAME VARCHAR(100) NOT NULL,
CATEGORY VARCHAR(80),
PRICE  DECIMAL(10,2) NOT NULL,
STOCK INT NOT NULL);


CREATE TABLE ORDERS(
ORDERS_ID INT PRIMARY KEY,
CUSTOMER_ID INT NOT NULL,
ORDER_DATE DATE NOT NULL,
STATUS VARCHAR (30) NOT NULL,
FOREIGN KEY(CUSTOMER_ID)REFERENCES CUSTOMERS(CUSTOMER_ID));




CREATE TABLE PAYMENTS (
PAYMENT_ID INT PRIMARY KEY,
ORDERS_ID INT NOT NULL,
AMOUNT INT NOT NULL,
PAYMENT_METHOD VARCHAR(100),
STATUS VARCHAR (30),
foreign key(ORDERS_ID) references ORDERS(ORDERS_ID));

CREATE TABLE order_items (     order_item_id INT PRIMARY KEY,     orders_id INT NOT NULL,     product_id INT NOT NULL,     quantity INT NOT NULL,     unit_price DECIMAL(10,2) NOT NULL,     FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


insert into customers values(
1,'Arun Kumar','arun@example.com', 'Coimbatore', '2026-01-10'),
(2, 'Priya S', 'priya@example.com', 'Chennai', '2026-01-15'),
(3, 'Rahul M', 'rahul@example.com', 'Bengaluru', '2026-02-02'),
(4, 'Divya R', 'divya@example.com', 'Madurai', '2026-02-18'),
(5, 'Karthik P', 'karthik@example.com', 'Salem', '2026-03-01');

insert into  products values(
101,'Wireless Mouse','Electronics',799.00,50),
(102,'Mechanical Mouse','Electronics',2499.00,25),
(103,'USB-C Cable','Accessories',399.00,100),
(104,'Laptop stand','Accessories',1299.00,30),
(105,'Headphones','Electronics',1999.00,40),
(106,'Webcam','Electronics',2999.00,15);

insert into orderS values
(1001,1,'2026-03-05','Delivered'),
(1002,2,'2026-03-07','Delivered'),
(1003,1,'2026-03-12','shipped'),
(1004,3,'2026-03-15','Delivered'),
(1005,4,'2026-03-18','cancelled');




Insert into order_items values(
1,1001,101,2,799.00),
(2,1001,103,1,399.00),
(3,1002,102,1,2499.00),
(4,1002,105,1,1999.00),
(5,1003,104,1,1299.00),
(6,1003,101,1,799.00),
(7,1004,106,1,2999.00),
(8,1004,103,2,399.00),
(9,1005,105,1,1999.00);


INSERT INTO payments VALUES
(501, 1001, 1997.00, 'UPI', 'Paid'),
(502, 1002, 4498.00, 'Card', 'Paid'),
(503, 1003, 2098.00, 'UPI', 'Paid'),
(504, 1004, 3797.00, 'Card', 'Paid'),
(505, 1005, 1999.00, 'UPI', 'Refunded');



select* from customers;

select name,price from products
where  price>1000;

select name ,price  from products
order by  price desc;

select * from  orders o
join customers c
on o.customer_id=c.customer_id;

select* from customers
where  city='coimbatore';

select count(*)  number_of_customers from  customers ;

select o.orders_id,c.name,
sum(oi.quantity*oi.unit_price ) as order_total from orders o
join customers c
on o.customer_id=c.customer_id
join order_items oi
on o.orders_id=oi.orders_id
group by o.orders_id,c.name
order by order_total desc;

10.)
select c.name,
sum(oi.quantity*oi.unit_price ) as total_spent from orders o
join customers c
on o.customer_id=c.customer_id
join order_items oi
on o.orders_id=oi.orders_id
where o.status<>'cancelled'
group by c.customer_id,c.name
order by total_spent desc;

select c.name,
payment as total_spent from orders o
join customers c
on o.customer_id=c.customer_id
join order_items oi
on o.orders_id=oi.orders_id
where o.status='cancelled'
group by c.customer_id,c.name;

select c.name,
sum(oi.quantity*oi.unit_price ) as total_spent from orders o
join customers c
on o.customer_id=c.customer_id
join order_items oi
on o.orders_id=oi.orders_id
group by c.customer_id,c.name
order by total_spent desc
limit 1;


SELECT
p.name,SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi 
ON p.product_id = oi.product_id
JOIN orders o 
ON oi.orders_id = o.orders_id
WHERE o.status <> 'Cancelled'
GROUP BY p.product_id, p.name
ORDER BY units_sold DESC;

SELECT name, stock
FROM products
WHERE stock < 30
ORDER BY stock ASC;

SELECT p.product_id, p.name
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS  NULL;

UPDATE orders
SET status = 'Delivered'
WHERE orders_id = 1003;
select*from orders;

UPDATE products
SET stock = stock - 2
WHERE product_id = 101;
select*from products;



SELECT
    DATE,('month', o.order_date) AS month,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status <> 'Cancelled'
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month;

#1
select * from customers
where city="coimbatore";
#2
SELECT *fROM products
where price>1500;
#3
select * from products 
order by price 
limit 1;

#4
select * from products 
order by price desc
limit 3;

#5
select count(customer_id)  as number_of_customers
from customers;
#6
select category,count(*)  products_count
from products
group by category;
#7
select c.name ,o.orders_id
from customers c
join orders o
on c.customer_id=o.customer_id;
#8
select o.  orders_id,sum(oi.quantity*oi.unit_price) total_value
from order_items oi
join orders o
on oi.orders_id=o.orders_id
group by orders_id;
#9
select o.  orders_id,sum(oi.quantity*oi.unit_price) total_value
from order_items oi
join orders o
on oi.orders_id=o.orders_id
group by orders_id
order by  total_value desc 
limit 1;

#12
select * from products 
where stock <20;
#13
select orders_id from customers c
join orders o
on c.customer_id=o.customer_id
where orderS_id IS NULL;
#14
select p.status from payments p
join orders o
on p.status=o.status
where  o.status="cancelled";
#10
SELECT 
    c.customer_id,
    c.name,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.orders_id = oi.orders_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 1;


SELECT 
    p.product_id,
    p.name,
    SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name
ORDER BY total_quantity DESC
LIMIT 1;
#11
SELECT 
    p.product_id,
    p.name,
    SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name
ORDER BY total_quantity DESC
LIMIT 1;
#15
SELECT SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.orders_id = oi.orders_id
WHERE o.status <> 'Cancelled';




