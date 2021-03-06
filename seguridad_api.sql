USE [master]
GO
/****** Object:  Database [seguridad_api]    Script Date: 28/11/2021 10:23:48 ******/
CREATE DATABASE [seguridad_api]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'seguridad_api', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\seguridad_api.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'seguridad_api_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\seguridad_api_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [seguridad_api] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [seguridad_api].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [seguridad_api] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [seguridad_api] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [seguridad_api] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [seguridad_api] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [seguridad_api] SET ARITHABORT OFF 
GO
ALTER DATABASE [seguridad_api] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [seguridad_api] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [seguridad_api] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [seguridad_api] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [seguridad_api] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [seguridad_api] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [seguridad_api] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [seguridad_api] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [seguridad_api] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [seguridad_api] SET  DISABLE_BROKER 
GO
ALTER DATABASE [seguridad_api] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [seguridad_api] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [seguridad_api] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [seguridad_api] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [seguridad_api] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [seguridad_api] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [seguridad_api] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [seguridad_api] SET RECOVERY FULL 
GO
ALTER DATABASE [seguridad_api] SET  MULTI_USER 
GO
ALTER DATABASE [seguridad_api] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [seguridad_api] SET DB_CHAINING OFF 
GO
ALTER DATABASE [seguridad_api] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [seguridad_api] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [seguridad_api] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [seguridad_api] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'seguridad_api', N'ON'
GO
ALTER DATABASE [seguridad_api] SET QUERY_STORE = OFF
GO
USE [seguridad_api]
GO
/****** Object:  Table [dbo].[equipo]    Script Date: 28/11/2021 10:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipo](
	[pokemon] [int] NOT NULL,
	[usuario] [int] NOT NULL,
	[orden] [int] NOT NULL,
	[id_equipopkmn] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_equipo_1] PRIMARY KEY CLUSTERED 
(
	[id_equipopkmn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evolucion]    Script Date: 28/11/2021 10:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evolucion](
	[evolucion_id] [int] NOT NULL,
	[pokemon] [int] NOT NULL,
	[tipoe] [int] NOT NULL,
	[orden] [int] NOT NULL,
 CONSTRAINT [PK_evolucion] PRIMARY KEY CLUSTERED 
(
	[evolucion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pokemon]    Script Date: 28/11/2021 10:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pokemon](
	[pokemon_id] [int] IDENTITY(1,1) NOT NULL,
	[pokemon_nombre] [varchar](50) NULL,
	[pokemon_desc] [text] NULL,
	[pokemon_altura] [decimal](18, 0) NULL,
	[pokemon_peso] [decimal](18, 0) NULL,
	[pokemon_img] [varchar](500) NULL,
 CONSTRAINT [PK_pokemon] PRIMARY KEY CLUSTERED 
(
	[pokemon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo]    Script Date: 28/11/2021 10:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo](
	[tipo_id] [int] IDENTITY(1,1) NOT NULL,
	[tipo_nombre] [nvarchar](max) NULL,
 CONSTRAINT [PK_tipo] PRIMARY KEY CLUSTERED 
(
	[tipo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_evolucion]    Script Date: 28/11/2021 10:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_evolucion](
	[tipoe_id] [int] IDENTITY(1,1) NOT NULL,
	[tipoe_nombre] [varchar](50) NULL,
 CONSTRAINT [PK_tipo_evolucion] PRIMARY KEY CLUSTERED 
(
	[tipoe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipopkmn]    Script Date: 28/11/2021 10:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipopkmn](
	[tipopkmn_id] [int] NOT NULL,
	[tipo_id] [int] NOT NULL,
	[pokemon_id] [int] NOT NULL,
 CONSTRAINT [PK_tipopkmn] PRIMARY KEY CLUSTERED 
(
	[tipopkmn_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 28/11/2021 10:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[usuario_id] [int] IDENTITY(1,1) NOT NULL,
	[usuario_nombre] [nvarchar](max) NOT NULL,
	[usuario_apellido] [nvarchar](max) NULL,
	[usuario_nickname] [nchar](20) NOT NULL,
	[usuario_genero] [nvarchar](max) NULL,
	[usuario_pass] [varchar](max) NULL,
	[usuario_tel] [varchar](10) NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[usuario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[equipo]  WITH CHECK ADD  CONSTRAINT [FK_equipo_pokemon] FOREIGN KEY([pokemon])
REFERENCES [dbo].[pokemon] ([pokemon_id])
GO
ALTER TABLE [dbo].[equipo] CHECK CONSTRAINT [FK_equipo_pokemon]
GO
ALTER TABLE [dbo].[equipo]  WITH CHECK ADD  CONSTRAINT [FK_equipo_usuario] FOREIGN KEY([usuario])
REFERENCES [dbo].[usuario] ([usuario_id])
GO
ALTER TABLE [dbo].[equipo] CHECK CONSTRAINT [FK_equipo_usuario]
GO
ALTER TABLE [dbo].[evolucion]  WITH CHECK ADD  CONSTRAINT [FK_evolucion_pokemon] FOREIGN KEY([pokemon])
REFERENCES [dbo].[pokemon] ([pokemon_id])
GO
ALTER TABLE [dbo].[evolucion] CHECK CONSTRAINT [FK_evolucion_pokemon]
GO
ALTER TABLE [dbo].[evolucion]  WITH CHECK ADD  CONSTRAINT [FK_evolucion_tipo_evolucion] FOREIGN KEY([evolucion_id])
REFERENCES [dbo].[tipo_evolucion] ([tipoe_id])
GO
ALTER TABLE [dbo].[evolucion] CHECK CONSTRAINT [FK_evolucion_tipo_evolucion]
GO
ALTER TABLE [dbo].[tipopkmn]  WITH CHECK ADD  CONSTRAINT [FK_tipopkmn_pokemon] FOREIGN KEY([pokemon_id])
REFERENCES [dbo].[pokemon] ([pokemon_id])
GO
ALTER TABLE [dbo].[tipopkmn] CHECK CONSTRAINT [FK_tipopkmn_pokemon]
GO
ALTER TABLE [dbo].[tipopkmn]  WITH CHECK ADD  CONSTRAINT [FK_tipopkmn_tipo] FOREIGN KEY([tipo_id])
REFERENCES [dbo].[tipo] ([tipo_id])
GO
ALTER TABLE [dbo].[tipopkmn] CHECK CONSTRAINT [FK_tipopkmn_tipo]
GO
USE [master]
GO
ALTER DATABASE [seguridad_api] SET  READ_WRITE 
GO
