--1
SELECT SalesOrderID, ShipDate
FROM Sales.SalesOrderHeader
WHERE OrderDate between '7/28/2002' AND '7/29/2014'

--2
SELECT ProductID, Name
FROM Production.Product
WHERE StandardCost < 110

--3
SELECT ProductID, Name
FROM Production.Product
WHERE Weight IS NULL

--4
SELECT ProductID, Name
FROM Production.Product
WHERE Color in ('silver','black','red')

--5
SELECT ProductID, Name
FROM Production.Product
WHERE Name like 'B%'

--6
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3

SELECT Description
FROM Production.ProductDescription
WHERE Description like '%[_]%'

--7
SELECT OrderDate ,sum(TotalDue)
FROM Sales.SalesOrderHeader
WHERE OrderDate between '7/1/2001' AND '7/31/2014'
GROUP BY OrderDate

--8
SELECT DISTINCT HireDate
FROM HumanResources.Employee

--9
SELECT AVG(DISTINCT ListPrice)
FROM Production.Product

--10
SELECT concat('The ', Name ,' is only! ', ListPrice)
FROM Production.Product
WHERE ListPrice between 100 AND 120
ORDER BY ListPrice

--11
--a
SELECT rowguid, name, SalesPersonID, Demographics
INTO Store_Archive
FROM Sales.Store

--b 
SELECT rowguid, name, SalesPersonID, Demographics
INTO Store_Archive_NoData
FROM Sales.Store
WHERE 1=2

--12
SELECT FORMAT(GETDATE(), 'dd-MM-yyyy')
UNION
SELECT FORMAT(GETDATE(), 'MM-dd-yyyy')
