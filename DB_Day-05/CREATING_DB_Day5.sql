-- CREATE DATABASE
CREATE DATABASE LAB4

-- ADD Instructor table
CREATE TABLE Instructor(
Id INT IDENTITY PRIMARY KEY,
Fname VARCHAR(30),
Lname VARCHAR(30),
Salary INT,
NetSalary AS Salary + Overtime,
Hiredate DATE,
Address VARCHAR(30),
OverTime int UNIQUE,
BDate DATE,
Age AS YEAR(GETDATE()) - YEAR(BDate),
CONSTRAINT add_chk CHECK (Address IN ('Cairo','Alex')),
CONSTRAINT sal_chk CHECK (Salary BETWEEN 1000 AND 5000))
ALTER TABLE Instructor
ADD CONSTRAINT sal_def DEFAULT 3000 FOR Salary

ALTER TABLE Instructor
ADD CONSTRAINT hire_def DEFAULT GETDATE() FOR HireDate

--ADD Course Table
CREATE TABLE Course(
CID INT IDENTITY PRIMARY KEY,
CName VARCHAR(30),
CDuration INT UNIQUE,
)

--ADD Lab Table
CREATE TABLE Lab(
LID INT,
CID INT,
CONSTRAINT Lab_crs_pk PRIMARY KEY (LID,CID),
Location VARCHAR(30),
Capacity INT,
CONSTRAINT cap_chk CHECK (Capacity < 20)
)
 ALTER TABLE Lab
 ADD CONSTRAINT crs_fk FOREIGN KEY (CID) REFERENCES Course(CID)
 ON DELETE CASCADE ON UPDATE CASCADE

 --Create M:M Relation.
 CREATE TABLE Ins_Crs(
 ID INT,
 CID INT,
CONSTRAINT Ins_crs_pk PRIMARY KEY (ID,CID)
 )
ALTER TABLE Ins_Crs
ADD CONSTRAINT Id_fk FOREIGN KEY (ID) REFERENCES Instructor(ID)
ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE Ins_Crs
ADD CONSTRAINT CID_fk FOREIGN KEY (CID) REFERENCES Course(CID)
ON DELETE CASCADE ON UPDATE CASCADE

