USE [master]
GO
/****** Object:  Database [MyStoreDB]    Script Date: 3/8/2023 8:56:10 AM ******/
CREATE DATABASE [MyStoreDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyStoreDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyStoreDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyStoreDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyStoreDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MyStoreDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyStoreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyStoreDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyStoreDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyStoreDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyStoreDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyStoreDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyStoreDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyStoreDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyStoreDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyStoreDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyStoreDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyStoreDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyStoreDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyStoreDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyStoreDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyStoreDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyStoreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyStoreDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyStoreDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyStoreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyStoreDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyStoreDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyStoreDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyStoreDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MyStoreDB] SET  MULTI_USER 
GO
ALTER DATABASE [MyStoreDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyStoreDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyStoreDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyStoreDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyStoreDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyStoreDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyStoreDB', N'ON'
GO
ALTER DATABASE [MyStoreDB] SET QUERY_STORE = OFF
GO
USE [MyStoreDB]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/8/2023 8:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Street] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 3/8/2023 8:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] NULL,
	[DepartmentName] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/8/2023 8:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](25) NULL,
	[Active] [int] NULL,
	[StoreID] [int] NULL,
	[ManagerID] [int] NULL,
	[Salary] [decimal](10, 2) NULL,
	[SalaryType] [char](1) NULL,
	[DepartmentID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/8/2023 8:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] NULL,
	[ProductName] [varchar](50) NULL,
	[ProductCategory] [varchar](50) NULL,
	[ItemPrice] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 3/8/2023 8:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[InvoiceID] [int] NULL,
	[CustomerID] [int] NULL,
	[SalesDate] [date] NULL,
	[StoreID] [int] NULL,
	[EmployeeID] [int] NULL,
	[SalesAmount] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesDetails]    Script Date: 3/8/2023 8:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesDetails](
	[InvoiceID] [int] NULL,
	[LineID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[ItemPrice] [decimal](10, 2) NULL,
	[Discount] [decimal](10, 2) NULL,
	[LineTotal] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 3/8/2023 8:56:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[StoreID] [nvarchar](50) NULL,
	[StoreName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Street] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[ZipCode] [varchar](10) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Phone], [Email], [Street], [City], [State], [ZipCode]) VALUES (1, N'Jonas', N'Walker', N'767-555-0113', N'jonas1@gmail.com', N'9273 Thorne Ave', NULL, N'NY', N'14127')
GO
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Phone], [Email], [Street], [City], [State], [ZipCode]) VALUES (2, N'Harish', N'Rao', N'451-555-0612', N'harish.rao@gmail.com', N'910 Vine Street', N'Cambell', N'CA', N'95008')
GO
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Phone], [Email], [Street], [City], [State], [ZipCode]) VALUES (3, N'Sudha', N'Sharma', N'892-555-0184', N'sudha@hotmail.com', N'769C Honey Creek St ', NULL, N'CA', N'90278')
GO
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Phone], [Email], [Street], [City], [State], [ZipCode]) VALUES (4, N'Hussain', N'Razaq', N'278-555-0186', N'hussain@hotmail.com', N'988 Pearl Lane ', N'Uniondale', N'NY', N'11553')
GO
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Phone], [Email], [Street], [City], [State], [ZipCode]) VALUES (5, N'Pamelia', N'Jackson', N'831-555-5554', N'pamelia.jackson@mystore.com', N'479 Chapel Court ', N'San Jose', N'CA', N'95127')
GO
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Phone], [Email], [Street], [City], [State], [ZipCode]) VALUES (6, N'George', N'Boyer', N'831-555-5556', N'george.boyer@mystore.com', N'182 Thorne Road ', N'Oxnard', N'CA', NULL)
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (1, N'Executive')
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (2, N'Finance')
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (3, N'Human Resources')
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (4, N'Marketing')
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (5, N'Purchasing')
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (1, N'Pamelia', N'Jackson', N'pamelia.jackson@mystore.com', N'831-555-5554', 1, 1, NULL, CAST(1000000.00 AS Decimal(10, 2)), N'M', 1)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (2, N'Kasha', N'David', N'kasha.david@mystore.com', N'831-555-5555', 1, 1, 1, CAST(120000.00 AS Decimal(10, 2)), N'M', 1)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (3, N'George', N'Boyer', N'george.boyer@mystore.com', N'831-555-5556', 1, 1, 2, CAST(40000.00 AS Decimal(10, 2)), N'M', 2)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (4, N'Mohan', N'Sharma', N'mohan.sharma@mystore.com', N'831-555-5557', 1, 2, 2, CAST(30000.00 AS Decimal(10, 2)), N'W', 3)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (5, N'Ramesh', N'Singh', N'ramesh.singh@mystore.com', N'516-379-4444', 1, 2, 1, CAST(55000.00 AS Decimal(10, 2)), N'W', 1)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (6, N'A. Scott', N'Wright', N'ascott0@adventure-works.com', N'992-555-0194', 1, 1, 2, CAST(70673.00 AS Decimal(10, 2)), N'M', 2)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (7, N'Alan', N'Brewer', N'alan0@adventure-works.com', N'438-555-0172', 1, 1, 2, CAST(48000.00 AS Decimal(10, 2)), N'M', 2)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (8, N'Alejandro', N'McGuel', N'alejandro0@adventure-works.com', N'668-555-0130', 1, 1, 2, CAST(45000.00 AS Decimal(10, 2)), N'M', 3)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (9, N'Alex', N'Nayberg', N'alex0@adventure-works.com', N'819-555-0198', 1, 1, 2, CAST(30000.00 AS Decimal(10, 2)), N'M', 3)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (10, N'Alice', N'Ciccu', N'alice0@adventure-works.com', N'333-555-0173', 1, 1, 2, CAST(33000.00 AS Decimal(10, 2)), N'M', 3)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (11, N'Amy', N'Alberts', N'amy0@adventure-works.com', N'775-555-0164', 1, 1, 2, CAST(144303.00 AS Decimal(10, 2)), N'M', 3)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (12, N'Andreas', N'Berglund', N'andreas0@adventure-works.com', N'181-555-0124', 1, 1, 2, CAST(31731.00 AS Decimal(10, 2)), N'M', 5)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (13, N'Andrew', N'Cencini', N'andrew1@adventure-works.com', N'207-555-0192', 1, 1, 2, CAST(30000.00 AS Decimal(10, 2)), N'M', 5)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (14, N'Andrew', N'Hill', N'andrew0@adventure-works.com', N'908-555-0159', 1, 1, 2, CAST(75000.00 AS Decimal(10, 2)), N'M', 4)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (15, N'Andy', N'Ruth', N'andy0@adventure-works.com', N'118-555-0110', 1, 1, 2, CAST(28500.00 AS Decimal(10, 2)), N'M', 3)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (16, N'Angela', N'Barbariol', N'angela0@adventure-works.com', N'150-555-0194', 1, 2, 5, CAST(33000.00 AS Decimal(10, 2)), N'W', 4)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (17, N'Anibal', N'Sousa', N'anibal0@adventure-works.com', N'106-555-0120', 1, 2, 5, CAST(42000.00 AS Decimal(10, 2)), N'W', 4)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (18, N'Annette', N'Hill', N'annette0@adventure-works.com', N'125-555-0196', 1, 2, 5, CAST(38250.00 AS Decimal(10, 2)), N'W', 4)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (19, N'Annik', N'Stahl', N'annik0@adventure-works.com', N'499-555-0125', 1, 2, 5, CAST(37350.00 AS Decimal(10, 2)), N'W', 3)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (20, N'Arvind', N'Rao', N'arvind0@adventure-works.com', N'848-555-0163', 1, 2, 5, CAST(45000.00 AS Decimal(10, 2)), N'W', 3)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (21, N'Ashvini', N'Sharma', N'ashvini0@adventure-works.com', N'656-555-0119', 1, 2, 5, CAST(97356.00 AS Decimal(10, 2)), N'W', 5)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (22, N'Barbara', N'Decker', N'barbara0@adventure-works.com', N'119-555-0192', 1, 2, 5, CAST(42000.00 AS Decimal(10, 2)), N'W', 5)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (23, N'Barbara', N'Moreland', N'barbara1@adventure-works.com', N'822-555-0145', 1, 2, 5, CAST(79327.00 AS Decimal(10, 2)), N'W', 5)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (24, N'Baris', N'Cetinok', N'baris0@adventure-works.com', N'164-555-0114', 1, 2, 5, CAST(45000.00 AS Decimal(10, 2)), N'W', 2)
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Email], [Phone], [Active], [StoreID], [ManagerID], [Salary], [SalaryType], [DepartmentID]) VALUES (25, N'Barry', N'Johnson', N'barry0@adventure-works.com', N'206-555-0180', 1, 2, 5, CAST(40350.00 AS Decimal(10, 2)), N'W', 2)
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCategory], [ItemPrice]) VALUES (1, N'Biscuit', N'Bakery', CAST(80.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCategory], [ItemPrice]) VALUES (2, N'Bread', N'Bakery', CAST(50.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCategory], [ItemPrice]) VALUES (3, N'Bun', N'Bakery', CAST(15.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCategory], [ItemPrice]) VALUES (4, N'Cake', N'Bakery', CAST(110.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCategory], [ItemPrice]) VALUES (5, N'Coke', N'Beverages', CAST(45.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCategory], [ItemPrice]) VALUES (6, N'Health Drink', N'Beverages', CAST(90.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCategory], [ItemPrice]) VALUES (7, N'Chicken', N'Eggs, Meat & Fish', CAST(300.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCategory], [ItemPrice]) VALUES (8, N'Egg', N'Eggs, Meat & Fish', CAST(10.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCategory], [ItemPrice]) VALUES (9, N'Fish', N'Eggs, Meat & Fish', CAST(250.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCategory], [ItemPrice]) VALUES (10, N'Mutton', N'Eggs, Meat & Fish', CAST(540.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCategory], [ItemPrice]) VALUES (11, N'Wheat Flour', N'Food Grains', CAST(40.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCategory], [ItemPrice]) VALUES (12, N'White Flour', N'Food Grains', CAST(43.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCategory], [ItemPrice]) VALUES (13, N'Dal', N'Food Grains', CAST(180.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCategory], [ItemPrice]) VALUES (14, N'Pulses', N'Food Grains', CAST(195.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCategory], [ItemPrice]) VALUES (15, N'Rice', N'Food Grains', CAST(85.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCategory], [ItemPrice]) VALUES (16, N'Chocolate', N'Snacks', CAST(25.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCategory], [ItemPrice]) VALUES (17, N'Cookies', N'Snacks', CAST(42.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCategory], [ItemPrice]) VALUES (18, N'Noodles', N'Snacks', CAST(120.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Sales] ([InvoiceID], [CustomerID], [SalesDate], [StoreID], [EmployeeID], [SalesAmount]) VALUES (1, 1, CAST(N'2022-06-01' AS Date), 1, 2, CAST(1259.63 AS Decimal(10, 2)))
GO
INSERT [dbo].[Sales] ([InvoiceID], [CustomerID], [SalesDate], [StoreID], [EmployeeID], [SalesAmount]) VALUES (2, 4, CAST(N'2022-06-01' AS Date), 2, 5, CAST(49.95 AS Decimal(10, 2)))
GO
INSERT [dbo].[Sales] ([InvoiceID], [CustomerID], [SalesDate], [StoreID], [EmployeeID], [SalesAmount]) VALUES (3, 5, CAST(N'2022-06-02' AS Date), 2, 4, CAST(14.95 AS Decimal(10, 2)))
GO
INSERT [dbo].[Sales] ([InvoiceID], [CustomerID], [SalesDate], [StoreID], [EmployeeID], [SalesAmount]) VALUES (4, 6, CAST(N'2022-06-02' AS Date), 1, 1, CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[Sales] ([InvoiceID], [CustomerID], [SalesDate], [StoreID], [EmployeeID], [SalesAmount]) VALUES (5, 3, CAST(N'2022-06-02' AS Date), 1, 2, CAST(1121.88 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (1, 2, 8, 2, CAST(10.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(10, 2)), CAST(19.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (1, 3, 10, 2, CAST(540.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(10, 2)), CAST(1079.95 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (1, 4, 16, 2, CAST(25.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(10, 2)), CAST(49.95 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (1, 5, 4, 1, CAST(110.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(109.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (2, 2, 16, 2, CAST(25.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(10, 2)), CAST(49.95 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (3, 1, 3, 1, CAST(15.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(10, 2)), CAST(14.95 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (4, 1, 2, 2, CAST(50.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(99.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (5, 1, 10, 2, CAST(540.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(10, 2)), CAST(1079.95 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (5, 2, 17, 1, CAST(42.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(10, 2)), CAST(41.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (6, 1, 18, 1, CAST(120.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(10, 2)), CAST(119.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (6, 2, 12, 2, CAST(43.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(10, 2)), CAST(85.95 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (6, 4, 3, 2, CAST(15.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(10, 2)), CAST(29.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (6, 5, 9, 2, CAST(250.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(10, 2)), CAST(499.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (7, 1, 15, 1, CAST(85.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(10, 2)), CAST(84.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (7, 2, 3, 1, CAST(15.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(14.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (7, 3, 17, 2, CAST(42.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(83.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (9, 1, 7, 2, CAST(300.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(599.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (10, 1, 14, 1, CAST(195.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(194.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (11, 1, 8, 1, CAST(10.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(10, 2)), CAST(9.95 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (11, 3, 16, 2, CAST(25.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(49.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (12, 1, 4, 2, CAST(110.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(219.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (12, 2, 11, 1, CAST(40.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(10, 2)), CAST(39.95 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (13, 1, 13, 1, CAST(180.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(179.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (13, 2, 17, 2, CAST(42.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(10, 2)), CAST(83.95 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (13, 4, 16, 2, CAST(25.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(10, 2)), CAST(49.95 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (14, 1, 6, 1, CAST(90.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(10, 2)), CAST(89.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (15, 1, 12, 2, CAST(43.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(10, 2)), CAST(85.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (15, 2, 8, 1, CAST(10.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(10, 2)), CAST(9.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (15, 3, 18, 2, CAST(120.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(10, 2)), CAST(239.95 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (16, 1, 8, 1, CAST(10.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(9.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (16, 3, 13, 2, CAST(180.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(10, 2)), CAST(359.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (16, 4, 14, 1, CAST(195.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(10, 2)), CAST(194.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (17, 1, 8, 1, CAST(10.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(10, 2)), CAST(9.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (17, 3, 5, 1, CAST(45.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(44.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (18, 1, 2, 2, CAST(50.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(99.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (18, 3, 7, 1, CAST(300.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(299.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (18, 5, 9, 2, CAST(250.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), CAST(499.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (19, 1, 10, 1, CAST(540.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(10, 2)), CAST(539.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (19, 2, 9, 2, CAST(250.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(499.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (20, 1, 9, 1, CAST(250.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(10, 2)), CAST(249.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[SalesDetails] ([InvoiceID], [LineID], [ProductID], [Quantity], [ItemPrice], [Discount], [LineTotal]) VALUES (20, 2, 10, 2, CAST(540.00 AS Decimal(10, 2)), CAST(0.07 AS Decimal(10, 2)), CAST(1079.93 AS Decimal(10, 2)))
GO
INSERT [dbo].[Store] ([StoreID], [StoreName], [Phone], [Email], [Street], [City], [State], [ZipCode]) VALUES (N'1', N'Santa Cruz Grocery', N'(831) 476-4321', N'santacruz@mystore.shop', N'3700 Portola Drive', N'Santa Cruz', N'CA', N'95060')
GO
INSERT [dbo].[Store] ([StoreID], [StoreName], [Phone], [Email], [Street], [City], [State], [ZipCode]) VALUES (N'2', N'Baldwin Grocery', N'(516) 379-8888', N'baldwin@mystore.shop', N'4200 Chestnut Lane', N'Baldwin', N'NY', N'11432')
GO
INSERT [dbo].[Store] ([StoreID], [StoreName], [Phone], [Email], [Street], [City], [State], [ZipCode]) VALUES (N'3', N'Rowlett Grocery', N'(972) 530-5555', N'rowlett@mystore.shop', N'8000 Fairway Avenue', N'Rowlett', N'TX', N'75088')
GO
INSERT [dbo].[Store] ([StoreID], [StoreName], [Phone], [Email], [Street], [City], [State], [ZipCode]) VALUES (N'4', N'Phoenix Grocery', N'(602) 630-6666', N'phoenix.gr@mystore.shop', N'7001 Central Avenue', N'Phoenix', N'AZ', N'85012')
GO
USE [master]
GO
ALTER DATABASE [MyStoreDB] SET  READ_WRITE 
GO
