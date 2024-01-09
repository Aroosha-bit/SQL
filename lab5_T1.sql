CREATE TABLE contacts (
contact_id NUMBER(10),
first_name VARCHAR2(50),
last_name VARCHAR2(50)
);
SELECT contact_id, first_name || last_name AS "NAME"
FROM contacts
WHERE last_name = 'Anderson';

CREATE TABLE contacts_1 (
contact_id NUMBER(10),
first_name VARCHAR2(50),
last_name VARCHAR2(50)
);
SELECT contact_id
FROM contacts_1
WHERE contact_id = 23;

CREATE TABLE contacts2 (
contact_id NUMBER(10),
first_name VARCHAR2(50),
last_name VARCHAR2(50)
);
SELECT * FROM contacts2;
