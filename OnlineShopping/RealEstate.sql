USE [master]
GO
/****** Object:  Database [RealEstate]    Script Date: 10/30/2017 10:34:40 PM ******/
CREATE DATABASE [RealEstate]
GO
ALTER DATABASE [RealEstate] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RealEstate].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RealEstate] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RealEstate] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RealEstate] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RealEstate] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RealEstate] SET ARITHABORT OFF 
GO
ALTER DATABASE [RealEstate] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RealEstate] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [RealEstate] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RealEstate] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RealEstate] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RealEstate] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RealEstate] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RealEstate] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RealEstate] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RealEstate] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RealEstate] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RealEstate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RealEstate] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RealEstate] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RealEstate] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RealEstate] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RealEstate] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RealEstate] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RealEstate] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RealEstate] SET  MULTI_USER 
GO
ALTER DATABASE [RealEstate] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RealEstate] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RealEstate] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RealEstate] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [RealEstate]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 10/30/2017 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NOT NULL,
	[PropertyTypeId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[DateUp] [datetime] NOT NULL,
	[DateExpire] [datetime] NULL,
	[MinSquare] [decimal](8, 2) NOT NULL,
	[AreaSize] [decimal](8, 2) NOT NULL,
	[Bedroom] [int] NOT NULL,
	[Bathroom] [int] NOT NULL,
	[Tier] [int] NOT NULL,
	[DirectionId] [int] NOT NULL,
	[Price] [decimal](15, 2) NOT NULL,
	[PictureId] [int] NOT NULL,
	[Desctiption] [ntext] NULL,
	[ContactId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Priority] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[Views] [int] NOT NULL,
 CONSTRAINT [PK_Articles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cities]    Script Date: 10/30/2017 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 10/30/2017 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ContactName] [nvarchar](150) NOT NULL,
	[Phone] [varchar](30) NULL,
	[Email] [varchar](150) NULL,
	[Address] [nvarchar](250) NULL,
	[GoogleMap] [varchar](250) NULL,
	[MoreInfo] [nvarchar](max) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Directions]    Script Date: 10/30/2017 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directions](
	[Id] [int] NOT NULL,
	[DirectionName] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Directions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Districts]    Script Date: 10/30/2017 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Districts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityId] [int] NOT NULL,
	[DistrictName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Districts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LevelPermissions]    Script Date: 10/30/2017 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LevelPermissions](
	[Id] [int] NOT NULL,
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
/****** Object:  Table [dbo].[News]    Script Date: 10/30/2017 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Summary] [nvarchar](500) NULL,
	[Details] [ntext] NOT NULL,
	[Picture] [varchar](250) NOT NULL,
	[DateUp] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[Views] [int] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 10/30/2017 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pictures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NOT NULL,
	[Url] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Picture] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropertyTypes]    Script Date: 10/30/2017 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyTypeName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PropertyTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Types]    Script Date: 10/30/2017 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLevels]    Script Date: 10/30/2017 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLevels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserLevels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/30/2017 10:34:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] NOT NULL,
	[LoginName] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Email] [varchar](150) NULL,
	[Phone] [varchar](30) NULL,
	[Address] [nvarchar](250) NULL,
	[LevelId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Directions] ([Id], [DirectionName]) VALUES (0, N'Unspecified')
INSERT [dbo].[Directions] ([Id], [DirectionName]) VALUES (1, N'North')
INSERT [dbo].[Directions] ([Id], [DirectionName]) VALUES (2, N'East')
INSERT [dbo].[Directions] ([Id], [DirectionName]) VALUES (3, N'South')
INSERT [dbo].[Directions] ([Id], [DirectionName]) VALUES (4, N'West')
INSERT [dbo].[Directions] ([Id], [DirectionName]) VALUES (5, N'Northeast ')
INSERT [dbo].[Directions] ([Id], [DirectionName]) VALUES (6, N'Southeast')
INSERT [dbo].[Directions] ([Id], [DirectionName]) VALUES (7, N'Southwest')
INSERT [dbo].[Directions] ([Id], [DirectionName]) VALUES (8, N'Northwest')
SET IDENTITY_INSERT [dbo].[PropertyTypes] ON 

INSERT [dbo].[PropertyTypes] ([Id], [PropertyTypeName]) VALUES (1, N'Office')
INSERT [dbo].[PropertyTypes] ([Id], [PropertyTypeName]) VALUES (2, N'Industrial')
INSERT [dbo].[PropertyTypes] ([Id], [PropertyTypeName]) VALUES (3, N'Retail')
INSERT [dbo].[PropertyTypes] ([Id], [PropertyTypeName]) VALUES (4, N'Apartment')
INSERT [dbo].[PropertyTypes] ([Id], [PropertyTypeName]) VALUES (5, N'House')
INSERT [dbo].[PropertyTypes] ([Id], [PropertyTypeName]) VALUES (6, N'Villas')
INSERT [dbo].[PropertyTypes] ([Id], [PropertyTypeName]) VALUES (7, N'Hotels')
INSERT [dbo].[PropertyTypes] ([Id], [PropertyTypeName]) VALUES (8, N'Land')
SET IDENTITY_INSERT [dbo].[PropertyTypes] OFF
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([Id], [TypeName]) VALUES (1, N'For rent')
INSERT [dbo].[Types] ([Id], [TypeName]) VALUES (2, N'For sale')
SET IDENTITY_INSERT [dbo].[Types] OFF
ALTER TABLE [dbo].[Articles] ADD  CONSTRAINT [DF_Articles_MinSquare]  DEFAULT ((0)) FOR [MinSquare]
GO
ALTER TABLE [dbo].[Articles] ADD  CONSTRAINT [DF_Articles_AreaSize]  DEFAULT ((0)) FOR [AreaSize]
GO
ALTER TABLE [dbo].[Articles] ADD  CONSTRAINT [DF_Articles_Bedroom]  DEFAULT ((0)) FOR [Bedroom]
GO
ALTER TABLE [dbo].[Articles] ADD  CONSTRAINT [DF_Articles_Bathroom]  DEFAULT ((0)) FOR [Bathroom]
GO
ALTER TABLE [dbo].[Articles] ADD  CONSTRAINT [DF_Articles_Tier]  DEFAULT ((0)) FOR [Tier]
GO
ALTER TABLE [dbo].[Articles] ADD  CONSTRAINT [DF_Articles_Direction]  DEFAULT ((0)) FOR [DirectionId]
GO
ALTER TABLE [dbo].[Articles] ADD  CONSTRAINT [DF_Articles_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Articles] ADD  CONSTRAINT [DF_Articles_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Articles] ADD  CONSTRAINT [DF_Articles_Views]  DEFAULT ((0)) FOR [Views]
GO
ALTER TABLE [dbo].[LevelPermissions] ADD  CONSTRAINT [DF_LevelPermissions_AllowAdd]  DEFAULT ((0)) FOR [AllowAdd]
GO
ALTER TABLE [dbo].[LevelPermissions] ADD  CONSTRAINT [DF_LevelPermissions_AllowEdit]  DEFAULT ((0)) FOR [AllowEdit]
GO
ALTER TABLE [dbo].[LevelPermissions] ADD  CONSTRAINT [DF_LevelPermissions_AllowDelete]  DEFAULT ((0)) FOR [AllowDelete]
GO
ALTER TABLE [dbo].[LevelPermissions] ADD  CONSTRAINT [DF_LevelPermissions_AllowView]  DEFAULT ((0)) FOR [AllowView]
GO
ALTER TABLE [dbo].[LevelPermissions] ADD  CONSTRAINT [DF_LevelPermissions_AllowAllList]  DEFAULT ((0)) FOR [AllowFullList]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_Views]  DEFAULT ((0)) FOR [Views]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Cities]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Contacts] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contacts] ([Id])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Contacts]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Directions] FOREIGN KEY([DirectionId])
REFERENCES [dbo].[Directions] ([Id])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Directions]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Districts] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[Districts] ([Id])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Districts]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Pictures] FOREIGN KEY([PictureId])
REFERENCES [dbo].[Pictures] ([Id])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Pictures]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_PropertyTypes] FOREIGN KEY([PropertyTypeId])
REFERENCES [dbo].[PropertyTypes] ([Id])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_PropertyTypes]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Types] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Types] ([Id])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Types]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Users]
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_Users]
GO
ALTER TABLE [dbo].[Districts]  WITH CHECK ADD  CONSTRAINT [FK_Districts_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Districts] CHECK CONSTRAINT [FK_Districts_Cities]
GO
ALTER TABLE [dbo].[LevelPermissions]  WITH CHECK ADD  CONSTRAINT [FK_LevelPermissions_UserLevels] FOREIGN KEY([LevelId])
REFERENCES [dbo].[UserLevels] ([Id])
GO
ALTER TABLE [dbo].[LevelPermissions] CHECK CONSTRAINT [FK_LevelPermissions_UserLevels]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Users]
GO
ALTER TABLE [dbo].[Pictures]  WITH CHECK ADD  CONSTRAINT [FK_Pictures_Articles] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Articles] ([Id])
GO
ALTER TABLE [dbo].[Pictures] CHECK CONSTRAINT [FK_Pictures_Articles]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserLevels] FOREIGN KEY([LevelId])
REFERENCES [dbo].[UserLevels] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserLevels]
GO
USE [master]
GO
ALTER DATABASE [RealEstate] SET  READ_WRITE 
GO
