--1
SELECT * FROM Employee
--2 
SELECT Fname, Lname, Salary, Dno FROM Employee
--3
SELECT Pname, Plocation, Dnum FROM Project
--4
SELECT Fname + ' ' + Lname AS "Full Name", 0.1 * 12 * Salary AS "Annual Comm" FROM Employee
--5
SELECT SSN, Fname + ' ' + Lname AS "Name" FROM Employee WHERE Salary > 1000
--6
SELECT SSN, Fname + ' ' + Lname AS "Name" FROM Employee WHERE Salary*12 > 10000
--7
SELECT Fname + ' ' + Lname AS "Name" , Salary FROM Employee WHERE Sex = 'f'
--8
SELECT Dnum, Dname  FROM Departments WHERE MGRSSN = 968574
--9
SELECT Pnumber, Pname, Plocation FROM Project WHERE Dnum = 10