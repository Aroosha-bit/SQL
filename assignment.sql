CREATE OR REPLACE TYPE your_domain AS OBJECT (
amount NUMBER(10, 2)
);
CREATE TABLE your_table (
  id NUMBER PRIMARY KEY,
  amount_column your_domain
);
INSERT INTO your_table (id, amount_column) Values (19 , 20);