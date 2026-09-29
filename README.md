# 🛒 ShopSphere — E-Commerce Database

> **From SQL fundamentals to real-world e-commerce data analysis.**

ShopSphere is a **15-day MySQL project** built to learn and apply SQL concepts through a practical e-commerce database.

The project progressively develops a relational database containing **customers, categories, products, orders, and order items**, while using SQL to retrieve, modify, connect, analyze, and manage the data.

---

## 🌟 What is ShopSphere?

ShopSphere simulates the database layer of an e-commerce system.

Instead of creating separate SQL exercises, the project builds **one database step-by-step**.

```text
Database
   ↓
Tables & Constraints
   ↓
E-Commerce Data
   ↓
SQL Queries
   ↓
Relationships
   ↓
Data Analysis
   ↓
Business Insights

The project was developed over 15 days, with each day focusing on a specific MySQL concept.

🎯 Project Objectives
Learn MySQL through practical implementation
Understand relational database design
Create and manage related tables
Practice SQL queries
Understand primary and foreign keys
Work with JOINs and subqueries
Perform data analysis using SQL
Understand views and indexes
Practice database transactions
Answer real-world e-commerce questions
Maintain a structured GitHub project
🛠️ Tech Stack
Database
🐬 MySQL
🖥️ MySQL Workbench
📊 SQL
Development & Version Control
🔧 Git
🐙 GitHub
🗄️ Database Structure

ShopSphere contains the following main entities:

┌──────────────┐
│  Customers   │
└──────┬───────┘
       │
       │ places
       ▼
┌──────────────┐
│    Orders    │
└──────┬───────┘
       │
       │ contains
       ▼
┌────────────────┐
│  Order Items   │
└───────┬────────┘
        │
        │ references
        ▼
┌──────────────┐
│   Products   │
└──────┬───────┘
       │
       │ belongs to
       ▼
┌──────────────┐
│  Categories  │
└──────────────┘
Main Tables
Table	Purpose
👤 customers	Stores customer information
📦 products	Stores product details
🗂️ categories	Organizes products into categories
🛍️ orders	Stores customer orders
📋 order_items	Stores products included in orders
📅 15-Day Learning Journey
Day	Topic	Implementation
01	🗄️ Database Creation	Create ShopSphere database
02	🏗️ Tables & Constraints	Create tables and apply constraints
03	➕ INSERT	Add e-commerce data
04	🔍 SELECT	Retrieve database information
05	🎯 WHERE	Filter records
06	↕️ ORDER BY & LIMIT	Sort and limit results
07	✏️ UPDATE & DELETE	Modify and remove records
08	📊 Aggregate Functions	COUNT, SUM, AVG, MIN, MAX
09	📈 GROUP BY & HAVING	Grouped data analysis
10	🔗 JOINs	Combine related tables
11	🧩 Subqueries	Perform nested queries
12	🧠 CASE & SQL Functions	Transform and classify data
13	⚡ Views & Indexes	Reusable queries and optimization
14	🔄 Transactions	COMMIT, ROLLBACK, SAVEPOINT
15	🚀 Final Analysis	E-commerce business analysis
🧠 SQL Concepts Practiced
Database & Table Design
CREATE DATABASE
CREATE TABLE
Primary Keys
Foreign Keys
NOT NULL
UNIQUE
DEFAULT
CHECK
Data Manipulation
INSERT
UPDATE
DELETE
Data Retrieval
SELECT
WHERE
ORDER BY
LIMIT
AND
OR
Data Analysis
COUNT()
SUM()
AVG()
MIN()
MAX()
GROUP BY
HAVING
Advanced SQL
INNER JOIN
LEFT JOIN
Subqueries
CASE
COALESCE()
ROUND()
String Functions
Date Functions
Numeric Functions
Database Management
Views
Indexes
EXPLAIN
Transactions
COMMIT
ROLLBACK
SAVEPOINT
📊 What Can ShopSphere Analyze?

The database can be used to answer practical e-commerce questions.

👤 Customer Analysis
Which customers have placed orders?
How many orders has each customer placed?
Which customers have the highest spending?
📦 Product Analysis
Which products have the highest prices?
Which products are above the average price?
Which products have low stock?
Which products perform best?
🗂️ Category Analysis
How many products belong to each category?
What is the average price by category?
Which categories contain the most products?
🛍️ Order Analysis
How many orders exist?
Which customers placed orders?
Which products are included in orders?
How many products were purchased?
💰 Sales Analysis
What is the total sales quantity?
What is the generated revenue?
Which products generate the most revenue?
Which categories perform best?
📁 Project Structure
ShopSphere-MySQL/
│
├── README.md
│
├── Day-01-Database/
│   └── day01.sql
│
├── Day-02-Tables/
│   └── day02.sql
│
├── Day-03-Insert/
│   └── day03.sql
│
├── Day-04-Select/
│   └── day04.sql
│
├── Day-05-Where/
│   └── day05.sql
│
├── Day-06-OrderBy-Limit/
│   └── day06.sql
│
├── Day-07-Update-Delete/
│   └── day07.sql
│
├── Day-08-Aggregate-Functions/
│   └── day08.sql
│
├── Day-09-GroupBy-Having/
│   └── day09.sql
│
├── Day-10-Joins/
│   └── day10.sql
│
├── Day-11-Subqueries/
│   └── day11.sql
│
├── Day-12-Case-SQL-Functions/
│   └── day12.sql
│
├── Day-13-Views-Indexes/
│   └── day13.sql
│
├── Day-14-Transactions/
│   └── day14.sql
│
└── Day-15-Final-Analysis/
    └── day15.sql
🚀 How to Run
1️⃣ Clone the Repository
git clone https://github.com/prerna2006raj-ctrl/ShopSphere-MySQL.git
2️⃣ Open MySQL Workbench

Connect to your local MySQL server.

3️⃣ Run the SQL Files

Run the files in sequence:

Day-01
   ↓
Day-02
   ↓
Day-03
   ↓
...
   ↓
Day-15

Running them in order ensures that the database structure and data are built progressively.

🔄 Development Workflow

Each day followed a simple development process:

Learn Concept
     ↓
Practice in MySQL Workbench
     ↓
Write SQL Queries
     ↓
Test & Debug
     ↓
Save SQL File
     ↓
Commit to Git
     ↓
Push to GitHub
Example Git Workflow
git status

git add .

git commit -m "Day 10: Added JOIN queries"

git push origin main
📈 Learning Progression

ShopSphere demonstrates a gradual progression from basic SQL to practical data analysis:

🗄️ Database Design
        ↓
🏗️ Tables & Constraints
        ↓
➕ Data Insertion
        ↓
🔍 Basic Queries
        ↓
🎯 Filtering & Sorting
        ↓
✏️ Data Modification
        ↓
📊 Aggregation
        ↓
📈 Grouping
        ↓
🔗 JOINs
        ↓
🧩 Subqueries
        ↓
🧠 SQL Functions
        ↓
⚡ Views & Indexes
        ↓
🔄 Transactions
        ↓
🚀 Final Analysis
💼 Skills Demonstrated

Through this project, I practiced:

🗄️ Database Skills
Relational database design
Table creation
Database constraints
Primary and foreign keys
Table relationships
💻 SQL Skills
Data manipulation
Data retrieval
Filtering
Sorting
Aggregation
Grouping
JOINs
Subqueries
Conditional logic
SQL functions
📊 Data Analysis
Customer analysis
Product analysis
Category analysis
Order analysis
Inventory analysis
Sales and revenue analysis
🔧 Development Skills
MySQL Workbench
Git
GitHub
Structured project organization
Incremental development
SQL debugging and testing
📌 Project Highlights
🗓️ 15-day structured MySQL project
🗄️ Relational e-commerce database
🔗 Multiple related tables
🧠 Beginner to advanced SQL progression
📊 Business-oriented data analysis
⚡ Views, indexes and query analysis
🔄 Transaction management
🐙 GitHub version-controlled development
📚 Documented learning journey
📊 Project Status
Day 01  ✅ Database Creation
Day 02  ✅ Tables & Constraints
Day 03  ✅ Data Insertion
Day 04  ✅ SELECT
Day 05  ✅ WHERE
Day 06  ✅ ORDER BY & LIMIT
Day 07  ✅ UPDATE & DELETE
Day 08  ✅ Aggregate Functions
Day 09  ✅ GROUP BY & HAVING
Day 10  ✅ JOINs
Day 11  ✅ Subqueries
Day 12  ✅ CASE & SQL Functions
Day 13  ✅ Views & Indexes
Day 14  ✅ Transactions
Day 15  ✅ Final Analysis
🎉 Status: Completed
🔮 Future Improvements

Possible future extensions include:

Add a payment module
Expand order management
Build more analytical views
Connect the database with a backend API
Create an e-commerce dashboard
Add a larger dataset
Connect the database to visualization tools
👩‍💻 Author
Prerna Raj

MySQL / SQL Learning & Portfolio Project — 2026