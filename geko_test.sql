USE [master]
GO
/****** Object:  Database [GEKO_TEST]    Script Date: 13/12/2023 14:12:57 ******/
CREATE DATABASE [GEKO_TEST]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GEKO_TEST', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GEKO_TEST.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GEKO_TEST_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GEKO_TEST_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GEKO_TEST] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GEKO_TEST].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GEKO_TEST] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GEKO_TEST] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GEKO_TEST] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GEKO_TEST] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GEKO_TEST] SET ARITHABORT OFF 
GO
ALTER DATABASE [GEKO_TEST] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GEKO_TEST] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GEKO_TEST] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GEKO_TEST] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GEKO_TEST] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GEKO_TEST] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GEKO_TEST] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GEKO_TEST] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GEKO_TEST] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GEKO_TEST] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GEKO_TEST] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GEKO_TEST] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GEKO_TEST] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GEKO_TEST] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GEKO_TEST] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GEKO_TEST] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GEKO_TEST] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GEKO_TEST] SET RECOVERY FULL 
GO
ALTER DATABASE [GEKO_TEST] SET  MULTI_USER 
GO
ALTER DATABASE [GEKO_TEST] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GEKO_TEST] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GEKO_TEST] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GEKO_TEST] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GEKO_TEST] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GEKO_TEST] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GEKO_TEST', N'ON'
GO
ALTER DATABASE [GEKO_TEST] SET QUERY_STORE = OFF
GO
USE [GEKO_TEST]
GO
/****** Object:  Table [dbo].[FORMATO_MENSAJE]    Script Date: 13/12/2023 14:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FORMATO_MENSAJE](
	[COD_FORMATO] [int] IDENTITY(1,1) NOT NULL,
	[COD_TIPO] [int] NOT NULL,
	[COD_TIPO_INFORMACION] [int] NOT NULL,
	[NOMBRE] [varchar](300) NOT NULL,
	[REMITENTE] [varchar](300) NOT NULL,
	[ASUNTO] [varchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_FORMATO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MENSAJE]    Script Date: 13/12/2023 14:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENSAJE](
	[COD_MENSAJE] [int] IDENTITY(1,1) NOT NULL,
	[COD_FORMATO] [int] NOT NULL,
	[COD_PRODUCTO_PROYECTO] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_MENSAJE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 13/12/2023 14:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[COD_PRODUCTO] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [varchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_PRODUCTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO_PROYECTO]    Script Date: 13/12/2023 14:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO_PROYECTO](
	[COD_PRODUCTO_PROYECTO] [int] IDENTITY(1,1) NOT NULL,
	[COD_PROYECTO] [int] NOT NULL,
	[COD_PRODUCTO] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_PRODUCTO_PROYECTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROYECTO]    Script Date: 13/12/2023 14:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROYECTO](
	[COD_PROYECTO] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_PROYECTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO]    Script Date: 13/12/2023 14:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO](
	[COD_TIPO] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_TIPO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_INFORMACION]    Script Date: 13/12/2023 14:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_INFORMACION](
	[COD_TIPO_INFORMACION] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_TIPO_INFORMACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FORMATO_MENSAJE] ON 

INSERT [dbo].[FORMATO_MENSAJE] ([COD_FORMATO], [COD_TIPO], [COD_TIPO_INFORMACION], [NOMBRE], [REMITENTE], [ASUNTO]) VALUES (1, 2, 1, N'BIENVENIDA', N'ADMON', N'BIENVENIDO A NUESTRA ORGANIZACION')
INSERT [dbo].[FORMATO_MENSAJE] ([COD_FORMATO], [COD_TIPO], [COD_TIPO_INFORMACION], [NOMBRE], [REMITENTE], [ASUNTO]) VALUES (2, 2, 2, N'MORA PENDIENTE', N'ADMON', N'TIENE UNA MORA PENDIENTE DE CANCELAR')
INSERT [dbo].[FORMATO_MENSAJE] ([COD_FORMATO], [COD_TIPO], [COD_TIPO_INFORMACION], [NOMBRE], [REMITENTE], [ASUNTO]) VALUES (3, 1, 3, N'INFORMACION', N'ADMON', N'TIENE UNA NOTIFICACION SI LEER')
SET IDENTITY_INSERT [dbo].[FORMATO_MENSAJE] OFF
GO
SET IDENTITY_INSERT [dbo].[MENSAJE] ON 

INSERT [dbo].[MENSAJE] ([COD_MENSAJE], [COD_FORMATO], [COD_PRODUCTO_PROYECTO]) VALUES (1, 1, 1)
INSERT [dbo].[MENSAJE] ([COD_MENSAJE], [COD_FORMATO], [COD_PRODUCTO_PROYECTO]) VALUES (2, 1, 2)
INSERT [dbo].[MENSAJE] ([COD_MENSAJE], [COD_FORMATO], [COD_PRODUCTO_PROYECTO]) VALUES (3, 1, 3)
INSERT [dbo].[MENSAJE] ([COD_MENSAJE], [COD_FORMATO], [COD_PRODUCTO_PROYECTO]) VALUES (4, 2, 1)
INSERT [dbo].[MENSAJE] ([COD_MENSAJE], [COD_FORMATO], [COD_PRODUCTO_PROYECTO]) VALUES (5, 2, 2)
INSERT [dbo].[MENSAJE] ([COD_MENSAJE], [COD_FORMATO], [COD_PRODUCTO_PROYECTO]) VALUES (6, 2, 3)
INSERT [dbo].[MENSAJE] ([COD_MENSAJE], [COD_FORMATO], [COD_PRODUCTO_PROYECTO]) VALUES (7, 3, 1)
INSERT [dbo].[MENSAJE] ([COD_MENSAJE], [COD_FORMATO], [COD_PRODUCTO_PROYECTO]) VALUES (8, 3, 4)
INSERT [dbo].[MENSAJE] ([COD_MENSAJE], [COD_FORMATO], [COD_PRODUCTO_PROYECTO]) VALUES (9, 3, 5)
INSERT [dbo].[MENSAJE] ([COD_MENSAJE], [COD_FORMATO], [COD_PRODUCTO_PROYECTO]) VALUES (10, 3, 6)
INSERT [dbo].[MENSAJE] ([COD_MENSAJE], [COD_FORMATO], [COD_PRODUCTO_PROYECTO]) VALUES (11, 3, 7)
SET IDENTITY_INSERT [dbo].[MENSAJE] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] ON 

INSERT [dbo].[PRODUCTO] ([COD_PRODUCTO], [DESCRIPCION]) VALUES (1, N'PREMIA CLASICA')
INSERT [dbo].[PRODUCTO] ([COD_PRODUCTO], [DESCRIPCION]) VALUES (2, N'PREMIA ORO')
INSERT [dbo].[PRODUCTO] ([COD_PRODUCTO], [DESCRIPCION]) VALUES (3, N'PREMIA PLATINUM')
SET IDENTITY_INSERT [dbo].[PRODUCTO] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO_PROYECTO] ON 

INSERT [dbo].[PRODUCTO_PROYECTO] ([COD_PRODUCTO_PROYECTO], [COD_PROYECTO], [COD_PRODUCTO]) VALUES (1, 1, 1)
INSERT [dbo].[PRODUCTO_PROYECTO] ([COD_PRODUCTO_PROYECTO], [COD_PROYECTO], [COD_PRODUCTO]) VALUES (2, 2, 1)
INSERT [dbo].[PRODUCTO_PROYECTO] ([COD_PRODUCTO_PROYECTO], [COD_PROYECTO], [COD_PRODUCTO]) VALUES (3, 3, 1)
INSERT [dbo].[PRODUCTO_PROYECTO] ([COD_PRODUCTO_PROYECTO], [COD_PROYECTO], [COD_PRODUCTO]) VALUES (4, 1, 2)
INSERT [dbo].[PRODUCTO_PROYECTO] ([COD_PRODUCTO_PROYECTO], [COD_PROYECTO], [COD_PRODUCTO]) VALUES (5, 2, 2)
INSERT [dbo].[PRODUCTO_PROYECTO] ([COD_PRODUCTO_PROYECTO], [COD_PROYECTO], [COD_PRODUCTO]) VALUES (6, 3, 2)
INSERT [dbo].[PRODUCTO_PROYECTO] ([COD_PRODUCTO_PROYECTO], [COD_PROYECTO], [COD_PRODUCTO]) VALUES (7, 1, 3)
INSERT [dbo].[PRODUCTO_PROYECTO] ([COD_PRODUCTO_PROYECTO], [COD_PROYECTO], [COD_PRODUCTO]) VALUES (9, 2, 3)
INSERT [dbo].[PRODUCTO_PROYECTO] ([COD_PRODUCTO_PROYECTO], [COD_PROYECTO], [COD_PRODUCTO]) VALUES (10, 3, 3)
SET IDENTITY_INSERT [dbo].[PRODUCTO_PROYECTO] OFF
GO
SET IDENTITY_INSERT [dbo].[PROYECTO] ON 

INSERT [dbo].[PROYECTO] ([COD_PROYECTO], [NOMBRE]) VALUES (1, N'PREMIA')
INSERT [dbo].[PROYECTO] ([COD_PROYECTO], [NOMBRE]) VALUES (2, N'KONMI')
INSERT [dbo].[PROYECTO] ([COD_PROYECTO], [NOMBRE]) VALUES (3, N'YUJULE')
SET IDENTITY_INSERT [dbo].[PROYECTO] OFF
GO
SET IDENTITY_INSERT [dbo].[TIPO] ON 

INSERT [dbo].[TIPO] ([COD_TIPO], [NOMBRE]) VALUES (1, N'EMAIL')
INSERT [dbo].[TIPO] ([COD_TIPO], [NOMBRE]) VALUES (2, N'SMS')
INSERT [dbo].[TIPO] ([COD_TIPO], [NOMBRE]) VALUES (3, N'MENSAJE EN ESTADO DE CUENTA')
SET IDENTITY_INSERT [dbo].[TIPO] OFF
GO
SET IDENTITY_INSERT [dbo].[TIPO_INFORMACION] ON 

INSERT [dbo].[TIPO_INFORMACION] ([COD_TIPO_INFORMACION], [NOMBRE]) VALUES (1, N'MENSAJE DE BIENVENIDA')
INSERT [dbo].[TIPO_INFORMACION] ([COD_TIPO_INFORMACION], [NOMBRE]) VALUES (2, N'MENSAJE DE MORA')
INSERT [dbo].[TIPO_INFORMACION] ([COD_TIPO_INFORMACION], [NOMBRE]) VALUES (3, N'MENSAJE DE INFORMACION')
INSERT [dbo].[TIPO_INFORMACION] ([COD_TIPO_INFORMACION], [NOMBRE]) VALUES (4, N'MENSAJE DE PROMOCION')
SET IDENTITY_INSERT [dbo].[TIPO_INFORMACION] OFF
GO
ALTER TABLE [dbo].[FORMATO_MENSAJE]  WITH CHECK ADD FOREIGN KEY([COD_TIPO])
REFERENCES [dbo].[TIPO] ([COD_TIPO])
GO
ALTER TABLE [dbo].[FORMATO_MENSAJE]  WITH CHECK ADD FOREIGN KEY([COD_TIPO_INFORMACION])
REFERENCES [dbo].[TIPO_INFORMACION] ([COD_TIPO_INFORMACION])
GO
ALTER TABLE [dbo].[MENSAJE]  WITH CHECK ADD FOREIGN KEY([COD_FORMATO])
REFERENCES [dbo].[FORMATO_MENSAJE] ([COD_FORMATO])
GO
ALTER TABLE [dbo].[MENSAJE]  WITH CHECK ADD FOREIGN KEY([COD_PRODUCTO_PROYECTO])
REFERENCES [dbo].[PRODUCTO_PROYECTO] ([COD_PRODUCTO_PROYECTO])
GO
ALTER TABLE [dbo].[PRODUCTO_PROYECTO]  WITH CHECK ADD FOREIGN KEY([COD_PROYECTO])
REFERENCES [dbo].[PROYECTO] ([COD_PROYECTO])
GO
ALTER TABLE [dbo].[PRODUCTO_PROYECTO]  WITH CHECK ADD FOREIGN KEY([COD_PRODUCTO])
REFERENCES [dbo].[PRODUCTO] ([COD_PRODUCTO])
GO
USE [master]
GO
ALTER DATABASE [GEKO_TEST] SET  READ_WRITE 
GO
