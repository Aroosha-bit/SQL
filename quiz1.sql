CREATE TABLE Table1_Constraint(
P_ID INT ,
P_Name VARCHAR(255) DEFAULT 'Aroosha',
P_Address VARCHAR(255),
P_City VARCHAR(255),
P_CNIC INT
);
CREATE TABLE Table2_Constraint_Name(
E_ID INT,
E_Name VARCHAR(255),
E_Address VARCHAR(255),
E_City VARCHAR (255),
E_CNIC INT,
CONSTRAINT dc_Table2_Constraint_Name DEFAULT (E_Name)
);
SELECT * FROM Table1_Constraint
INSERT INTO (10 , '%Aroosha' , '%abc' , '%xyz' , 123);