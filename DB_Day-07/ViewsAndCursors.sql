--1
CREATE VIEW v1 AS
SELECT CONCAT(s.St_Fname, s.St_Lname) AS 'Full Name', c.Crs_Name AS 'Course Name'
FROM Student s
JOIN Stud_Course sc
ON s.St_Id = sc.St_Id
JOIN Course c
ON c.Crs_Id = sc.Crs_Id
WHERE sc.Crs_Id > 50

--2

--3
GO

CREATE VIEW v3 AS
SELECT i.Ins_Name, d.Dept_Name
FROM Instructor i
JOIN Department d
ON i.Dept_Id = d.Dept_Id
WHERE d.Dept_Name in ('SD', 'Java')

GO

--4
CREATE VIEW v4 AS
SELECT *
FROM Student
WHERE St_Address in ('Alex', 'Cairo')
WITH CHECK OPTION

--5
GO
CREATE VIEW v5 AS
SELECT p.Pname, COUNT(w.ESSN) as 'count'
FROM Project p
JOIN Works_for w
ON p.Pnumber = w.Pno
GROUP BY p.Pname

------------------------------------------------------------------------------
--6
GO
CREATE SCHEMA Compnay
GO
ALTER SCHEMA Compnay TRANSFER dbo.Departments
GO 
CREATE SCHEMA HumanResources
GO 
ALTER SCHEMA HumanResources TRANSFER dbo.Employee

-----------------------------------------------------------------------------------
--7
GO

DECLARE T_CUR CURSOR 
	FOR SELECT SALARY FROM EMPLOYEE
	FOR UPDATE
DECLARE @SAL INT
OPEN T_CUR
FETCH T_CUR INTO @SAL
BEGIN
WHILE @@FETCH_STATUS = 0
BEGIN
IF @SAL < 3000
BEGIN
UPDATE EMPLOYEE
SET SALARY = SALARY + 0.1 * SALARY
FETCH t_cur INTO @SAL
END
ELSE
BEGIN
UPDATE EMPLOYEE
SET SALARY = SALARY + 0.2 * SALARY
FETCH t_cur INTO @SAL
END
END
END
CLOSE T_CUR
DEALLOCATE T_CUR

-------------------------------------------------
--11
GO
DECLARE t_cur1 CURSOR
	FOR select Dname, MGRSSN From Departments
	for read only
DECLARE @name VARCHAR(50)
DECLARE @id INT
OPEN t_cur1
FETCH t_cur1 INTO @name, @id
BEGIN
WHILE @@FETCH_STATUS = 0
BEGIN
SELECT @name, (SELECT Fname FROM Employee WHERE @id = SSN)
FETCH t_cur1 INTO @name, @id
END
END
CLOSE t_cur1
DEALLOCATE t_cur1

---------------------------------------
--12
GO
USE ITI
DECLARE t_cur2 CURSOR
	FOR SELECT St_Fname FROM Student
	FOR READ only
DECLARE @name VARCHAR(50)
DECLARE @printedName VARCHAR(100) = ''
OPEN t_cur2
FETCH t_cur2 INTO @name
BEGIN
WHILE @@FETCH_STATUS = 0
BEGIN
SET @printedName = CONCAT(@printedName, @name, ', ')
FETCH t_cur2 INTO @name
END
PRINT(@printedName)
END
CLOSE t_cur2
DEALLOCATE t_cur2
