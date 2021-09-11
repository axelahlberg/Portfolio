/*

String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

*/

-- Suppose we have the following table:

CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

-- Which we populate with the following values:

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

-- Performing Trim, LTRIM, and RTRIM on the table we just created

Select EmployeeID, TRIM(employeeID) AS IDTRIM
FROM EmployeeErrors 

Select EmployeeID, RTRIM(employeeID) as IDRTRIM
FROM EmployeeErrors 

Select EmployeeID, LTRIM(employeeID) as IDLTRIM
FROM EmployeeErrors 

-- Replacing '- Fired' with nothing

Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
FROM EmployeeErrors

-- Using Substring for a fuzzy match

Select Substring(err.FirstName,1,3), Substring(t.FirstName,1,3), Substring(err.LastName,1,3), Substring(t.LastName,1,3)
FROM EmployeeErrors err
JOIN Table 2 t
	on Substring(err.FirstName,1,3) = Substring(t.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(t.LastName,1,3)

-- Using UPPER and lower

Select firstname, LOWER(firstname)
from EmployeeErrors

Select Firstname, UPPER(FirstName)
from EmployeeErrors