--4
--Create audit table.
CREATE TABLE Budget_log (
Project_no INT,
UserName VARCHAR(50),
ModifiedDate DATE,
Budget_old INT,
Budget_new INT
)
GO
--Create the trigger.
CREATE TRIGGER budget_trg ON Project
AFTER UPDATE AS
BEGIN
INSERT INTO Budget_log
VALUES ((SELECT Pnumber FROM inserted),
@@SERVERNAME, 
GETDATE(),
(SELECT Budget FROM deleted),
(SELECT Budget FROM inserted))
END

----------------------------------------------------------------
--5
GO

CREATE TRIGGER dept_trg ON Department
INSTEAD OF INSERT AS
BEGIN
PRINT('You can not insert in this table')
END
 
-------------------------------------------------------------
--6
GO

ALTER TRIGGER Emp_trg ON EMPLOYEE
AFTER INSERT AS
BEGIN
IF MONTH(GETDATE()) = 3
BEGIN
print('Can not insert a new employee in March')
ROLLBACK
END
ELSE
COMMIT
END
------------------------------------------------------------------
--7
--Create audit table.
CREATE TABLE Student_log (
UserName VARCHAR(50),
ModifiedDate DATE,
Note VARCHAR(100)
)
GO
--Create the trigger.
ALTER TRIGGER Student_trg ON Student
AFTER INSERT AS
BEGIN
INSERT INTO Student_log
VALUES (@@SERVERNAME,
GETDATE(),
CONCAT(@@SERVERNAME ,' inserted new row with key = ' ,(SELECT st_id FROM inserted)))
END

--------------------------------------------------------------------------------------
--8
GO

ALTER TRIGGER Student_dlt_trg ON Student
INSTEAD OF DELETE AS
BEGIN
INSERT INTO Student_log
VALUES (@@SERVERNAME,
GETDATE(),
CONCAT(@@SERVERNAME ,' tried to delete new row with key = ' ,(SELECT st_id FROM deleted)))
END
