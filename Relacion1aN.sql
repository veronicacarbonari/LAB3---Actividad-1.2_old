create database Relacion1aN
go
use Relacion1aN
go

/* Club - Socios
Un club de futbol tiene n cantidad de socios, cada socio es solo parte de un club
*/
 

create table Club(
IdClub int not null primary key,
Nombre varchar(30) not null unique,
Ubicacion varchar (30) not null,
CantSocios int not null,
Division char not null
)

create table Socio(
IdSocio int not null primary key,
Dni varchar(15) not null unique,
IdClub int not null foreign key references Club (IdClub),
Nombre varchar (30) not null,
Apellido varchar (30) not null
)