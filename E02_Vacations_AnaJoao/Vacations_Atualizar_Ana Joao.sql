
-- 15. Crie o script Vacations_Atualizar_Nome.sql para atualizar o primeiro formul�rio de pedido de f�rias.

USE [Vacations_AnaJoao];

GO


UPDATE [dbo].[Employee]
SET [EmployeeMiddleName] = 'Lima', [EmployeeLastName] = 'de Fran�a'
WHERE [EmployeeId] = 1;
GO

UPDATE [dbo].[Employee]
SET [EmployeeCode] = 'PT-PRT-SI-000120'
WHERE [EmployeeId] = 2;
GO

UPDATE [dbo].[Department]
SET [Department] = 'Sistemas de Informa��o'
WHERE [DepartmentId] = 1

UPDATE [dbo].[Vacation]
SET [EndDate] = '2019-12-31', [TotalDays] = '7'
WHERE [VacationId] = 3

Update [dbo].[Approval]
SET	[Approved] = 1
WHERE [VacationId] = 3
