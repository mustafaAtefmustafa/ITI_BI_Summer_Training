-- Procedure 2
ALTER PROCEDURE num_emp(@prj_name VARCHAR(30)) AS
BEGIN
DECLARE @n INT
SET @n = (SELECT COUNT(ESSN) 
FROM Works_for 
JOIN Project
ON Pno = Pnumber
WHERE Pname = @prj_name
GROUP BY Pno
)
IF @n >= 3
PRINT(CONCAT('The number of employees in the project ', @prj_name ,'  is 3 or more'))
ELSE
BEGIN
SELECT CONCAT('The following employees work for project ',@prj_name,' ', fname,' ', lname)
FROM Employee
JOIN Works_for
ON SSN = ESSn
JOIN Project
ON Pnumber = pno
WHERE Pname = @prj_name
--DECLARE @fullname VARCHAR(30)
--DECLARE @i INT = 1
--WHILE @i <= @n
--BEGIN
--SET @fullname = (SELECT full_name FROM
--(SELECT CONCAT(fname,' ', lname) as full_name, ROW_NUMBER() OVER(ORDER BY fname)r
--FROM Employee
--JOIN Works_for
--ON SSN = ESSn
--JOIN Project
--ON Pno = Pnumber
--WHERE Pname = @prj_name) as t 
--WHERE r = @i)
--PRINT(@fullname)
--SET @i = @i + 1
--END
END
END
EXECUTE num_emp 'Al Rabwah'

GO
-- Procedure 3
ALTER PROCEDURE Emp_Replace(@old INT, @new INT, @pn INT) AS
BEGIN
IF @OLD not in (SELECT ESSN FROM Works_for)
print('The old Employee does not work on any projects')
ELSE IF @new not in (SELECT SSN FROM Employee)
print('The new Employee does not exist')
ELSE IF @pn not in (SELECT pno FROM Works_for)
print('The project does not exist')
ELSE IF @new  in(SELECT ESSN FROM Works_for WHERE pno = @pn)
print('The new Employee Already Works for this project')
ELSE
BEGIN
UPDATE Works_for
SET ESSn = @new
WHERE ESSn = @old AND Pno = @pn
END
END
--EXECUTE Emp_Replace 112233,512463, 100