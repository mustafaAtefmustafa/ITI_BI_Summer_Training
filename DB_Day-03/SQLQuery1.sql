--1
SELECT d.Dnum, d.Dname, e.SSN, e.Fname + ' ' + e.Lname AS "Manager Name"
FROM Departments d, Employee e
WHERE d.MGRSSN = e.SSN

--2
SELECT d.Dname, p.Pname
FROM Departments d, Project p
WHERE p.Dnum = d.Dnum

--3
SELECT de.*, e.Fname + ' ' + e.Lname AS "Dependee Name"
FROM Dependent de, Employee e
WHERE de.ESSN = e.SSN

--4
SELECT Pnumber, Pname, Plocation
FROM Project
WHERE City in ('Cairo', 'Alex')

--5
SELECT *
FROM Project
WHERE Pname like 'a%'

--6
SELECT *
FROM Employee 
WHERE Dno = 30 AND Salary BETWEEN 1000 AND 2000

--7
SELECT e.Fname + ' ' + e.Lname AS "Name"
FROM Employee e JOIN Works_for w
ON e.SSN = w.ESSN
JOIN Project p
ON w.Pno = p.Pnumber
WHERE e.Dno = 10 AND w.Hours >= 10 AND p.Pname = 'AL Rabwah'

--8
SELECT e.Fname + ' ' + e.Lname AS "Name"
FROM Employee e JOIN Employee s
ON e.Superssn = s.SSN
WHERE s.Fname + ' ' + s.Lname = 'Kamel Mohamed'

--9
SELECT e.Fname + ' ' + e.Lname AS "Name", p.Pname
FROM Employee e JOIN Works_for w
ON e.SSN = w.ESSn
JOIN Project p
ON w.Pno = p.Pnumber
ORDER BY p.Pname

--10
SELECT p.Pnumber, d.Dname, e.Lname, e.Address, e.Bdate
FROM Project p JOIN Departments d
ON p.Dnum = d.Dnum
JOIN Employee e
ON e.SSN = d.MGRSSN
WHERE p.City = 'Cairo'

--11
SELECT e.*
FROM Employee e JOIN Departments d
ON e.SSN = d.MGRSSN

--12
SELECT e.* , de.*
FROM Employee e LEFT JOIN Dependent de
ON e.SSN = de.ESSN
--13
INSERT INTO Employee (SSN, Superssn, Salary, Dno)
VALUES (102672, 112233, 3000, 30)
--14
INSERT INTO Employee (SSN, Dno)
VALUES (102660, 30)
--15
UPDATE Employee
SET Salary = Salary + 0.2 * Salary
WHERE SSN = 102672
