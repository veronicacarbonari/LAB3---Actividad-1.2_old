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