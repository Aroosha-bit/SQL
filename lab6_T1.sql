CREATE TABLE Products_T1
(     ProductID INTEGER PRIMARY KEY,
      ProductDescription VARCHAR(200),
      ProductPrice VARCHAR(25)
);
INSERT INTO Products_T1(ProductID,ProductDescription, ProductPrice) VALUES(&ProductID,'&ProductDescription','&ProductPrice');
SELECT * FROM Products_T1;

SELECT AVG(ProductPrice)
FROM Products_T1;

SELECT MIN(productDescription) AS first_product_name
FROM Products_T1;

SELECT SUM(productprice) AS total_price
FROM Products_T1;

SELECT COUNT(DISTINCT productID) AS item_count
FROM Products_T1
WHERE productID = 3;
