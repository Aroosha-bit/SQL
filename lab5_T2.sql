CREATE TABLE Product_T4(
ProductID NUMBER(2),
ProductDescription VARCHAR2(50),
ProductFinish VARCHAR2(50),
ProductStandardPrice VARCHAR2(50),
ProductLineID NUMBER(2)
);
INSERT INTO Product_T4(ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductLineID)VALUES (&ProductID , '&ProductDescription' ,
 '&ProductFinish' , '&ProductStandardPrice' , '&ProductLineID');
SELECT ProductDescription , ProductStandardPrice
FROM Product_T4 Where ProductStandardPrice < '$275';
SELECT ProductStandardPrice, ProductDescription, ProductID
FROM Product_T4;
