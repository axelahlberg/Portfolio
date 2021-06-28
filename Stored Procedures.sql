/*

Let's imagine we have 2 tables named EmployeeDemographics and EmployeeSalarya that we want to join together.
Let us further suppose that we want to create and store a procedure that outputs the
number of employees with the jobtitle we input, their average age, and their average salary.
The following procedure can be created, stored, and later called to fulfill that puspose.
 
*/

CREATE PROCEDURE Temp_Employee
@JobTitle nvarchar(100)
AS
DROP TABLE IF EXISTS #temp_employee2
Create table #temp_employee2 (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)

Insert into #temp_employee2
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
where JobTitle = @JobTitle -- Parameter
group by JobTitle

Select * 
From #temp_employee2
GO;

-- Call the procedure

exec Temp_Employee @jobtitle = 'Salesman'
exec Temp_Employee @jobtitle = 'Accountant'

