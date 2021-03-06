USE [master]
GO
/****** Object:  Database [StudentCourseDB]    Script Date: 3/6/2020 10:52:38 AM ******/
CREATE DATABASE [StudentCourseDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentCourseDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\StudentCourseDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentCourseDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\StudentCourseDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StudentCourseDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentCourseDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentCourseDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentCourseDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentCourseDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentCourseDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentCourseDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentCourseDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentCourseDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentCourseDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentCourseDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentCourseDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentCourseDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentCourseDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentCourseDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentCourseDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentCourseDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentCourseDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentCourseDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentCourseDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentCourseDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentCourseDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentCourseDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentCourseDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentCourseDB] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentCourseDB] SET  MULTI_USER 
GO
ALTER DATABASE [StudentCourseDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentCourseDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentCourseDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentCourseDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentCourseDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentCourseDB', N'ON'
GO
ALTER DATABASE [StudentCourseDB] SET QUERY_STORE = OFF
GO
USE [StudentCourseDB]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 3/6/2020 10:52:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseNumber] [varchar](20) NULL,
	[CourseTitle] [varchar](50) NULL,
	[Duration] [varchar](50) NULL,
	[Prerequisite] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCourse]    Script Date: 3/6/2020 10:52:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourse](
	[StudentID] [int] NULL,
	[CourseNumber] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 3/6/2020 10:52:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[HomePhone] [varchar](50) NULL,
	[Pass] [varchar](50) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Courses] ([CourseNumber], [CourseTitle], [Duration], [Prerequisite]) VALUES (N'COMP101', N'Structured Programming', N'90', N'None')
INSERT [dbo].[Courses] ([CourseNumber], [CourseTitle], [Duration], [Prerequisite]) VALUES (N'COMP102', N'Introduction to C#', N'75', N'COMP101')
INSERT [dbo].[Courses] ([CourseNumber], [CourseTitle], [Duration], [Prerequisite]) VALUES (N'COMP103', N'Advanced Programming in C#', N'75', N'COMP102')
INSERT [dbo].[Courses] ([CourseNumber], [CourseTitle], [Duration], [Prerequisite]) VALUES (N'COMP104', N'Web Programming I', N'90', N'NONE')
INSERT [dbo].[Courses] ([CourseNumber], [CourseTitle], [Duration], [Prerequisite]) VALUES (N'COMP105', N'Web Programming II', N'90', N'COMP104')
INSERT [dbo].[StudentCourse] ([StudentID], [CourseNumber]) VALUES (11111, N'COMP101')
INSERT [dbo].[StudentCourse] ([StudentID], [CourseNumber]) VALUES (11111, N'COMP103')
INSERT [dbo].[StudentCourse] ([StudentID], [CourseNumber]) VALUES (22222, N'COMP103')
INSERT [dbo].[StudentCourse] ([StudentID], [CourseNumber]) VALUES (33333, N'COMP101')
INSERT [dbo].[StudentCourse] ([StudentID], [CourseNumber]) VALUES (44444, N'COMP103')
INSERT [dbo].[StudentCourse] ([StudentID], [CourseNumber]) VALUES (11111, N'COMP102')
INSERT [dbo].[StudentCourse] ([StudentID], [CourseNumber]) VALUES (11111, N'COMP104')
INSERT [dbo].[StudentCourse] ([StudentID], [CourseNumber]) VALUES (11111, N'COMP105')
INSERT [dbo].[StudentCourse] ([StudentID], [CourseNumber]) VALUES (22222, N'COMP102')
INSERT [dbo].[StudentCourse] ([StudentID], [CourseNumber]) VALUES (22222, N'COMP102')
INSERT [dbo].[StudentCourse] ([StudentID], [CourseNumber]) VALUES (22222, N'COMP105')
INSERT [dbo].[StudentCourse] ([StudentID], [CourseNumber]) VALUES (22222, N'COMP104')
INSERT [dbo].[StudentCourse] ([StudentID], [CourseNumber]) VALUES (22222, N'COMP101')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [Email], [HomePhone], [Pass]) VALUES (11111, N'Mary', N'Brown', N'mary@gmail.com', N'(514)111-1111', N'12345')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [Email], [HomePhone], [Pass]) VALUES (22222, N'Wei', N'Wang', N'wei@gmail.com', N'(514)222-2222', N'00000')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [Email], [HomePhone], [Pass]) VALUES (33333, N'Michael', N'Scofield', N'michael@gmail.com', N'(514)333-3333', N'98765')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName], [Email], [HomePhone], [Pass]) VALUES (44444, N'Daniel', N'Rother', N'daniel@yahoo.com', N'(514)555-5555', N'21212')
USE [master]
GO
ALTER DATABASE [StudentCourseDB] SET  READ_WRITE 
GO
