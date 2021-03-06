USE [master]
GO
/****** Object:  Database [soporte]    Script Date: 28/01/2021 18:36:25 ******/
CREATE DATABASE [soporte]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'soporte', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\soporte.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'soporte_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\soporte_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [soporte] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [soporte].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [soporte] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [soporte] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [soporte] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [soporte] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [soporte] SET ARITHABORT OFF 
GO
ALTER DATABASE [soporte] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [soporte] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [soporte] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [soporte] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [soporte] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [soporte] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [soporte] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [soporte] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [soporte] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [soporte] SET  DISABLE_BROKER 
GO
ALTER DATABASE [soporte] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [soporte] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [soporte] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [soporte] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [soporte] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [soporte] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [soporte] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [soporte] SET RECOVERY FULL 
GO
ALTER DATABASE [soporte] SET  MULTI_USER 
GO
ALTER DATABASE [soporte] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [soporte] SET DB_CHAINING OFF 
GO
ALTER DATABASE [soporte] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [soporte] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [soporte] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [soporte] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'soporte', N'ON'
GO
ALTER DATABASE [soporte] SET QUERY_STORE = OFF
GO
USE [soporte]
GO
/****** Object:  Table [dbo].[clasificacion]    Script Date: 28/01/2021 18:36:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clasificacion](
	[idClasificacion] [int] IDENTITY(1,1) NOT NULL,
	[Clasificacion] [varchar](100) NULL,
	[Orden] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_clasificacion] PRIMARY KEY CLUSTERED 
(
	[idClasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estado]    Script Date: 28/01/2021 18:36:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado](
	[idEstado] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](50) NULL,
	[Orden] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_estado] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[perfil]    Script Date: 28/01/2021 18:36:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfil](
	[idPerfil] [int] IDENTITY(1,1) NOT NULL,
	[Perfil] [varchar](50) NULL,
	[Orden] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_perfil] PRIMARY KEY CLUSTERED 
(
	[idPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prioriad]    Script Date: 28/01/2021 18:36:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prioriad](
	[idPrioridad] [int] IDENTITY(1,1) NOT NULL,
	[Prioridad] [varchar](50) NULL,
	[ValorPrioridad] [int] NULL,
	[Orden] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_prioriad] PRIMARY KEY CLUSTERED 
(
	[idPrioridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[soporte]    Script Date: 28/01/2021 18:36:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[soporte](
	[idSoporte] [int] IDENTITY(1,1) NOT NULL,
	[idPerfil] [int] NULL,
	[idUsuario] [int] NULL,
	[Fecha] [datetime] NULL,
	[idClasificacion] [int] NULL,
	[idPrioridad] [int] NULL,
	[Asunto] [varchar](150) NULL,
	[HoraSoporte] [numeric](18, 2) NULL,
	[idEstado] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_soporte] PRIMARY KEY CLUSTERED 
(
	[idSoporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 28/01/2021 18:36:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NULL,
	[Nombre] [varchar](150) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[soporte]  WITH CHECK ADD  CONSTRAINT [FK_soporte_clasificacion] FOREIGN KEY([idClasificacion])
REFERENCES [dbo].[clasificacion] ([idClasificacion])
GO
ALTER TABLE [dbo].[soporte] CHECK CONSTRAINT [FK_soporte_clasificacion]
GO
ALTER TABLE [dbo].[soporte]  WITH CHECK ADD  CONSTRAINT [FK_soporte_estado] FOREIGN KEY([idEstado])
REFERENCES [dbo].[estado] ([idEstado])
GO
ALTER TABLE [dbo].[soporte] CHECK CONSTRAINT [FK_soporte_estado]
GO
ALTER TABLE [dbo].[soporte]  WITH CHECK ADD  CONSTRAINT [FK_soporte_perfil] FOREIGN KEY([idPerfil])
REFERENCES [dbo].[perfil] ([idPerfil])
GO
ALTER TABLE [dbo].[soporte] CHECK CONSTRAINT [FK_soporte_perfil]
GO
ALTER TABLE [dbo].[soporte]  WITH CHECK ADD  CONSTRAINT [FK_soporte_prioriad] FOREIGN KEY([idPrioridad])
REFERENCES [dbo].[prioriad] ([idPrioridad])
GO
ALTER TABLE [dbo].[soporte] CHECK CONSTRAINT [FK_soporte_prioriad]
GO
ALTER TABLE [dbo].[soporte]  WITH CHECK ADD  CONSTRAINT [FK_soporte_usuario] FOREIGN KEY([idPrioridad])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[soporte] CHECK CONSTRAINT [FK_soporte_usuario]
GO
USE [master]
GO
ALTER DATABASE [soporte] SET  READ_WRITE 
GO
