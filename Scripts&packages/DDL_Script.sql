/*
================== DDL Script =================================
Script Purpose:
	This script is used to Define tables which is similar to the source.
WARNING:
	This script DROPS the table if Exists. So, if Their is data inside, it will be removed.
*/


USE RetailDB;

GO
IF OBJECT_ID ('Bronze.orders','U') IS NOT NULL
	DROP TABLE Bronze.orders;
CREATE TABLE Bronze.orders (order_id INT,customer_id INT,	store_id INT, order_date DATE,	promotion_id INT);

GO 
IF OBJECT_ID ('Bronze.order_items','U') IS NOT NULL
	DROP TABLE Bronze.order_items;
CREATE TABLE Bronze.order_items (order_item_id INT,order_id INT,product_id	INT, qty INT,price NUMERIC(2));

GO 
IF OBJECT_ID ('Bronze.employees','U') IS NOT NULL
	DROP TABLE Bronze.employees;
CREATE TABLE Bronze.employees (employee_id INT,store_id INT,salary INT);

GO
IF OBJECT_ID ('Bronze.customers','U') IS NOT NULL
	DROP TABLE Bronze.customers;
CREATE TABLE Bronze.customers (customer_id INT,	city VARCHAR(20),signup_date DATE);

GO
IF OBJECT_ID ('Bronze.categories','U') IS NOT NULL
	DROP TABLE Bronze.categories;
CREATE TABLE Bronze.categories (category_id INT,category_name VARCHAR(20));

GO
IF OBJECT_ID ('Bronze.payments','U') IS NOT NULL
	DROP TABLE Bronze.payments;
CREATE TABLE Bronze.payments (payment_id INT,order_id INT,amount INT);

GO 
IF OBJECT_ID ('Bronze.products','U') IS NOT NULL
	DROP TABLE Bronze.products;
CREATE TABLE Bronze.products (product_id INT,category_id INT,supplier_id INT,price INT);

GO
IF OBJECT_ID ('Bronze.promotions','U') IS NOT NULL
	DROP TABLE Bronze.promotions;
CREATE TABLE Bronze.promotions (promotion_id INT,discount INT);

GO
IF OBJECT_ID ('Bronze.returns','U') IS NOT NULL
	DROP TABLE Bronze.returns;
CREATE TABLE Bronze.returns(return_id INT,order_item_id INT,refund INT);

GO
IF OBJECT_ID ('Bronze.shipments','U') IS NOT NULL
	DROP TABLE Bronze.shipments;
CREATE TABLE Bronze.shipments (shipment_id INT,order_id INT,status VARCHAR(20));

GO
IF OBJECT_ID ('Bronze.store','U') IS NOT NULL
	DROP TABLE Bronze.store;
CREATE TABLE Bronze.store (store_id	INT,city VARCHAR(20));

GO
IF OBJECT_ID ('Bronze.suppliers','U') IS NOT NULL
	DROP TABLE Bronze.suppliers;
CREATE TABLE Bronze.suppliers (supplier_id INT	,country VARCHAR(20));

GO
