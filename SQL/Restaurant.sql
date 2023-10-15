--create table & insert table
CREATE TABLE menu(menu_no INT,
  name NVARCHAR(20),
  price INT);

INSERT INTO menu VALUES
(1, 'Chicken Steak', 79),
(2, 'Grilled Dory Steak', 79),
(3, 'Pork Steak', 89),
(4, 'Porkchop Steak', 99),
(5, 'Sirloin Steak', 129),
(6, 'Ripeye Steak', 179),
(7, 'Salmon Steak', 199),
(8, 'Spaghetti Carbonara Tuna', 59),
(9, 'Spaghetti Carbonara Salmon', 89),
(10, 'Caesar Salad', 69);

CREATE TABLE customers(customer_id NVARCHAR(5),
  customer_firstname NVARCHAR(20),
  customer_lastname NVARCHAR(20),
  phone_number TEXT,
  membership BOOLEAN);

INSERT INTO customers VALUES
('RN001', 'Reasun', 'Nutthaphol', '0901234567', 1),
('BA001', 'Bankrupzy', 'Adisak', '0912345678', 1),
('RW001', 'Riceby', 'Warot', '0923456789', 1),
('BP001', 'Balloon', 'Pachara', '0934567890', 0),
('JN001', 'Jamie', 'Nathon', '0945678901', 0);

CREATE TABLE orders(order_no INT,
  menu_no INT,
  customer_id NVARCHAR(5),
  employee_id NVARCHAR(10),
  tables INT);

INSERT INTO orders VALUES
(1, 1, 'RN001', 'A.Ferguson', 2),
(1, 6, 'RN001', 'A.Ferguson', 2),
(1, 9, 'RN001', 'A.Ferguson', 2),
(2, 8, 'BA001', 'A.Wenger', 3),
(2, 10, 'BA001', 'A.Wenger', 3),
(3, 2, 'RW001', 'M.Arteta', 4),
(3, 4, 'RW001', 'M.Arteta', 4),
(3, 1, 'RW001', 'M.Arteta', 4),
(3, 10, 'RW001', 'M.Arteta', 4),
(4, 3, 'BP001', 'R.Benitez', 5),
(4, 5, 'BP001', 'R.Benitez', 5),
(5, 7, 'JN001', 'J.Klopp', 1),
(5, 2, 'JN001', 'J.Klopp', 1),
(5, 10, 'JN001', 'J.Klopp', 1);

CREATE TABLE employees(employee_id NVARCHAR(20),
  employee_firstname NVARCHAR(20),
  employee_lastname NVARCHAR(20));

INSERT INTO employees VALUES
('A.Ferguson', 'Alex', 'Ferguson'),
('A.Wenger', 'Arsène', 'Wenger'),
('M.Arteta', 'Mikel', 'Arteta'),
('R.Benitez', 'Rafael', 'Benitez'),
('J.Klopp', 'Jürgen', 'Klopp');

CREATE TABLE reservation(tables INT,
  status BOOLEAN,
  customer_id NVARCHAR(5));

INSERT INTO reservation VALUES
(1, 0, NULL),
(2, 1, 'RN001'),
(3, 1, 'BA001'),
(4, 1, 'RW001'),
(5, 0, NULL);

--display all tables
SELECT * FROM menu;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM employees;
SELECT * FROM reservation;

--join table
SELECT 
  menu.menu_no,
  menu.name,
  orders.customer_id
FROM menu
JOIN orders ON menu.menu_no = orders.menu_no
ORDER BY customer_id;

--aggregate function
--sorted by top spenders from receipt
SELECT
	orders.customer_id,
	COUNT(orders.customer_id) AS total_order,
	ROUND(AVG(menu.price), 2) AS avg_price,
	SUM(menu.price) AS total_price,
	MIN(menu.price) AS min_price,
	MAX(menu.price) AS max_price
FROM menu
JOIN orders on menu.menu_no = orders.menu_no
GROUP BY order_no
ORDER BY total_price DESC;

--JOIN TABLE
--assumed that this query is customers' receipts
SELECT
	orders.order_no,
	orders.tables,
	customers.customer_id,
	customers.customer_lastname,
	menu.name,
	menu.price,
	employees.employee_id
FROM orders
JOIN menu
	ON orders.menu_no = menu.menu_no
JOIN customers
	ON orders.customer_id = customers.customer_id
JOIN reservation
	ON orders.tables = reservation.tables
JOIN employees
	ON orders.employee_id = employees.employee_id
ORDER BY orders.order_no;

--subquery
--1. normal subquery (discount coupon lucky draw from membership)
SELECT * FROM
	(
	SELECT
	customer_firstname,
	customer_lastname,
	membership
	FROM
		(
		SELECT * FROM customers
		)
	)
WHERE membership = 1;
--2. common table expression (discount coupon lucky draw for normal customer from picking randomly, 1 order = 1 attempt)
WITH lucky_draw AS(
SELECT * FROM customers
	WHERE customer_firstname LIKE 'R%'
), randomreciept AS(
SELECT * FROM orders
	WHERE employee_id = 'A.Ferguson'
)

SELECT
	lucky_draw.phone_number,
	lucky_draw.customer_firstname,
	lucky_draw.customer_lastname,
	randomreciept.menu_no,
	randomreciept.customer_id
FROM lucky_draw
JOIN randomreciept
ON lucky_draw.customer_id = randomreciept.customer_id;
