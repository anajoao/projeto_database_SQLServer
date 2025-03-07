USE [Vacations_AnaJoao];

GO




-- 12. Crie a consulta Vacations_Joins_Nome.sql, para juntar as tabelas de forma a produzir um resultado semelhante à imagem do formulário em papel.

SELECT
	r.RequestId AS'Request form nº',
	FORMAT(r.RequestDate, 'dd-MM-yyyy') AS'Request date',
	FORMAT(a.ApprovalDate, 'dd-MM-yyyy') AS'Approval date',
	m.EmployeeCode AS'Manager code',
	CONCAT_WS(' ', m.EmployeeFirstName, m.EmployeeMiddleName, m.EmployeeLastName) AS'Manager name',
	e.EmployeeCode AS'Employee code',
	CONCAT_WS(' ', e.EmployeeFirstName, e.EmployeeMiddleName, e.EmployeeLastName) AS'Employee name',
	d.Department AS'Department',
	v.VacationId AS'#',
	FORMAT(v.StartDate, 'dd-MM-yyyy') AS'Start date',
	FORMAT(v.EndDate, 'dd-MM-yyyy') AS'End date',
	v.TotalDays AS'Total days',
	a.Approved AS'Approved?'
FROM
	[dbo].[Department] AS d
INNER JOIN
	[dbo].[EmployeeDepartment] AS ed
ON
	d.DepartmentId = ed.DepartmentId
INNER JOIN	
	[dbo].[Employee] AS e
ON
	e.EmployeeId = ed.EmployeeId
INNER JOIN
	[dbo].[Employee] AS m
ON
	e.ManagerId = m.EmployeeId
INNER JOIN
	[dbo].[Request] AS r
ON
	r.EmployeeId = e.EmployeeId
INNER JOIN
	[dbo].[Vacation] AS v
ON
	r.RequestId = v.RequestId
INNER JOIN
	[dbo].[Approval] AS a
ON
	v.VacationId = a.VacationId;

GO

