CREATE TABLE Cust_T (
    CustomerID NUMBER(11,0) NOT NULL,
    CustomerName VARCHAR2(25) NOT NULL,
    CustomerAddress VARCHAR2(30),
    CustomerCity VARCHAR2(20),
    CustomerState CHAR(2),
    CustomerPostalCode VARCHAR2(9),
    CONSTRAINT Customer_PK PRIMARY KEY (CustomerID)
);
INSERT INTO Cust_T (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES (1, 'John Doe', '123 Main St', 'Anytown', 'CA', '12345');
INSERT INTO Cust_T (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES (2, 'Jane Smith', '456 Oak St', 'Sometown', 'NY', '67890');
INSERT INTO Cust_T (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES   (3, 'Bob Johnson', '789 Pine St', 'Othertown', 'TX', '13579');
INSERT INTO Cust_T (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES   (4, 'Alice Brown', '101 Cedar St', 'Newtown', 'FL', '24680');
INSERT INTO Cust_T (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES   (5, 'Charlie Davis', '222 Elm St', 'Smalltown', 'AZ', '98765');
INSERT INTO Cust_T (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES   (6, 'Eva White', '333 Maple St', 'Yourtown', 'WA', '54321');
INSERT INTO Cust_T (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES   (7, 'Frank Miller', '444 Birch St', 'Hometown', 'IL', '11223');
INSERT INTO Cust_T (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES   (8, 'Grace Wilson', '555 Walnut St', 'Theirtown', 'GA', '33445');
INSERT INTO Cust_T (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode)VALUES   (9, 'David Lee', '666 Oak St', 'Somewhere', 'OH', '66778');
SELECT * FROM Cust_T;
CREATE TABLE Order11_T (
    OrderID NUMBER(11,0) NOT NULL,
    OrderDate DATE DEFAULT SYSDATE,
    CustomerID NUMBER(11,0),
    Amount NUMBER(11,0),
    CONSTRAINT Order_PK PRIMARY KEY (OrderID),
    CONSTRAINT Order_FK FOREIGN KEY (CustomerID) REFERENCES Cust_T(CustomerID)
);
INSERT INTO Order11_T (OrderID, OrderDate, CustomerID, Amount)VALUES (1001, SYSDATE, 1, 500.00);
INSERT INTO Order11_T (OrderID, OrderDate, CustomerID, Amount)VALUES  (1002, SYSDATE, 2, 750.00);
INSERT INTO Order11_T (OrderID, OrderDate, CustomerID, Amount)VALUES (1003, SYSDATE, 3, 600.00);
INSERT INTO Order11_T (OrderID, OrderDate, CustomerID, Amount)VALUES  (1004, SYSDATE, 4, 900.00);
INSERT INTO Order11_T (OrderID, OrderDate, CustomerID, Amount)VALUES  (1005, SYSDATE, 5, 400.00);
INSERT INTO Order11_T (OrderID, OrderDate, CustomerID, Amount)VALUES  (1006, SYSDATE, 6, 800.00);
INSERT INTO Order11_T (OrderID, OrderDate, CustomerID, Amount)VALUES  (1007, SYSDATE, 7, 700.00);
INSERT INTO Order11_T (OrderID, OrderDate, CustomerID, Amount)VALUES (1008, SYSDATE, 8, 550.00);


SELECT * FROM Order11_T;
CREATE TABLE Pro_T (
    ProductID NUMBER(11,0) NOT NULL,
    ProductDescription VARCHAR2(50),
    ProductFinish VARCHAR2(20) CHECK (ProductFinish IN ('Cherry', 'Natural Ash', 'White Ash', 'Red Oak', 'Natural Oak', 'Walnut')),
    ProductStandardPrice DECIMAL(6,2),
    ProductLineID INTEGER,
    CONSTRAINT Product_PK PRIMARY KEY (ProductID)
);
INSERT INTO Pro_T (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)VALUES (101, 'Desk', 'Cherry', 199.99, 1);
INSERT INTO Pro_T (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)VALUES   (102, 'Chair', 'Natural Oak', 79.99, 2);
INSERT INTO Pro_T (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)VALUES   (103, 'Bookshelf', 'White Ash', 149.99, 1);
INSERT INTO Pro_T (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)VALUES  (104, 'Table', 'Red Oak', 129.99, 2);
INSERT INTO Pro_T (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)VALUES (105, 'Cabinet', 'Walnut', 299.99, 1);
INSERT INTO Pro_T (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)VALUES  (106, 'Lamp', 'Natural Ash', 49.99, 2);
INSERT INTO Pro_T (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)VALUES  (107, 'Bed', 'Cherry', 499.99, 1);
INSERT INTO Pro_T (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)VALUES   (108, 'Sofa', 'Walnut', 799.99, 2);
INSERT INTO Pro_T (ProductID, ProductDescription, ProductFinish, ProductStandardPrice, ProductLineID)VALUES   (109, 'Dresser', 'White Ash', 349.99, 1);

SELECT * FROM Pro_T;
CREATE TABLE OrderLine_T (
    OrderID NUMBER(11,0) NOT NULL,
    ProductID NUMBER(11,0) NOT NULL,
    OrderedQuantity INTEGER NOT NULL,
    CONSTRAINT OrderLine_PK PRIMARY KEY (OrderID, ProductID),
    CONSTRAINT OrderLine_FK1 FOREIGN KEY (OrderID) REFERENCES Order11_T(OrderID),
    CONSTRAINT OrderLine_FK2 FOREIGN KEY (ProductID) REFERENCES Pro_T(ProductID)
);
INSERT INTO OrderLine_T (OrderID, ProductID, OrderedQuantity)VALUES (1001, 101, 2);
INSERT INTO OrderLine_T (OrderID, ProductID, OrderedQuantity)VALUES (1001, 102, 4);
INSERT INTO OrderLine_T (OrderID, ProductID, OrderedQuantity)VALUES   (1002, 103, 1);
INSERT INTO OrderLine_T (OrderID, ProductID, OrderedQuantity)VALUES   (1002, 104, 3);
INSERT INTO OrderLine_T (OrderID, ProductID, OrderedQuantity)VALUES   (1003, 105, 1);
INSERT INTO OrderLine_T (OrderID, ProductID, OrderedQuantity)VALUES   (1003, 106, 2);
INSERT INTO OrderLine_T (OrderID, ProductID, OrderedQuantity)VALUES  (1004, 107, 1);
INSERT INTO OrderLine_T (OrderID, ProductID, OrderedQuantity)VALUES   (1004, 108, 1);
INSERT INTO OrderLine_T (OrderID, ProductID, OrderedQuantity)VALUES  (1005, 109, 2);

SELECT * FROM OrderLine_T;
SELECT O.CustomerID,C.CustomerID,CustomerName,OrderID
FROM Cust_T C INNER JOIN Order11_T O
ON C.CustomerID = O.CustomerID
Order By OrderID;

SELECT CustomerID,CustomerName,OrderID
FROM Cust_T  Natural JOIN Order11_T;

SELECT * FROM Cust_T Natural Join Order11_T;

