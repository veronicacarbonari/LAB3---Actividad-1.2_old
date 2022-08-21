use Relacion1a1
go

create table Provincias(
IDprovincia int not null primary key check(IDprovincia>=1 and IDprovincia<=24),
Nombre varchar(30) not null unique,
Area int not null,
Poblacion int not null
)

create table Capitales(
IDcapital int not null primary key check(IDcapital>=1 and IDcapital<=24),
IDprovincia int not null foreign key references Provincias(IDprovincia),
Nombre varchar(30) not null unique,
Area int not null,
Poblacion int not null
)

