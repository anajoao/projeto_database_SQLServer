
-- 15. Crie o script Vacations_Atualizar_Nome.sql para atualizar o primeiro formulário de pedido de férias.

USE [Vacations_AnaJoao];

GO


UPDATE [dbo].[Employee]
SET [EmployeeMiddleName] = 'Lima', [EmployeeLastName] = 'de França'
WHERE [EmployeeId] = 1;
GO

UPDATE [dbo].[Employee]
SET [EmployeeCode] = 'PT-PRT-SI-000120'
WHERE [EmployeeId] = 2;
GO

UPDATE [dbo].[Department]
SET [Department] = 'Sistemas de Informação'
WHERE [DepartmentId] = 1

UPDATE [dbo].[Vacation]
SET [EndDate] = '2019-12-31', [TotalDays] = '7'
WHERE [VacationId] = 3

Update [dbo].[Approval]
SET	[Approved] = 1
WHERE [VacationId] = 3
