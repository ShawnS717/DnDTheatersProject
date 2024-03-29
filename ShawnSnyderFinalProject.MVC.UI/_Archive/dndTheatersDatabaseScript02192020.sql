/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_Theaters]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tickets]') AND type in (N'U'))
ALTER TABLE [dbo].[Tickets] DROP CONSTRAINT IF EXISTS [FK_Tickets_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TheaterMovies]') AND type in (N'U'))
ALTER TABLE [dbo].[TheaterMovies] DROP CONSTRAINT IF EXISTS [FK_TheaterMovies_Theaters]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TheaterMovies]') AND type in (N'U'))
ALTER TABLE [dbo].[TheaterMovies] DROP CONSTRAINT IF EXISTS [FK_TheaterMovies_Showtimes]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TheaterMovies]') AND type in (N'U'))
ALTER TABLE [dbo].[TheaterMovies] DROP CONSTRAINT IF EXISTS [FK_TheaterMovies_Movies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SeatID]') AND type in (N'U'))
ALTER TABLE [dbo].[SeatID] DROP CONSTRAINT IF EXISTS [FK_SeatID_Tickets]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SeatID]') AND type in (N'U'))
ALTER TABLE [dbo].[SeatID] DROP CONSTRAINT IF EXISTS [FK_SeatID_TheaterMovies]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP INDEX IF EXISTS [UserNameIndex] ON [dbo].[AspNetUsers]
GO
/****** Object:  Index [IX_UserId]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP INDEX IF EXISTS [IX_RoleId] ON [dbo].[AspNetUserRoles]
GO
/****** Object:  Index [IX_UserId]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserLogins]
GO
/****** Object:  Index [IX_UserId]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP INDEX IF EXISTS [IX_UserId] ON [dbo].[AspNetUserClaims]
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP INDEX IF EXISTS [RoleNameIndex] ON [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP TABLE IF EXISTS [dbo].[Tickets]
GO
/****** Object:  Table [dbo].[Theaters]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP TABLE IF EXISTS [dbo].[Theaters]
GO
/****** Object:  Table [dbo].[TheaterMovies]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP TABLE IF EXISTS [dbo].[TheaterMovies]
GO
/****** Object:  Table [dbo].[Showtimes]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP TABLE IF EXISTS [dbo].[Showtimes]
GO
/****** Object:  Table [dbo].[SeatID]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP TABLE IF EXISTS [dbo].[SeatID]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP TABLE IF EXISTS [dbo].[Movies]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Database [DnDTheaters]    Script Date: 2/19/2020 8:43:56 AM ******/
DROP DATABASE IF EXISTS [DnDTheaters]
GO
/****** Object:  Database [DnDTheaters]    Script Date: 2/19/2020 8:43:56 AM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'DnDTheaters')
BEGIN
CREATE DATABASE [DnDTheaters]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DnDTheatersDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\DnDTheatersDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DnDTheatersDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\DnDTheatersDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [DnDTheaters] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DnDTheaters].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DnDTheaters] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DnDTheaters] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DnDTheaters] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DnDTheaters] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DnDTheaters] SET ARITHABORT OFF 
GO
ALTER DATABASE [DnDTheaters] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DnDTheaters] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DnDTheaters] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DnDTheaters] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DnDTheaters] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DnDTheaters] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DnDTheaters] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DnDTheaters] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DnDTheaters] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DnDTheaters] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DnDTheaters] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DnDTheaters] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DnDTheaters] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DnDTheaters] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DnDTheaters] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DnDTheaters] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DnDTheaters] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DnDTheaters] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DnDTheaters] SET  MULTI_USER 
GO
ALTER DATABASE [DnDTheaters] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DnDTheaters] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DnDTheaters] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DnDTheaters] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DnDTheaters] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DnDTheaters] SET QUERY_STORE = OFF
GO
USE [DnDTheaters]
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/19/2020 8:43:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/19/2020 8:43:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/19/2020 8:43:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/19/2020 8:43:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/19/2020 8:43:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/19/2020 8:43:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 2/19/2020 8:43:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Movies]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Movies](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[esrbRating] [varchar](4) NULL,
	[PercentRating] [tinyint] NULL,
	[ImagePath] [varchar](50) NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SeatID]    Script Date: 2/19/2020 8:43:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SeatID]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SeatID](
	[SeatID] [int] IDENTITY(1,1) NOT NULL,
	[TMID] [int] NOT NULL,
	[TicketID] [int] NOT NULL,
 CONSTRAINT [PK_SeatID] PRIMARY KEY CLUSTERED 
(
	[SeatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Showtimes]    Script Date: 2/19/2020 8:43:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Showtimes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Showtimes](
	[ShowtimeID] [int] IDENTITY(1,1) NOT NULL,
	[Time] [smallint] NOT NULL,
 CONSTRAINT [PK_Showtimes] PRIMARY KEY CLUSTERED 
(
	[ShowtimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TheaterMovies]    Script Date: 2/19/2020 8:43:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TheaterMovies]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TheaterMovies](
	[TMID] [int] IDENTITY(1,1) NOT NULL,
	[TheaterID] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
	[ShowtimeID] [int] NOT NULL,
	[ReservationLimit] [tinyint] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_TheaterMovies] PRIMARY KEY CLUSTERED 
(
	[TMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Theaters]    Script Date: 2/19/2020 8:43:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Theaters]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Theaters](
	[TheaterID] [int] IDENTITY(1,1) NOT NULL,
	[TheaterName] [varchar](75) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [char](2) NOT NULL,
	[ZipCode] [char](5) NOT NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
 CONSTRAINT [PK_Theaters] PRIMARY KEY CLUSTERED 
(
	[TheaterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 2/19/2020 8:43:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tickets]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tickets](
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 2/19/2020 8:43:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[AssignedTheaterID] [int] NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202002121613478_InitialCreate', N'ShawnSnyderFinalProject.MVC.UI.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE436127D5F60FF41D0D366E1B47CC90C668DEE044EDB9D183BBE60DA1EECDB802DB1DBCC489422511E1B8B7CD93EEC27ED2F2C2951375E24AA5B7D711020704BC553C5E221592C15E77FFFF9EFF8A797C0B79E619CA0104FEC93D1B16D41EC861EC2AB899D92E5F71FEC9F7EFCEB5FC6575EF0627D2EE4CE981C6D899389FD444874EE3889FB0403908C02E4C661122EC9C80D030778A1737A7CFC0FE7E4C48114C2A6589635FE9462820298FDA03FA72176614452E0DF841EF413FE9CBE9967A8D62D08601201174EECF913F886E7F8D583F10C61E0DFC7E16FD025A39BCFD3D1E3F52807B0AD0B1F016ADC1CFA4BDB02188704106AFAF96302E7240EF16A1ED107C07F788D20955B023F81BC4BE795B869EF8E4F59EF9CAA6101E5A60909839E802767DC5D8ED87C2DA7DBA53BA943AFA8E3C92BEB75E6D4897DEDC1ECD1A7D0A70E10159E4FFD98094FEC9B52C54512DD42322A1A8E72C8594CE1BE85F1D7511DF1C8326E7754D2EB7474CCFE3BB2A6A94FD2184E304C490CFC23EB3E5DF8C8FD277C7D08BF423C393B592CCF3EBC7B0FBCB3F73FC0B377F59ED2BE52B9C603FA88B2258231B50D2ECBFEDB96D36CE7880DCB66B536B9572897E84CB1AD1BF0F211E21579A273E8F4836DCDD00BF48A279C5C8F18D189451B9138A53F6F53DF070B1F96EF9D569DECFF2D5A4FDFBD1F44EB2D7846AB6CE805FD74E2C4745E7D827EF6367942513EBD1AE3FD858BCDE23060BF9BFCCADF7E998769ECB2CE845A910710AF20695A37762AF21A519A410D4FEB02F5F0A9CD2C95E9AD14651D5A6726142A763D1B0A7BB7ABD79871175144072FA316F3481BE18CF6AF91007864B537AB0876624A304C3BFE675E2FAF0280FC01164C032D347C59A23880652F7F0E293D01EE6DF33D4812BA5E78BF82E4A9C574FAE700A6CFA19BC694C673028268EBDAEE9F420C6FD360C166C7EE740D36340FDFC2197049185F61D66A63BC8FA1FB354CC915F62E01818FC42D00D9CF071498030C62CE85EBC224995132436F1AD2E8BC00BCC6E4ECB4371C5BB3F61DB04C7D800275C422ACAE5F0AD12A6A514B48918B464C15BDB499FA315C216C666A21AA373597E834958BF53595819959CA25F58666029D76E65283C583D9080D1F1066B0871F116EB679EBD6829A1BE7748584BF400C63BA8C79F7801018E36A044CD68D7D040BD9F031A55BDF9B324D9F819F0EAD6AADD9902D02C3CF860CF6F0674366267DFC8C3C1695181C930A610A6F24AF3E8175CF39C1B25D4F87463777AD7C376B806EBA5C2449E8A26C162812643CBDD1B49FC6705677AE23EF8D982FA11DA344476CCBA34F68DF6C915477F812FA9040EBC2CD13885390B8C093DD483BE4F530ACD8511586557993A6717F977452A6C3983502EC1094D0998A3091A705C22E8A80DFE925A1A5E116C6FA5EEA10DF5CC20862A6B0D31326CAD569126640A94718942E0F8D9D1AE3DA89A8895A7563DE15C256E32E652F76C2C98ED859C34B1EBF6D8598ED1EDB0139DB5D62628036E5B70F82F2B38A2901C483CBA1115438316908CA43AA9D10B4E9B13D10B4E9923747D0FC886A3AFEC279F5D0E8D93C28EF7E5B6F75D71EB8D9F0C78151338F3D691B425BC058A6E7E582BD842F447138A376F2F359C2435D91220C7C0E49336553C5BBCA38D469071149D4065811AD03947F2C9480A409D5C3B82297D76A1D8F227AC01679B75658BEF60BB0350EC8D8F58FA63541FDA755919C46A78FB267251B24921B1D166A380A42888B57B3E3064ED1E56565C798C4C27DA2E15AC7F860B438A82372D538A9E8CCE05E2AA8D9ED255540D62724DBC84B42F8A4F152D199C1BDC439DAED244550D0232CD8C845CD2D7CA0C956643ACADDA67C3776F2F22AFE60EC68EAB0C637208A105ED5EAB2F8136B9E17654DBF9FF72F4D0A720CC74D14154AA5B5A52612C6600585B75435B57486E2845C02021680E579A65E208929F756CDF25FA8AC6F9FF22016FB4021CDFEE65F568D3EF137B65F393EE1B033DAE980053959665D410975738B95CE011FC48A64FE34F4D300EB632E7DEBFC935EBD7DFE4446183B82FD524C2539508A7C9BA3613456F23CD9DEB89551CEFA63A787D08D4011A3D6C74017B7EA518A34561D4597DADADB58EAC29D4DC74F0C2EFB0F5F27C276661FAF68A903F0473D316A45111258ED9D396AB36EA58ED97C638E2814A7D42185573DACAC97A0348CACBF580B4FE351B584B906B9E8A48E2EBF354756949FD4A115AFD7C056D82CBE33475554A8D48115AFCDB1AB7215715D3DE0FD4D7BE4197283CB0FCA9BED701A8CED2C92C36C90B57A803A50ED714F2CFEC55F02E3CF0F9260DAD3E29004CB53269B114C83A15F9F1A1FD79BCB536B45801EB3F1C5BCB105B4550CE8F1FAD178AB6491CE8FA248A9BD3C470AE7C5313FBB755FEE910E73B9886D156EA4147B4D080C464C6034FFDD9FFA08B2C5BE10B801182D6142F22A11FBF4F8E454B80C743817739C24F17CC5D957773BA739663B28F8C2CF20769F402C975F6C7079A5029532DBD7D8832F13FBDF59ABF32C49C2FECA1E1F59D7C92346BFA7F4C5439C42EB0FB99C7498627E83EB23A5A17FBC897B19E62EBFFED797BCE9917517D3E9746E1D0B8E5E67F89BB7357A599337DDC09AB5EF70BCDDD9D6B8FAA0441566CBFA371D16880C72CBA1B0F26F0178F9AEAF69CA9B0C1B212A6E2B0C8537880B75B711D6C1D2DE44F0E84F92DD44E8D759F5CD84754CD3DE4A40B83F987827C17C192A5AEE711F529CA176B124657EEEACE9DEA8C073DF7B9354FABDD14497CBBB7BC00D5AC2BD5988F2C64AA307DB3A1595CF8361EF93F75B2F773E940AE72A68DF6F61F32E6B995BBE44FDA94A980FA0E84E5144B4FF42E55D734D97143EF06ACF7EE5C8074636BECDEFBFE878D764D325880F9C6CBD4A8B0F8C6BFBDA3FF7CC34E32D74EF85C272CD93E6E38E2A8BDC55089CA7DCE9F17F115212E411657E7F535D79D65635DBA1B012D12BD597BC898AA58923E99524DAD5F6EB2BDFF05B3BCB65DAD56A0A45DB74F3F5BF55379769D7AD29BFDC4709B3B200525556DEB18EB5D55DBDA592E5464F3A2AE4BB62D6D62FF56FA9427910A734668FE6EBF2DB29481EC425434E9D1E05C8F28762BA77D6FEAD48BA7F27685541B07F391243B7B16B9632D77819169BB76051212264686E20011EDD522F628296C025F4354B406717D0B3A41EFB0CB280DE35BE4B499412DA65182CFC46C28B05016DFAB32AEBA6CDE3BB88FD4A86E8023513B1C4FD1DFE3945BE57DA3D53E48434102CBAE0E95E369684A57D57AF25D26D880D81B8FBCAA0E80106914FC1923B3C07CF701DDB28FD3EC215705FAB0CA00EA47B209A6E1F5F22B08A4190708CAA3DFD4939EC052F3FFE1F64C3827632550000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'6476b95e-e2c3-477c-8aa9-b8cd2c2010aa', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'5a5c9767-b7f5-453c-952f-6f0e8081030d', N'Customer')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'92d12222-a959-4f20-bed1-af9aaa65c2da', N'Manager')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'072eb770-f884-4290-96c2-b0793bf0f83f', N'5a5c9767-b7f5-453c-952f-6f0e8081030d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b72a3dcf-530c-4339-ac1d-d0e24de3b0b3', N'5a5c9767-b7f5-453c-952f-6f0e8081030d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e26d6c93-016b-4b6f-905e-c92ec87669b7', N'5a5c9767-b7f5-453c-952f-6f0e8081030d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'130997f4-4e08-4aef-b6c1-5d1534ab7da4', N'6476b95e-e2c3-477c-8aa9-b8cd2c2010aa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cc9e312c-9568-4e9e-89b1-45bdb0d6e529', N'92d12222-a959-4f20-bed1-af9aaa65c2da')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'072eb770-f884-4290-96c2-b0793bf0f83f', N'customer3@dndtheaters.com', 0, N'AB9doY4EDBIEaHDOyHSPTLt5NW/ahgUeoSvcmPwWUA0ebZyePrT8It2IZXOVioQg8w==', N'fb0e5e1e-e1fa-4c10-8b31-be16c70436cc', NULL, 0, 0, NULL, 1, 0, N'customer3@dndtheaters.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'130997f4-4e08-4aef-b6c1-5d1534ab7da4', N'smsadmin@example.com', 0, N'AHE3hbymfzXLLNNlpV2Iiij8tDJ51y04CjBCsCR7H3wC8gdpWxGBy8iDzfr7FDwSCQ==', N'db16d4d9-25ee-401a-8873-ecd1b7713f40', NULL, 0, 0, NULL, 1, 0, N'smsadmin@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'761aa9be-9849-4596-a8e7-d30611343cb9', N'Annonymous@DnDTheaters.com', 0, N'AJPJiEhrjDp9fGrjhYULvfvSAe8Bj6omNk6ykAq6mA2SdSfH/6oXova2OSrU55ESHg==', N'4c98b6ef-2e50-472d-b917-76a427613d58', NULL, 0, 0, NULL, 1, 0, N'Annonymous@DnDTheaters.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b72a3dcf-530c-4339-ac1d-d0e24de3b0b3', N'customer1@dndtheaters.com', 0, N'AGCYBIMQ+2fsTHYzTOueu0eRBh5hKyKtvWWawXk73LizLS6tY7URZg0JIm4eZaLXPA==', N'4ab7b81e-89d2-48a1-b292-1bab93b8d3fd', NULL, 0, 0, NULL, 1, 0, N'customer1@dndtheaters.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'cc9e312c-9568-4e9e-89b1-45bdb0d6e529', N'smsManager@example.com', 0, N'AHt6SM9yiyqNlaZ+b8PTuHyxdHJvcfKlU+6hLV5U11JCPaSf400ks1WOdap654MbaQ==', N'b23ed3e3-e0bb-4291-8333-e532a319eaf3', NULL, 0, 0, NULL, 1, 0, N'smsManager@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e26d6c93-016b-4b6f-905e-c92ec87669b7', N'customer2@dndtheaters.com', 0, N'AMEAH+mGCxf4nXhwmQhC2qVT8QqCBKuBgLpjOucSoQYoALYmSSmqoFhss00x+BVUXg==', N'fb5b1d1e-54e0-44bb-ab31-af250f85c474', NULL, 0, 0, NULL, 1, 0, N'customer2@dndtheaters.com')
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieId], [Name], [Description], [esrbRating], [PercentRating], [ImagePath]) VALUES (1, N'POPEYE', N'When Bluto comes to take olive oil for the last time', N'r', 85, N'0eee9f60-6bc1-4e14-be4a-f1721f3a1ec7.jpg')
INSERT [dbo].[Movies] ([MovieId], [Name], [Description], [esrbRating], [PercentRating], [ImagePath]) VALUES (2, N'BEDTIME!', N'When the clock ticks past 9 o''clock. The kids start to drop', N'pg13', 50, N'0bfd8b32-c405-45b8-9bd9-5a11459c4894.jpg')
INSERT [dbo].[Movies] ([MovieId], [Name], [Description], [esrbRating], [PercentRating], [ImagePath]) VALUES (3, N'Bravo', N'Johnny Bravo is at it again getting into hi-jinks as he tries to show off', N'e', 90, N'a3a94c95-d737-45e8-96d7-5a0b1556767a.jpg')
INSERT [dbo].[Movies] ([MovieId], [Name], [Description], [esrbRating], [PercentRating], [ImagePath]) VALUES (6, N'PAWS', N'When some friends go out to sea for spring break... an unlikely killer emerges', N'r', 85, N'436b2615-3987-4e7e-9132-b4f0e1f27dad.jpg')
INSERT [dbo].[Movies] ([MovieId], [Name], [Description], [esrbRating], [PercentRating], [ImagePath]) VALUES (11, N'Star Shrek', N'The Shrek universe and Star Trek universe collide in this ambitious crossover event', N'pg13', 80, N'9b21705d-9104-41d5-aa6d-b4fa5d1e599b.jpg')
INSERT [dbo].[Movies] ([MovieId], [Name], [Description], [esrbRating], [PercentRating], [ImagePath]) VALUES (12, N'Another Matt Damon Rescue Mission', N'Matt Damon gets himself stranded AGAIN', N'pg13', 65, N'9fe10ec0-5bda-46c8-ab30-993a20be32c6.jpg')
INSERT [dbo].[Movies] ([MovieId], [Name], [Description], [esrbRating], [PercentRating], [ImagePath]) VALUES (13, N'X-MEN In Black', N'Man these crossover titles are getting out of hand', N'pg', 75, N'53972c0f-291d-46ca-9d04-495557b2b670.jpg')
INSERT [dbo].[Movies] ([MovieId], [Name], [Description], [esrbRating], [PercentRating], [ImagePath]) VALUES (14, N'Freddy vs Jason vs The Board of Education', N'Now the iconic slasher villains have to face their biggest challenge yet... the schools', N'r', 98, N'7207c06f-fa46-47a0-9dfd-fabe86ef3300.png')
INSERT [dbo].[Movies] ([MovieId], [Name], [Description], [esrbRating], [PercentRating], [ImagePath]) VALUES (15, N'The Fresh Prince of Persia', N'This is the story all about how the sands of time got flipped turned upside down', N'pg13', 80, N'a0a65610-95a4-4989-a95d-1e880bc05062.jpg')
SET IDENTITY_INSERT [dbo].[Movies] OFF
SET IDENTITY_INSERT [dbo].[SeatID] ON 

INSERT [dbo].[SeatID] ([SeatID], [TMID], [TicketID]) VALUES (1, 5, 3)
INSERT [dbo].[SeatID] ([SeatID], [TMID], [TicketID]) VALUES (2, 1, 3)
INSERT [dbo].[SeatID] ([SeatID], [TMID], [TicketID]) VALUES (3, 1, 4)
INSERT [dbo].[SeatID] ([SeatID], [TMID], [TicketID]) VALUES (4, 1, 5)
INSERT [dbo].[SeatID] ([SeatID], [TMID], [TicketID]) VALUES (5, 1, 10)
INSERT [dbo].[SeatID] ([SeatID], [TMID], [TicketID]) VALUES (6, 1, 11)
INSERT [dbo].[SeatID] ([SeatID], [TMID], [TicketID]) VALUES (7, 6, 3)
INSERT [dbo].[SeatID] ([SeatID], [TMID], [TicketID]) VALUES (17, 2, 3)
INSERT [dbo].[SeatID] ([SeatID], [TMID], [TicketID]) VALUES (18, 2, 4)
INSERT [dbo].[SeatID] ([SeatID], [TMID], [TicketID]) VALUES (19, 2, 28)
INSERT [dbo].[SeatID] ([SeatID], [TMID], [TicketID]) VALUES (20, 2, 29)
INSERT [dbo].[SeatID] ([SeatID], [TMID], [TicketID]) VALUES (21, 2, 30)
SET IDENTITY_INSERT [dbo].[SeatID] OFF
SET IDENTITY_INSERT [dbo].[Showtimes] ON 

INSERT [dbo].[Showtimes] ([ShowtimeID], [Time]) VALUES (1, 15)
INSERT [dbo].[Showtimes] ([ShowtimeID], [Time]) VALUES (2, 30)
INSERT [dbo].[Showtimes] ([ShowtimeID], [Time]) VALUES (3, 45)
INSERT [dbo].[Showtimes] ([ShowtimeID], [Time]) VALUES (4, 100)
INSERT [dbo].[Showtimes] ([ShowtimeID], [Time]) VALUES (5, 115)
INSERT [dbo].[Showtimes] ([ShowtimeID], [Time]) VALUES (6, 130)
INSERT [dbo].[Showtimes] ([ShowtimeID], [Time]) VALUES (7, 145)
INSERT [dbo].[Showtimes] ([ShowtimeID], [Time]) VALUES (8, 200)
INSERT [dbo].[Showtimes] ([ShowtimeID], [Time]) VALUES (9, 215)
INSERT [dbo].[Showtimes] ([ShowtimeID], [Time]) VALUES (10, 230)
INSERT [dbo].[Showtimes] ([ShowtimeID], [Time]) VALUES (11, 245)
INSERT [dbo].[Showtimes] ([ShowtimeID], [Time]) VALUES (12, 300)
INSERT [dbo].[Showtimes] ([ShowtimeID], [Time]) VALUES (13, 315)
INSERT [dbo].[Showtimes] ([ShowtimeID], [Time]) VALUES (14, 330)
INSERT [dbo].[Showtimes] ([ShowtimeID], [Time]) VALUES (15, 345)
INSERT [dbo].[Showtimes] ([ShowtimeID], [Time]) VALUES (16, 400)
SET IDENTITY_INSERT [dbo].[Showtimes] OFF
SET IDENTITY_INSERT [dbo].[TheaterMovies] ON 

INSERT [dbo].[TheaterMovies] ([TMID], [TheaterID], [MovieID], [ShowtimeID], [ReservationLimit], [Date]) VALUES (1, 1, 1, 1, 30, CAST(N'2020-06-15' AS Date))
INSERT [dbo].[TheaterMovies] ([TMID], [TheaterID], [MovieID], [ShowtimeID], [ReservationLimit], [Date]) VALUES (2, 1, 2, 6, 45, CAST(N'2020-02-24' AS Date))
INSERT [dbo].[TheaterMovies] ([TMID], [TheaterID], [MovieID], [ShowtimeID], [ReservationLimit], [Date]) VALUES (3, 2, 1, 1, 25, CAST(N'2020-02-13' AS Date))
INSERT [dbo].[TheaterMovies] ([TMID], [TheaterID], [MovieID], [ShowtimeID], [ReservationLimit], [Date]) VALUES (4, 2, 3, 5, 30, CAST(N'2020-01-03' AS Date))
INSERT [dbo].[TheaterMovies] ([TMID], [TheaterID], [MovieID], [ShowtimeID], [ReservationLimit], [Date]) VALUES (5, 1, 1, 2, 3, CAST(N'2020-03-15' AS Date))
INSERT [dbo].[TheaterMovies] ([TMID], [TheaterID], [MovieID], [ShowtimeID], [ReservationLimit], [Date]) VALUES (6, 1, 6, 14, 1, CAST(N'2020-03-15' AS Date))
INSERT [dbo].[TheaterMovies] ([TMID], [TheaterID], [MovieID], [ShowtimeID], [ReservationLimit], [Date]) VALUES (7, 1, 1, 15, 30, CAST(N'2020-06-15' AS Date))
INSERT [dbo].[TheaterMovies] ([TMID], [TheaterID], [MovieID], [ShowtimeID], [ReservationLimit], [Date]) VALUES (8, 1, 1, 3, 20, CAST(N'2020-03-23' AS Date))
INSERT [dbo].[TheaterMovies] ([TMID], [TheaterID], [MovieID], [ShowtimeID], [ReservationLimit], [Date]) VALUES (9, 3, 11, 6, 10, CAST(N'2020-04-12' AS Date))
SET IDENTITY_INSERT [dbo].[TheaterMovies] OFF
SET IDENTITY_INSERT [dbo].[Theaters] ON 

INSERT [dbo].[Theaters] ([TheaterID], [TheaterName], [Address], [City], [State], [ZipCode], [Longitude], [Latitude]) VALUES (1, N'The Original DnD Theaters', N'6800 Zoo Dr', N'Kansas City', N'MO', N'64132', -94.528966, 39.006796)
INSERT [dbo].[Theaters] ([TheaterID], [TheaterName], [Address], [City], [State], [ZipCode], [Longitude], [Latitude]) VALUES (2, N'First Expansion DnD Theaters', N'521 E Chestnut St', N'Junction City', N'KS', N'66441', -96.820388, 39.018901)
INSERT [dbo].[Theaters] ([TheaterID], [TheaterName], [Address], [City], [State], [ZipCode], [Longitude], [Latitude]) VALUES (3, N'The Second Anticipated Expansion DnD Theaters', N'308 W Commercial St', N'Pleasant Hill', N'MO', N'64080', -94.277874, 38.784077)
SET IDENTITY_INSERT [dbo].[Theaters] OFF
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([TicketID], [UserID]) VALUES (3, N'761aa9be-9849-4596-a8e7-d30611343cb9')
INSERT [dbo].[Tickets] ([TicketID], [UserID]) VALUES (4, N'761aa9be-9849-4596-a8e7-d30611343cb9')
INSERT [dbo].[Tickets] ([TicketID], [UserID]) VALUES (5, N'761aa9be-9849-4596-a8e7-d30611343cb9')
INSERT [dbo].[Tickets] ([TicketID], [UserID]) VALUES (10, N'761aa9be-9849-4596-a8e7-d30611343cb9')
INSERT [dbo].[Tickets] ([TicketID], [UserID]) VALUES (11, N'761aa9be-9849-4596-a8e7-d30611343cb9')
INSERT [dbo].[Tickets] ([TicketID], [UserID]) VALUES (12, N'761aa9be-9849-4596-a8e7-d30611343cb9')
INSERT [dbo].[Tickets] ([TicketID], [UserID]) VALUES (13, N'761aa9be-9849-4596-a8e7-d30611343cb9')
INSERT [dbo].[Tickets] ([TicketID], [UserID]) VALUES (14, N'761aa9be-9849-4596-a8e7-d30611343cb9')
INSERT [dbo].[Tickets] ([TicketID], [UserID]) VALUES (15, N'761aa9be-9849-4596-a8e7-d30611343cb9')
INSERT [dbo].[Tickets] ([TicketID], [UserID]) VALUES (16, N'761aa9be-9849-4596-a8e7-d30611343cb9')
INSERT [dbo].[Tickets] ([TicketID], [UserID]) VALUES (17, N'761aa9be-9849-4596-a8e7-d30611343cb9')
INSERT [dbo].[Tickets] ([TicketID], [UserID]) VALUES (18, N'761aa9be-9849-4596-a8e7-d30611343cb9')
INSERT [dbo].[Tickets] ([TicketID], [UserID]) VALUES (19, N'761aa9be-9849-4596-a8e7-d30611343cb9')
INSERT [dbo].[Tickets] ([TicketID], [UserID]) VALUES (26, N'761aa9be-9849-4596-a8e7-d30611343cb9')
INSERT [dbo].[Tickets] ([TicketID], [UserID]) VALUES (27, N'761aa9be-9849-4596-a8e7-d30611343cb9')
INSERT [dbo].[Tickets] ([TicketID], [UserID]) VALUES (28, N'b72a3dcf-530c-4339-ac1d-d0e24de3b0b3')
INSERT [dbo].[Tickets] ([TicketID], [UserID]) VALUES (29, N'b72a3dcf-530c-4339-ac1d-d0e24de3b0b3')
INSERT [dbo].[Tickets] ([TicketID], [UserID]) VALUES (30, N'b72a3dcf-530c-4339-ac1d-d0e24de3b0b3')
SET IDENTITY_INSERT [dbo].[Tickets] OFF
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [AssignedTheaterID]) VALUES (N'072eb770-f884-4290-96c2-b0793bf0f83f', N'other', N'guy', NULL)
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [AssignedTheaterID]) VALUES (N'130997f4-4e08-4aef-b6c1-5d1534ab7da4', N'Jane', N'Doe', NULL)
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [AssignedTheaterID]) VALUES (N'761aa9be-9849-4596-a8e7-d30611343cb9', N'Annonymous', N'User', NULL)
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [AssignedTheaterID]) VALUES (N'b72a3dcf-530c-4339-ac1d-d0e24de3b0b3', N'First', N'Customer', NULL)
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [AssignedTheaterID]) VALUES (N'cc9e312c-9568-4e9e-89b1-45bdb0d6e529', N'John', N'Doe', 1)
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName], [AssignedTheaterID]) VALUES (N'e26d6c93-016b-4b6f-905e-c92ec87669b7', N'second', N'Customer', NULL)
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2/19/2020 8:43:56 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND name = N'RoleNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 2/19/2020 8:43:56 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 2/19/2020 8:43:56 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 2/19/2020 8:43:56 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_RoleId')
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 2/19/2020 8:43:56 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND name = N'IX_UserId')
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2/19/2020 8:43:56 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND name = N'UserNameIndex')
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SeatID_TheaterMovies]') AND parent_object_id = OBJECT_ID(N'[dbo].[SeatID]'))
ALTER TABLE [dbo].[SeatID]  WITH CHECK ADD  CONSTRAINT [FK_SeatID_TheaterMovies] FOREIGN KEY([TMID])
REFERENCES [dbo].[TheaterMovies] ([TMID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SeatID_TheaterMovies]') AND parent_object_id = OBJECT_ID(N'[dbo].[SeatID]'))
ALTER TABLE [dbo].[SeatID] CHECK CONSTRAINT [FK_SeatID_TheaterMovies]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SeatID_Tickets]') AND parent_object_id = OBJECT_ID(N'[dbo].[SeatID]'))
ALTER TABLE [dbo].[SeatID]  WITH CHECK ADD  CONSTRAINT [FK_SeatID_Tickets] FOREIGN KEY([TicketID])
REFERENCES [dbo].[Tickets] ([TicketID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SeatID_Tickets]') AND parent_object_id = OBJECT_ID(N'[dbo].[SeatID]'))
ALTER TABLE [dbo].[SeatID] CHECK CONSTRAINT [FK_SeatID_Tickets]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TheaterMovies_Movies]') AND parent_object_id = OBJECT_ID(N'[dbo].[TheaterMovies]'))
ALTER TABLE [dbo].[TheaterMovies]  WITH CHECK ADD  CONSTRAINT [FK_TheaterMovies_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TheaterMovies_Movies]') AND parent_object_id = OBJECT_ID(N'[dbo].[TheaterMovies]'))
ALTER TABLE [dbo].[TheaterMovies] CHECK CONSTRAINT [FK_TheaterMovies_Movies]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TheaterMovies_Showtimes]') AND parent_object_id = OBJECT_ID(N'[dbo].[TheaterMovies]'))
ALTER TABLE [dbo].[TheaterMovies]  WITH CHECK ADD  CONSTRAINT [FK_TheaterMovies_Showtimes] FOREIGN KEY([ShowtimeID])
REFERENCES [dbo].[Showtimes] ([ShowtimeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TheaterMovies_Showtimes]') AND parent_object_id = OBJECT_ID(N'[dbo].[TheaterMovies]'))
ALTER TABLE [dbo].[TheaterMovies] CHECK CONSTRAINT [FK_TheaterMovies_Showtimes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TheaterMovies_Theaters]') AND parent_object_id = OBJECT_ID(N'[dbo].[TheaterMovies]'))
ALTER TABLE [dbo].[TheaterMovies]  WITH CHECK ADD  CONSTRAINT [FK_TheaterMovies_Theaters] FOREIGN KEY([TheaterID])
REFERENCES [dbo].[Theaters] ([TheaterID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TheaterMovies_Theaters]') AND parent_object_id = OBJECT_ID(N'[dbo].[TheaterMovies]'))
ALTER TABLE [dbo].[TheaterMovies] CHECK CONSTRAINT [FK_TheaterMovies_Theaters]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tickets_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tickets]'))
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_UserDetails] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Tickets_UserDetails]') AND parent_object_id = OBJECT_ID(N'[dbo].[Tickets]'))
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_UserDetails]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_Theaters]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_Theaters] FOREIGN KEY([AssignedTheaterID])
REFERENCES [dbo].[Theaters] ([TheaterID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_Theaters]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_Theaters]
GO
ALTER DATABASE [DnDTheaters] SET  READ_WRITE 
GO
