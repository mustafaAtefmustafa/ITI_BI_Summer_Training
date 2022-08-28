--1
SELECT COUNT(St_Id)
FROM Student
WHERE St_Age IS NOT NULL

--2
SELECT DISTINCT Ins_Name
FROM Instructor

--3
SELECT s.St_Id , CONCAT(s.St_Fname, ' ', s.St_Lname) AS 'Student FUll Name' , ISNULL(d.Dept_Name, 'NO DEPT') as 'Department'
FROM STUDENT s LEFT JOIN Department d
ON s.Dept_Id = d.Dept_Id

--4
SELECT i.Ins_Name, ISNULL(d.Dept_Name, 'NO DEPT') as 'Department'
FROM Instructor i LEFT JOIN Department d
ON i.Dept_Id = d.Dept_Id

--5
SELECT CONCAT(s.St_Fname, ' ', s.St_Lname) AS 'Student FUll Name', crs.Crs_Name
FROM Student s
JOIN Stud_Course sc
ON s.St_Id = sc.St_Id
JOIN Course crs
ON sc.Crs_Id = crs.Crs_Id
WHERE sc.Grade IS NOT NULL

--6
SELECT t.Top_Name, COUNT(c.crs_Id)
FROM Course c, Topic t
WHERE c.Top_Id = t.Top_Id
GROUP BY t.Top_Name

--7
SELECT MAX(Salary), MIN(Salary)
FROM Instructor

--8
SELECT *
FROM Instructor
WHERE Salary < (SELECT(AVG(ISNULL(Salary,0))) FROM Instructor)

--9
SELECT d.Dept_Name
FROM Department d, Instructor i
WHERE d.Dept_Id = i.Ins_Id AND i.Salary < (SELECT(MIN(Salary)) FROM Instructor)

--10
SELECT DISTINCT TOP(2) Salary
FROM Instructor
ORDER BY Salary

--11
SELECT Ins_Name, COALESCE(CONVERT(VARCHAR(30), Salary), 'Ins Bonus')
FROM Instructor

--12
SELECT ISNULL(AVG(Salary), 0)
FROM Instructor

--13
SELECT s.St_Fname, ss.*
FROM Student s, Student ss
WHERE s.St_super = ss.St_Id