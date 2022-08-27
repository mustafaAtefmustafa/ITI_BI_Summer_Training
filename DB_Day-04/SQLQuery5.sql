--1
SELECT de.Dependent_name, de.Sex
FROM Dependent de, Employee e
WHERE e.SSN = de.ESSN AND e.Sex = 'F' And de.Sex = 'F'
UNION 
SELECT de.Dependent_name, de.Sex
FROM Dependent de, Employee e
WHERE e.SSN = de.ESSN AND e.Sex = 'M' And de.Sex = 'M'

--2
SELECT p.Pname, sum(w.hours)
FROM Project p, Works_for w
WHERE p.Pnumber = w.Pno
GROUP BY p.Pname

--3
SELECT *
FROM Departments
WHERE Dnum = (SELECT top(1) Dno 
FROM Employee 
WHERE Dno IS NOT NULL 
ORDER BY SSN )

--4
SELECT d.Dname, max(e.Salary), min(e.Salary), AVG(e.Salary)
FROM Departments d, Employee e
WHERE d.Dnum = e.Dno
GROUP BY d.Dname

--5
SELECT e.Fname + ' ' + e.Lname as 'Full Name'
FROM Employee e, Departments d
WHERE e.SSN = d.MGRSSN
AND e.SSN NOT IN (SELECT ESSN
From Dependent)

--6
SELECT d.Dnum, d.Dname, count(e.SSN)
FROM Departments d, Employee e
WHERE d.Dnum = e.Dno
GROUP BY d.Dnum, d.Dname
HAVING AVG(e.Salary) < (SELECT AVG(Salary) FROM Employee)

--7
SELECT e.fname, p.Pname, d.Dnum
FROM Employee e JOIN Works_for w 
ON e.SSN = w.ESSn
JOIN Project p
ON w.Pno = p.Pnumber
JOIN Departments d
ON e.Dno = d.Dnum
ORDER BY d.Dnum, e.Fname, e.Lname

--8
SELECT Salary
FROM Employee
WHERE Salary in (SELECT TOP (2) Salary
FROM Employee
ORDER BY Salary DESC)

--9
SELECT Fname + ' ' + Lname AS FullName
FROM Employee
Where Fname + ' ' + Lname in (SELECT Dependent_name
FROM Dependent)

--10
SELECT SSN, Fname
FROM Employee
WHERE EXISTS (SELECT * 
FROM Dependent 
WHERE SSN = ESSN)

--11
INSERT INTO Departments
VALUES ('DEPT IT', 100, 112233, '1-11-2006')

--12
UPDATE Departments
set MGRSSN = 968574
WHERE Dnum = 100

UPDATE Departments
set MGRSSN = 102672
WHERE Dnum = 20

UPDATE Employee
set Superssn = 102672
WHERE SSN = 102660 

--13
UPDATE Employee
set Superssn = 102672
WHERE Superssn = 223344
DELETE 
FROM Dependent
WHERE ESSN = 223344

UPDATE Works_for
set ESSN = 102672
WHERE ESSN = 223344

UPDATE Departments
set MGRSSN = 102672
WHERE MGRSSN = 223344
DELETE FROM Employee WHERE SSN = 223344

--14
UPDATE Employee
set Salary = Salary + 0.3 * Salary
WHERE SSN IN (SELECT SSN
FROM Employee e JOIN Works_for w
ON e.SSN = w.ESSN
JOIN Project p
ON w.Pno = p.Pnumber
WHERE p.Pname = 'AL Rabwah')
