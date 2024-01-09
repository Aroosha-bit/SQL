CREATE TABLE employeess(
E_No INT,
E_Name VARCHAR(50),
E_job VARCHAR(50),
E_Salary INT,
E_DeptNO INT
);
INSERT INTO employeess(E_No , E_Name , E_job , E_Salary , E_DeptNO) values (&E_No ,'&E_Name' , '&E_job' , &E_Salary , &E_DeptNO);
SELECT * FROM employees;
SELECT  MAX(E_Salary) AS Maximum
FROM employeess;
SELECT MIN(E_Salary) AS Minimum
FROM employeess;
SELECT SUM(E_Salary) AS Sum
FROM employeess;
SELECT AVG(E_Salary) AS Average
FROM employeess;

SELECT E_job , 
MAX(E_Salary) AS Maximum,
MIN(E_Salary) AS Minimum,
SUM(E_Salary) AS Sum,
AVG(E_Salary) AS Average
FROM employeess
GROUP BY E_job;

SELECT E_job , COUNT(*) AS NumberOFPeople
FROM employeess
GROUP BY E_job;

SELECT DEPTNO, COUNT(*) AS "Number of Employees"
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) >= 2;
