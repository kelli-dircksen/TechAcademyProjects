USE [master]
GO
/****** Object:  Database [Library]    Script Date: 4/13/2017 1:36:18 PM ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Library.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Library_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Library]
GO
/****** Object:  StoredProcedure [dbo].[LIBRARY_BRANCH1]    Script Date: 4/13/2017 1:36:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LIBRARY_BRANCH1] @BranchName nvarchar(50), @DueDate nchar(10)
AS 
SELECT BOOK.Title, BORROWERS.Name, BORROWERS.Address FROM LIBRARY_BRANCH
INNER JOIN BOOK_LOANS
ON BOOK_LOANS.BranchID = LIBRARY_BRANCH.BranchID
INNER JOIN BORROWERS
ON BORROWERS.CardNo = BOOK_LOANS.CardNo
INNER JOIN BOOK
ON BOOK.BookID = BOOK_LOANS.BookID
WHERE LIBRARY_BRANCH.BranchName = @BranchName 
AND BOOK_LOANS.DueDate = @DueDate

GO
/****** Object:  Table [dbo].[BOOK]    Script Date: 4/13/2017 1:36:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOK](
	[BookID] [nchar](10) NULL,
	[Title] [nvarchar](50) NULL,
	[PublisherName] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BOOK_AUTHORS]    Script Date: 4/13/2017 1:36:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOK_AUTHORS](
	[BookID] [nchar](10) NULL,
	[AuthorName] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BOOK_COPIES]    Script Date: 4/13/2017 1:36:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOK_COPIES](
	[BookID] [nchar](10) NULL,
	[BranchID] [nchar](10) NULL,
	[No_Of_Copies] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BOOK_LOANS]    Script Date: 4/13/2017 1:36:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOK_LOANS](
	[BookID] [nchar](10) NULL,
	[BranchID] [nchar](10) NULL,
	[CardNo] [nchar](10) NULL,
	[DateOut] [nchar](10) NULL,
	[DueDate] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BORROWERS]    Script Date: 4/13/2017 1:36:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BORROWERS](
	[CardNo] [nchar](10) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LIBRARY_BRANCH]    Script Date: 4/13/2017 1:36:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIBRARY_BRANCH](
	[BranchID] [nchar](10) NULL,
	[BranchName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PUBLISHERS]    Script Date: 4/13/2017 1:36:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PUBLISHERS](
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'1         ', N'The Lost Tribe', N'LeafBooks')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'2         ', N'Two Stones', N'LeafBooks')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'3         ', N'Seven Kings', N'LeafBooks')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'4         ', N'Queen Bee', N'LeafBooks')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'5         ', N'Owl News', N'LeafBooks')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'6         ', N'Fact Check', N'LeafBooks')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'7         ', N'Blue Sky', N'LeafBooks')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'8         ', N'In Search of Lost Time', N'Penguin')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'9         ', N'Ulysses', N'Sylvia Beach')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'10        ', N'The Odyssey', N'Harper Perennial Modern Classics')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'11        ', N'War and Peace', N'The Russian Messenger')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'12        ', N'Moby Dick', N'Harper & Brothers')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'13        ', N'The Divine Comedy', N'Oxford Press')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'15        ', N'The Great Gatsby', N'Scribner')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'16        ', N'The Iliad', N'Barnes & Noble')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'17        ', N'Crime and Punishment', N'The Russian Messenger')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'18        ', N'Pride and Prejudice', N'Thomas Egerton')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'19        ', N'Wuthering Heights', N'Thomas Cautley Newby')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'20        ', N'Nineteen Eighty Four', N'Harvill Secker')
INSERT [dbo].[BOOK] ([BookID], [Title], [PublisherName]) VALUES (N'14        ', N'To the Lighthouse', N'Hogarth Press')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'1         ', N'John Doe')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'2         ', N'Stephen King')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'3         ', N'Mary Jane')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'4         ', N'Kari Shae')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'5         ', N'Dave Newt')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'6         ', N'Steven Lee')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'7         ', N'Stephen King')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'8         ', N'Marcel Proust')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'9         ', N'James Joyce')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'10        ', N'Homer')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'11        ', N'Leo Tolstoy')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'12        ', N'Hereman Melville')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'13        ', N'Dante Alighieri')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'14        ', N'Virginia Woolf')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'15        ', N'F. Scott Fitzgerald')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'16        ', N'Homer')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'17        ', N'Fyodor Dostoyevsky')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'18        ', N'Jane Austen')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'19        ', N'Emily Bronte')
INSERT [dbo].[BOOK_AUTHORS] ([BookID], [AuthorName]) VALUES (N'20        ', N'George Orwell')
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'1         ', N'100       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'2         ', N'100       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'3         ', N'100       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'4         ', N'100       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'5         ', N'100       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'6         ', N'100       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'7         ', N'100       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'8         ', N'100       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'9         ', N'100       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'10        ', N'100       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'10        ', N'101       ', 3)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'11        ', N'101       ', 3)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'12        ', N'101       ', 3)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'13        ', N'101       ', 3)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'14        ', N'101       ', 3)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'15        ', N'101       ', 3)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'16        ', N'101       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'17        ', N'101       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'3         ', N'101       ', 5)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'18        ', N'101       ', 5)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'15        ', N'102       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'16        ', N'102       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'17        ', N'102       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'18        ', N'102       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'19        ', N'102       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'6         ', N'102       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'1         ', N'102       ', 4)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'2         ', N'102       ', 4)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'3         ', N'102       ', 3)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'4         ', N'102       ', 3)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'5         ', N'102       ', 3)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'5         ', N'103       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'6         ', N'103       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'7         ', N'103       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'8         ', N'103       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'9         ', N'103       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'10        ', N'103       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'15        ', N'103       ', 3)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'16        ', N'103       ', 3)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'17        ', N'103       ', 3)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'18        ', N'103       ', 4)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'19        ', N'103       ', 4)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'20        ', N'103       ', 4)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'20        ', N'104       ', 4)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'6         ', N'104       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'19        ', N'104       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'18        ', N'104       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'17        ', N'104       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'16        ', N'104       ', 3)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'15        ', N'104       ', 3)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'14        ', N'104       ', 3)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'13        ', N'104       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'9         ', N'104       ', 2)
INSERT [dbo].[BOOK_COPIES] ([BookID], [BranchID], [No_Of_Copies]) VALUES (N'7         ', N'104       ', 6)
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'1         ', N'100       ', N'30        ', N'2017-07-01', N'2017-08-01')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'2         ', N'100       ', N'31        ', N'2015-04-01', N'2015-05-01')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'3         ', N'100       ', N'32        ', N'2016-09-12', N'2016-10-12')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'4         ', N'100       ', N'33        ', N'2013-09-15', N'2017-4-13 ')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'5         ', N'100       ', N'33        ', N'2017-04-23', N'2017-4-13 ')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'6         ', N'101       ', N'33        ', N'2017-12-25', N'2017-4-13 ')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'7         ', N'101       ', N'33        ', N'2017-05-05', N'2017-4-13 ')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'8         ', N'101       ', N'33        ', N'2017-11-05', N'2017-4-13 ')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'9         ', N'101       ', N'33        ', N'2017-11-23', N'2017-4-13 ')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'10        ', N'101       ', N'34        ', N'2016-04-13', N'2016-05-13')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'11        ', N'102       ', N'34        ', N'2013-04-01', N'2013-05-01')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'12        ', N'102       ', N'34        ', N'2016-10-30', N'2016-11-30')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'13        ', N'102       ', N'34        ', N'2016-07-30', N'2016-08-30')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'14        ', N'102       ', N'34        ', N'2016-02-24', N'2016-03-24')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'15        ', N'102       ', N'34        ', N'2016-11-22', N'2016-12-22')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'16        ', N'103       ', N'35        ', N'2017-04-01', N'2017-05-01')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'17        ', N'103       ', N'35        ', N'2017-08-01', N'2017-09-01')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'18        ', N'103       ', N'35        ', N'2016-04-01', N'2016-04-01')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'19        ', N'103       ', N'36        ', N'2017-12-01', N'2018-01-01')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'20        ', N'103       ', N'36        ', N'2015-08-12', N'2015-09-12')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'1         ', N'104       ', N'37        ', N'2017-03-11', N'2017-04-11')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'2         ', N'104       ', N'37        ', N'2017-08-12', N'2017-09-12')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'3         ', N'104       ', N'38        ', N'2017-03-12', N'2017-04-12')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'4         ', N'104       ', N'39        ', N'2017-05-22', N'2017-06-22')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'5         ', N'104       ', N'39        ', N'2017-01-22', N'2017-02-22')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'6         ', N'100       ', N'40        ', N'2017-06-12', N'2017-07-12')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'7         ', N'100       ', N'40        ', N'2017-06-25', N'2017-07-25')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'8         ', N'101       ', N'40        ', N'2017-10-21', N'2017-11-21')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'9         ', N'101       ', N'41        ', N'2016-04-20', N'2016-05-20')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'10        ', N'101       ', N'41        ', N'2017-04-17', N'2017-05-15')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'11        ', N'102       ', N'42        ', N'2016-08-01', N'2016-09-01')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'12        ', N'102       ', N'43        ', N'2016-11-11', N'2016-11-11')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'13        ', N'102       ', N'44        ', N'2017-11-19', N'2017-12-19')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'14        ', N'103       ', N'44        ', N'2017-04-18', N'2017-05-18')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'15        ', N'103       ', N'45        ', N'2017-09-21', N'2017-10-21')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'16        ', N'103       ', N'46        ', N'2016-11-21', N'2016-12-21')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'16        ', N'104       ', N'47        ', N'2017-09-21', N'2017-10-21')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'17        ', N'100       ', N'47        ', N'2017-06-20', N'2017-07-20')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'18        ', N'101       ', N'48        ', N'2015-03-22', N'2015-04-22')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'19        ', N'101       ', N'48        ', N'2016-06-01', N'2016-07-01')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'20        ', N'101       ', N'48        ', N'2016-11-01', N'2016-12-01')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'1         ', N'102       ', N'49        ', N'2015-10-15', N'2015-11-15')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'2         ', N'103       ', N'50        ', N'2015-09-11', N'2015-10-11')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'3         ', N'103       ', N'50        ', N'2017-09-18', N'2017-10-18')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'4         ', N'104       ', N'51        ', N'2017-05-21', N'2017-06-21')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'5         ', N'104       ', N'51        ', N'2017-07-12', N'2017-08-12')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'6         ', N'100       ', N'52        ', N'2017-11-12', N'2017-12-12')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'7         ', N'100       ', N'52        ', N'2015-09-12', N'2015-10-12')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'8         ', N'100       ', N'52        ', N'2016-09-22', N'2016-10-22')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'9         ', N'100       ', N'52        ', N'2017-05-22', N'2017-06-22')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'10        ', N'100       ', N'53        ', N'2017-06-01', N'2017-07-01')
INSERT [dbo].[BOOK_LOANS] ([BookID], [BranchID], [CardNo], [DateOut], [DueDate]) VALUES (N'11        ', N'100       ', N'53        ', N'2017-08-01', N'2017-09-01')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'30        ', N'Sam Hicks', N'323 SE Walnut St.', N'555-982-3546')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'31        ', N'Jane Reef', N'555 NW Lilly Ave.', N'555-334-9088')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'32        ', N'Scott Johns', N'2672 SE Willow Ave.', N'555-323-5040')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'33        ', N'Mary Johns', N'2672 SE Willow Ave.', N'555-474-5040')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'34        ', N'Lilly May', N'3737 SE Owl St.', N'555-677-0090')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'35        ', N'Oliver Short', N'4321 Shady Ave.', N'555-733-1090')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'36        ', N'Will Duncan', N'6161 NW Olive St.', N'555-413-9855')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'37        ', N'Kelly Roberts', N'321 SE Woodward Ave.', N'555-333-7645')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'38        ', N'Avery Marie', N'2121 SE Filmont Ave.', N'555-455-0908')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'39        ', N'Joseph Agert', N'3232 Ike St.', N'555-232-7766')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'40        ', N'Mike Scott', N'777 SW Adberry Way.', N'555-434-3000')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'41        ', N'Chris Guy', N'222 SW Jefferson St.', N'555-688-0900')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'42        ', N'Alex Scott', N'1660 SE Williams Ave.', N'555-723-0977')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'43        ', N'Mark Alexande', N'400 NE Fremont St.', N'555-808-9000')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'44        ', N'Michael Scott', N'544 SE Beach Drive', N'555-212-3040')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'45        ', N'John Wolf', N'60 E. Maryland Ave.', N'555-455-7711')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'46        ', N'Ellis Miley', N'472 SE Belmont Ave.', N'555-363-6990')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'47        ', N'Anna James', N'5010 NW 17th St.', N'555-388-2920')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'48        ', N'David Scott', N'2180 W. Nike Way', N'555-873-4499')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'49        ', N'Nicole Kerigan', N'3232 E. Wisconsin Ave.', N'555-309-6771')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'50        ', N'Sami Wood', N'2140 N. Douglas Ave.', N'555-245-0909')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'51        ', N'Rachel Green', N'3001 NW Westgate St.', N'555-450-8080')
INSERT [dbo].[BORROWERS] ([CardNo], [Name], [Address], [Phone]) VALUES (N'52        ', N'Emily White', N'5717 E. Feather Ave.', N'555-327-6633')
INSERT [dbo].[LIBRARY_BRANCH] ([BranchID], [BranchName], [Address]) VALUES (N'100       ', N'East Lake', N'32 E. Lake Ave.')
INSERT [dbo].[LIBRARY_BRANCH] ([BranchID], [BranchName], [Address]) VALUES (N'101       ', N'Sharpstown', N'4319 SW Township St.')
INSERT [dbo].[LIBRARY_BRANCH] ([BranchID], [BranchName], [Address]) VALUES (N'102       ', N'Central', N'111 NW Leaders St.')
INSERT [dbo].[LIBRARY_BRANCH] ([BranchID], [BranchName], [Address]) VALUES (N'103       ', N'Saucer', N'13156 SW Cup Dr.')
INSERT [dbo].[LIBRARY_BRANCH] ([BranchID], [BranchName], [Address]) VALUES (N'104       ', N'Lightning', N'444 W. Rathdowne St.')
INSERT [dbo].[PUBLISHERS] ([Name], [Address], [Phone]) VALUES (N'LeafBooks', N'222 SW Wyoming St.', N'555-234-7658')
INSERT [dbo].[PUBLISHERS] ([Name], [Address], [Phone]) VALUES (N'Penguin', N'345 NW Chihauhua Ave.', N'555-657-0982')
INSERT [dbo].[PUBLISHERS] ([Name], [Address], [Phone]) VALUES (N'Sylvia Beach', N'385 NW California Blvd.', N'555-549-5910')
INSERT [dbo].[PUBLISHERS] ([Name], [Address], [Phone]) VALUES (N'Harper Perennial Modern Classics', N'643 SE Blossom St.', N'555-436-0938')
INSERT [dbo].[PUBLISHERS] ([Name], [Address], [Phone]) VALUES (N'The Russian Messenger', N'111 SW Winterfell Ave.', N'555-754-0921')
INSERT [dbo].[PUBLISHERS] ([Name], [Address], [Phone]) VALUES (N'Harper & Brothers', N'4376 NW Lilly St.', N'555-433-9844')
INSERT [dbo].[PUBLISHERS] ([Name], [Address], [Phone]) VALUES (N'Oxford Press', N'7543 E. Cleveland Ave.', N'555-422-8659')
INSERT [dbo].[PUBLISHERS] ([Name], [Address], [Phone]) VALUES (N'Scribner', N'233 NW Blanket Ave.', N'555-874-2009')
INSERT [dbo].[PUBLISHERS] ([Name], [Address], [Phone]) VALUES (N'Barnes & Noble', N'6487 NW Oak St.', N'555-429-9872')
INSERT [dbo].[PUBLISHERS] ([Name], [Address], [Phone]) VALUES (N'Thomas Egerton', N'327 SW George St.', N'555-432-0964')
INSERT [dbo].[PUBLISHERS] ([Name], [Address], [Phone]) VALUES (N'Thomas Cautley Newby', N'3228 Wallaby Way', N'555-543-0944')
INSERT [dbo].[PUBLISHERS] ([Name], [Address], [Phone]) VALUES (N'Harvill Secker', N'5443 SE Espresso St.', N'555-654-0982')
INSERT [dbo].[PUBLISHERS] ([Name], [Address], [Phone]) VALUES (N'Hogarth Press', N'3221 SW Olivia St.', N'555-655-9881')
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
