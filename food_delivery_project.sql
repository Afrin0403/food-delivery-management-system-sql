-- 1. DATABASE CREATION
DROP DATABASE IF EXISTS projectdemo;
create database projectdemo;
use projectdemo;

-- 2.TABLE CREATION

-- Customers Table

CREATE TABLE Customers (customer_id INT AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
phone VARCHAR(15) UNIQUE NOT NULL,
email VARCHAR(100) UNIQUE,
address TEXT NOT NULL,
city VARCHAR(50) NOT NULL,
pincode VARCHAR(10) NOT NULL,
registration_date DATE DEFAULT (CURRENT_DATE));

-- Restaurants table

CREATE TABLE Restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    rating DECIMAL(2,1) CHECK (rating BETWEEN 0 AND 5),
    opening_time TIME NOT NULL,
    closing_time TIME NOT NULL);

-- Menu Table

CREATE TABLE Menu (item_id INT AUTO_INCREMENT PRIMARY KEY,
restaurant_id INT NOT NULL,
item_name VARCHAR(100) NOT NULL,
category VARCHAR(50) NOT NULL,
price DECIMAL(8,2) NOT NULL CHECK (price > 0),
availability_status VARCHAR(20) DEFAULT 'Available',
FOREIGN KEY (restaurant_id) 
REFERENCES Restaurants(restaurant_id)
ON DELETE CASCADE);

-- Orders Table

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) DEFAULT 0,
    order_status VARCHAR(30) DEFAULT 'Pending',
    
    FOREIGN KEY (customer_id) 
    REFERENCES Customers(customer_id)
    ON DELETE CASCADE,
    
    FOREIGN KEY (restaurant_id) 
    REFERENCES Restaurants(restaurant_id)
    ON DELETE CASCADE
);

-- Order_Details Table

CREATE TABLE Order_Details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price DECIMAL(8,2) NOT NULL,
    
    FOREIGN KEY (order_id) 
    REFERENCES Orders(order_id)
    ON DELETE CASCADE,
    
    FOREIGN KEY (item_id) 
    REFERENCES Menu(item_id)
    ON DELETE CASCADE
);

-- payments Table

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT UNIQUE NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    payment_status VARCHAR(20) DEFAULT 'Pending',
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (order_id) 
    REFERENCES Orders(order_id)
    ON DELETE CASCADE
);

-- Delivery Table

CREATE TABLE Delivery (
    delivery_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT UNIQUE NOT NULL,
    delivery_person_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    delivery_status VARCHAR(30) DEFAULT 'Preparing',
    delivery_time DATETIME,
    
    FOREIGN KEY (order_id) 
    REFERENCES Orders(order_id)
    ON DELETE CASCADE
);

-- Delivery_partners Table

CREATE TABLE Delivery_Partners (
    partner_id INT AUTO_INCREMENT PRIMARY KEY,
    partner_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    vehicle_type VARCHAR(50),
    joining_date DATE,
    status VARCHAR(30) DEFAULT 'Active'
);

-- Categories table

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

-- Reviews table

CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date timestamp DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
    ON DELETE CASCADE,
    FOREIGN KEY (restaurant_id)
    REFERENCES Restaurants(restaurant_id)
    ON DELETE CASCADE
);

-- coupons table 

CREATE TABLE Coupons (
    coupon_id INT AUTO_INCREMENT PRIMARY KEY,
    coupon_code VARCHAR(20) UNIQUE NOT NULL,
    discount_percent INT CHECK (discount_percent BETWEEN 1 AND 100),
    expiry_date DATE,
    status VARCHAR(20) DEFAULT 'Active'
);
-- Restaurant_owners table

CREATE TABLE Restaurant_Owners (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    restaurant_id INT UNIQUE,
    
    FOREIGN KEY (restaurant_id)
    REFERENCES Restaurants(restaurant_id)
    ON DELETE CASCADE
);

-- INSERT DATA

INSERT INTO Customers (customer_name, phone, email, address, city, pincode) VALUES
('Aisha Rahman','9000000001','aisha@gmail.com','Anna Nagar','Chennai','600040'),
('Rahul Kumar','9000000002','rahul@gmail.com','Velachery','Chennai','600042'),
('Priya Sharma','9000000003','priya@gmail.com','T Nagar','Chennai','600017'),
('Arjun Mehta','9000000004','arjun@gmail.com','Tambaram','Chennai','600045'),
('Sneha Iyer','9000000005','sneha@gmail.com','Adyar','Chennai','600020'),
('Kavin Raj','9000000006','kavin@gmail.com','Porur','Chennai','600116'),
('Meera Nair','9000000007','meera@gmail.com','OMR','Chennai','600096'),
('Vikram Das','9000000008','vikram@gmail.com','Guindy','Chennai','600032'),
('Ananya Rao','9000000009','ananya@gmail.com','Kodambakkam','Chennai','600024'),
('Rohit Sharma','9000000010','rohit@gmail.com','Perungudi','Chennai','600096');


INSERT INTO Restaurants 
(restaurant_name, location, phone, rating, opening_time, closing_time) VALUES
('Spice Hub','Anna Nagar','9111111111',4.5,'09:00:00','23:00:00'),
('Food Palace','Velachery','9222222222',4.2,'10:00:00','22:30:00'),
('Urban Tandoor','T Nagar','9333333333',4.6,'09:00:00','23:00:00'),
('Biryani House','Porur','9444444444',4.3,'10:00:00','22:30:00'),
('Cafe Delight','Adyar','9555555555',4.1,'08:00:00','22:00:00');


INSERT INTO Categories (category_name) VALUES
('Veg'),
('Non-Veg'),
('Beverage'),
('Dessert');


INSERT INTO Menu (restaurant_id, item_name, category, price, availability_status) VALUES
(1,'Chicken Biryani','Non-Veg',250,'Available'),
(1,'Veg Fried Rice','Veg',180,'Available'),
(1,'Ice Cream','Dessert',110,'Available'),
(2,'Paneer Butter Masala','Veg',220,'Available'),
(2,'Cold Coffee','Beverage',120,'Available'),
(3,'Mutton Biryani','Non-Veg',320,'Available'),
(3,'Chicken 65','Non-Veg',180,'Available'),
(4,'Butter Naan','Veg',40,'Available'),
(4,'Gulab Jamun','Dessert',90,'Available'),
(5,'Pizza','Veg',250,'Available'),
(5,'Pasta','Veg',220,'Available'),
(2,'Chicken Shawarma','Non-Veg',150,'Available'),
(2,'Lassi','Beverage',80,'Available'),
(3,'Grill Chicken','Non-Veg',350,'Available'),
(4,'Veg Meals','Veg',130,'Available');


INSERT INTO Orders 
(customer_id, restaurant_id, order_date, total_amount, order_status) VALUES
(1,1,'2026-01-10 13:00:00',430,'Delivered'),
(2,2,'2026-01-15 19:30:00',340,'Delivered'),
(3,3,'2026-01-20 14:00:00',320,'Delivered'),
(4,4,'2026-01-25 18:30:00',260,'Delivered'),
(5,5,'2026-02-01 20:00:00',250,'Pending'),
(6,2,'2026-02-05 13:15:00',150,'Delivered'),
(7,1,'2026-02-08 19:45:00',110,'Cancelled'),
(8,3,'2026-02-10 21:00:00',350,'Delivered'),
(9,4,'2026-02-12 12:30:00',130,'Pending'),
(10,5,'2026-02-15 17:00:00',220,'Delivered');

INSERT INTO Order_Details (order_id, item_id, quantity, price) VALUES
(1,1,1,250),(1,2,1,180),
(2,4,1,220),(2,5,1,120),
(3,6,1,320),
(4,8,2,80),(4,9,1,90),
(5,10,1,250),
(6,12,1,150),
(7,3,1,110),
(8,14,1,350),
(9,15,1,130),
(10,11,1,220),
(3,7,1,180),
(2,13,1,80),
(5,11,1,220),
(6,5,1,120),
(8,1,1,250),
(9,8,1,40),
(10,2,1,180);


INSERT INTO Payments (order_id, payment_method, payment_status) VALUES
(1,'UPI','Paid'),
(2,'Card','Paid'),
(3,'UPI','Paid'),
(4,'Card','Paid'),
(5,'Cash','Pending'),
(6,'UPI','Paid'),
(7,'Card','Failed'),
(8,'UPI','Paid'),
(9,'Cash','Pending'),
(10,'Card','Paid');


INSERT INTO Delivery_Partners (partner_name, phone, vehicle_type, joining_date) VALUES
('Suresh','9666000001','Bike','2025-01-10'),
('Manoj','9666000002','Scooter','2025-03-12'),
('Deepak','9666000003','Bike','2025-05-01'),
('Ramesh','9666000004','Bike','2025-06-15'),
('Ajay','9666000005','Scooter','2025-08-20');



INSERT INTO Delivery (order_id, delivery_person_name, contact_number, delivery_status, delivery_time) VALUES
(1,'Suresh','9666000001','Delivered','2026-01-10 13:45:00'),
(2,'Manoj','9666000002','Delivered','2026-01-15 20:00:00'),
(3,'Deepak','9666000003','Delivered','2026-01-20 14:40:00'),
(4,'Ramesh','9666000004','Delivered','2026-01-25 19:10:00'),
(5,'Ajay','9666000005','Preparing',NULL),
(6,'Suresh','9666000001','Delivered','2026-02-05 13:50:00'),
(7,'Manoj','9666000002','Cancelled',NULL),
(8,'Deepak','9666000003','Delivered','2026-02-10 21:40:00'),
(9,'Ramesh','9666000004','Out for Delivery',NULL),
(10,'Ajay','9666000005','Delivered','2026-02-15 17:40:00');



INSERT INTO Reviews (customer_id, restaurant_id, rating, review_text) VALUES
(1,1,5,'Excellent taste'),
(2,2,4,'Good service'),
(3,3,5,'Loved the biryani'),
(4,4,3,'Average experience'),
(5,5,4,'Nice ambience'),
(6,2,5,'Fast delivery'),
(7,1,2,'Food was cold'),
(8,3,5,'Very tasty'),
(9,4,4,'Good quality'),
(10,5,5,'Highly recommended');


INSERT INTO Coupons (coupon_code, discount_percent, expiry_date) VALUES
('WELCOME10',10,'2026-12-31'),
('NEWUSER20',20,'2026-06-30'),
('FESTIVE15',15,'2026-10-31'),
('SAVE5',5,'2026-08-31'),
('BIGSALE25',25,'2026-09-30');


INSERT INTO Restaurant_Owners (owner_name, phone, email, restaurant_id) VALUES
('Ravi Kumar','9888000001','ravi@spicehub.com',1),
('Sanjay','9888000002','sanjay@foodpalace.com',2),
('Imran','9888000003','imran@urbantandoor.com',3),
('Mahesh','9888000004','mahesh@biryanihouse.com',4),
('Karthik','9888000005','karthik@cafedelight.com',5);


-- ANALYTICAL QUERIES

select * from customers;

UPDATE Customers
SET registration_date = DATE_SUB(CURDATE(),
INTERVAL FLOOR(RAND(customer_id) * 180) DAY);

-- customers who registered within last 30 days
SELECT * 
FROM Customers
WHERE registration_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- restaurant rating above 4
select * from Restaurants
where rating > 4;

-- show all veg restaurants
select item_name,price from Menu where category ='Veg'

-- show delivered orders
select * from orders where order_status = 'Delivered'

-- pending payments
select * from Payments where payment_status ='Pending';

-- total orders in last 7 days
select count(*) as total_orders from Orders where order_date >= DATE_SUB(CURDATE(),INTERVAL 7 DAY);

-- revenue in last 30 days
SELECT SUM(total_amount) AS revenue_last_30_days
FROM Orders
WHERE order_status = 'Delivered'
AND order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- top 5 most expensive menu items
SELECT item_name, price
FROM Menu
ORDER BY price DESC
LIMIT 5;

select c.customer_name ,sum(o.total_amount) as total_spent
from Orders as o
join Customers c on o.customer_id = c.customer_id
group by c.customer_name
order by total_spent desc
limit 1;

-- restaurant with most orders
select r.restaurant_name,count(order_id) as total_orders
from Orders o
join Restaurants r on o.restaurant_id = r.restaurant_id
group by r.restaurant_name
order by total_orders desc
limit 1;

-- average of order value	
SELECT AVG(total_amount) AS avg_order_value
FROM Orders;			

-- order between two dates
SELECT *
FROM Orders
WHERE order_date BETWEEN '2025-12-01' AND '2026-01-31';

-- customer who gave 5 star reviews
SELECT DISTINCT c.customer_name
FROM Reviews r
JOIN Customers c ON r.customer_id = c.customer_id
WHERE r.rating = 5;
									
-- restaurant with no reviews
select restaurant_name from Restaurants 
where restaurant_id not in (select distinct restaurant_id from Reviews);

-- total quantity sold  per item 
SELECT m.item_name, SUM(od.quantity) AS total_sold
FROM Order_Details od
JOIN Menu m ON od.item_id = m.item_id
GROUP BY m.item_name
ORDER BY total_sold DESC;

-- late deliveries (> 45 minutes)

SELECT d.order_id,
TIMESTAMPDIFF(MINUTE, o.order_date, d.delivery_time) AS delivery_minutes
FROM Delivery d
JOIN Orders o ON d.order_id = o.order_id
WHERE TIMESTAMPDIFF(MINUTE, o.order_date, d.delivery_time) > 45;

-- monthly revenue
SELECT MONTH(order_date) AS month,
       SUM(total_amount) AS monthly_revenue
FROM Orders
WHERE order_status = 'Delivered'
GROUP BY MONTH(order_date)
ORDER BY month;

-- cancelled order %
SELECT 
(SELECT COUNT(*) FROM Orders WHERE order_status = 'Cancelled') * 100.0 /
COUNT(*) AS cancel_percentage
FROM Orders;
