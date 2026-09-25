# 🏦 Banking Database Management System

A relational **Banking Database Management System** developed using **MySQL** to efficiently store, manage, and retrieve banking-related information.

The database is designed around core banking entities such as **Customers, Branches, Accounts, Loans, and Transactions**, with relationships established using primary and foreign keys. The project demonstrates practical implementation of relational database concepts and SQL queries.

---

## 📌 Project Overview

The Banking Database Management System provides a structured database for managing essential banking operations.

The system maintains information about:

- 👤 Customers
- 🏢 Bank Branches
- 💳 Customer Accounts
- 💰 Loans
- 💸 Financial Transactions

The database follows a relational structure where different entities are connected through appropriate keys and relationships.

---

## 🗂️ Database Structure

The database consists of the following main tables:

### 1. Customers

Stores personal information of bank customers.

| Column | Data Type | Description |
|---|---|---|
| CustomerID | INT | Primary key for each customer |
| FirstName | VARCHAR(50) | Customer's first name |
| LastName | VARCHAR(50) | Customer's last name |
| Email | VARCHAR(100) | Customer's email address |
| Phone | VARCHAR(20) | Customer's phone number |
| DateOfBirth | DATE | Customer's date of birth |

---

### 2. Branches

Stores information about bank branches.

| Column | Data Type | Description |
|---|---|---|
| BranchID | INT | Primary key for each branch |
| BranchName | VARCHAR(100) | Name of the branch |
| BranchAddress | VARCHAR(200) | Branch address |
| BranchPhone | VARCHAR(15) | Branch contact number |

---

### 3. Accounts

Stores customer bank account information.

| Column | Data Type | Description |
|---|---|---|
| AccountID | INT | Primary key for each account |
| AccountType | VARCHAR | Type of bank account |
| Balance | DECIMAL(10,2) | Current account balance |
| CustomerID | INT | References the customer |
| BranchID | INT | References the bank branch |

---

### 4. Loans

Stores information about customer loans.

| Column | Data Type | Description |
|---|---|---|
| LoanID | INT | Primary key for each loan |
| LoanAmount | DECIMAL(10,2) | Amount of the loan |
| InterestRate | DECIMAL(5,2) | Applicable interest rate |
| StartDate | DATE | Loan starting date |
| EndDate | DATE | Loan ending date |
| CustomerID | INT | References the customer |

---

### 5. Transactions

Stores financial transactions associated with customer accounts.

| Column | Data Type | Description |
|---|---|---|
| TransactionID | INT | Primary key for each transaction |
| TransactionDate | DATE | Date of transaction |
| Amount | DECIMAL(10,2) | Transaction amount |
| TransactionType | VARCHAR | Type of transaction |
| AccountID | INT | References the account |

---

## 🔗 Entity Relationships

The database follows a relational structure with the following relationships:

```text
                    ┌───────────────┐
                    │   Customers   │
                    └───────┬───────┘
                            │
                ┌───────────┼───────────┐
                │           │           │
                ▼           ▼           ▼
          ┌──────────┐ ┌──────────┐ ┌────
          │ Accounts │ │  Loans   │ │         
          └────┬─────┘ └──────────┘ │         
               │                    │         
               ▼                    │         
        ┌──────────────┐            │         
        │ Transactions │            │         
        └──────────────┘            │         
                                    │
                              ┌─────▼─────┐
                              │  Branches │
                              └───────────┘
Main Relationships
A Customer can have one or more Accounts.
A Customer can have one or more Loans.
A Branch can manage multiple Accounts.
An Account can have multiple Transactions.
Foreign keys are used to maintain relationships between related tables.
🛠️ Technologies Used
MySQL
MySQL Workbench
SQL
EER Diagram / Database Modeling
💡 SQL Concepts Demonstrated

This project can be used to demonstrate practical knowledge of:

Database creation
Table creation
Primary Keys
Foreign Keys
Constraints
INSERT
UPDATE
DELETE
SELECT
WHERE
ORDER BY
GROUP BY
HAVING
Aggregate Functions
Joins
Subqueries
Data Filtering
Sorting and Grouping
Relational Database Design
📊 Database Design

The database was designed using MySQL Workbench EER Diagram to visually represent the tables and their relationships.

The design separates banking information into multiple related tables instead of storing all information in a single table. This improves data organization, reduces redundancy, and makes the database easier to maintain and query.

🎯 Project Objectives

The main objectives of this project are:

To design a structured relational banking database.
To understand relationships between different banking entities.
To implement primary and foreign key relationships.
To perform CRUD operations using SQL.
To retrieve meaningful information using SQL queries.
To practice joins, aggregate functions, grouping, and subqueries.
To gain practical experience with MySQL and database design.
📁 Project Files
Banking-Database/
│
├── banking_database.sql
├── README.md
└── EER_Diagram.png
🚀 How to Run the Project
Step 1: Install MySQL

Install MySQL Server and MySQL Workbench.

Step 2: Clone the Repository
git clone https://github.com/your-username/Banking-Database.git
Step 3: Open MySQL Workbench

Open the SQL script:

banking_database.sql
Step 4: Execute the Script

Run the SQL script to create the database, tables, relationships, and sample data.

Step 5: Run SQL Queries

After creating the database, execute the required SQL queries to retrieve and analyze banking information.

The project includes an EER diagram representing the relationships between:

Customers → Accounts → Transactions

and

Customers → Loans

with Branches → Accounts.

📌 Future Improvements

The database can be extended by adding:

ATM management
Employee information
Credit/debit card management
Online banking
Beneficiary management
Loan payment tracking
Account statement generation
Interest calculation
Stored procedures and triggers
Views for banking reports
👨‍💻 Author

Ketan G. Aswale

Data Science Student

⭐ If you find this project useful, consider giving the repository a star!
