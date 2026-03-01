# 🍔 Food Delivery Management System  
*A Relational Database Design & Analytics Project using SQL*

---

## 👩‍💻 Author  
**Afrin Sulthana**

---

## 📌 Project Overview  

This project is a fully structured **Food Delivery Management System** designed using **MySQL**.

It simulates how real-world food delivery platforms manage:

- Customer registrations  
- Restaurant onboarding  
- Menu management  
- Order processing  
- Payment tracking  
- Delivery monitoring  
- Reviews & ratings  
- Revenue analytics  

The database is normalized and designed with proper relational integrity, constraints, and business logic.

---

## 🏗 Database Architecture  

The system consists of **13 relational tables**, including:

- Customers  
- Restaurants  
- Restaurant_Owners  
- Categories  
- Menu  
- Orders  
- Order_Details  
- Payments  
- Delivery  
- Delivery_Partners  
- Reviews  
- Coupons  

### 🔑 Key Relationships

- One customer → Many orders  
- One restaurant → Many menu items  
- One order → Multiple order details  
- One order → One payment  
- One order → One delivery record  

Foreign keys are implemented with appropriate `ON DELETE CASCADE` rules to maintain data consistency.

---

## 🧠 SQL Concepts Demonstrated  

This project showcases strong understanding of:

- Primary & Foreign Keys  
- Constraints (`NOT NULL`, `UNIQUE`, `CHECK`)  
- `AUTO_INCREMENT`  
- Default values  
- Data normalization  
- JOIN operations (`INNER JOIN`, `LEFT JOIN`)  
- Subqueries  
- `GROUP BY` & `HAVING`  
- Aggregate functions (`SUM`, `COUNT`, `AVG`)  
- Date functions  
- Business analytics queries  

---

## 📊 Analytical Queries Implemented  

The project includes real business insight queries such as:

- Customers registered in the last 30 days  
- Restaurants with rating above 4  
- Delivered vs Cancelled orders  
- Pending payments  
- Revenue in the last 30 days  
- Monthly revenue calculation  
- Top 5 most expensive menu items  
- Customer with highest total spending  
- Restaurant with most orders  
- Late deliveries (delivery time > 45 minutes)  
- Cancelled order percentage  
- Restaurants with no reviews  
- Total quantity sold per item  

These queries simulate reporting dashboards used in real food delivery companies.

---

## 💼 Business Value  

This database design helps:

- Track revenue performance  
- Analyze customer behavior  
- Measure delivery efficiency  
- Identify high-performing restaurants  
- Monitor cancellation trends  

---

## 🛠 Technologies Used  

- MySQL  
- SQL  

---

## ▶ How to Run the Project  

1. Open MySQL Workbench or MySQL CLI  
2. Execute the file:

   `food_delivery_project.sql`

3. The script will:
   - Create the database  
   - Create all tables  
   - Insert sample data  
   - Execute analytical queries  

## 📈 Future Enhancements  

- Add Stored Procedures  
- Add Triggers  
- Implement Indexing for performance optimization  
- Create Views for reporting  
- Connect with a front-end application  

---

## 🎯 Project Purpose  

This project was built to demonstrate:

- Strong SQL fundamentals  
- Real-world database modeling  
- Business-focused query writing  
- Interview-ready database project implementation  

---

✨ This project reflects practical implementation of SQL concepts in a real-world business scenario.
