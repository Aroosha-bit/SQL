CREATE TABLE CUSTOMER_T11 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    CustomerAddress VARCHAR(255),
    CustomerCity VARCHAR(255),
    CustomerState VARCHAR(255),
    CustomerPostalCode VARCHAR(10)
);
-- Insert data into CUSTOMER_T table
INSERT INTO CUSTOMER_T11 (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES(1, 'Contemporary Casuals', '15005 Hines Blvd', 'Gainesville', 'PL', NULL);
INSERT INTO CUSTOMER_T11 (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES  (2, 'Value Furniture', '15145 5.W. 17th st.', 'Plano', NULL, '75094-7745');
INSERT INTO CUSTOMER_T11 (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES(3, 'Home Furnishings', '1500 Allard Ave.', 'Albany', 'NY', '12209-1125');
INSERT INTO CUSTOMER_T11 (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES    (4, 'Eastern Furniture', '1925 Beltline Rd.', 'Carteret', 'NJ', '07008-3188');
INSERT INTO CUSTOMER_T11 (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES    (5, 'Impressions', '5585 Westcott Ct.', 'Sacramento', 'CA', '94206-4056');
INSERT INTO CUSTOMER_T11 (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES  (6, 'Furniture Gallery', '325 Flatiron Dr.', 'Boulder', NULL, '80514-4432');
INSERT INTO CUSTOMER_T11 (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES (7, 'Period Furniture', '394 Rainbow Dr.', 'Seattle', 'WA', '97954-5589');
INSERT INTO CUSTOMER_T11 (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES (8, 'California Classics', '816 Peach Rd.', 'Santa Clara', 'CA', '96915-7754');
SELECT * FROM CUSTOMER_T11;
-- Create Order_T table
CREATE TABLE Order_T (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT
);

-- Insert data into Order_T table
INSERT INTO Order_T (OrderID, OrderDate, CustomerID) VALUES (1001, TO_DATE('10/21/2010', 'MM/DD/YYYY'), 15);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID) VALUES   (1002, TO_DATE('10/21/2010', 'MM/DD/YYYY'), 5);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID) VALUES  (1003, TO_DATE('10/22/2010', 'MM/DD/YYYY'), 3);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID) VALUES(1004, TO_DATE('10/22/2010', 'MM/DD/YYYY'), 2);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID)VALUES(1005, TO_DATE('10/24/2010', 'MM/DD/YYYY'), 11);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID)VALUES(1006, TO_DATE('10/24/2010', 'MM/DD/YYYY'), 12);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID)VALUES(1007, TO_DATE('10/27/2010', 'MM/DD/YYYY'), 4);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID)VALUES(1008, TO_DATE('10/30/2010', 'MM/DD/YYYY'), 1);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID)VALUES  (1009, TO_DATE('11/5/2010', 'MM/DD/YYYY'), 5);
INSERT INTO Order_T (OrderID, OrderDate, CustomerID)VALUES(1010, TO_DATE('11/5/2010', 'MM/DD/YYYY'), 3);
SELECT * FROM Order_T ;
-- task 01
SELECT  Order_T.OrderID,Customer_T11.CustomerName,Order_T.CustomerID
FROM  Order_T LEFT OUTER JOIN CUSTOMER_T11
ON CUSTOMER_T11.CustomerID=Order_T.CustomerID
ORDER BY Order_T.OrderID ASC;
-- task02
SELECT CustomerName,Customer_T11.CustomerID,Order_T.OrderID
FROM Customer_T11 JOIN Order_T
ON CUSTOMER_T11.CustomerID=Order_T.CustomerID
ORDER BY Order_T.OrderID ASC;
-- task03
SELECT
    o.OrderID,
    c.CustomerName,
    c.CustomerID
FROM
    Order_T o
LEFT JOIN
    CUSTOMER_T11 c ON o.CustomerID = c.CustomerID
ORDER BY
    o.OrderID ASC;

SELECT  CustomerName
FROM CUSTOMER_T11 JOIN ORDER_T
ON CUSTOMER_T11.CustomerID = ORDER_T.CustomerID
ORDER BY ORDER_T.OrderID ASC;
