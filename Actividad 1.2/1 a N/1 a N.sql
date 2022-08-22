--  *1 a N BANDAS a DISCOS, una banda puede estar relacionada a varios discos, pero no al reves.

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

Create Table DISCOS(
    ID_Banda INT NOT NULL FOREIGN KEY References BANDAS(ID),
    Nombre VARCHAR(40) NOT NULL,
    Lanzamiento DATE NOT NULL,
    Duracion DATETIME NOT NULL,
)
GO