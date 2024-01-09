CREATE TABLE employees
( employee_number number(10) not null,
 employee_name varchar2(50) not null,
 salary number(6),
 CONSTRAINT employees_pk PRIMARY KEY (employee_number)
);
INSERT INTO employees (employee_number, employee_name, salary)
VALUES (1001, 'John Smith', 62000);
INSERT INTO employees (employee_number, employee_name, salary)
VALUES (1002, 'Jane Anderson', 57500);
INSERT INTO employees (employee_number, employee_name, salary)
VALUES (1003, 'Brad Everest', 71000);
INSERT INTO employees (employee_number, employee_name, salary)
VALUES (1004, 'Jack Horvath', 42000);

SELECT * FROM employees
WHERE employee_name LIKE '%h';

CREATE TABLE product_table
(     
      productID INT,
      productdiscription VARCHAR(200),
      productfinish VARCHAR(200),
      productstandardprice INT
);
INSERT INTO product_table( productID ,productdiscription, productfinish, productstandardprice) VALUES( &productId ,'&productdiscription', '&productfinish', &productstandardprice);
SELECT productdiscription, productfinish, productstandardprice
FROM product_table
WHERE (productdiscription LIKE '%Desk'
OR productdiscription LIKE '%Table')
AND productstandardprice > 300;

SELECT  productfinish FROM product_table
WHERE productfinish LIKE '%h';

SELECT  productfinish FROM product_table
WHERE productfinish LIKE '%s%';


SELECT  productID FROM product_table
WHERE productID LIKE '1%';

CREATE TABLE person12 (
P_ID INT,
First_name VARCHAR2(10),
Last_name VARCHAR2 (10),
Address VARCHAR2(100),
City VARCHAR2 (50)
);
SELECT * FROM person12;
INSERT INTO person12 (P_ID, First_name, Last_name, Address, City)VALUES(&P_ID, '&First_name', '&Last_name', '&Address', '&City');
SELECT City FROM person12
WHERE City LIKE 'sa%';

SELECT * FROM person11
WHERE City LIKE '%nes%';

SELECT * FROM person11
WHERE FirstName LIKE '_la';

SELECT * FROM person11
WHERE LastName LIKE 'S_end_on';


