USE [master]
GO
/****** Object:  Database [TicketSeller]    Script Date: 22/11/2021 11:44:24 p. m. ******/
CREATE DATABASE [TicketSeller]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TicketSeller', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TicketSeller.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TicketSeller_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TicketSeller_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TicketSeller] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TicketSeller].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TicketSeller] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TicketSeller] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TicketSeller] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TicketSeller] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TicketSeller] SET ARITHABORT OFF 
GO
ALTER DATABASE [TicketSeller] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TicketSeller] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TicketSeller] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TicketSeller] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TicketSeller] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TicketSeller] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TicketSeller] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TicketSeller] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TicketSeller] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TicketSeller] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TicketSeller] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TicketSeller] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TicketSeller] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TicketSeller] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TicketSeller] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TicketSeller] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TicketSeller] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TicketSeller] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TicketSeller] SET  MULTI_USER 
GO
ALTER DATABASE [TicketSeller] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TicketSeller] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TicketSeller] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TicketSeller] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TicketSeller] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TicketSeller] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TicketSeller] SET QUERY_STORE = OFF
GO
USE [TicketSeller]
GO
/****** Object:  Table [dbo].[TickersSale]    Script Date: 22/11/2021 11:44:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TickersSale](
	[idRuta] [int] NOT NULL,
	[idLugarRuta] [int] NOT NULL,
	[idHorario] [int] NOT NULL,
	[campo] [int] NOT NULL,
	[idTiquete] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_TickersSale] PRIMARY KEY CLUSTERED 
(
	[idTiquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketsHorarios]    Script Date: 22/11/2021 11:44:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketsHorarios](
	[idHorario] [int] IDENTITY(1,1) NOT NULL,
	[idRuta] [int] NOT NULL,
	[idLugarRuta] [int] NOT NULL,
	[tiempoHorario] [nvarchar](50) NULL,
 CONSTRAINT [PK_TicketsHorarios] PRIMARY KEY CLUSTERED 
(
	[idHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketsLugares]    Script Date: 22/11/2021 11:44:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketsLugares](
	[idLugarRuta] [int] IDENTITY(1,1) NOT NULL,
	[idRuta] [int] NULL,
	[NombreLugar] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TicketsLugares] PRIMARY KEY CLUSTERED 
(
	[idLugarRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketsRuta]    Script Date: 22/11/2021 11:44:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketsRuta](
	[idRuta] [int] IDENTITY(1,1) NOT NULL,
	[NombreRuta] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rutas] PRIMARY KEY CLUSTERED 
(
	[idRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TickersSale]  WITH CHECK ADD  CONSTRAINT [FK_TickersSale_TicketsHorarios] FOREIGN KEY([idHorario])
REFERENCES [dbo].[TicketsHorarios] ([idHorario])
GO
ALTER TABLE [dbo].[TickersSale] CHECK CONSTRAINT [FK_TickersSale_TicketsHorarios]
GO
ALTER TABLE [dbo].[TickersSale]  WITH CHECK ADD  CONSTRAINT [FK_TickersSale_TicketsLugares] FOREIGN KEY([idLugarRuta])
REFERENCES [dbo].[TicketsLugares] ([idLugarRuta])
GO
ALTER TABLE [dbo].[TickersSale] CHECK CONSTRAINT [FK_TickersSale_TicketsLugares]
GO
ALTER TABLE [dbo].[TickersSale]  WITH CHECK ADD  CONSTRAINT [FK_TickersSale_TicketsRuta] FOREIGN KEY([idRuta])
REFERENCES [dbo].[TicketsRuta] ([idRuta])
GO
ALTER TABLE [dbo].[TickersSale] CHECK CONSTRAINT [FK_TickersSale_TicketsRuta]
GO
ALTER TABLE [dbo].[TicketsHorarios]  WITH CHECK ADD  CONSTRAINT [FK_TicketsHorarios_TicketsLugares] FOREIGN KEY([idLugarRuta])
REFERENCES [dbo].[TicketsLugares] ([idLugarRuta])
GO
ALTER TABLE [dbo].[TicketsHorarios] CHECK CONSTRAINT [FK_TicketsHorarios_TicketsLugares]
GO
ALTER TABLE [dbo].[TicketsHorarios]  WITH CHECK ADD  CONSTRAINT [FK_TicketsHorarios_TicketsRuta] FOREIGN KEY([idRuta])
REFERENCES [dbo].[TicketsRuta] ([idRuta])
GO
ALTER TABLE [dbo].[TicketsHorarios] CHECK CONSTRAINT [FK_TicketsHorarios_TicketsRuta]
GO
ALTER TABLE [dbo].[TicketsLugares]  WITH CHECK ADD  CONSTRAINT [FK_TicketsLugares_TicketsRuta] FOREIGN KEY([idRuta])
REFERENCES [dbo].[TicketsRuta] ([idRuta])
GO
ALTER TABLE [dbo].[TicketsLugares] CHECK CONSTRAINT [FK_TicketsLugares_TicketsRuta]
GO
ALTER TABLE [dbo].[TicketsRuta]  WITH CHECK ADD  CONSTRAINT [FK_TicketsRuta_TicketsRuta] FOREIGN KEY([idRuta])
REFERENCES [dbo].[TicketsRuta] ([idRuta])
GO
ALTER TABLE [dbo].[TicketsRuta] CHECK CONSTRAINT [FK_TicketsRuta_TicketsRuta]
GO
USE [master]
GO
ALTER DATABASE [TicketSeller] SET  READ_WRITE 
GO
