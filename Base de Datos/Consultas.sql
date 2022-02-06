


CREATE DATABASE UNC
GO

----------- Creacion de Tablas
USE UNC

CREATE TABLE Autores(
		idAutores INT primary key not null,  --Primary Key
		
		Nombre varchar(70) not null,          --Tablas Sin restricciones
		Nacionalidad varchar(55) not null

)
--
CREATE TABLE Libros(
		idLibro INT primary key not null,   --Primary Key
		
		titulo varchar(90) not null,         --Tablas Sin restricciones
		editorial varchar(75) not null,
		especialidad varchar(70) not null

)
--

CREATE TABLE Lectores(
		idLectores INT primary key not null,  --Primary Key
		
		dni varchar(45) not null,          --Tablas Sin restricciones
		nombres varchar(45) not null,
		direccion varchar(75) not null,
		carrera varchar(45) not null,
		edad varchar(45) not null,
		sexo char(1) not null


)

--
CREATE TABLE Libros_Autores(
		idLibros Int not null,                  
		idAutores Int not null,
		

--Foreing Keys

 FOREIGN KEY (idLibros) REFERENCES Libros(idLibro),
 FOREIGN KEY (idAutores) REFERENCES Autores(idAutores)
)

--
CREATE TABLE Prestamos(
		idPrestamos INT Primary Key not null,        --Primary Key
		
		fechaPrestamo DATETIME not null,
		fechaDevolucion DATETIME not null,
		estado CHAR(1) not null,
		
		Libros_idLibro INT not null,  
		Lectores_idLectores INT  not null

 FOREIGN KEY (Libros_idLibro) REFERENCES Libros(idLibro),
 FOREIGN KEY (Lectores_idLectores) REFERENCES Lectores(idLectores)

)




--Establecer las Foregn Keys   -Libros Autores (En caso de alternar tablas)------------------------------------------------

ALTER TABLE Libros_Autores ADD CONSTRAINT pk_Libros_Autores_IdLibros PRIMARY KEY (IdLibros)

------------------------------------------------------------------------------------------------------
/* Comandos Por si ocurren errores*/

select * from  Libros_Autores

DELETE FROM Libros;

------------------------------------------------------------------------------------------------

---Insertando Datos


INSERT INTO AUTORES 
VALUES
('1','Stephen King','Estados Unidos'),
('2','Howard Phillips','Estado Unidos'),
('3','Mario Vargas Llosa','Perù'),
('4','Richar Laymon','Estado Unidos'),
('5','Dean R. Koontz','Estados Unidos'),
('6','Alan Moore','Inglaterra'),
('7','John Verdon','Estados Unidos'),
('8','Emilio Gil Ibor','España'),
('9','ANA MARIA MATUTE','España'),
('10','Elizabeth Kay','Londres'),
('11','Megan Maxwell','España'),
('12','Carlos Ruiz Zafòn','España'),
('13','Pau Donès','España'),
('14','Carlos Ruiz Zafòn','España'),
('15','Fernando Aramburu','España'),
('16','Eva Garcia Sàenz','España'),
('17','Curro Cañete','España'),
('18','Maria Oruña','España'),
('19','Julio Fuentes Gonzàlez','Argentina'),
('20','Fernando Iwaski','Perù'),
('21','CLIVE BARKER','Inglterra'),
('22','Jack C. McCormac','Estados Unidos'),
('23','Lorenzo Amable','España'),
('24','Alberto Bryce Echenìque','Perù'),
('25','Julio Ramòn Ribeyro','Perù'),
('26','Phillip Jose Farmer','Estado Unidos'),
('27','Joan Manuel Gisbert','España'),
('28','Thomas Harris','Estado Unidos'),
('29','Diego Ameixeiras','Suiza'),
('30','John Katzenbach','Estado Unidos')

SELECT * FROM Autores

--ESPECIALIDAD DE CADA LIBRO-----------

--AUTOAYUDA
--INGENIERIA CIVIL
--HISTORIA
--NOVELA NEGRA
--NOVELA ROMANTICA
--SUSPENSO
--TERROR
--LITERUATURA FANTASTICA
--LITERATURA FICCION
--POLITICA


--EDITORIALES DE CADA LIBRO-----------

--PLANETA
--DEBOLSILLO
--AMARANTE
--SANTILLANA
--ALFAGUARA
--BOOKET
--ALMA

INSERT INTO LIBROS
VALUES

('1','IT','DEBOLSILLO','SUSPENSO'),
('2','LA LLAMADA DE CTHULHU','SANTILLANA','SUSPENSO'),
('3','LA CIUDAD Y LOS PERROS','ALFAGUARA','NOVELA SOCIAL'),
('4','HOWARD PHILLIPS','ALMA','TERROR'),
('5','LOS OJOS DE LA OSCURIDAD','RBA LIBROS','SUSPENSO'),
('6','HIDRAULICA','RIL EDITORES','INGENIERIA CIVIL'),
('7','NO ABRAS LOS OJOS','ROCA','SUSPENSO'),
('8','EL SUEÑO DEL ALFARERO','AMARANTE','NOVELA NEGRA'),
('9','OLVIDADO REY GUDÙ','PLANETA','LITERATURA FANTASTICA'),
('10','SIETE MENTIRAS','PLANETA','THRILLER'),
('11','¿A QUÈ ESTÀS ESPERANDO?','ESCENCIA','NOVELA ROMANTICA'),
('12','LA TRILOGIA DE LA NIEBLA','BOOKET','NOVELA CONTEMPORANEA'),
('13','50 PALOS','BOOKET','AUTOAYUDA'),
('14','LA CIUDAD DE VAPOR','PLANETA','NOVELA GENERAL'),
('15','PATRIA','MAXITUSQUETS','POLITICA'),
('16','AQUITANIA','PLANETA','NOVELA NEGRA'),
('17','AHORA TE TOCA SER FELIZ','PLANETA','AUTOAYUDA'),
('18','EL BOSQUE DE LOS CUATRO VIENTOS','DESTINO','HISTORIA'),
('19','EL ASESINO DEL BLOODY MARY','AMARANTE','NOVELA NEGRA'),
('20','AJUAR FUNERARIO','PAGINA DE ESPUMA','TERROR'),
('21','LIBROS DE SANGRE','LA FACTORIA DE IDEAS','TERROR'),
('22','DISEÑO DE ESTRUCTURAS DE ACERO','ALFAOMEGA','INGENIERIA CIVIL'),
('23','LA GUERRA DE DOLORES BELTRAN','AMARANTE','POLITICA'),
('24','UN MUNDO PARA JULIUS','SANTILLANA','LITERATURA FICCION'),
('25','LOS GALLINAZOS SIN PLUMAS','SANTILLANA','CUENTO'),
('26','EL ABISMO','TIMUN MAS','LITERATURA FANTASTICA'),
('27','LA MANSION DE LOS ABISMOS','PLANETA LECTOR','NOVELA'),
('28','EL SILENCIO DE LOS CORDEROS','DEBOLSIILO','NOVELA POLICIACA'),
('29','LA NOCHE DEL CAIMAN','FCE','SUSPENSO'),
('30','CONFIANZA CIEGA','EDICIONES B','SUSPENSO'),
('31','TOMINOCKER','DEBOLSILLO','SUSPENSO'),
('32','EL UMBRAL DE LA NOCHE','DEBOLSILLO','SUSPENSO')

SELECT * FROM LIBROS

-----Sexo de los Lectores------
--(F) Femenino
--(M) Masculino

INSERT INTO Lectores
VALUES
('1','55462963','Sebastian Francia','Los Olivos','Ingenieria Software','19','M'),
('2','32997353','Alejandro Lopez','Callao','Ingenieria Software','19','M'),
('3','87956736','Ayrton Rumualdo','Callao','Ingenieria Software','22','M'),
('4','86362689','David Alexander','Puente Pìedra','Ingenieria Software','25','F'),
('5','38868587','Pedro Miguel ','Av Sergio Bernales','Profesor','15','M'),
('6','67759646','Nieves Canovas','CA San Agustin','Administrador de Empresas','30','F'),
('7','98928735','Jesusa Mariño','CA San Lorenzo','Diseñador Digital','27','M'),
('8','45528383','Karla Flandez','Jiron Carmen','Farmaceutico','22','F'),
('9','32688497','Anyelo Peredo','Psj Doce','Medico','19','M'),
('10','88925453','Emely Ormazabal','Psj Trece','Psicologo','17','F'),

('11','99892525','Rodrigo Arnau','Jiron Leoncio Prado','Medico','19','M'),
('12','45869588','Hamza Contreras','CA San Lorenzo','Farmaceutico','35','M'),
('13','46354758','Aquilino Guerrero','Jr Victor Samora','Pintor','28','M'),
('14','99538323','Yasmin Narvaez','Psj San Felipe','Administrador de Empresas','30','F'),
('15','55737963','Laura Taboada','Psj Cuarenta y Dos','Abogado','31','F'),
('16','75536845','Elisabet Moyano','Psj Cuarto','Medico','40','F'),
('17','52947756','Salma Agudo','CA Domingo Elias','Arquitecto','38','F'),
('18','75976549','Maria Candelaria','CA Junin','Psicologo','17','F'),
('19','25369437','Evaristo Conesa','Jr San Pedro','Arquitecto','22','M'),
('20','73729674','Magdalena Carbonell','CA Junin','Abogado','20','F'),

('21','64823387','Florencia Planas','Jr Dante','Pintor','17','F'),
('22','64823387','Clemente Burgos','CA Santa Rosa','Mecanico','19','M'),
('23','64823387','Carmelo Ferrer','AV Angamos','Medico','20','M'),
('24','64823387','Mohamed Rodrigues','CA Domingo Elias','Diseñador Digital','25','M'),
('25','64823387','Esperanza Camacho','Jr Ica','Fisico','17','F'),
('26','64823387','Genoveva Pavon','Jr Juan Ochoa','Farmaceutico','18','F'),
('27','64823387','Francisco Manuel','Jr Carmen','Arquitecto','19','M'),
('28','64823387','Maria Antonia','CA San Agustin','Diseñador Digital','22','F'),
('29','64823387','Alberto Palacio','Av Avelino Caceres','Geologo','30','M'),
('30','64823387','Juan Bautista','Av Ricardo Palma','Fisico','33','M')

SELECT * FROM Lectores
-----Estados de cada libro---

-- (B) Buen Estado
-- (M) Maltratado
-- (A) Abollado
-- (N) No entrego


INSERT INTO Prestamos
VALUES

('1','20141011 07:30:30','20141224 09:30:30','B','1','2'),
('2','20141121 08:12:30','20141125 10:23:10','B','2','2'),
('3','20181221 09:12:45','20190102 08:30:09','B','3','3'),
('4','20170601 10:15:25','20170612 11:24:30','B','4','4'),
('5','20190503 11:25:30','20190612 09:11:29','B','5','14'),
('6','20160311 12:30:25','20160430 07:12:09','A','6','6'),
('7','20150909 09:12:54','20151211 01:06:52','A','7','13'),
('8','20181101 10:21:12','20181221 09:12:25','B','8','25'),
('9','20190312 09:21:12','20190512 10:30:21','D','9','9'),
('10','20140414 10:22:45','20141205 12:35:02','B','10','10'),
('11','20200315 03:25:11','20201212 00:00:00','N','11','12'),
('12','20190214 04:12:45','20190329 01:30:54','B','12','14'),
('13','20190424 07:20:15','20190512 07:00:37','B','6','13'),
('14','20181113 08:15:30','20181120 11:30:39','D','14','14'),
('15','20200216 11:25:30','20200314 01:25:15','A','15','5'),
('16','20190312 12:30:21','20201212 00:00:00','N','16','8'),
('17','20200115 02:11:24','20200215 10:22:51','B','17','12'),
('18','20151112 09:12:30','20151222 11:30:37','A','2','18'),
('19','20140706 11:25:30','20150825 12:45:11','B','19','4'),
('20','20150412 02:17:25','20150628 02:15:30','B','20','20'),
('21','20170203 01:25:22','20170312 07:12:33','B','21','21'),
('22','20181111 07:22:15','20181226 11:25:21','B','22','10'),
('23','20190515 11:22:58','20190603 12:25:22','M','23','8'),
('24','20190908 03:12:22','20191016 07:05:10','B','24','24'),
('25','20150921 07:11:25','20151211 08:32:12','B','25','12'),
('26','20160513 06:11:22','20160605 09:11:30','A','26','28'),
('27','20170511 01:32:11','20170711 02:33:45','B','22','7'),
('28','20171221 02:32:10','20201212 00:00:00','N','28','28'),
('29','20180507 07:14:10','20180522 04:03:11','B','6','14'),
('30','20140429 08:22:55','20150422 09:11:22','A','30','28')

SELECT * FROM PRESTAMOS


INSERT INTO Libros_Autores
VALUES
('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','6'),
('7','7'),
('8','8'),
('9','9'),
('10','10'),
('11','11'),
('12','12'),
('13','13'),
('14','15'),
('16','16'),
('17','17'),
('18','18'),
('19','19'),
('20','20'),
('21','21'),
('22','22'),
('23','23'),
('24','24'),
('25','25'),
('26','26'),
('27','27'),
('28','28'),
('29','29'),
('30','30'),
('31','1'),
('32','1')

SELECT * FROM Libros_Autores


/* Las Consultas */

/* Mostrar  ID, Titulo, Fecha de Prestamo y Estado de los libros de la Editorial Santillana  */


SELECT idLibro,titulo,fechaPrestamo,estado,editorial from Libros INNER JOIN Prestamos ON Libros.idLibro=Prestamos.Libros_idLibro WHERE editorial in('SANTILLANA');

/*Mostrar todos los prestamos de libros asignados a un lector independiente que este haya realizado   */

SELECT idLibro,titulo, fechaPrestamo, nombres,Lectores_idLectores from Prestamos INNER JOIN Lectores on Lectores.idLectores=Prestamos.Lectores_idLectores INNER JOIN LIBROS ON Prestamos.Libros_idLibro = idLibro WHERE Lectores_idLectores in(3)

/*Mostrar las personas que se prestaron un cierto libro*/

SELECT idLibro,titulo, fechaPrestamo, nombres,Lectores_idLectores from Prestamos INNER JOIN Lectores on Lectores.idLectores=Prestamos.Lectores_idLectores INNER JOIN LIBROS ON Prestamos.Libros_idLibro = idLibro WHERE Libros_idLibro in(2)

/*Mostrar todos los lectores que no se prestaron ningun libro*/

SELECT nombres, direccion, carrera, edad, sexo,idLectores FROM LECTORES L WHERE NOT EXISTS (SELECT * FROM PRESTAMOS P WHERE L.idLectores = P.Lectores_idLectores)

/* Seleccionar los prestamos de libros de todos los lectores que tengan 17 años*/

SELECT  nombres,edad,titulo, fechaPrestamo from Lectores INNER JOIN Prestamos on Lectores_idLectores=idLectores INNER JOIN Libros on Prestamos.Libros_idLibro = idLibro WHERE edad = 17

/* Seleccionar todos los libros prestados de todas las editoriales*/

SELECT titulo,editorial,fechaDevolucion,fechaDevolucion from Prestamos P INNER JOIN Libros L on L.idLibro= P.idPrestamos ORDER BY editorial 

/* Seleccionar la cantidad de libros prestados en la editorial santillana */
          
SELECT COUNT(*) AS [Cantidad de Libros prestados de la editorial SANTILLANA]
from Prestamos INNER JOIN Libros ON  Prestamos.idPrestamos=Libros.idLibro WHERE editorial in ('SANTILLANA')     

Select * from Libros Where editorial in('SANTILLANA')

-------------------------------------------------------------------------------------------------

SELECT COUNT(*) AS [Cantidad de Libros prestados de la editorial Alfaguara]
from Prestamos INNER JOIN Libros ON  Prestamos.idPrestamos=Libros.idLibro WHERE editorial in ('PLANETA') 

Select * from Libros Where editorial in('PLANETA')




/* Seleccionar el promedio de lectores que prestaron un libro de especialidad de ingenieria civil*/

SELECT AVG(idLibro) AS [Cantindad de Usuarios]
FROM Prestamos P INNER JOIN Libros L ON P.Lectores_idLectores=L.idLibro Where especialidad = 'ingenieria civil'

SELECT titulo,fechaPrestamo,especialidad,nombres from Prestamos P INNER JOIN Libros L on P.Libros_idLibro=L.idLibro INNER JOIN Lectores LE on idLectores = Libros_idLibro where especialidad = 'ingenieria civil'


/* +------------Creacion de Funciones-------------+ */

/* Crear una funcion para saber la edad promedio de lectores que se prestaron un libro */


CREATE FUNCTION FN_LISTAALQUILER (@libro INT)
RETURNS table
AS

	RETURN (
		SELECT AVG(CONVERT(int, edad)) as [Edad promedio] 
		from PRESTAMOS INNER JOIN LIBROS ON PRESTAMOS.Libros_idLibro=LIBROS.idLibro INNER JOIN LECTORES 
		ON PRESTAMOS.Lectores_idLectores=LECTORES.idLectores WHERE @libro = 1

	);
GO

DROP FUNCTION FN_LISTAALQUILER


SELECT * FROM FN_LISTAALQUILER(1) --El numero 1 es el valor que albergara la funcion
GO



/* Crear una funcion (que devuelva una tabla) que liste los prestamos solicitados por un determinado alumno*/

IF OBJECT_ID('F_ListarPrestamos')IS NOT NULL
			DROP FUNCTION F_ListarPrestamos
GO


CREATE FUNCTION F_ListarPrestamos (@lector INT)
RETURNS table
AS

	RETURN (
		SELECT titulo, fechaPrestamo, fechaDevolucion,nombres from Prestamos P
		INNER JOIN Libros LI ON P.Libros_idLibro = LI.idLibro
		INNER JOIN LECTORES LE ON P.Lectores_idLectores= LE.idLectores
		WHERE P.Lectores_idLectores = @lector
	);
GO


DROP FUNCTION F_ListarPrestamos

SELECT * FROM F_ListarPrestamos(10); --El 10 es la id del alumno
GO


/* Crear una vista para mostrar los prestamos de la editorial Planeta*/

CREATE VIEW v_PrestamosLibrosEditorial AS
	SELECT editorial,titulo,fechaPrestamo from Prestamos P INNER JOIN Lectores LE 
	ON P.idPrestamos = LE.idLectores INNER JOIN Libros LI ON P.Libros_idLibro = LI.idLibro
	WHERE editorial = 'Planeta'

DROP VIEW v_PrestamosLibrosEditorial

SELECT * FROM v_PrestamosLibrosEditorial


/* Crear una vista para mostrar los autores de los libros mas solicitados */

CREATE VIEW v_AutoresLibrosMasSolicitados AS
	SELECT Nombre,titulo,idLibros from Autores A INNER JOIN Libros_Autores LA on A.idAutores= LA.idLibros 
	INNER JOIN Prestamos P ON LA.idLibros = P.Libros_idLibro  INNER JOIN Libros LI ON LI.idLibro = LA.idLibros
	GROUP BY Nombre,LI.titulo,la.idLibros
	having COUNT(*)>1  
	---El es para que enumere los primeros puestos de acuerdo a su cantidad

DROP VIEW v_AutoresLibrosMasSolicitados

SELECT * FROM v_AutoresLibrosMasSolicitados

/* Crear un procedimiento almacenado para mostrar los prestamos de libros de editorial SANTILLANA del año 2019 */

CREATE PROCEDURE sp_PrestamosEditorialAño AS
	SELECT editorial,titulo,fechaPrestamo from Libros LI INNER JOIN Prestamos P on P.Libros_idLibro = LI.idLibro
	where fechaPrestamo > CONVERT (date, '2019-01-01 00:00:00:000')and fechaPrestamo < CONVERT(date, '2019-12-30 12:12:12:000') and editorial = 'SANTILLANA'

DROP PROCEDURE sp_PrestamosEditorialAño

EXEC sp_PrestamosEditorialAño


/* Crear un procedimiento almacenado para mostrar los prestamos de libros desde 01/01/2018 a 01/03/2020 */

CREATE PROCEDURE sp_PrestamosEditorial AS
	SELECT fechaPrestamo,titulo,nombres from Prestamos P INNER JOIN Libros L ON l.idLibro = P.Libros_idLibro
	INNER JOIN Lectores E ON E.idLectores = P.Lectores_idLectores
	where fechaPrestamo > CONVERT (date, '01/01/2018 00:00:00:000') and fechaPrestamo < CONVERT(date, '01/03/2020 12:12:12:000')
	GROUP BY fechaPrestamo,L.titulo,E.nombres

DROP PROCEDURE sp_PrestamosEditorial

EXEC sp_PrestamosEditorial

/* Crear un procedimiento almacenado para mostrar los prestamos de libros que deben ser ya devueltos */

CREATE PROCEDURE sp_PrestamosDevolver AS
	SELECT estado,fechaPrestamo,titulo,nombres,titulo from Prestamos P JOIN Libros L on l.idLibro = P.Libros_idLibro 
	JOIN Lectores E on E.idLectores = P.Lectores_idLectores
	where estado  = CONVERT(varchar,'N') --N es el caracter que hace referencia al estado de los libros que no fueron entregados

drop procedure sp_PrestamosDevolver

EXEC sp_PrestamosDevolver


select * from Prestamos


/* Crear un procedimiento almacenado que muestre los libros de un determinado autor */

CREATE PROCEDURE sp_LibrosAutor AS
	SELECT nombre,titulo from Autores A JOIN Libros_Autores LA on LA.idAutores =  A.idAutores 
	JOIN Libros I on I.idLibro = LA.idLibros where Nombre = 'Stephen King'

drop procedure sp_LibrosAutor

exec sp_LibrosAutor

/* Crear un trigger que permita listar los registros de la tablar lectores y despues inserte un nuevo registro */



CREATE TRIGGER t_ListarLectores ON Lectores
FOR INSERT
AS
	DECLARE @idLectores INT
	DECLARE @DNI varchar(45)
	DECLARE @Nombres varchar(45)
	DECLARE @Direcciòn varchar(45)
	DECLARE @Carrera varchar(45)
	DECLARE @Edad varchar(45)
	DECLARE @Sexo char(1)

	SET @idLectores = (SELECT idLectores from inserted)
	SET @dni = (SELECT dni from  inserted)
	SET @Nombres = (SELECT nombres from inserted)
	SET @Direcciòn = (SELECT direccion from inserted)
	SET @Edad = (SELECT edad from inserted)
	SET @Sexo = (SELECT sexo from inserted)

	SELECT * FROM Lectores


GO

DROP TRIGGER t_ListarLectores 
go

 insert into Lectores Values('124','25252646','Enrique','Av.Gaudencio Mejia','Escritor','25','M')


 /* Crear un procedimiento almacenado utilizando visual studio para que muestre los prestamos de la editorial Planeta*/

 CREATE PROCEDURE sp_PrestamosEditorialAño AS
	

	SELECT editorial,titulo,nombres from Prestamos P  INNER JOIN Libros LI  on P.Libros_idLibro = LI.idLibro 
	INNER JOIN Lectores LE ON LE.idLectores = P.Lectores_idLectores
	where editorial = 'PLaneta'  

DROP PROCEDURE sp_PrestamosEditorialAño

EXEC sp_PrestamosEditorialAño


 /* Crear un archivo XML para almacenar los libros prestados desde el mes de Enero a Octubre del año 2019*/

  SELECT fechaPrestamo,titulo,nombres from Prestamos P JOIN Lectores L ON  P.Lectores_idLectores = L.idLectores 
  JOIN Libros LI ON P.Libros_idLibro = LI.idLibro WHERE fechaPrestamo > CONVERT (date,'01/01/2019') and fechaPrestamo < CONVERT (date,'01/10/2019') 
  GROUP By fechaPrestamo,titulo,nombres

  for XML AUTO 