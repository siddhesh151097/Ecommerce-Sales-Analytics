Drop database Olist_Dataset;
CREATE DATABASE Olist_Dataset;
USE Olist_Dataset;

CREATE TABLE Customer_Details (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state CHAR(2)
);

CREATE TABLE Orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(50),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
);

CREATE TABLE Order_Details (
    order_item_id INT PRIMARY KEY,
    order_id VARCHAR(50),
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price FLOAT,
    freight_value FLOAT
);

CREATE TABLE Payment_Details (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(50),
    payment_installments INT,
    payment_value FLOAT
);

CREATE TABLE Products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

CREATE TABLE Product_Reviews (
    review_id VARCHAR(50) PRIMARY KEY,
    order_id VARCHAR(50),
    review_score INT,
    review_comment_title VARCHAR(255),
    review_comment_message TEXT,
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME
);

CREATE TABLE Sellers (
    seller_id VARCHAR(50) PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city VARCHAR(100),
    seller_state CHAR(2)
);
drop table if exists Product_Categories;
CREATE TABLE Product_Categories (
    product_category_name VARCHAR(100),
    product_category_name_english VARCHAR(100)
);
ALTER TABLE Product_Categories
ADD PRIMARY KEY (product_category_name);

-- Customers Details
INSERT INTO Customer_Details (customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state)
VALUES
('C1', 'CU1', 10000, 'sao paulo', 'SP'),
('C2', 'CU2', 20000, 'rio de janeiro', 'RJ'),
('C3', 'CU3', 30000, 'belo horizonte', 'MG'),
('C4', 'CU4', 40000, 'curitiba', 'PR'),
('C5', 'CU5', 10001, 'sao paulo', 'SP'),
('C6', 'CU6', 50000, 'porto alegre', 'RS'),
('C7', 'CU7', 60000, 'salvador', 'BA'),
('C8', 'CU8', 70000, 'fortaleza', 'CE'),
('C9', 'CU9', 80000, 'brasilia', 'DF'),
('C10','CU10',90000,'recife', 'PE');

-- Sample orders
INSERT INTO Orders (order_id, customer_id, order_status, order_purchase_timestamp)
VALUES
('O1', 'C1', 'delivered', '2026-01-02 10:15:00'), -- Thursday (Weekday)
('O2', 'C2', 'delivered', '2026-01-03 14:30:00'), -- Friday (Weekday)
('O3', 'C3', 'delivered', '2026-01-04 12:00:00'), -- Saturday (Weekend)
('O4', 'C4', 'delivered', '2026-01-05 16:45:00'), -- Sunday (Weekend)
('O5', 'C5', 'delivered', '2026-01-06 09:20:00'); -- Monday (Weekday)

-- Order Details 
INSERT INTO Order_Details (order_item_id, order_id, product_id, seller_id, price, freight_value)
VALUES
(1, 'O1', 'P1', 'S1', 150.00, 10.00), -- pet_shop
(2, 'O2', 'P2', 'S2', 80.00, 5.00),   -- perfumaria
(3, 'O3', 'P3', 'S3', 200.00, 15.00), -- pet_shop
(4, 'O4', 'P4', 'S4', 75.00, 8.00);   -- beleza_saude


-- Payment info for each order
INSERT INTO Payment_Details (order_id, payment_sequential, payment_type, payment_installments, payment_value)
VALUES
('O1', 1, 'credit_card', 1, 150.00),
('O2', 1, 'boleto', 1, 80.00),
('O3', 1, 'credit_card', 1, 200.00),
('O4', 1, 'debit_card', 1, 75.00),
('O5', 1, 'credit_card', 1, 180.00);

-- Products Table
INSERT INTO Products (product_id, product_category_name, product_name_length, product_description_length, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm)
VALUES
('P1', 'pet_shop', 15, 50, 2, 500, 20, 15, 10),
('P2', 'perfumaria', 12, 40, 1, 200, 10, 5, 5),
('P3', 'pet_shop', 10, 30, 1, 300, 15, 10, 8),
('P4', 'beleza_saude', 20, 60, 3, 100, 8, 5, 5);

-- Product Reviews Table
DELETE FROM Product_Reviews WHERE review_id IN ('R1','R2','R3','R4','R5');

REPLACE INTO Product_Reviews 
(review_id, order_id, review_score, review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp)
VALUES
('R1', 'O1', 5, 'Excellent', 'Very satisfied with the product.', '2026-01-05 12:00:00', '2026-01-06 09:00:00'),
('R2', 'O2', 4, 'Good', 'Product arrived on time.', '2026-01-07 14:00:00', '2026-01-08 10:00:00'),
('R3', 'O3', 5, 'Great', 'Perfect product for my pet.', '2026-01-06 16:00:00', '2026-01-07 08:00:00'),
('R4', 'O4', 3, 'Average', 'Delivery was late.', '2026-01-08 11:00:00', NULL),
('R5', 'O5', 5, 'Fantastic', 'Highly recommend.', '2026-01-07 09:00:00', '2026-01-07 17:00:00');


-- Sellers Table
INSERT INTO Sellers (seller_id, seller_zip_code_prefix, seller_city, seller_state)
VALUES
('S1', 10000, 'Sao Paulo', 'SP'),
('S2', 20000, 'Rio de Janeiro', 'RJ'),
('S3', 30000, 'Belo Horizonte', 'MG'),
('S4', 40000, 'Curitiba', 'PR');

-- Product Categories Table
INSERT INTO Product_Categories (product_category_name, product_category_name_english)
VALUES
('pet_shop', 'pet_shop'),
('perfumaria', 'perfumery'),
('beleza_saude', 'health_beauty'),
('artes', 'arts'),
('informatica', 'computing');

-- KPI - 1 Weekday vs Weekend Payment Statistics
SELECT
    CASE
        WHEN DAYOFWEEK(o.order_purchase_timestamp) IN (1,7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    p.payment_type,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(p.payment_value), 2) AS total_payment,
    ROUND(AVG(p.payment_value), 2) AS avg_payment_value
FROM Orders o
JOIN Payment_Details p
    ON o.order_id = p.order_id
GROUP BY day_type, p.payment_type
ORDER BY day_type, total_payment DESC;

-- KPI 2: Count of Orders with Review Score 5 and Payment Type = Credit Card.
SELECT
    COUNT(DISTINCT o.order_id) AS five_star_credit_card_orders
FROM Orders o
JOIN Payment_Details p
    ON o.order_id = p.order_id
JOIN Product_Reviews r
    ON o.order_id = r.order_id
WHERE r.review_score = 5
  AND p.payment_type = 'credit_card';

-- KPI 3: Average Delivery Time for Pet Shop Products.
SELECT
    ROUND(
        AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)), 2
    ) AS avg_delivery_days_pet_shop
FROM Orders o
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE p.product_category_name = 'pet_shop'
  AND o.order_delivered_customer_date IS NOT NULL;


-- KPI -4

SELECT
    ROUND(AVG(od.price), 2) AS avg_order_price,
    ROUND(AVG(p.payment_value), 2) AS avg_payment_value
FROM Customer_Details c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Payment_Details p ON o.order_id = p.order_id
WHERE c.customer_city = 'Sao Paulo';

-- KPI 5: Relationship Between Shipping Days and Review Scores.
SELECT
    r.review_score,
    ROUND(AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)), 2) AS avg_shipping_days
FROM Orders o
JOIN Product_Reviews r ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY r.review_score
ORDER BY r.review_score DESC;

SELECT o.order_id, r.review_score, o.order_purchase_timestamp, o.order_delivered_customer_date
FROM Orders o
JOIN Product_Reviews r ON o.order_id = r.order_id;

UPDATE Orders
SET order_delivered_customer_date = '2026-01-05 10:15:00'
WHERE order_id = 'O1';

UPDATE Orders
SET order_delivered_customer_date = '2026-01-06 14:30:00'
WHERE order_id = 'O2';

UPDATE Orders
SET order_delivered_customer_date = '2026-01-06 12:00:00'
WHERE order_id = 'O3';

UPDATE Orders
SET order_delivered_customer_date = '2026-01-08 16:45:00'
WHERE order_id = 'O4';

UPDATE Orders
SET order_delivered_customer_date = '2026-01-07 09:20:00'
WHERE order_id = 'O5';

SELECT * FROM Orders;
SELECT * FROM Product_Reviews;













