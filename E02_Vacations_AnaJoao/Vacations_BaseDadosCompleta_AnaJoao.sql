USE [master]
GO
/****** Object:  Database [Vacations_AnaJoao]    Script Date: 12/04/2024 18:42:45 ******/
CREATE DATABASE [Vacations_AnaJoao]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OrderForm', FILENAME = N'C:\Restart11\Data\Vacations_AnaJoao.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OrderForm_log', FILENAME = N'C:\Restart11\Data\Vacations_AnaJoao_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Vacations_AnaJoao] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vacations_AnaJoao].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vacations_AnaJoao] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vacations_AnaJoao] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vacations_AnaJoao] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Vacations_AnaJoao] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vacations_AnaJoao] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET RECOVERY FULL 
GO
ALTER DATABASE [Vacations_AnaJoao] SET  MULTI_USER 
GO
ALTER DATABASE [Vacations_AnaJoao] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vacations_AnaJoao] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vacations_AnaJoao] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vacations_AnaJoao] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Vacations_AnaJoao] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Vacations_AnaJoao] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Vacations_AnaJoao', N'ON'
GO
ALTER DATABASE [Vacations_AnaJoao] SET QUERY_STORE = OFF
GO
USE [Vacations_AnaJoao]
GO
/****** Object:  Table [dbo].[Approval]    Script Date: 12/04/2024 18:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Approval](
	[ApprovalId] [int] IDENTITY(1,1) NOT NULL,
	[VacationId] [int] NOT NULL,
	[ApprovalDate] [date] NOT NULL,
	[Approved] [bit] NOT NULL,
 CONSTRAINT [PK_Approval] PRIMARY KEY CLUSTERED 
(
	[ApprovalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 12/04/2024 18:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[Department] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/04/2024 18:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeCode] [nvarchar](20) NOT NULL,
	[EmployeeFirstName] [nvarchar](50) NOT NULL,
	[EmployeeMiddleName] [nvarchar](50) NULL,
	[EmployeeLastName] [nvarchar](50) NOT NULL,
	[ManagerId] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeDepartment]    Script Date: 12/04/2024 18:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeDepartment](
	[EmployeeId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_DepartmentEmployee] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC,
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 12/04/2024 18:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[RequestId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[RequestDate] [date] NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vacation]    Script Date: 12/04/2024 18:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacation](
	[VacationId] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[TotalDays] [tinyint] NULL,
 CONSTRAINT [PK_Vacation] PRIMARY KEY CLUSTERED 
(
	[VacationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Approval] ON 

INSERT [dbo].[Approval] ([ApprovalId], [VacationId], [ApprovalDate], [Approved]) VALUES (1, 1, CAST(N'2019-03-04' AS Date), 1)
INSERT [dbo].[Approval] ([ApprovalId], [VacationId], [ApprovalDate], [Approved]) VALUES (2, 2, CAST(N'2019-03-04' AS Date), 1)
INSERT [dbo].[Approval] ([ApprovalId], [VacationId], [ApprovalDate], [Approved]) VALUES (3, 3, CAST(N'2019-03-04' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Approval] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentId], [Department]) VALUES (1, N'Tecnologias de Informação')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeId], [EmployeeCode], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [ManagerId]) VALUES (1, N'PT-PRT-HR-000012', N'Carolina ', N'Franco', N'de Lima', NULL)
INSERT [dbo].[Employee] ([EmployeeId], [EmployeeCode], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], [ManagerId]) VALUES (2, N'PT-PRT-TI-000120', N'Maria Antónia ', N'de Castro', N'e Sá', 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
INSERT [dbo].[EmployeeDepartment] ([EmployeeId], [DepartmentId]) VALUES (1, 1)
INSERT [dbo].[EmployeeDepartment] ([EmployeeId], [DepartmentId]) VALUES (2, 1)
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([RequestId], [EmployeeId], [RequestDate]) VALUES (1, 2, CAST(N'2019-02-25' AS Date))
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[Vacation] ON 

INSERT [dbo].[Vacation] ([VacationId], [RequestId], [StartDate], [EndDate], [TotalDays]) VALUES (1, 1, CAST(N'2019-03-04' AS Date), CAST(N'2019-03-08' AS Date), 5)
INSERT [dbo].[Vacation] ([VacationId], [RequestId], [StartDate], [EndDate], [TotalDays]) VALUES (2, 1, CAST(N'2019-07-29' AS Date), CAST(N'2019-08-16' AS Date), 15)
INSERT [dbo].[Vacation] ([VacationId], [RequestId], [StartDate], [EndDate], [TotalDays]) VALUES (3, 1, CAST(N'2019-12-23' AS Date), CAST(N'2020-01-03' AS Date), 8)
SET IDENTITY_INSERT [dbo].[Vacation] OFF
GO
ALTER TABLE [dbo].[Approval]  WITH CHECK ADD  CONSTRAINT [FK_Approval_Vacation] FOREIGN KEY([VacationId])
REFERENCES [dbo].[Vacation] ([VacationId])
GO
ALTER TABLE [dbo].[Approval] CHECK CONSTRAINT [FK_Approval_Vacation]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Employee]
GO
ALTER TABLE [dbo].[EmployeeDepartment]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDepartment_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[EmployeeDepartment] CHECK CONSTRAINT [FK_EmployeeDepartment_Department]
GO
ALTER TABLE [dbo].[EmployeeDepartment]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDepartment_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmployeeDepartment] CHECK CONSTRAINT [FK_EmployeeDepartment_Employee]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Employee]
GO
ALTER TABLE [dbo].[Vacation]  WITH CHECK ADD  CONSTRAINT [FK_Vacation_Request] FOREIGN KEY([RequestId])
REFERENCES [dbo].[Request] ([RequestId])
GO
ALTER TABLE [dbo].[Vacation] CHECK CONSTRAINT [FK_Vacation_Request]
GO
USE [master]
GO
ALTER DATABASE [Vacations_AnaJoao] SET  READ_WRITE 
GO
