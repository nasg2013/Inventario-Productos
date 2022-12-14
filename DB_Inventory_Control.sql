USE [master]
GO
/****** Object:  Database [DB_Inventory_Control]    Script Date: 03/08/2022 20:25:38 ******/
CREATE DATABASE [DB_Inventory_Control]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Inventory_Control', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_Inventory_Control.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_Inventory_Control_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_Inventory_Control_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_Inventory_Control] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Inventory_Control].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Inventory_Control] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Inventory_Control] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Inventory_Control] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_Inventory_Control] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Inventory_Control] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_Inventory_Control] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Inventory_Control] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Inventory_Control] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Inventory_Control] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Inventory_Control] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Inventory_Control] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_Inventory_Control] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_Inventory_Control', N'ON'
GO
ALTER DATABASE [DB_Inventory_Control] SET QUERY_STORE = OFF
GO
USE [DB_Inventory_Control]
GO
/****** Object:  Table [dbo].[Price_Type]    Script Date: 03/08/2022 20:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price_Type](
	[Id_Price_Type] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Price_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 03/08/2022 20:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id_Product] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Id_Type] [int] NOT NULL,
	[Id_Price_Type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Type]    Script Date: 03/08/2022 20:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Type](
	[Id_Product_Type] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Product_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Id_Price_Type])
REFERENCES [dbo].[Price_Type] ([Id_Price_Type])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([Id_Type])
REFERENCES [dbo].[Product_Type] ([Id_Product_Type])
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertProduct]    Script Date: 03/08/2022 20:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_InsertProduct]
(@Name varchar(30), @Quantity int, @Price float,@Id_Type int, @Id_Price int)
as
begin
insert into Product ([Name], [Quantity], [Price], [Id_Type], [Id_Price_Type])
values(@Name , @Quantity , @Price ,@Id_Type , @Id_Price )
end
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectPriceType]    Script Date: 03/08/2022 20:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_SelectPriceType]
AS
BEGIN
	Select [Id_Price_Type], [Name]
	from [dbo].[Price_Type]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectProduct]    Script Date: 03/08/2022 20:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_SelectProduct]
AS
BEGIN
	Select [Id_Product], [Name], [Quantity], [Price], [Id_Type], [Id_Price_Type]
	from [dbo].[Product]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectProductType]    Script Date: 03/08/2022 20:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_SelectProductType]
AS
BEGIN
	Select [Id_Product_Type], [Name]
	from [dbo].[Product_Type]
END
GO
USE [master]
GO
ALTER DATABASE [DB_Inventory_Control] SET  READ_WRITE 
GO
