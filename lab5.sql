CREATE TABLE departments
 ( department_id number(10) not null,
 department_name varchar2(50) not null);
 ALTER TABLE departments RENAME TO depts;
 
CREATE TABLE employees( employee_number number(10) not null, 
employee_name varchar2(50) not null, 
department_id number(10));
ALTER TABLE employees
ADD Salary NUMBER(6);

CREATE TABLE customers
( customer_id number(10) not null,
 customer_name varchar2(50) not null,
 address varchar2(50),
 city varchar2(50),
 state varchar2(25),
 zip_code varchar2(10));
 ALTER TABLE customers
 ADD (contact_name VARCHAR2(50),last_contacted DATE);
 
CREATE TABLE employees (
  employee_number NUMBER(10) NOT NULL,
  employee_name VARCHAR2(50) NOT NULL,
  department_id NUMBER(10));
INSERT INTO employees (employee_number, employee_name, department_id) VALUES (1, 'Aroosha', 101);
INSERT INTO employees (employee_number, employee_name, department_id) VALUES (2, 'ahmed', 102);
INSERT INTO employees (employee_number, employee_name, department_id) VALUES (3, 'ayesha', 101);
INSERT INTO employees (employee_number, employee_name, department_id) VALUES (4, 'fatima', 103);
INSERT INTO employees (employee_number, employee_name, department_id) VALUES (5, 'adan', 102);
INSERT INTO employees (employee_number, employee_name, department_id) VALUES (6, 'abdullah', 101);
INSERT INTO employees (employee_number, employee_name, department_id) VALUES (7, 'laraib', 103);
INSERT INTO employees (employee_number, employee_name, department_id) VALUES (8, 'maryam', 102);
INSERT INTO employees (employee_number, employee_name, department_id) VALUES (9, 'aqsa', 101);
INSERT INTO employees (employee_number, employee_name, department_id) VALUES (10, 'saad', 103);

CREATE TABLE employees
( employee_number number(10) not null,
 employee_name varchar2(50) not null,
 department_id number(10),
 salary number(6),
 CONSTRAINT employees_pk PRIMARY KEY (employee_number));
 ALTER TABLE employees DROP COLUMN salary;
 
CREATE TABLE departments
( department_id number(10) not null,
 department_name varchar2(50) not null,
 CONSTRAINT departments_pk PRIMARY KEY (department_id) );
ALTER TABLE departments RENAME COLUMN department_name TO dept_name;



