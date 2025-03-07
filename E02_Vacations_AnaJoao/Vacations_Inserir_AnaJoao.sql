
-- 14. Crie um ficheiro de script para inserir dois departamentos da empresa: Comercial e Administração. Dê- lhe o nome Vacations_Inserir_Nome.sql.


USE [Vacations_AnaJoao];
GO

INSERT [dbo].[Department] ([Department]) 
VALUES (N'Comercial');

INSERT [dbo].[Department] ([Department]) 
VALUES (N'Administração');
GO


-- 16. Use o ficheiro criado anteriormente, Vacations_Inserir_Nome.sql , para inserir dois novos formulários

-- Request form 2


INSERT [dbo].[Department] ([Department]) 
VALUES (N'Financeiro');
GO

INSERT [dbo].[Employee] ([EmployeeCode], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [ManagerId]) 
VALUES (N'PT-PRT-HR-000003', N'Mário ', N'', N'Ramos', NULL);

INSERT [dbo].[Employee] ([EmployeeCode], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [ManagerId]) 
VALUES (N'PT-LIS-FI-00083', N'Rui ', N'Pina', N'de Oliveira', 3);
GO

INSERT [dbo].[EmployeeDepartment] ([EmployeeId], [DepartmentId]) 
VALUES (3, 4);

INSERT [dbo].[EmployeeDepartment] ([EmployeeId], [DepartmentId]) 
VALUES (4, 4);
GO

INSERT [dbo].[Request] ([EmployeeId], [RequestDate]) 
VALUES (4, CAST(N'2019-02-26' AS Date));
GO

INSERT [dbo].[Vacation] ([RequestId], [StartDate], [EndDate], [TotalDays]) 
VALUES (2, CAST(N'2019-04-15' AS Date), CAST(N'2019-04-19' AS Date), 6);

INSERT [dbo].[Vacation] ([RequestId], [StartDate], [EndDate], [TotalDays]) 
VALUES (2, CAST(N'2019-07-29' AS Date), CAST(N'2019-08-21' AS Date), 27);
GO

INSERT [dbo].[Approval] ([VacationId], [ApprovalDate], [Approved])
VALUES (1, CAST(N'2019-03-06' AS Date), 0);

INSERT [dbo].[Approval] ([VacationId], [ApprovalDate], [Approved])
VALUES (2, CAST(N'2019-03-06' AS Date), 1);
GO

-- Request form 3


INSERT [dbo].[Department] ([Department]) 
VALUES (N'Administrativo');
GO

INSERT [dbo].[Employee] ([EmployeeCode], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [ManagerId]) 
VALUES (N'PT-LIS-FI-00083', N'Maria Teresa ', N'Vale', N'dos Santos', 3);
GO

INSERT [dbo].[EmployeeDepartment] ([EmployeeId], [DepartmentId]) 
VALUES (3, 5);

INSERT [dbo].[EmployeeDepartment] ([EmployeeId], [DepartmentId]) 
VALUES (5, 5);
GO

INSERT [dbo].[Request] ([EmployeeId], [RequestDate]) 
VALUES (5, CAST(N'2019-03-04' AS Date));
GO

INSERT [dbo].[Vacation] ([RequestId], [StartDate], [EndDate], [TotalDays]) 
VALUES (3, CAST(N'2019-02-04' AS Date), CAST(N'2019-02-15' AS Date), NULL);

INSERT [dbo].[Vacation] ([RequestId], [StartDate], [EndDate], [TotalDays]) 
VALUES (3, CAST(N'2019-07-29' AS Date), CAST(N'2019-07-31' AS Date), NULL);

INSERT [dbo].[Vacation] ([RequestId], [StartDate], [EndDate], [TotalDays]) 
VALUES (3, CAST(N'2019-12-23' AS Date), CAST(N'2019-12-31' AS Date), NULL);
GO

INSERT [dbo].[Approval] ([VacationId], [ApprovalDate], [Approved])
VALUES (1, CAST(N'2019-03-13' AS Date), 1);

INSERT [dbo].[Approval] ([VacationId], [ApprovalDate], [Approved])
VALUES (2, CAST(N'2019-03-13' AS Date), 1);

INSERT [dbo].[Approval] ([VacationId], [ApprovalDate], [Approved])
VALUES (3, CAST(N'2019-03-13' AS Date), 0);
GO