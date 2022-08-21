Create database Ejemplo_uno
GO

Use Ejemplo_uno
GO

Create table Estudiante(
	ID int not null primary key,
	Nombre varchar(20) not null,
	Apellido varchar(20) not null
	)
	GO

Create table Informacion(
	Pais varchar(20) not null,
	Ciudad varchar(20) not null,
	edad smallint not null,
	telefeno int null,
	IDEstudiante int not null foreign key references Estudiante(ID),
	)
	GO

