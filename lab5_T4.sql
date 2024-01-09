CREATE TABLE personss (
P_ID INT,
First_name VARCHAR2(10),
Last_name VARCHAR2 (10),
Address VARCHAR2(100),
City VARCHAR2 (50)
);
INSERT INTO personss (P_ID, First_name, Last_name, Address, City)VALUES(&P_ID, '&First_name', '&Last_name', '&Address', '&City');
SELECT DISTINCT City FROM personss;

CREATE TABLE PRODUCT_T
(     ProductID INTEGER PRIMARY KEY,
      ProductDescription VARCHAR(200),
      ProductPrice VARCHAR(25)
);
INSERT INTO PRODUCT_T(ProductID,ProductDescription, ProductPrice) VALUES(&ProductID,'&ProductDescription','&ProductPrice');

SELECT ProductDescription, ProductPrice
FROM Product_T
WHERE ProductPrice < 275;

SELECT ProductDescription, ProductPrice
FROM Product_T;

SELECT * FROM PRODUCT_T
WHERE ProductID='01'
AND ProductDescription='table';

SELECT * FROM PRODUCT_T
WHERE ProductID='01'
OR ProductDescription='end table';

SELECT * FROM PRODUCT_T WHERE
ProductPrice='55'
AND (ProductID='2' OR ProductID='3');

SELECT * FROM PRODUCT_T
ORDER BY ProductID DESC ;

SELECT ProductID
FROM PRODUCT_T
WHERE ProductID IN (1,3);

SELECT ProductID
FROM PRODUCT_T
WHERE ProductID BETWEEN 1 AND 3;

SELECT ProductID
FROM PRODUCT_T
WHERE ProductID NOT BETWEEN 1 AND 3;



//Queries From Manual
//CUSTOMER TABLE

CREATE TABLE CUSTOMER_T00
(     CustomerState VARCHAR(100) ,
      CustomerName VARCHAR(200),
      CustomerCity VARCHAR(25),
      PostalCode NUMBER(10) 
);
INSERT INTO CUSTOMER_T00(CustomerName, CustomerCity, CustomerState, PostalCode ) VALUES('Hibba','Wah Cantt','Punjab', 2323);
INSERT INTO CUSTOMER_T00(CustomerName, CustomerCity, CustomerState, PostalCode ) VALUES('Amna','Karachi','Sindh',6767); 
INSERT INTO CUSTOMER_T00(CustomerName, CustomerCity,  CustomerState, PostalCode ) VALUES('Aliya','Quetta','Balochistan', null); 

SELECT * FROM CUSTOMER_T00 
WHERE PostalCode IS NULL;

//QUERY
SELECT ProductDescription, ProductID
FROM PRODUCT_T
WHERE ProductDescription != 'End Table' ;

//QUERY
SELECT ProductDescription, ProductPrice
FROM PRODUCT_T
WHERE ProductPrice > 199 AND ProductPrice < 301;

//QUERY
SELECT ProductDescription, ProductPrice
FROM PRODUCT_T
WHERE ProductPrice BETWEEN 200 AND 300;

//Query

CREATE TABLE ORDER_T
(     OrderId NUMBER(10) ,
      OrderQuantity Number(10)
      
);
INSERT INTO ORDER_T(OrderId ,OrderQuantity) VALUES(666,10);
INSERT INTO ORDER_T(OrderId , OrderQuantity ) VALUES(999,20); 
INSERT INTO ORDER_T(OrderId,OrderQuantity ) VALUES(888,05); 
INSERT INTO ORDER_T(OrderId,OrderQuantity ) VALUES(888,15); 
SELECT OrderID
FROM ORDER_T;

SELECT DISTINCT OrderID
FROM ORDER_T;
ELECT OrderID, OrderDate
FROM Order_T
WHERE OrderDate > ‘24-OCT-2010’;

SELECT DISTINCT OrderID, OrderQuantity
FROM ORDER_T;