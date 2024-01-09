CREATE TABLE People3(
P_ID number(2),
Lastname VARCHAR2(50),
Firstname VARCHAR2(50),
Address VARCHAR2(50),
City VARCHAR2(50)
);
INSERT INTO People3(P_ID,Lastname,Firstname,Address,City)VALUES (&P_ID , '&Lastname','&Firstname','&Address','&City');
SELECT * FROM People3;
SELECT DISTINCT City FROM People3;

SELECT * FROM People3
WHERE FirstName='Aroosha'
AND LastName='Fatima';

SELECT * FROM People3
WHERE FirstName='Aroosha'
OR FirstName='Fatima';

SELECT * FROM People3 WHERE
LastName='Fatima'
AND (FirstName='Aroosha' OR FirstName='maryam');

SELECT * FROM People3 WHERE 
LastName='Fatima'
AND FirstName='Aroosha' OR FirstName='maryam';

SELECT * FROM People3
ORDER BY LastName DESC;

SELECT * FROM People3
ORDER BY LastName ASC;

SELECT * FROM People3
WHERE LastName
BETWEEN 'ayesha' AND 'asd';



