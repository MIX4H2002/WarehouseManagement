USE [master]
GO
/****** Object:  Database [WarehouseDB]    Script Date: 16.09.2024 3:38:10 ******/
CREATE DATABASE [WarehouseDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WarehouseDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS02\MSSQL\DATA\WarehouseDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WarehouseDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS02\MSSQL\DATA\WarehouseDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WarehouseDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WarehouseDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WarehouseDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WarehouseDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WarehouseDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WarehouseDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WarehouseDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WarehouseDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WarehouseDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WarehouseDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WarehouseDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WarehouseDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WarehouseDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WarehouseDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WarehouseDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WarehouseDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WarehouseDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WarehouseDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WarehouseDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WarehouseDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WarehouseDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WarehouseDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WarehouseDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WarehouseDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WarehouseDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WarehouseDB] SET  MULTI_USER 
GO
ALTER DATABASE [WarehouseDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WarehouseDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WarehouseDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WarehouseDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WarehouseDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WarehouseDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WarehouseDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [WarehouseDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WarehouseDB]
GO
/****** Object:  Table [dbo].[Boxes]    Script Date: 16.09.2024 3:38:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boxes](
	[BoxId] [nvarchar](50) NOT NULL,
	[PalletId] [nvarchar](50) NOT NULL,
	[Width] [float] NOT NULL,
	[Height] [float] NOT NULL,
	[Depth] [float] NOT NULL,
	[Weight] [float] NOT NULL,
	[ExpirationDate] [date] NULL,
	[ProductionDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[BoxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pallets]    Script Date: 16.09.2024 3:38:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pallets](
	[PalletId] [nvarchar](50) NOT NULL,
	[Width] [float] NOT NULL,
	[Height] [float] NOT NULL,
	[Depth] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PalletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B1', N'P1', 50, 50, 50, 10, CAST(N'2024-01-10' AS Date), NULL)
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B10', N'P2', 70, 70, 70, 11, NULL, CAST(N'2024-01-20' AS Date))
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B11', N'P3', 50, 50, 50, 9, CAST(N'2024-03-01' AS Date), NULL)
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B12', N'P3', 60, 60, 60, 13, NULL, CAST(N'2024-02-05' AS Date))
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B13', N'P3', 55, 55, 55, 17, CAST(N'2024-04-05' AS Date), NULL)
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B14', N'P3', 45, 45, 45, 15, CAST(N'2024-05-05' AS Date), NULL)
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B15', N'P3', 70, 70, 70, 14, NULL, CAST(N'2024-03-20' AS Date))
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B16', N'P4', 50, 50, 50, 6, CAST(N'2024-02-10' AS Date), NULL)
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B17', N'P4', 60, 60, 60, 7, NULL, CAST(N'2024-05-10' AS Date))
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B18', N'P4', 55, 55, 55, 8, CAST(N'2024-05-20' AS Date), NULL)
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B19', N'P4', 45, 45, 45, 9, CAST(N'2024-06-10' AS Date), NULL)
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B2', N'P1', 60, 60, 60, 15, NULL, CAST(N'2024-06-15' AS Date))
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B20', N'P4', 70, 70, 70, 10, NULL, CAST(N'2024-12-15' AS Date))
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B21', N'P5', 50, 50, 50, 11, CAST(N'2024-06-05' AS Date), NULL)
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B22', N'P5', 60, 60, 60, 9, NULL, CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B23', N'P5', 55, 55, 55, 8, CAST(N'2024-07-05' AS Date), NULL)
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B24', N'P5', 45, 45, 45, 12, CAST(N'2024-08-05' AS Date), NULL)
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B25', N'P5', 70, 70, 70, 14, NULL, CAST(N'2024-01-25' AS Date))
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B3', N'P1', 55, 55, 55, 12, CAST(N'2024-03-05' AS Date), NULL)
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B4', N'P1', 45, 45, 45, 18, CAST(N'2024-04-15' AS Date), NULL)
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B5', N'P1', 70, 70, 70, 20, NULL, CAST(N'2024-01-25' AS Date))
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B6', N'P2', 50, 50, 50, 8, CAST(N'2024-06-20' AS Date), NULL)
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B7', N'P2', 60, 60, 60, 12, NULL, CAST(N'2024-07-15' AS Date))
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B8', N'P2', 55, 55, 55, 14, CAST(N'2024-08-01' AS Date), CAST(N'2024-08-15' AS Date))
INSERT [dbo].[Boxes] ([BoxId], [PalletId], [Width], [Height], [Depth], [Weight], [ExpirationDate], [ProductionDate]) VALUES (N'B9', N'P2', 45, 45, 45, 10, CAST(N'2024-09-10' AS Date), CAST(N'2024-09-15' AS Date))
GO
INSERT [dbo].[Pallets] ([PalletId], [Width], [Height], [Depth]) VALUES (N'P1', 120, 100, 120)
INSERT [dbo].[Pallets] ([PalletId], [Width], [Height], [Depth]) VALUES (N'P2', 130, 110, 130)
INSERT [dbo].[Pallets] ([PalletId], [Width], [Height], [Depth]) VALUES (N'P3', 140, 120, 140)
INSERT [dbo].[Pallets] ([PalletId], [Width], [Height], [Depth]) VALUES (N'P4', 150, 130, 150)
INSERT [dbo].[Pallets] ([PalletId], [Width], [Height], [Depth]) VALUES (N'P5', 160, 140, 160)
GO
ALTER TABLE [dbo].[Boxes]  WITH CHECK ADD  CONSTRAINT [FK_PalletBox] FOREIGN KEY([PalletId])
REFERENCES [dbo].[Pallets] ([PalletId])
GO
ALTER TABLE [dbo].[Boxes] CHECK CONSTRAINT [FK_PalletBox]
GO
USE [master]
GO
ALTER DATABASE [WarehouseDB] SET  READ_WRITE 
GO
