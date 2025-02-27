USE [master]
GO
/****** Object:  Database [database]    Script Date: 6/21/2024 2:43:11 AM ******/
CREATE DATABASE [database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'database', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'database_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [database] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [database] SET ARITHABORT OFF 
GO
ALTER DATABASE [database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [database] SET  MULTI_USER 
GO
ALTER DATABASE [database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [database] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [database] SET QUERY_STORE = ON
GO
ALTER DATABASE [database] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [database]
GO
/****** Object:  User [sb]    Script Date: 6/21/2024 2:43:12 AM ******/
CREATE USER [sb] FOR LOGIN [sb] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[tbl_Accounts]    Script Date: 6/21/2024 2:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Accounts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Position] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Accounts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Classify]    Script Date: 6/21/2024 2:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Classify](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Order]    Script Date: 6/21/2024 2:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Order](
	[ID] [int] NOT NULL,
	[TableID] [int] NOT NULL,
	[OrderDetailsID] [int] NOT NULL,
	[OrderTime] [datetime] NOT NULL,
	[CompletionTime] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[AmountOfMoney] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_OrderDetails]    Script Date: 6/21/2024 2:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OrderDetails](
	[ID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CompletionTime] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 6/21/2024 2:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[UnitID] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[CompletionTime] [int] NOT NULL,
	[ImagePath] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[ClassifyID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Report]    Script Date: 6/21/2024 2:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Report](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Report] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Unit]    Script Date: 6/21/2024 2:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Unit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Unit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[_InsertClassify]    Script Date: 6/21/2024 2:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[_InsertClassify] 
    @Vlaue nvarchar(50)
AS
BEGIN
    INSERT INTO tbl_Classify(Value) 
    VALUES (@Vlaue);
END
GO
/****** Object:  StoredProcedure [dbo].[_InsertOrder]    Script Date: 6/21/2024 2:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[_InsertOrder] 
    @TableID int,
    @OrderDetailsID int,
    @OrderTime datetime,
	@CompletionTime int,
    @Status bit,
    @AmountOfMoney int
AS
BEGIN
    INSERT INTO tbl_Order (TableID, OrderDetailsID, OrderTime,CompletionTime, Status, AmountOfMoney) 
    VALUES (@TableID, @OrderDetailsID, @OrderTime,@CompletionTime, @Status, @AmountOfMoney);
END
GO
/****** Object:  StoredProcedure [dbo].[_InsertOrderDetails]    Script Date: 6/21/2024 2:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[_InsertOrderDetails] 
    @ID int,
	@ProductID int,
	@UnitID int,
	@Quantity int,
	@CompletionTime int
AS
BEGIN
    INSERT INTO tbl_OrderDetails(ID,ProductID,UnitID,Quantity,CompletionTime) 
    VALUES (@ID,@ProductID,@UnitID,@Quantity,@CompletionTime);
END
GO
/****** Object:  StoredProcedure [dbo].[_InsertProduct]    Script Date: 6/21/2024 2:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[_InsertProduct] 
	@Name nvarchar(100),
	@UnitID int,
	@Price int,
	@CompletionTime int,
	@ImagePath nvarchar(max),
	@Status bit,
	@Classify int
AS
BEGIN
    INSERT INTO tbl_Product(Name,UnitID,Price,CompletionTime,ImagePath,Status,ClassifyID) 
    VALUES (@Name,@UnitID,@Price,@CompletionTime,@ImagePath,@Status,@Classify);
END
GO
/****** Object:  StoredProcedure [dbo].[_InsertReport]    Script Date: 6/21/2024 2:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[_InsertReport] 
	@OrderID int,
	@AmountOfMonney int
AS
BEGIN
    INSERT INTO tbl_Report(OrderID,AmountOfMoney) 
    VALUES (@OrderID,@AmountOfMonney);
END
GO
/****** Object:  StoredProcedure [dbo].[_InsertUnit]    Script Date: 6/21/2024 2:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[_InsertUnit] 
	@Value nvarchar(50)
AS
BEGIN
    INSERT INTO tbl_Unit(Value) 
    VALUES (@Value);
END
GO
/****** Object:  StoredProcedure [dbo].[_selectAdminProduct]    Script Date: 6/21/2024 2:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[_selectAdminProduct] as
begin
	SELECT tbl_Product.ID,tbl_Product.Name,tbl_Unit.Value as UnitValue,tbl_Product.Price,tbl_Product.CompletionTime,tbl_Product.ImagePath,
tbl_Product.Status,tbl_Classify.Value as ClassifyValue
from tbl_Product 
inner join tbl_Classify 
on tbl_Product.ClassifyID = tbl_Classify.ID
inner join tbl_Unit
on tbl_Product.UnitID = tbl_Unit.ID
end
GO
/****** Object:  StoredProcedure [dbo].[_SelectOrderDetails]    Script Date: 6/21/2024 2:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[_SelectOrderDetails] @OrderDetailsID int
as
begin
	SELECT tbl_Product.Name,tbl_OrderDetails.Quantity,tbl_Unit.Value,tbl_Product.CompletionTime 
	FROM tbl_Order
	inner join tbl_OrderDetails
	on tbl_Order.OrderDetailsID = tbl_OrderDetails.ID
	inner join tbl_Product
	on tbl_OrderDetails.ProductID = tbl_Product.ID
	inner join tbl_Unit
	on tbl_Product.UnitID = tbl_Unit.ID
	where tbl_OrderDetails.ID = @OrderDetailsID
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 6/21/2024 2:43:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[UpdateProduct]
	@ID int,
	@Name nvarchar(100),
	@UnitID int,
	@Price int,
	@CompletionTime int,
	@ImagePath nvarchar(max),
	@Status bit,
	@ClassifyID int
AS
BEGIN
	UPDATE tbl_Product SET 
		Name = @Name,
		UnitID = @UnitID,
		Price = @Price,
		CompletionTime = @CompletionTime,
		ImagePath = @ImagePath,
		Status = @Status,
		ClassifyID = @ClassifyID
	WHERE
		ID = @ID
END
GO
USE [master]
GO
ALTER DATABASE [database] SET  READ_WRITE 
GO
