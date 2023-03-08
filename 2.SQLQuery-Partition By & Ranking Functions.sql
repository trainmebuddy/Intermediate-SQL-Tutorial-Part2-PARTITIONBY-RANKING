USE [MyStoreDB]
GO
--PARTITION BY Statement
SELECT 
 E.EmployeeID
,E.FirstName
,E.LastName 
,D.DepartmentName
,E.Salary
FROM Employee AS E
LEFT JOIN Department AS D
ON E.DepartmentID = D.DepartmentID

SELECT 
 E.EmployeeID
,E.FirstName
,E.LastName 
,D.DepartmentName
,AVG(E.Salary) OVER (PARTITION BY D.DepartmentName ORDER BY firstname) AvgSalaryByDept
FROM Employee AS E
LEFT JOIN Department AS D
ON E.DepartmentID = D.DepartmentID

--RANKING FUNCTIONS
--RANKING functions without PARTITION BY
SELECT 
 E.EmployeeID
,E.FirstName
,E.LastName 
,D.DepartmentName
,E.Salary
,ROW_NUMBER() OVER (ORDER BY Salary) ROWNUMBER
,RANK() OVER (ORDER BY Salary) RANK
,DENSE_RANK() OVER (ORDER BY Salary) DENSERANK
,NTILE(5) OVER (ORDER BY Salary) Quartile
FROM Employee AS E
LEFT JOIN Department AS D
ON E.DepartmentID = D.DepartmentID

--RANKING functions with PARTITION BY
SELECT 
 E.EmployeeID
,E.FirstName
,E.LastName 
,D.DepartmentName
,Salary
,ROW_NUMBER() OVER (PARTITION BY D.DepartmentName ORDER BY Salary) ROWNUMBER
,RANK() OVER (PARTITION BY D.DepartmentName ORDER BY Salary) RANK
,DENSE_RANK() OVER (PARTITION BY D.DepartmentName ORDER BY Salary) DENSERANK
,NTILE(2) OVER (PARTITION BY D.DepartmentName ORDER BY Salary) Quartile
FROM Employee AS E
LEFT JOIN Department AS D
ON E.DepartmentID = D.DepartmentID