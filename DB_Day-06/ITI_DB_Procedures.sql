-- Procedure 1
CREATE PROCEDURE num_st(@n INT) AS
BEGIN
SELECT COUNT(St_Id) FROM Student
WHERE @n = Dept_Id
END

GO
-- Another Solution Procedure 1
CREATE PROCEDURE st_num AS
BEGIN
SELECT dept_id, COUNT(st_ID)
FROM Student
GROUP BY Dept_Id
END
