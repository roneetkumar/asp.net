USE [master]
GO
/****** Object:  Database [PropertyRentalDB]    Script Date: 4/18/2020 9:58:52 PM ******/
CREATE DATABASE [PropertyRentalDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PropertyRentalDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PropertyRentalDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PropertyRentalDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PropertyRentalDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PropertyRentalDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PropertyRentalDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PropertyRentalDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PropertyRentalDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PropertyRentalDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PropertyRentalDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PropertyRentalDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET RECOVERY FULL 
GO
ALTER DATABASE [PropertyRentalDB] SET  MULTI_USER 
GO
ALTER DATABASE [PropertyRentalDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PropertyRentalDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PropertyRentalDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PropertyRentalDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PropertyRentalDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PropertyRentalDB', N'ON'
GO
ALTER DATABASE [PropertyRentalDB] SET QUERY_STORE = OFF
GO
USE [PropertyRentalDB]
GO
/****** Object:  Table [dbo].[Appartments]    Script Date: 4/18/2020 9:58:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appartments](
	[AppartmentId] [int] IDENTITY(1000,1) NOT NULL,
	[NumberOfRoom] [int] NOT NULL,
	[NumberOfBath] [int] NOT NULL,
	[NumberOfParking] [int] NOT NULL,
	[FloorNum] [int] NOT NULL,
	[PricePerMonth] [int] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[RentStatus] [nvarchar](30) NOT NULL,
	[BuildingId] [int] NOT NULL,
 CONSTRAINT [PK_Appartments] PRIMARY KEY CLUSTERED 
(
	[AppartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 4/18/2020 9:58:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentId] [int] IDENTITY(1000,1) NOT NULL,
	[Schedule] [date] NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[AttendingPerson] [nvarchar](30) NOT NULL,
	[TenantId] [int] NOT NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[AppointmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 4/18/2020 9:58:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buildings](
	[BuildingId] [int] IDENTITY(1000,1) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[PostCode] [nvarchar](10) NOT NULL,
	[TotalOfFloor] [int] NOT NULL,
	[NumOfAppartment] [int] NOT NULL,
	[BuildYear] [date] NOT NULL,
 CONSTRAINT [PK_Buildings] PRIMARY KEY CLUSTERED 
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 4/18/2020 9:58:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageId] [int] IDENTITY(1000,1) NOT NULL,
	[Content] [nvarchar](100) NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[TenantId] [int] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenants]    Script Date: 4/18/2020 9:58:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenants](
	[TenantId] [int] IDENTITY(1000,1) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[PhoneNumber] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](30) NULL,
 CONSTRAINT [PK_Tenants] PRIMARY KEY CLUSTERED 
(
	[TenantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appartments] ON 

INSERT [dbo].[Appartments] ([AppartmentId], [NumberOfRoom], [NumberOfBath], [NumberOfParking], [FloorNum], [PricePerMonth], [Description], [RentStatus], [BuildingId]) VALUES (1000, 4, 2, 2, 3, 1800, N'very big', N'available', 1001)
INSERT [dbo].[Appartments] ([AppartmentId], [NumberOfRoom], [NumberOfBath], [NumberOfParking], [FloorNum], [PricePerMonth], [Description], [RentStatus], [BuildingId]) VALUES (1001, 3, 1, 0, 2, 1000, N'one room is an office', N'available', 1002)
INSERT [dbo].[Appartments] ([AppartmentId], [NumberOfRoom], [NumberOfBath], [NumberOfParking], [FloorNum], [PricePerMonth], [Description], [RentStatus], [BuildingId]) VALUES (1002, 5, 1, 0, 1, 2300, N'vary vary big house ,renovated', N'available', 1001)
INSERT [dbo].[Appartments] ([AppartmentId], [NumberOfRoom], [NumberOfBath], [NumberOfParking], [FloorNum], [PricePerMonth], [Description], [RentStatus], [BuildingId]) VALUES (1003, 2, 1, 0, 3, 1300, N'shinning ,renovated', N'available', 1002)
INSERT [dbo].[Appartments] ([AppartmentId], [NumberOfRoom], [NumberOfBath], [NumberOfParking], [FloorNum], [PricePerMonth], [Description], [RentStatus], [BuildingId]) VALUES (1004, 5, 1, 1, 1, 2000, N'vary big window ,renovated', N'available', 1005)
INSERT [dbo].[Appartments] ([AppartmentId], [NumberOfRoom], [NumberOfBath], [NumberOfParking], [FloorNum], [PricePerMonth], [Description], [RentStatus], [BuildingId]) VALUES (1005, 4, 1, 1, 4, 1500, N'with a lot murble ,renovated', N'available', 1001)
INSERT [dbo].[Appartments] ([AppartmentId], [NumberOfRoom], [NumberOfBath], [NumberOfParking], [FloorNum], [PricePerMonth], [Description], [RentStatus], [BuildingId]) VALUES (1006, 5, 2, 1, 5, 1800, N'can be discuse the price ,renovated', N'rent out', 1000)
INSERT [dbo].[Appartments] ([AppartmentId], [NumberOfRoom], [NumberOfBath], [NumberOfParking], [FloorNum], [PricePerMonth], [Description], [RentStatus], [BuildingId]) VALUES (1007, 3, 2, 1, 1, 1100, N' big appartment ,renovated', N'available', 1002)
INSERT [dbo].[Appartments] ([AppartmentId], [NumberOfRoom], [NumberOfBath], [NumberOfParking], [FloorNum], [PricePerMonth], [Description], [RentStatus], [BuildingId]) VALUES (1008, 3, 1, 1, 1, 1200, N'big appartment ,renovated', N'available', 1001)
INSERT [dbo].[Appartments] ([AppartmentId], [NumberOfRoom], [NumberOfBath], [NumberOfParking], [FloorNum], [PricePerMonth], [Description], [RentStatus], [BuildingId]) VALUES (1009, 3, 1, 2, 1, 1200, N'near primary school ,renovated', N'available', 1003)
INSERT [dbo].[Appartments] ([AppartmentId], [NumberOfRoom], [NumberOfBath], [NumberOfParking], [FloorNum], [PricePerMonth], [Description], [RentStatus], [BuildingId]) VALUES (1010, 2, 1, 1, 1, 800, N'near gym and restaurant ,renovated', N' not available', 1001)
INSERT [dbo].[Appartments] ([AppartmentId], [NumberOfRoom], [NumberOfBath], [NumberOfParking], [FloorNum], [PricePerMonth], [Description], [RentStatus], [BuildingId]) VALUES (1011, 3, 1, 2, 1, 1400, N'be a good  ,renovated', N'available', 1006)
INSERT [dbo].[Appartments] ([AppartmentId], [NumberOfRoom], [NumberOfBath], [NumberOfParking], [FloorNum], [PricePerMonth], [Description], [RentStatus], [BuildingId]) VALUES (1012, 3, 2, 1, 1, 1200, N'vary vary big house ,renovated', N'rent out', 1004)
INSERT [dbo].[Appartments] ([AppartmentId], [NumberOfRoom], [NumberOfBath], [NumberOfParking], [FloorNum], [PricePerMonth], [Description], [RentStatus], [BuildingId]) VALUES (1013, 4, 1, 0, 1, 1700, N'vary big room ,renovated', N'available', 1000)
INSERT [dbo].[Appartments] ([AppartmentId], [NumberOfRoom], [NumberOfBath], [NumberOfParking], [FloorNum], [PricePerMonth], [Description], [RentStatus], [BuildingId]) VALUES (1014, 4, 3, 0, 1, 1600, N'vary quite big house ,renovated', N'available', 1004)
INSERT [dbo].[Appartments] ([AppartmentId], [NumberOfRoom], [NumberOfBath], [NumberOfParking], [FloorNum], [PricePerMonth], [Description], [RentStatus], [BuildingId]) VALUES (1015, 4, 1, 2, 1, 1300, N'big house with 2 parking places ', N'available', 1001)
SET IDENTITY_INSERT [dbo].[Appartments] OFF
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([AppointmentId], [Schedule], [Location], [AttendingPerson], [TenantId]) VALUES (1000, CAST(N'2009-01-02' AS Date), N'123,street stars', N'Manager1', 1000)
INSERT [dbo].[Appointments] ([AppointmentId], [Schedule], [Location], [AttendingPerson], [TenantId]) VALUES (1001, CAST(N'2010-02-03' AS Date), N'123,street stars', N'Manager4', 1005)
INSERT [dbo].[Appointments] ([AppointmentId], [Schedule], [Location], [AttendingPerson], [TenantId]) VALUES (1002, CAST(N'2010-04-04' AS Date), N'456,boul moutj', N'Manager2', 1007)
INSERT [dbo].[Appointments] ([AppointmentId], [Schedule], [Location], [AttendingPerson], [TenantId]) VALUES (1003, CAST(N'2010-05-06' AS Date), N'789,street sun', N'Manager3', 1002)
INSERT [dbo].[Appointments] ([AppointmentId], [Schedule], [Location], [AttendingPerson], [TenantId]) VALUES (1004, CAST(N'2010-09-10' AS Date), N'789,street sun', N'Manager2', 1008)
INSERT [dbo].[Appointments] ([AppointmentId], [Schedule], [Location], [AttendingPerson], [TenantId]) VALUES (1005, CAST(N'2011-07-07' AS Date), N'2455,boul seruter', N'Manager4', 1003)
INSERT [dbo].[Appointments] ([AppointmentId], [Schedule], [Location], [AttendingPerson], [TenantId]) VALUES (1006, CAST(N'2012-03-05' AS Date), N'102-567,street human', N'Manager1', 1001)
INSERT [dbo].[Appointments] ([AppointmentId], [Schedule], [Location], [AttendingPerson], [TenantId]) VALUES (1007, CAST(N'2012-03-05' AS Date), N'7865,avenue str', N'Manager3', 1009)
INSERT [dbo].[Appointments] ([AppointmentId], [Schedule], [Location], [AttendingPerson], [TenantId]) VALUES (1008, CAST(N'2013-01-02' AS Date), N'4538,avenue gytert', N'Manager2', 1005)
INSERT [dbo].[Appointments] ([AppointmentId], [Schedule], [Location], [AttendingPerson], [TenantId]) VALUES (1009, CAST(N'2013-09-19' AS Date), N'6785,street iuyte', N'Manager1', 1003)
SET IDENTITY_INSERT [dbo].[Appointments] OFF
SET IDENTITY_INSERT [dbo].[Buildings] ON 

INSERT [dbo].[Buildings] ([BuildingId], [Address], [PostCode], [TotalOfFloor], [NumOfAppartment], [BuildYear]) VALUES (1000, N'3456,upper lache Montreal', N'H4A1W2', 5, 12, CAST(N'2010-01-01' AS Date))
INSERT [dbo].[Buildings] ([BuildingId], [Address], [PostCode], [TotalOfFloor], [NumOfAppartment], [BuildYear]) VALUES (1001, N'1345,shernhook Montreal', N'H2B1M2', 4, 24, CAST(N'1936-01-01' AS Date))
INSERT [dbo].[Buildings] ([BuildingId], [Address], [PostCode], [TotalOfFloor], [NumOfAppartment], [BuildYear]) VALUES (1002, N'34756,chierrt lache Montreal', N'H3A4W2', 6, 78, CAST(N'1987-01-01' AS Date))
INSERT [dbo].[Buildings] ([BuildingId], [Address], [PostCode], [TotalOfFloor], [NumOfAppartment], [BuildYear]) VALUES (1003, N'3496,upper unpbu Montreal', N'H5M1W4', 3, 18, CAST(N'1969-01-01' AS Date))
INSERT [dbo].[Buildings] ([BuildingId], [Address], [PostCode], [TotalOfFloor], [NumOfAppartment], [BuildYear]) VALUES (1004, N'2456,sufng lache Montreal', N'H4A4Y3', 5, 21, CAST(N'2001-01-01' AS Date))
INSERT [dbo].[Buildings] ([BuildingId], [Address], [PostCode], [TotalOfFloor], [NumOfAppartment], [BuildYear]) VALUES (1005, N'3456,upper lache Montreal', N'H2A3G2', 4, 20, CAST(N'1970-01-01' AS Date))
INSERT [dbo].[Buildings] ([BuildingId], [Address], [PostCode], [TotalOfFloor], [NumOfAppartment], [BuildYear]) VALUES (1006, N'3456,updhr lache Montreal', N'H3B5S2', 2, 8, CAST(N'1952-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[Buildings] OFF
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([MessageId], [Content], [CreatedDate], [TenantId]) VALUES (1000, N'The property of street upper is this month.', CAST(N'2009-01-02' AS Date), 1000)
INSERT [dbo].[Messages] ([MessageId], [Content], [CreatedDate], [TenantId]) VALUES (1001, N'The payment of the propertyId 1002 is refused.', CAST(N'2009-03-01' AS Date), 1005)
INSERT [dbo].[Messages] ([MessageId], [Content], [CreatedDate], [TenantId]) VALUES (1002, N'renew property now is aviliable', CAST(N'2009-04-06' AS Date), 1007)
INSERT [dbo].[Messages] ([MessageId], [Content], [CreatedDate], [TenantId]) VALUES (1003, N'For increase the price', CAST(N'2009-05-08' AS Date), 1009)
INSERT [dbo].[Messages] ([MessageId], [Content], [CreatedDate], [TenantId]) VALUES (1004, N'this is a question about hot water', CAST(N'2009-07-09' AS Date), 1003)
SET IDENTITY_INSERT [dbo].[Messages] OFF
SET IDENTITY_INSERT [dbo].[Tenants] ON 

INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [PhoneNumber], [Email], [Password]) VALUES (1000, N'Hheer', N'Bwn', N'544-111-1234', N'Hens@gil.com', N'1010')
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [PhoneNumber], [Email], [Password]) VALUES (1001, N'Tom', N'Muersdgre', N'625-142-1234', N'yhhe@ghoo.com', N'1011')
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [PhoneNumber], [Email], [Password]) VALUES (1002, N'jurugr', N'Brown', N'354-162-1234', N'MaryBrown@gmail.com', N'1012')
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [PhoneNumber], [Email], [Password]) VALUES (1003, N'sfsgx', N'Bouchard', N'515-972-1234', N'Jenn@gmail.com', N'1013')
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [PhoneNumber], [Email], [Password]) VALUES (1004, N'Peter', N'Nguyen', N'514-772-1234', N'MRser@xmail.ca', N'1014')
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [PhoneNumber], [Email], [Password]) VALUES (1005, N'Hheer', N'Bwn', N'544-111-1234', N'sfrg@gil.com', N'1015')
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [PhoneNumber], [Email], [Password]) VALUES (1006, N'Tom', N'Muersdgre', N'625-142-1234', N'egrore@ghoo.com', N'1016')
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [PhoneNumber], [Email], [Password]) VALUES (1007, N'jugr', N'Brown', N'354-162-1234', N'dwn@gmail.ca', N'1017')
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [PhoneNumber], [Email], [Password]) VALUES (1008, N'Sam', N'Bouard', N'515-982-1234', N'leee@gmail.com', N'1018')
INSERT [dbo].[Tenants] ([TenantId], [FirstName], [LastName], [PhoneNumber], [Email], [Password]) VALUES (1009, N'Psgter', N'Ngufyen', N'574-772-1434', N'Mrsr@xmail.com', N'1019')
SET IDENTITY_INSERT [dbo].[Tenants] OFF
ALTER TABLE [dbo].[Appartments]  WITH CHECK ADD  CONSTRAINT [FK_Appartments_Buildings] FOREIGN KEY([BuildingId])
REFERENCES [dbo].[Buildings] ([BuildingId])
GO
ALTER TABLE [dbo].[Appartments] CHECK CONSTRAINT [FK_Appartments_Buildings]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Tenants] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenants] ([TenantId])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Tenants]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Tenants] FOREIGN KEY([MessageId])
REFERENCES [dbo].[Tenants] ([TenantId])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Tenants]
GO
USE [master]
GO
ALTER DATABASE [PropertyRentalDB] SET  READ_WRITE 
GO
