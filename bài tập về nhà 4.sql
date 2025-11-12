SET SQL_SAFE_UPDATES = 0;

UPDATE Employees 
SET Salary = 4800 
WHERE EmployeeID = 2;
UPDATE Employees 
SET HireDate = '2021-08-01' 
WHERE EmployeeID = (
    SELECT EmployeeID FROM (
        SELECT EmployeeID FROM Employees WHERE FirstName = 'David'
    ) AS temp
);