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
RELACION 1:N
LA FABRICACIÓN DE PRODUCTOS QUE PUEDEN SER DE VARIOS COLORES (REMERAS)
*/

CREATE TABLE COLORES(
	ID SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
	NOMBRE VARCHAR(15) NOT NULL
)
GO
CREATE TABLE PRODUCTOS(
	ID SMALLINT NOT NULL,
	ID_TIPO_PROD SMALLINT NOT NULL FOREIGN KEY REFERENCES TIPO_PRODUCTO(ID),
	ID_COLOR SMALLINT NOT NULL FOREIGN KEY REFERENCES COLORES(ID),
	ID_TALLE SMALLINT NOT NULL,
	PRIMARY KEY (ID_TIPO_PROD,ID_COLOR,ID_TALLE)
)
GO
INSERT into COLORES (NOMBRE)
values
	('ROJO'),
	('VERDE'),
	('AZUL'),
	('NEGRO')
GO
