Create database Ejemplo_Dos
GO
Use Ejemplo_Dos
GO

Create table Categoria(
ID bigint not null primary key,
Descripcion varchar(50) not null
)
GO

Create table Producto(
ID bigint not null primary key,
Nombre varchar(20) not null,
Descripcion varchar(50) not null,
Cantidad int not null,
Precio int not null,
ID_Categoria bigint not null foreign key references Categoria(ID),
)
GO