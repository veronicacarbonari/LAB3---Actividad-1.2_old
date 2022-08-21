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

Create table Ventas(
ID_Venta int not null foreign key references Venta(ID),
ID_Producto bigint not null primary key,
Cantidad int not null
)
GO

Create table Productos(
IDProducto bigint not null foreign key references Ventas(ID_Producto),
Descripcion varchar(50)not null,
PrecioVenta int not null,
NumeroProveedor int not null,
Stock int not null,
Categoria varchar(50) not null
)
GO