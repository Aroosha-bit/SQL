CREATE TABLE CUSTOMER_T111(
customerID INT  primary key,
customerName VARCHAR(50)  ,
customerAddress VARCHAR(50),
CustomerCity VarChar(50),
CustomerState VARCHAR(50),
CustomerPostalCode VARCHAR(50)
);
INSERT INTO CUSTOMER_T111 (customerID, customerNAME, customerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES(1, 'Contemporary Casual', '15145 SW. 17th St.', 'Gainesville', 'FL', '32601');
INSERT INTO CUSTOMER_T111 (customerID, customerNAME, customerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES(2, 'Value Furniture', '1365S Hines Blvd', 'Plano', 'TX', '75094');
INSERT INTO CUSTOMER_T111 (customerID, customerNAME, customerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES (5, 'Impressions', '1505 Beine Rd.', 'Carteret', 'NJ', '07008');
INSERT INTO CUSTOMER_T111(customerID, customerNAME, customerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES (6, 'Furniture Gallery', '325 Flatiron Dr.', 'Boulder', 'CO', '80514');
INSERT INTO CUSTOMER_T111 (customerID, customerNAME, customerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES(3, 'Home Furnishings', '1900 Allard Ave', 'Albany', 'NY', '12209');
Select * FROM CUSTOMER_T111;

Create Table ORDER_Tt222(
orderID varchar  (20),
customerID INT ,
orderdate date
);
alter table ORDER_Tt222
add  constraint KFk_customer FOREIGN KEY(customerID) References CUSTOMER_T111(customerID);
INSERT INTO ORDER_Tt222 (orderID,customerID,orderdate)VALUES(1001,6, TO_DATE('21-OCT-06', 'DD-MON-YY'));
INSERT INTO ORDER_Tt222 (orderID,customerID,orderdate)VALUES(1002, 6,TO_DATE('21-OCT-06', 'DD-MON-YY'));
INSERT INTO ORDER_Tt222 (orderID,customerID,orderdate)VALUES (1003, 5,TO_DATE('22-OCT-06', 'DD-MON-YY'));
INSERT INTO ORDER_Tt222 (orderID,customerID,orderdate)VALUES (1004,6, TO_DATE('22-OCT-06', 'DD-MON-YY'));
INSERT INTO ORDER_Tt222 (orderID,customerID,orderdate)VALUES(1005, 2 ,TO_DATE('24-OCT-06', 'DD-MON-YY'));

Select * FROM ORDER_Tt222;

create table ORDER_LINE_T
(
order_id varchar (100) ,
product_id varchar (100) ,
quantity varchar (100)
);
-- Insert data into ORDER_LINE_T
INSERT INTO ORDER_LINE_T (order_id,product_id,quantity)VALUES(1001, 1, 2);
INSERT INTO ORDER_LINE_T (order_id,product_id,quantity)VALUES(1001, 2, 2);
INSERT INTO ORDER_LINE_T (order_id,product_id,quantity)VALUES(1001, 4, 1);
INSERT INTO ORDER_LINE_T (order_id,product_id,quantity)VALUES  (1002, 3, 3);
INSERT INTO ORDER_LINE_T (order_id,product_id,quantity)VALUES  (1003, 5, 3);
INSERT INTO ORDER_LINE_T (order_id,product_id,quantity)VALUES (1004, 5, 2);

select *from ORDER_LINE_T;



 create table PRODUCT_T110
 (
 product_id varchar (10) ,
 product_description  varchar  (100) ,
 product_finish varchar (100),
 prod_lineid number(10),
 price int
 );
INSERT INTO PRODUCT_T110 (product_id,product_description,product_finish,price,prod_lineid) VALUES(1, 'End Table', 'Cherry', 175, 1);
INSERT INTO PRODUCT_T110 (product_id,product_description,product_finish,price,prod_lineid)VALUES (2, 'Coffee Table', 'Natural Ash', 200, 2);
INSERT INTO PRODUCT_T110 (product_id,product_description,product_finish,price,prod_lineid)VALUES(3, 'Computer Desk', 'Natural Ash', 375, 2);
INSERT INTO PRODUCT_T110 (product_id,product_description,product_finish,price,prod_lineid)VALUES(4, 'White Ash', '650', 5);
INSERT INTO PRODUCT_T110 (product_id,product_description,product_finish,price,prod_lineid)VALUES(5, 'Writer''s Desk', 'Cherry', 325, 5);
INSERT INTO PRODUCT_T110 (product_id,product_description,product_finish,price,prod_lineid)VALUES(6, '8-Drawer Desk', 'Walnut', 250, 5);
 select *from PRODUCT_T110;
 
 -----------------------task1 using not in--------------------------------------------------\

SELECT c.customerID, c.customerName
FROM CUSTOMER_T11 c
WHERE c.customerID NOT IN (
    SELECT o.customerID
    FROM ORDER_Tt222 , ORDER_LINE_T ol,PRODUCT_T110 p WHERE o.orderID = ol.order_id
AND ol.product_id = p.product_id
    AND p.product_description LIKE '%whiters%'
);
 -----------------------task1 using not Exist--------------------------------------------------\
SELECT c.customerID, c.customerName
FROM CUSTOMER_T111 c
WHERE NOT EXISTS (
    SELECT *
    FROM ORDER_Tt222 o
    JOIN ORDER_LINE_T ol ON o.orderID = ol.order_id
    JOIN PRODUCT_T110 p ON ol.product_id = p.product_id
    WHERE o.customerID = c.customerID
    AND p.product_description LIKE '%whiters%'
);

 --------------------Task2 (name/address------------------------------------
 SELECT customerName, customerAddress,customerCity,customerState
FROM CUSTOMER_T111
WHERE customerID = (
    SELECT customerID
    FROM ORDER_Tt222
    WHERE orderID = '1001'
);
---------------task3 (total value ) quantity *price------------------
 SELECT p.product_id, p.product_description,p.price,
       (
           SELECT SUM(ol.quantity * pr.price)
           FROM ORDER_LINE_T ol
           JOIN PRODUCT_T110 pr ON ol.product_id = pr.product_id
           WHERE pr.product_id = p.product_id
       ) AS total_value
FROM PRODUCT_T110 p;

-----------------------------------------examples-----------------------------------------------------------------------------------
 SELECT  customerName , customerAddress,CustomerCity, CustomerState , CustomerPostalCode
FROM CUSTOMER_T1, ORDER_T2
WHERE CUSTOMER_T1.CustomerID=ORDER_T2.customerID
AND orderID=1003;


SELECT  customerName , customerAddress,CustomerCity, CustomerState , CustomerPostalCode
FROM CUSTOMER_T111
 WHERE CUSTOMER_T111.CustomerID IN
 (SELECT ORDER_Tt222.CustomerID
 FROM ORDER_Tt222
 WHERE orderID=1003);
 
 SELECT  customerName
FROM CUSTOMER_T1
 WHERE CustomerID IN
 (SELECT DISTINCT CustomerID
 
 FROM ORDER_T2);
 
 SELECT customerName
FROM CUSTOMER_T11
 WHERE CustomerID NOT IN
 (SELECT CustomerID FROM ORDER_Tt22, ORDER_LINE_T, PRODUCT_T110
WHERE ORDER_Tt22.orderID=
ORDER_LINE_T.order_id AND
ORDER_LINE_T.product_id =
PRODUCT_T110.product_id
AND product_description='Computer Desk');
 

 SELECT DISTINCT Order_id FROM ORDER_LINE_T
WHERE EXISTS (SELECT * FROM PRODUCT_T1 WHERE product_id   =
ORDER_LINE_T.product_id  AND  product_finish ='ww');


SELECT product_finish, product_description , product_id
 FROM PRODUCT_T1 PA
 WHERE  product_id > ALL
 (SELECT  product_id FROM PRODUCT_T1 PB
 WHERE PB. product_id != PA. product_id);
 
 
 SELECT  product_description  , product_id , AVGPRICE
FROM
(SELECT AVG( product_id) AVGPRICE FROM PRODUCT_T1), PRODUCT_TT11
WHERE  product_id > AVGPRICE;

SELECT customer_name, customerID
FROM CUSTOMER_T1
WHERE customerID = (
    SELECT customerID
   
    FROM ORDER_T2
    WHERE order_id = 1003
   
);
SELECT product_id
FROM( SELECT SUM(price) sumprice FROM  PRODUCT_T110),  PRODUCT_T110  WHERE sumprice>100;

