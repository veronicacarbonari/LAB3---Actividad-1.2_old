Create database Ejemplo_Tres
GO

Use Ejemplo_Tres
GO

Create table Venta(
ID int not null primary key,
Numero_Empleado bigint not null,
Fecha date not null,
Numero_Cliente bigint not null
)
GO

Create table Detalle_Ventas(
ID_Venta int primary key foreign key references Venta(ID),
ID_Producto int not null foreign key references Productos(ID),
Cantidad int not null
)
GO

Create table Productos(
ID int Primary Key,
Descripcion varchar(50)not null,
PrecioVenta int not null,
NumeroProveedor int not null,
Stock int not null,
Categoria varchar(50) not null
)
GO
