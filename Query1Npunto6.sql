CREATE DATABASE ACT12_1N_6
GO

USE ACT12_1N_6
GO

/* Una liga de ajedrez local tiene una serie de equipos que compiten por campeonatos 
todos los años.Enlistamos cada equipo,sus socios y datos historicos */
CREATE TABLE EQUIPOS(
	ID TINYINT not null, 	
	Nombre VARCHAR(35) not null ,	--UNIQUE
	Fundacion SMALLDATETIME not null,	
	Trofeos TINYINT null,	 --null? SI, en equipos nuevos sin historial
	Mail VARCHAR(255) not null
)
GO

CREATE TABLE JUGADORES(
ID SMALLINT not null, --Mayor a 0
ID_Equipo TINYINT null, --Foreign Key Equipos(ID)//puede ser un socio de la liga sin equipo
Nombre VARCHAR(25) not null,	
Apellido VARCHAR(25) not null,
Nacimiento SMALLDATETIME not null, 
Puntos_ELO SMALLINT null, -- Mayor-Igual a 0 && Menor a 3000, puede desconocerse
Ingreso_Equipo SMALLDATETIME not null,
Sexo CHAR(1) not null, --(M:F:X) No es BIT, porque X!=NULL 
DNI VARCHAR(10) not null , --UNIQUE
)
GO


ALTER TABLE EQUIPOS 
ADD CONSTRAINT PK_EQUIPOS PRIMARY KEY (ID)

ALTER TABLE EQUIPOS 
ADD CONSTRAINT CHK_FUNDACION CHECK ( NOT(Fundacion>GetDate()) )

ALTER TABLE EQUIPOS
ADD CONSTRAINT UQ_ID UNIQUE (Nombre)

GO


ALTER TABLE JUGADORES 
ADD CONSTRAINT PK_JUGADORES PRIMARY KEY (ID)

ALTER TABLE JUGADORES 
ADD CONSTRAINT CHK_IDjugadores CHECK (ID>0)

ALTER TABLE JUGADORES 
ADD CONSTRAINT CHK_BORN CHECK(INGRESO_EQUIPO>NACIMIENTO AND Nacimiento<GetDate())

ALTER TABLE JUGADORES 
ADD CONSTRAINT FK_EQUIPO FOREIGN KEY (ID_EQUIPO) REFERENCES EQUIPOS(ID)
 
 ALTER TABLE JUGADORES 
 ADD CONSTRAINT CHK_ELO CHECK (PUNTOS_ELO >= 0 AND PUNTOS_ELO < 3000)

 ALTER TABLE JUGADORES
 ADD CONSTRAINT CHK_SEXO CHECK (SEXO='F' OR SEXO='M' OR SEXO='X' )

 ALTER TABLE JUGADORES 
 ADD CONSTRAINT UQ_DNI UNIQUE (DNI)