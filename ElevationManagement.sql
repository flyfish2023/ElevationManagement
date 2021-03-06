USE [master]
GO
/****** Object:  Database [ElevationManagement]    Script Date: 3/12/2014 10:04:18 PM ******/
CREATE DATABASE [ElevationManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ElevationManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ElevationManagement.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ElevationManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ElevationManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ElevationManagement] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ElevationManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ElevationManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ElevationManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ElevationManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ElevationManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ElevationManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [ElevationManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ElevationManagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ElevationManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ElevationManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ElevationManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ElevationManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ElevationManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ElevationManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ElevationManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ElevationManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ElevationManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ElevationManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ElevationManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ElevationManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ElevationManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ElevationManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ElevationManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ElevationManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ElevationManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ElevationManagement] SET  MULTI_USER 
GO
ALTER DATABASE [ElevationManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ElevationManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ElevationManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ElevationManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ElevationManagement]
GO
/****** Object:  User [CF datasource for ElevationManagement]    Script Date: 3/12/2014 10:04:18 PM ******/
CREATE USER [CF datasource for ElevationManagement] FOR LOGIN [cfem] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [CF datasource for ElevationManagement]
GO
/****** Object:  Table [dbo].[bin]    Script Date: 3/12/2014 10:04:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bin](
	[binID] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NULL,
	[location] [varchar](50) NULL,
	[addBy] [int] NULL,
	[addDate] [datetime] NULL,
	[archiveBy] [int] NULL,
	[archiveDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[carriers]    Script Date: 3/12/2014 10:04:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[carriers](
	[carrierID] [int] IDENTITY(1,1) NOT NULL,
	[carrierName] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[checkLIst]    Script Date: 3/12/2014 10:04:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[checkLIst](
	[checkListID] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[conditionCode]    Script Date: 3/12/2014 10:04:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[conditionCode](
	[conditionCodeID] [int] IDENTITY(1,1) NOT NULL,
	[conditionDescription] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer]    Script Date: 3/12/2014 10:04:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](50) NULL,
	[lastName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[device]    Script Date: 3/12/2014 10:04:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[device](
	[deviceID] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NULL,
	[esn] [varchar](50) NULL,
	[deviceTypeID] [int] NULL,
	[customerID] [int] NULL,
	[originationLocation] [int] NULL,
	[pricePaid] [money] NULL,
	[addDate] [datetime] NULL,
	[archiveBy] [int] NULL,
	[archiveDate] [datetime] NULL,
	[addBy] [varchar](50) NULL,
	[checkedIn] [char](10) NULL,
	[carrier] [varchar](50) NULL,
	[checkedItems] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[devicePurchaseLimit]    Script Date: 3/12/2014 10:04:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[devicePurchaseLimit](
	[devicePurchaseLimitID] [int] IDENTITY(1,1) NOT NULL,
	[devicePurchaseLimit] [money] NULL,
	[deviceTypeID] [int] NULL,
	[conditionCodeID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[deviceType]    Script Date: 3/12/2014 10:04:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[deviceType](
	[deviceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[manufacturer] [varchar](50) NULL,
	[make] [varchar](50) NULL,
	[model] [varchar](50) NULL,
	[storageSize] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[descriptionShort] [varchar](20) NULL,
	[conditionPerfect] [money] NULL,
	[conditionGood] [money] NULL,
	[conditionFair] [money] NULL,
	[conditionPoor] [money] NULL,
	[addBy] [int] NULL,
	[addDate] [datetime] NULL,
	[archiveBy] [int] NULL,
	[archiveDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginInfo]    Script Date: 3/12/2014 10:04:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginInfo](
	[UserID] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Roles] [varchar](50) NULL,
	[addDate] [datetime] NULL,
	[personID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[loginRoles]    Script Date: 3/12/2014 10:04:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[loginRoles](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleDescription] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[person]    Script Date: 3/12/2014 10:04:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[person](
	[personID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](50) NULL,
	[lastName] [varchar](50) NULL,
	[middleName] [varchar](50) NULL,
	[addBy] [int] NULL,
	[addDate] [datetime] NULL,
	[archiveBy] [int] NULL,
	[archiveDate] [datetime] NULL,
	[defaultBin] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shipments]    Script Date: 3/12/2014 10:04:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shipments](
	[ShipmentID] [int] IDENTITY(1,1) NOT NULL,
	[personID] [int] NOT NULL,
	[DateTimePlaced] [datetime] NOT NULL,
	[DateTimeShipped] [datetime] NULL,
	[TrackingCode] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShippedItems]    Script Date: 3/12/2014 10:04:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippedItems](
	[ShipmentID] [int] NOT NULL,
	[DeviceID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[status]    Script Date: 3/12/2014 10:04:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[status](
	[statusID] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store]    Script Date: 3/12/2014 10:04:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[store](
	[storeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[location] [nchar](10) NULL,
	[street1] [varchar](50) NULL,
	[street2] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[state] [char](2) NULL,
	[zip] [char](5) NULL,
	[zipPlus4] [char](9) NULL,
	[phone] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[workflow]    Script Date: 3/12/2014 10:04:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workflow](
	[workflowID] [int] IDENTITY(1,1) NOT NULL,
	[deviceID] [int] NULL,
	[binID] [int] NULL,
	[addBy] [int] NULL,
	[addDate] [datetime] NULL,
	[archiveBy] [int] NULL,
	[archiveDate] [datetime] NULL,
	[inDate] [datetime] NULL,
	[outDate] [datetime] NULL,
	[statusID] [int] NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[device] ADD  CONSTRAINT [DF_device_checkedIn]  DEFAULT ('N') FOR [checkedIn]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Store which purchased' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'device', @level2type=N'COLUMN',@level2name=N'originationLocation'
GO
USE [master]
GO
ALTER DATABASE [ElevationManagement] SET  READ_WRITE 
GO
