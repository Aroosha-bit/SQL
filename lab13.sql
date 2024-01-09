--Task 01--
CREATE TABLE Emp000 (
    Employee_ID INT,
    Employee_Name VARCHAR(255),
    Salary INT,
    Department VARCHAR(255),
    Commission INT
);
INSERT INTO Emp000 (Employee_ID, Employee_Name, Salary, Department, Commission)VALUES(101, 'Emp A', 10000, 'Sales', 10);
INSERT INTO Emp000 (Employee_ID, Employee_Name, Salary, Department, Commission)VALUES    (102, 'Emp B', 20000, 'IT', 22);
INSERT INTO Emp000 (Employee_ID, Employee_Name, Salary, Department, Commission)VALUES   (103, 'Emp C', 28000, 'IT', 20);
INSERT INTO Emp000 (Employee_ID, Employee_Name, Salary, Department, Commission)VALUES  (104, 'Emp D', 30000, 'Support', NULL);
INSERT INTO Emp000 (Employee_ID, Employee_Name, Salary, Department, Commission)VALUES   (105, 'Emp E', 32000, 'Sales', 10);
SELECT * FROM Emp000;
CREATE VIEW EmpVU1 AS
SELECT
    Employee_ID AS ID_Number,
    Employee_Name AS E_Name,
    Salary,
    Salary * 12 AS ANN_Salary
FROM
    Emp000
WHERE
    Department = 'IT';
SELECT * FROM EmpVU1;
-- Task 02--
CREATE TABLE Product (
    ProductID INT,
    ProductDescription VARCHAR(255),
    ProductFinish VARCHAR(255),
    ProductStandardPrice DECIMAL(8, 2),
    ProductLineID INT
);
INSERT INTO Product (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)VALUES(1, 'End Table', 'Cherry', 175.00, 1);
INSERT INTO Product (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)VALUES   (2, 'Coffe Table', 'Natural Ash', 200.00, 2);
INSERT INTO Product (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)VALUES  (3, 'Computer Desk', 'Natural Ash', 375.00, 3),
INSERT INTO Product (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)VALUES  (4, 'Entertainment Center', 'Natural Maple', 650.00, 1);
INSERT INTO Product (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)VALUES (5, 'Writers Desk', 'Cherry', 325.00, 2);
INSERT INTO Product (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)VALUES(6, '8-Drawer Desk', 'White Ash', 750.00, 3);
INSERT INTO Product (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)VALUES (7, 'Dining Table', 'Natural Ash', 800.00, 1);
INSERT INTO Product (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)VALUES (8, 'Computer Desk', 'Walnut', 250.00, 3);
SELECT * FROM Product;
CREATE VIEW EXPENSIVE_STUFF_V1
AS
SELECT ProductID, ProductDescription,ProductStandardPrice
FROM Product
WHERE ProductStandardPrice > 300
WITH CHECK OPTION;
SELECT * FROM EXPENSIVE_STUFF_V1;
UPDATE EXPENSIVE_STUFF_V
SET ProductStandardPrice=295
WHERE ProductID =5;
-- Task 03--
SELECT * FROM Emp000;
CREATE OR REPLACE VIEW EmpVU1
(ID_NUMBER , E_Name, ANN_Salary)
AS SELECT Employee_ID, Employee_Name, Salary*12 From Emp000 where Department = 'Sales'; 

CREATE OR REPLACE VIEW DEPT_SUMMARY (D, C, Total_s, Average_s) AS
SELECT Department, COUNT(Department), SUM(Salary), AVG(Salary)
FROM Emp000
GROUP BY Department
WITH CHECK OPTION;
DELETE FROM DEPT_SUMMARY WHERE C = 1;   -- as view contains functions
-- The following statement selects D and Average_s for departments with a count greater than the count of 'Sales'
SELECT D, Average_s
FROM DEPT_SUMMARY
WHERE C > (SELECT C FROM DEPT_SUMMARY WHERE D = 'Sales');
SELECT * FROM DEPT_SUMMARY;
SELECT C FROM DEPT_SUMMARY WHERE D = 'Sales';

Create or replace view product_VU AS
SELECT ProductID, ProductDescription,ProductStandardPrice
FROM Product
WHERE ProductStandardPrice > 300
WITH CHECK OPTION;
select * from product_VU;
UPDATE product_VU 
set ProductStandardPrice=200
where ProductID = 7;
