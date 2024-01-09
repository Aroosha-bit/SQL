
CREATE TABLE Customers (
    CustomerID INT,
    CustomerName VARCHAR(255),
    ShipToState VARCHAR(255),
    ShipToCity VARCHAR(255)
);
INSERT INTO Customers (CustomerID, CustomerName, ShipToState, ShipToCity) VALUES (&CustomerID, '&CustomerName', '&ShipToState', '&ShipToCity');
SELECT ShipToState, COUNT(*) AS NumberOfCustomers
FROM Customers
GROUP BY ShipToState;

SELECT ShipToState, ShipToCity, COUNT(*) AS NumberOfCustomers
FROM Customers
GROUP BY ShipToState, ShipToCity;

SELECT ShipToState, COUNT(*) AS NumberOfCustomers
FROM Customers
GROUP BY ShipToState
HAVING COUNT(*) > 1;

CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(255),
    ProductFinish VARCHAR(255),
    StandardPrice DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, ProductFinish, StandardPrice)
VALUES (&ProductID, '&ProductName', '&ProductFinish', &StandardPrice);

SELECT ProductFinish, AVG(StandardPrice) AS AveragePrice
FROM Products
GROUP BY ProductFinish
HAVING AVG(StandardPrice) < 750
ORDER BY ProductFinish;
