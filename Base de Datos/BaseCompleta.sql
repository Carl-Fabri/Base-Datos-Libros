USE [master]
GO
/****** Object:  Database [UNC]    Script Date: 05/02/2022 6:17:08 ******/
CREATE DATABASE [UNC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UNC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.FABRII\MSSQL\DATA\UNC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UNC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.FABRII\MSSQL\DATA\UNC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UNC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UNC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UNC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UNC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UNC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UNC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UNC] SET ARITHABORT OFF 
GO
ALTER DATABASE [UNC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UNC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UNC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UNC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UNC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UNC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UNC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UNC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UNC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UNC] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UNC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UNC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UNC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UNC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UNC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UNC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UNC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UNC] SET RECOVERY FULL 
GO
ALTER DATABASE [UNC] SET  MULTI_USER 
GO
ALTER DATABASE [UNC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UNC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UNC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UNC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UNC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UNC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'UNC', N'ON'
GO
ALTER DATABASE [UNC] SET QUERY_STORE = OFF
GO
USE [UNC]
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 05/02/2022 6:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[idLibro] [int] NOT NULL,
	[titulo] [varchar](90) NOT NULL,
	[editorial] [varchar](75) NOT NULL,
	[especialidad] [varchar](70) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lectores]    Script Date: 05/02/2022 6:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectores](
	[idLectores] [int] NOT NULL,
	[dni] [varchar](45) NOT NULL,
	[nombres] [varchar](45) NOT NULL,
	[direccion] [varchar](75) NOT NULL,
	[carrera] [varchar](45) NOT NULL,
	[edad] [varchar](45) NOT NULL,
	[sexo] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idLectores] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestamos]    Script Date: 05/02/2022 6:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamos](
	[idPrestamos] [int] NOT NULL,
	[fechaPrestamo] [datetime] NOT NULL,
	[fechaDevolucion] [datetime] NOT NULL,
	[estado] [char](1) NOT NULL,
	[Libros_idLibro] [int] NOT NULL,
	[Lectores_idLectores] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPrestamos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_LISTAALQUILER]    Script Date: 05/02/2022 6:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[FN_LISTAALQUILER] (@libro INT)
RETURNS table
AS

	RETURN (
		SELECT AVG(CONVERT(int, edad)) as [Edad promedio] 
		from PRESTAMOS INNER JOIN LIBROS ON PRESTAMOS.Libros_idLibro=LIBROS.idLibro INNER JOIN LECTORES 
		ON PRESTAMOS.Lectores_idLectores=LECTORES.idLectores WHERE @libro = 1

	);
GO
/****** Object:  UserDefinedFunction [dbo].[F_ListarPrestamos]    Script Date: 05/02/2022 6:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[F_ListarPrestamos] (@lector INT)
RETURNS table
AS

	RETURN (
		SELECT titulo, fechaPrestamo, fechaDevolucion,nombres from Prestamos P
		INNER JOIN Libros LI ON P.Libros_idLibro = LI.idLibro
		INNER JOIN LECTORES LE ON P.Lectores_idLectores= LE.idLectores
		WHERE P.Lectores_idLectores = @lector
	);
GO
/****** Object:  View [dbo].[v_PrestamosLibrosEditorial]    Script Date: 05/02/2022 6:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PrestamosLibrosEditorial] AS
	SELECT editorial,titulo,fechaPrestamo from Prestamos P INNER JOIN Lectores LE 
	ON P.idPrestamos = LE.idLectores INNER JOIN Libros LI ON P.Libros_idLibro = LI.idLibro
	WHERE editorial = 'Planeta'
GO
/****** Object:  Table [dbo].[Autores]    Script Date: 05/02/2022 6:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autores](
	[idAutores] [int] NOT NULL,
	[Nombre] [varchar](70) NOT NULL,
	[Nacionalidad] [varchar](55) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAutores] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libros_Autores]    Script Date: 05/02/2022 6:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros_Autores](
	[idLibros] [int] NOT NULL,
	[idAutores] [int] NOT NULL,
 CONSTRAINT [pk_Libros_Autores_IdLibros] PRIMARY KEY CLUSTERED 
(
	[idLibros] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_AutoresLibrosMasSolicitados]    Script Date: 05/02/2022 6:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_AutoresLibrosMasSolicitados] AS
	SELECT Nombre,titulo,idLibros from Autores A INNER JOIN Libros_Autores LA on A.idAutores= LA.idLibros 
	INNER JOIN Prestamos P ON LA.idLibros = P.Libros_idLibro  INNER JOIN Libros LI ON LI.idLibro = LA.idLibros
	GROUP BY Nombre,LI.titulo,la.idLibros
	having COUNT(*)>1  
GO
ALTER TABLE [dbo].[Libros_Autores]  WITH CHECK ADD FOREIGN KEY([idAutores])
REFERENCES [dbo].[Autores] ([idAutores])
GO
ALTER TABLE [dbo].[Libros_Autores]  WITH CHECK ADD FOREIGN KEY([idLibros])
REFERENCES [dbo].[Libros] ([idLibro])
GO
ALTER TABLE [dbo].[Prestamos]  WITH CHECK ADD FOREIGN KEY([Libros_idLibro])
REFERENCES [dbo].[Libros] ([idLibro])
GO
ALTER TABLE [dbo].[Prestamos]  WITH CHECK ADD FOREIGN KEY([Lectores_idLectores])
REFERENCES [dbo].[Lectores] ([idLectores])
GO
/****** Object:  StoredProcedure [dbo].[sp_LibrosAutor]    Script Date: 05/02/2022 6:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_LibrosAutor] AS
	SELECT nombre,titulo from Autores A JOIN Libros_Autores LA on LA.idAutores =  A.idAutores 
	JOIN Libros I on I.idLibro = LA.idLibros where Nombre = 'Stephen King'
GO
/****** Object:  StoredProcedure [dbo].[sp_PrestamosDevolver]    Script Date: 05/02/2022 6:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_PrestamosDevolver] AS
	SELECT estado,fechaPrestamo,titulo,nombres,titulo from Prestamos P JOIN Libros L on l.idLibro = P.Libros_idLibro 
	JOIN Lectores E on E.idLectores = P.Lectores_idLectores
	where estado  = CONVERT(varchar,'N') --N es el caracter que hace referencia al estado de los libros que no fueron entregados
GO
/****** Object:  StoredProcedure [dbo].[sp_PrestamosEditorial]    Script Date: 05/02/2022 6:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_PrestamosEditorial] AS
	SELECT fechaPrestamo,titulo,nombres from Prestamos P INNER JOIN Libros L ON l.idLibro = P.Libros_idLibro
	INNER JOIN Lectores E ON E.idLectores = P.Lectores_idLectores
	where fechaPrestamo > CONVERT (date, '01/01/2018 00:00:00:000') and fechaPrestamo < CONVERT(date, '01/03/2020 12:12:12:000')
	GROUP BY fechaPrestamo,L.titulo,E.nombres
GO
/****** Object:  StoredProcedure [dbo].[sp_PrestamosEditorialAño]    Script Date: 05/02/2022 6:17:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_PrestamosEditorialAño] AS
	SELECT editorial,titulo,fechaPrestamo from Libros LI INNER JOIN Prestamos P on P.Libros_idLibro = LI.idLibro
	where fechaPrestamo > CONVERT (date, '2019-01-01 00:00:00:000')and fechaPrestamo < CONVERT(date, '2019-12-30 12:12:12:000') and editorial = 'SANTILLANA'
GO
USE [master]
GO
ALTER DATABASE [UNC] SET  READ_WRITE 
GO
