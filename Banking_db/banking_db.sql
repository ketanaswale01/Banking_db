----------------------------
-- LAB-1
----------------------------

create database BankingDB;
use BankingDB;

create table Customers
(
	CustomerID INT,
    FirstName varchar(50),
    LastName varchar(50),
    Email varchar(100),
    Phone bigint,
    AccountCreationDate date
    );
    
describe Customers;

insert into Customers(CustomerID,FirstName,LastName,Email,Phone,AccountCreationDate)
values(101,"Kedar","Khamkar","kedar@gmail.com",9876543212,null),
(2,'John','Cena','Youcantseeme@gmail.com','1234567894','2026-10-07');

select * from Customers;

----------------------------
-- LAB-2
----------------------------

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

----------------- 
-- Alter Command
ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

show create table accounts;
-----------------
-- Drop Command
DROP TABLE AccountBranches;

-----------------
-- Constraints
ALTER TABLE Customers
ADD PRIMARY KEY (CustomerID);

alter table Branches
add primary key (BranchID);

alter table Accounts
add primary key (AccountID);
-----------------
-- Foreign Key
ALTER TABLE Accounts
ADD CustomerID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

-- Accounts connect with branch
alter table Accounts
add BranchID int;

alter table Accounts
add constraint FK_Accounts_Branch
foreign key (BranchID)
references Branches(BranchID);

-- Transaction connect with Accounts
alter table Transactions
add AccountID int;

alter table Transactions
add constraint FK_Tansaction_Account
foreign key (AccountID)
references Accounts(AccountID); 

-- Loans connect with Customers
alter table Loans 
add CustomerID int;

alter table Loans
add constraint FK_Loans_Customers
foreign key (CustomerID)
references Customers(CustomerID);

-----------------
-- Not null
ALTER TABLE Customers
MODIFY FirstName VARCHAR(50) NOT NULL;

-----------------
-- Unique
ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);




-- ========================
-- LAB-3
-- ========================
alter table Customers rename column AccountCreationDate to DateOfBirth;

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-15');

update Customers set CustomerID = 102 where CustomerID = 2;
update Customers set CustomerID = 103 where FirstName = 'Rahul';

UPDATE Customers SET Phone='9999999999' WHERE CustomerID=101;
SELECT * FROM Customers WHERE CustomerID = 101;
UPDATE Customers SET Email='rahul.sharma@gmail.com'WHERE CustomerID=103;

delete from Customers
where phone = '9876543210';

select * from customers;

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);

select * from Accounts;

insert into Customers
values (104, 'Sneha', 'Joshi', 'sneha.joshi@gmail.com', '9876500002', '1997-09-12'),
(105, 'Rohan', 'Kulkarni', 'rohan.k@gmail.com', '9876500003', '1993-11-25');

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(202, 102, 'Current', 40000),
(203, 103, 'Savings', 35000),
(204, 104, 'Current', 60000),
(205, 105, 'Savings', 45000);

-- Insert 5 Records into Transactions Table
INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, '2025-05-10', 5000, 'Deposit'),
(302, 202, '2025-05-11', 2500, 'Withdraw'),
(303, 203, '2025-05-12', 10000, 'Deposit'),
(304, 204, '2025-05-13', 3000, 'Withdraw'),
(305, 205, '2025-05-14', 7000, 'Deposit');

-- Insert 5 Records into Branches Table
INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(1, 'Mumbai Branch', 'Andheri, Mumbai', '0221111111'),
(2, 'Pune Branch', 'Shivaji Nagar, Pune', '0202222222'),
(3, 'Nashik Branch', 'College Road, Nashik', '0253222222'),
(4, 'Nagpur Branch', 'Sitabuldi, Nagpur', '0712333333'),
(5, 'Navi Mumbai Branch', 'Vashi, Navi Mumbai', '0224444444');

-- Insert 5 Records into Loans Table
INSERT INTO Loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID)
VALUES
(301, 500000, 8.50, '2025-01-15', '2030-01-15', 101),
(302, 300000, 9.25, '2025-02-10', '2028-02-10', 102),
(303, 750000, 8.75, '2025-03-20', '2032-03-20', 103),
(304, 250000, 10.00, '2025-04-05', '2029-04-05', 104),
(305, 1000000, 7.95, '2025-05-12', '2035-05-12', 105);

update Accounts set Balance = 30000
where AccountID = 201;

select * from Customers;

-- Task-3

-- Delete Transaction Record
DELETE FROM Transactions
WHERE TransactionID = 302;
SELECT * FROM Transactions;

-- Delete Account Record
DELETE FROM Accounts
WHERE AccountID = 202;
SELECT * FROM Accounts;



-- =========================================================================
-- LAB-4
-- =========================================================================

-- TASK 1
SELECT * FROM Customers;

SELECT FirstName, LastName, Email, Phone
FROM Customers;

select AccountID,AccountType,Balance
from Accounts;

-- TASK 2
SELECT * FROM Accounts
WHERE AccountType = 'Savings';

SELECT * FROM Accounts
WHERE Balance > 25000;

SELECT * FROM Transactions
WHERE Amount BETWEEN 5000 AND 20000;

SELECT * FROM Customers
WHERE CustomerID IN (101,102,103);

SELECT * FROM Customers
WHERE FirstName LIKE 'R%';

select * from Accounts;

select * from Accounts
where balance < 15000;

select * from Transactions
where Amount between 1000 and 10000;

select * from Customers
where CustomerID in (104,105);

select * from Customers
where LastName like 'S%';

-- TASK 3
SELECT * FROM Customers
ORDER BY FirstName ASC;

select * from Accounts Order BY Balance desc;

select distinct AccountType from Accounts;

-- =================================
-- LAB 5
-- =================================

-- Task 1
select * from Customers
where FirstName Like 'A%';

select * from Customers
where Email like '%gmail%';

select * from Customers
where LastName like '%kar';

select * from Customers
where FirstName like 'R%';

select * from Customers
where Email like 'yahoo';

select * from Customers
where LastName like 'P%';

select * from Customers
where Phone like '%99';


-- Task 3
SELECT * FROM Accounts
WHERE AccountType IN ('Savings', 'Current');

SELECT * FROM Transactions
WHERE TransactionType IN ('Deposit', 'Withdrawal');

SELECT * FROM Customers
WHERE CustomerID IN (101,102,105);

select * from Accounts
where AccountType IN ('Salary','Savings');

select * from Transactions
where TransactionType IN('Payment','Deposit');

select * from Customers
where CustomerID In('103','104');

select * from Accounts
where AccountID in(203);

-- Task 3
SELECT * FROM Customers
ORDER BY LastName ASC;

SELECT * FROM Accounts
ORDER BY Balance DESC;

SELECT * FROM Transactions
ORDER BY TransactionDate DESC;

select * from Customers
order by FirstName asc;

select * from Accounts
order by AccountType asc;

select * from Transactions
order by Amount desc;

select * from Customers
order by DateOfBirth asc;


-- Task 4--> LIMIT,OFFSET
SELECT * FROM Accounts
ORDER BY Balance DESC
LIMIT 5;

select * from Customers limit 3;

select * from Transactions
limit 5 offset 3;

select * from Transactions
order by Amount desc 
limit 3;

select * from Customers
limit 4;

select * from Accounts
limit 3 offset 2;

select * from Transactions
order by TransactionDate asc limit 5;


-- Task 5
SELECT * FROM Accounts
ORDER BY Balance DESC
LIMIT 5;

SELECT * FROM Customers
WHERE FirstName LIKE 'S%'
LIMIT 5;
 
SELECT * FROM Transactions
WHERE TransactionType IN ('Deposit','Withdrawal')
ORDER BY TransactionDate DESC;


-- =============================================
-- LAB 6
-- =============================================

-- ====================================
-- Task 1

-- String Function
SELECT
FirstName,
UPPER(FirstName) AS UpperCaseName
FROM customers;

SELECT
FirstName,
LOWER(FirstName) AS LowerCaseName
FROM customers;

SELECT
FirstName,
LENGTH(FirstName) AS NameLength
FROM customers;

SELECT
FirstName,
LEFT(FirstName,3) AS Initials
FROM customers;

SELECT
CONCAT(FirstName,' - ',LastName) AS FullName
FROM customers;

-- Math Functions
SELECT ROUND(1256.75) AS Rounded_Value;
SELECT CEIL(1256.25) AS Ceiling_Value;
SELECT FLOOR(1256.75) AS Floor_Value;
SELECT ABS(-2500) AS Absolute_Value;
SELECT MOD(25,4) AS Remainder;

-- Date Functions
SELECT CURDATE(); 
SELECT NOW();

SELECT
CustomerID,
YEAR(DateOfBirth) AS BirthYear
FROM customers;

SELECT
CustomerID,
MONTH(DateOfBirth) AS BirthMonth
FROM customers;

SELECT
CustomerID,
DATEDIFF(CURDATE(),DateOfBirth) AS Days
FROM customers;

-- Comparison Functions
SELECT
    FirstName,
    DateOfBirth,
    IF(YEAR(DateOfBirth) <= 1995,
       'Adult',
       'Young') AS Category
FROM Customers;

SELECT
    FirstName,
    IFNULL(Phone, 'Not Available') AS PhoneNumber
FROM Customers;

SELECT GREATEST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS LatestBirthDate;

SELECT LEAST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS EarliestBirthDate;

SELECT
    FirstName,
    NULLIF(FirstName,'Priya') AS Result
FROM Customers;

-- =======================================
-- Task 2
-- =======================================

SELECT SUM(Balance) as total_balance
FROM Accounts;

SELECT AVG(Balance) AS average_balance
FROM Accounts;

SELECT MAX(Balance) AS highest_balance
FROM Accounts;

SELECT MIN(Balance) AS lowest_balance
FROM Accounts;

SELECT COUNT(*) AS total_accounts
FROM Accounts;

-- ======================================
-- Task 3
-- ======================================

SELECT 
    AccountType,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType;

-- =====================================
-- Task 4
-- =====================================

SELECT 
    AccountType,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType
HAVING SUM(Balance) > 25000;


-- =============================================
-- LAB 7
-- =============================================

use bankingdb;

-- =====================================
-- Task 1
-- =====================================

Select
    LoanID,
    CustomerID, LoanAmount, RANK() 
    OVER(ORDER BY LoanAmount DESC) AS LoanRank
FROM Loans;

select 
	LoanID,
    CustomerID, LoanAmount, dense_rank()
    over(order by LoanAmount desc) as LoanRank
from Loans;

select 
	LoanID,
    CustomerID, LoanAmount, row_number()
    over(order by LoanAmount desc) as LoanRank
from Loans;

SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    ROW_NUMBER() 
    OVER(PARTITION BY CustomerID
	ORDER BY LoanAmount DESC) AS RowNum
FROM Loans;

SELECT
    LoanID, CustomerID,LoanAmount,
    SUM(LoanAmount) 
    OVER(ORDER BY LoanAmount DESC) AS RunningTotal
FROM Loans;

SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    LAG(LoanAmount) 
    OVER(ORDER BY LoanAmount DESC) AS PreviousLoanAmount
FROM Loans;

SELECT
    LoanID, CustomerID, LoanAmount,
    LEAD(LoanAmount) 
    OVER(ORDER BY LoanAmount DESC) AS NextLoanAmount
FROM Loans;


-- =============================================
-- LAB 8
-- =============================================

-- =====================================
-- INNER JOIN
-- =====================================

SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID;

-- =====================================
-- LEFT JOIN
-- =====================================

SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
LEFT JOIN Transactions t
ON a.AccountID = t.AccountID;

-- =====================================
-- TASK 3
-- =====================================

SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE t.TransactionType = 'Deposit';

-- =====================================
-- TASK 4
-- =====================================

SELECT
    a.AccountID, a.AccountType, a.Balance,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE a.Balance > 30000
ORDER BY a.Balance DESC;