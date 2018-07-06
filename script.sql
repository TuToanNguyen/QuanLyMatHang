USE [master]
GO
/****** Object:  Database [QLMH]    Script Date: 7/6/2018 8:14:23 PM ******/
CREATE DATABASE [QLMH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLMH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\QLMH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLMH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\QLMH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QLMH] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLMH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLMH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLMH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLMH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLMH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLMH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLMH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLMH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLMH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLMH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLMH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLMH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLMH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLMH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLMH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLMH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLMH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLMH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLMH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLMH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLMH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLMH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLMH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLMH] SET RECOVERY FULL 
GO
ALTER DATABASE [QLMH] SET  MULTI_USER 
GO
ALTER DATABASE [QLMH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLMH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLMH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLMH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLMH] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLMH', N'ON'
GO
ALTER DATABASE [QLMH] SET QUERY_STORE = OFF
GO
USE [QLMH]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [QLMH]
GO
/****** Object:  Table [dbo].[MATHANG]    Script Date: 7/6/2018 8:14:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MATHANG](
	[MAMH] [int] IDENTITY(1,1) NOT NULL,
	[TENMH] [nvarchar](50) NULL,
	[SOLUONG] [numeric](18, 0) NULL,
	[GIA] [money] NULL,
	[MANSX] [int] NULL,
 CONSTRAINT [PK_MATHANG] PRIMARY KEY CLUSTERED 
(
	[MAMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NSX]    Script Date: 7/6/2018 8:14:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NSX](
	[MANSX] [int] IDENTITY(1,1) NOT NULL,
	[TENNSX] [nvarchar](50) NULL,
 CONSTRAINT [PK_NSX] PRIMARY KEY CLUSTERED 
(
	[MANSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MATHANG] ON 

INSERT [dbo].[MATHANG] ([MAMH], [TENMH], [SOLUONG], [GIA], [MANSX]) VALUES (1, N'Kem đánh răng', CAST(1 AS Numeric(18, 0)), 12000.0000, 1)
INSERT [dbo].[MATHANG] ([MAMH], [TENMH], [SOLUONG], [GIA], [MANSX]) VALUES (2, N'Bàn chảy', CAST(33 AS Numeric(18, 0)), 7000.0000, 2)
INSERT [dbo].[MATHANG] ([MAMH], [TENMH], [SOLUONG], [GIA], [MANSX]) VALUES (5, N'Kem đánh răng', CAST(5 AS Numeric(18, 0)), 12000.0000, 3)
SET IDENTITY_INSERT [dbo].[MATHANG] OFF
SET IDENTITY_INSERT [dbo].[NSX] ON 

INSERT [dbo].[NSX] ([MANSX], [TENNSX]) VALUES (1, N'Viet Nam')
INSERT [dbo].[NSX] ([MANSX], [TENNSX]) VALUES (2, N'Han Quoc')
INSERT [dbo].[NSX] ([MANSX], [TENNSX]) VALUES (3, N'Hong Kong')
SET IDENTITY_INSERT [dbo].[NSX] OFF
USE [master]
GO
ALTER DATABASE [QLMH] SET  READ_WRITE 
GO
