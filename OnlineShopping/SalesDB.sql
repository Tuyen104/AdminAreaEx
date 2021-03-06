USE [master]
GO
/****** Object:  Database [Sales]    Script Date: 1/6/2018 06:03:55 PM ******/
CREATE DATABASE [Sales]
GO
ALTER DATABASE [Sales] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sales].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sales] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sales] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sales] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sales] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sales] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sales] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Sales] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Sales] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sales] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sales] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sales] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sales] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sales] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sales] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sales] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sales] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sales] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sales] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sales] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sales] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sales] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sales] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sales] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sales] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sales] SET  MULTI_USER 
GO
ALTER DATABASE [Sales] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sales] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sales] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sales] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Sales]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/6/2018 06:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[TopicId] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 1/6/2018 06:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Password] [varchar](100) NULL,
	[Phone] [nvarchar](30) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[VIP] [int] NOT NULL,
 CONSTRAINT [PK_Customers_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 1/6/2018 06:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [nvarchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[EmployeeName] [nvarchar](50) NOT NULL,
	[Phone] [varchar](30) NULL,
	[Email] [nvarchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[LevelId] [int] NOT NULL,
	[LastLogin] [datetime] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LevelPermissions]    Script Date: 1/6/2018 06:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LevelPermissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LevelId] [int] NOT NULL,
	[TableName] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[AllowAdd] [bit] NOT NULL,
	[AllowEdit] [bit] NOT NULL,
	[AllowDelete] [bit] NOT NULL,
	[AllowView] [bit] NOT NULL,
	[AllowFullList] [bit] NOT NULL,
 CONSTRAINT [PK_LevelPermissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Levels]    Script Date: 1/6/2018 06:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Levels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Levels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 1/6/2018 06:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Unit] [nvarchar](20) NOT NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[Quantity] [decimal](18, 0) NOT NULL,
	[Discount] [decimal](18, 0) NOT NULL,
	[Tax] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/6/2018 06:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderCode] [nvarchar](20) NULL,
	[OrderDate] [datetime] NOT NULL,
	[CustomerId] [int] NULL,
	[ShippingId] [int] NULL,
	[Discount] [decimal](18, 0) NOT NULL,
	[Tax] [decimal](18, 0) NOT NULL,
	[ShippingFee] [decimal](18, 0) NOT NULL,
	[PaymentMethodId] [int] NULL,
	[EmployeeId] [int] NULL,
	[StatusId] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 1/6/2018 06:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MethodName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentMethods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 1/6/2018 06:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pictures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Url] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Picture] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/6/2018 06:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](150) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Unit] [nvarchar](20) NOT NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[Description] [ntext] NULL,
	[PictureId] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 1/6/2018 06:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShippingName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](150) NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 1/6/2018 06:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[Id] [int] NOT NULL,
	[StatusName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topics]    Script Date: 1/6/2018 06:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TopicName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Topcis] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CategoryName], [TopicId]) VALUES (1, N'Smart phones', 1)
INSERT [dbo].[Categories] ([Id], [CategoryName], [TopicId]) VALUES (2, N'Android Mobiles', 1)
INSERT [dbo].[Categories] ([Id], [CategoryName], [TopicId]) VALUES (3, N'Windows Mobiles', 1)
INSERT [dbo].[Categories] ([Id], [CategoryName], [TopicId]) VALUES (4, N'Refurbished Mobiles', 1)
INSERT [dbo].[Categories] ([Id], [CategoryName], [TopicId]) VALUES (5, N'All Mobile Accessories', 1)
INSERT [dbo].[Categories] ([Id], [CategoryName], [TopicId]) VALUES (6, N'Cases & Covers', 1)
INSERT [dbo].[Categories] ([Id], [CategoryName], [TopicId]) VALUES (7, N'Smart notebooks', 2)
INSERT [dbo].[Categories] ([Id], [CategoryName], [TopicId]) VALUES (8, N'Android Note Book', 2)
INSERT [dbo].[Categories] ([Id], [CategoryName], [TopicId]) VALUES (9, N'Windows Note Books', 2)
INSERT [dbo].[Categories] ([Id], [CategoryName], [TopicId]) VALUES (10, N'Refurbished Note Books', 2)
INSERT [dbo].[Categories] ([Id], [CategoryName], [TopicId]) VALUES (11, N'Note Books Accessories', 2)
INSERT [dbo].[Categories] ([Id], [CategoryName], [TopicId]) VALUES (12, N'Cases & Covers', 2)
INSERT [dbo].[Categories] ([Id], [CategoryName], [TopicId]) VALUES (13, N'Smart tablets', 3)
INSERT [dbo].[Categories] ([Id], [CategoryName], [TopicId]) VALUES (14, N'Android Tablets', 3)
INSERT [dbo].[Categories] ([Id], [CategoryName], [TopicId]) VALUES (15, N'Windows Tablets', 3)
INSERT [dbo].[Categories] ([Id], [CategoryName], [TopicId]) VALUES (16, N'Refurbished Tablets', 3)
INSERT [dbo].[Categories] ([Id], [CategoryName], [TopicId]) VALUES (18, N'Tablets Accessories', 3)
INSERT [dbo].[Categories] ([Id], [CategoryName], [TopicId]) VALUES (19, N'Cases & Covers', 3)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [CustomerName], [Email], [Password], [Phone], [Address], [VIP]) VALUES (1, N'abc', N'abc@gmail.com', N'123', N'897987', N'789789', 1)
INSERT [dbo].[Customers] ([Id], [CustomerName], [Email], [Password], [Phone], [Address], [VIP]) VALUES (2, N'gfdhj', N'hjdgh', N'gf', N'hjgf', N'jhgdf', 1)
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [LoginName], [Password], [EmployeeName], [Phone], [Email], [Address], [LevelId], [LastLogin]) VALUES (2, N'admin', N'123', N'ADMIN', N'09483240', N'897894573@fdsf.dsfdsf', N'sfgshifh', 1, NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Levels] ON 

INSERT [dbo].[Levels] ([Id], [LevelName]) VALUES (1, N'Admin')
INSERT [dbo].[Levels] ([Id], [LevelName]) VALUES (2, N'Manager')
INSERT [dbo].[Levels] ([Id], [LevelName]) VALUES (3, N'Seller')
SET IDENTITY_INSERT [dbo].[Levels] OFF

SET IDENTITY_INSERT [dbo].[Topics] ON 

INSERT [dbo].[Topics] ([Id], [TopicName]) VALUES (1, N'Smart Phone')
INSERT [dbo].[Topics] ([Id], [TopicName]) VALUES (2, N'Note Book')
INSERT [dbo].[Topics] ([Id], [TopicName]) VALUES (3, N'Tablets')
SET IDENTITY_INSERT [dbo].[Topics] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Employee__DB8464FF8A891409]    Script Date: 1/6/2018 06:03:55 PM ******/
ALTER TABLE [dbo].[Employees] ADD UNIQUE NONCLUSTERED 
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_Employees_Levels]    Script Date: 1/6/2018 06:03:55 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FK_Employees_Levels] ON [dbo].[Employees]
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_LevelLevelPermission]    Script Date: 1/6/2018 06:03:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_LevelLevelPermission] ON [dbo].[LevelPermissions]
(
	[LevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_OrderDetails_Orders]    Script Date: 1/6/2018 06:03:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_OrderDetails_Orders] ON [dbo].[OrderDetails]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_OrderDetails_Products]    Script Date: 1/6/2018 06:03:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_OrderDetails_Products] ON [dbo].[OrderDetails]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Products_Categories]    Script Date: 1/6/2018 06:03:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Products_Categories] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_Level]  DEFAULT ((0)) FOR [VIP]
GO
ALTER TABLE [dbo].[LevelPermissions] ADD  CONSTRAINT [DF_LevelPermissions_AllowAdd]  DEFAULT ((0)) FOR [AllowAdd]
GO
ALTER TABLE [dbo].[LevelPermissions] ADD  CONSTRAINT [DF_LevelPermissions_AllowEdit]  DEFAULT ((0)) FOR [AllowEdit]
GO
ALTER TABLE [dbo].[LevelPermissions] ADD  CONSTRAINT [DF_LevelPermissions_AllowDelete]  DEFAULT ((0)) FOR [AllowDelete]
GO
ALTER TABLE [dbo].[LevelPermissions] ADD  CONSTRAINT [DF_LevelPermissions_AllowView]  DEFAULT ((0)) FOR [AllowView]
GO
ALTER TABLE [dbo].[LevelPermissions] ADD  CONSTRAINT [DF_LevelPermissions_AllowFullList]  DEFAULT ((0)) FOR [AllowFullList]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Tax]  DEFAULT ((0)) FOR [Tax]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_ShippingFee]  DEFAULT ((0)) FOR [ShippingFee]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Topics] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topics] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Topics]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Levels] FOREIGN KEY([LevelId])
REFERENCES [dbo].[Levels] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Levels]
GO
ALTER TABLE [dbo].[LevelPermissions]  WITH CHECK ADD  CONSTRAINT [FK_LevelLevelPermission] FOREIGN KEY([LevelId])
REFERENCES [dbo].[Levels] ([Id])
GO
ALTER TABLE [dbo].[LevelPermissions] CHECK CONSTRAINT [FK_LevelLevelPermission]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_PaymentMethods] FOREIGN KEY([PaymentMethodId])
REFERENCES [dbo].[PaymentMethods] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_PaymentMethods]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shipping] FOREIGN KEY([ShippingId])
REFERENCES [dbo].[Shipping] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shipping]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Statuses] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Statuses] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Statuses]
GO
ALTER TABLE [dbo].[Pictures]  WITH CHECK ADD  CONSTRAINT [FK_Pictures_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Pictures] CHECK CONSTRAINT [FK_Pictures_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Pictures] FOREIGN KEY([PictureId])
REFERENCES [dbo].[Pictures] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Pictures]
GO
USE [master]
GO
ALTER DATABASE [Sales] SET  READ_WRITE 
GO
