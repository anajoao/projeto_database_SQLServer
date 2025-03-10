
-- 11. Crie o ficheiro de script Vacations_CarregamentoDados_Nome.sql para carregar os dados iniciais das tabelas. Como fonte, use os dados normalizados do Excel.

USE [Vacations_AnaJoao];
GO


INSERT [dbo].[Department] ([Department]) 
VALUES (N'Tecnologias de Informação');
GO

INSERT [dbo].[Employee] ([EmployeeCode], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [ManagerId]) 
VALUES (N'PT-PRT-HR-000012', N'Carolina ', N'Franco', N'de Lima', NULL);

INSERT [dbo].[Employee] ([EmployeeCode], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [ManagerId]) 
VALUES (N'PT-PRT-TI-000120', N'Maria Antónia ', N'de Castro', N'e Sá', 1);
GO

INSERT [dbo].[EmployeeDepartment] ([EmployeeId], [DepartmentId]) 
VALUES (1, 1);

INSERT [dbo].[EmployeeDepartment] ([EmployeeId], [DepartmentId]) 
VALUES (2, 1);
GO

INSERT [dbo].[Request] ([EmployeeId], [RequestDate]) 
VALUES (2, CAST(N'2019-02-25' AS Date));
GO

INSERT [dbo].[Vacation] ([RequestId], [StartDate], [EndDate], [TotalDays]) 
VALUES (1, CAST(N'2019-03-04' AS Date), CAST(N'2019-03-08' AS Date), 5);

INSERT [dbo].[Vacation] ([RequestId], [StartDate], [EndDate], [TotalDays]) 
VALUES (1, CAST(N'2019-07-29' AS Date), CAST(N'2019-08-16' AS Date), 15);

INSERT [dbo].[Vacation] ([RequestId], [StartDate], [EndDate], [TotalDays]) 
VALUES (1, CAST(N'2019-12-23' AS Date), CAST(N'2020-01-03' AS Date), 8);
GO


INSERT [dbo].[Approval] ([VacationId], [ApprovalDate], [Approved])
VALUES (1, CAST(N'2019-03-04' AS Date), 1);

INSERT [dbo].[Approval] ([VacationId], [ApprovalDate], [Approved])
VALUES (2, CAST(N'2019-03-04' AS Date), 1);

INSERT [dbo].[Approval] ([VacationId], [ApprovalDate], [Approved])
VALUES (3, CAST(N'2019-03-04' AS Date), 0);
GO