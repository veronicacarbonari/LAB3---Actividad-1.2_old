--  *1 a 1 MUSICOS a Datos_Musico, solo puede haber un registo para los datos de cada músico que es un registro único.

CREATE DATABASE Act1_2
GO

USE Act1_2
GO

Create Table Musicos(
    ID VARCHAR(4) NOT NULL PRIMARY KEY,
    Puesto VARCHAR(20) NOT NULL CHECK(Puesto IN('Percusion', 'Vocalista','Guitarrista', 'Bajista')),
    Nombre_Art VARCHAR(30) NULL,
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