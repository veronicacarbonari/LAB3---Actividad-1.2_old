CREATE DATABASE TP1_2_separado
GO
USE TP1_2_separado
GO

-- PUNTO 1
/*1.	Pensar un ejemplo para cada tipo de relación que se puede dar entre tablas (1:1, 1:N y N:N). 
Describirlo en palabras en un comentario de SQL.

RELACION 1:1
LA FABRICACIÓN DE PRODUCTOS CUYO EMPAQUE SÓLO PUEDE SERVIR PARA CADA PRODUCTO

RELACION 1:N
LA FABRICACIÓN DE PRODUCTOS QUE PUEDEN SER DE VARIOS COLORES (REMERAS)

RELACION N:N
LA FABRICACION DE UN PRODUCTO QUE PUEDE SER DE DISTINTOS COLORES Y DISTINTOS TALLES
*/

-- PUNTO 2
/*2.	Codificar el script en lenguaje T-SQL. 
Hacer uso de restricciones de tipo Primary Key, Foreign Key, Unique, Check o las que crean necesarias.
RELACION 1:1
LA FABRICACIÓN DE PRODUCTOS CUYO EMPAQUE SÓLO PUEDE SERVIR PARA CADA PRODUCTO
*/

CREATE TABLE TIPO_PRODUCTO(
	ID SMALLINT NOT NULL PRIMARY KEY,
	DESCRIPCION VARCHAR(15) NOT NULL,
)
GO
CREATE TABLE EMPAQUES(
	ID SMALLINT NOT NULL PRIMARY KEY,
	LARGO SMALLINT NOT NULL CHECK(LARGO>0),
	ANCHO SMALLINT NOT NULL CHECK(ANCHO>0),
	PROFUNDIDAD SMALLINT NOT NULL CHECK(PROFUNDIDAD>0),
	ID_TIPO_PRODUCTO SMALLINT NOT NULL UNIQUE FOREIGN KEY REFERENCES TIPO_PRODUCTO(ID)
)	
GO
INSERT into TIPO_PRODUCTO(ID, DESCRIPCION)
values
	(1, 'REMERA'),
	(2, 'PANTALON'),
	(3, 'CAMPERA'),
	(4, 'CAMISA')
INSERT into EMPAQUES(ID, LARGO, ANCHO, PROFUNDIDAD,ID_TIPO_PRODUCTO)
values
	(1,20,10,15,1),
	(2,5,22,14,2),
	(3,18,15,25,3),
	(4,15,15,25,4)
GO

