ALTER TABLE Employees
ADD Department VARCHAR(50);
INSERT INTO Employees (FirstName, LastName, HireDate, Salary, Department)
VALUES 
    ('Michael', 'Johnson', '2022-01-15', 7000, 'IT'),
    ('Sarah', 'Wilson', '2021-11-20', 5500, 'HR'),
    ('Robert', 'Lee', '2020-09-10', 4800, 'Sales');
SELECT Department, COUNT(*) AS NumberOfEmployees
FROM Employees
GROUP BY Department;
SELECT Department, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department;
SELECT Department, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 5000;