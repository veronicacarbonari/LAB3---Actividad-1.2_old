--1-Pensar un ejemplo para cada tipo de relación que se puede dar entre tablas (1:1, 1:N y N:N). 
--  *1 a 1 MUSICOS a Datos_Musico, solo puede haber un registo para los datos de cada músico que es un registro único.
--  *1 a N BANDAS a DISCOS, una banda puede estar relacionada a varios discos, pero no al reves.
--  *N a N BANDAS A MUSICOS (Relacionadas entre si a traves de la tabla Musicos_Banda), solo puede haber una banda pero puede darse que un músico sea miembro
--      de más de una banda.


CREATE DATABASE Act1_2
GO

USE Act1_2
GO

Create Table BANDAS(
    ID INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Genero VARCHAR(30) NULL CHECK(Genero IN('Rock','Metal','Pop','Jazz','Clasico')),
)
GO

Create Table Musicos(
    ID VARCHAR(4) NOT NULL PRIMARY KEY,
    Puesto VARCHAR(20) NOT NULL CHECK(Puesto IN('Percusion', 'Vocalista','Guitarrista', 'Bajista')),
    Nombre_Art VARCHAR(30) NULL,
)
GO

Create Table Musicos_Banda(
    ID_Banda INT NOT NULL FOREIGN KEY References BANDAS(ID),
    ID_Musico VARCHAR(4) NOT NULL FOREIGN KEY References MUSICOS(ID),
)
GO

Create Table Datos_Musico(
    DNI INT NOT NULL UNIQUE,
    ID_MUSICO VARCHAR(4) NOT NULL FOREIGN KEY References MUSICOS(ID),
    MAIL VARCHAR(30) NOT NULL UNIQUE,
    NOMBRES VARCHAR(40) NOT NULL,
    APELLIDOS VARCHAR(40) NOT NULL,
    NACIMIENTO DATE NOT NULL CHECK(NACIMIENTO < GETDATE()),  
)
GO

Create Table DISCOS(
    ID_Banda INT NOT NULL FOREIGN KEY References BANDAS(ID),
    Nombre VARCHAR(40) NOT NULL,
    Lanzamiento DATE NOT NULL,
    Duracion DATETIME NOT NULL,
)
GO