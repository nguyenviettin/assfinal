USE [master]
GO
/****** Object:  Database [baithi]    Script Date: 7/7/2017 12:43:00 AM ******/
CREATE DATABASE [baithi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'baithi', FILENAME = N'E:\2\baithi.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'baithi_log', FILENAME = N'E:\2\baithi_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [baithi] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [baithi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [baithi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [baithi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [baithi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [baithi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [baithi] SET ARITHABORT OFF 
GO
ALTER DATABASE [baithi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [baithi] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [baithi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [baithi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [baithi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [baithi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [baithi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [baithi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [baithi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [baithi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [baithi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [baithi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [baithi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [baithi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [baithi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [baithi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [baithi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [baithi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [baithi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [baithi] SET  MULTI_USER 
GO
ALTER DATABASE [baithi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [baithi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [baithi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [baithi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [baithi]
GO
/****** Object:  Table [dbo].[Departs]    Script Date: 7/7/2017 12:43:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[Sdt] [varchar](50) NULL,
	[Gioitinh] [bit] NULL,
 CONSTRAINT [PK__Departs__3214EC077565B7A9] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Departs] ON 

INSERT [dbo].[Departs] ([Id], [Name], [Email], [Sdt], [Gioitinh]) VALUES (1, N'thay Phung', N'thayphung@gmail.com', N'0987654321', 1)
INSERT [dbo].[Departs] ([Id], [Name], [Email], [Sdt], [Gioitinh]) VALUES (3, N'IT', N'3@gmail.com', N'0987614566', 0)
INSERT [dbo].[Departs] ([Id], [Name], [Email], [Sdt], [Gioitinh]) VALUES (4, N'1', N'1', N'1', 1)
INSERT [dbo].[Departs] ([Id], [Name], [Email], [Sdt], [Gioitinh]) VALUES (5, N'123', N'123', N'123', 0)
INSERT [dbo].[Departs] ([Id], [Name], [Email], [Sdt], [Gioitinh]) VALUES (6, N'Tuan', N'123', N'123', 1)
SET IDENTITY_INSERT [dbo].[Departs] OFF
USE [master]
GO
ALTER DATABASE [baithi] SET  READ_WRITE 
GO
