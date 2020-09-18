--CREACION TABLAS DIRECCION Y RELACIONADOS
--DEPARTAMENTO
CREATE TABLE Departamento(
    IdDepartamento INTEGER NOT NULL PRIMARY KEY,
    Nombre VARCHAR(25) NOT NULL UNIQUE
    );
--MUNICIPIO
CREATE TABLE Municipio (
    IdMunicipo INTEGER NOT NULL PRIMARY KEY,
    Nombre VARCHAR(25) NOT NULL,
    IdDepartamento INTEGER NOT NULL,
    CONSTRAINT FK_Departamento FOREIGN KEY (IdDepartamento) REFERENCES Departamento(IdDepartamento)
    );
--DIRECCION
CREATE TABLE Direccion (
    IdDireccion INTEGER NOT NULL PRIMARY KEY ,
    IdMunicipio INTEGER NOT NULL,
    Calle VARCHAR2(25),
    Avenida VARCHAR2(25),
    Casa VARCHAR2(10),
    Zona INTEGER,
    CONSTRAINT FK_Municipio FOREIGN KEY (IdMunicipio) REFERENCES Municipio(IdMunicipo)
    );

--CREACION DE PERSONAS PARA RELACION CON CLIENTES Y PROVEEDORES
CREATE TABLE Personas (
    IdPersona INTEGER NOT NULL PRIMARY KEY,
    PrimerNombre VARCHAR2(15) NOT NULL,
    SegundoNombre VARCHAR2(15) NOT NULL,
    PrimerApellido VARCHAR2(10) NOT NULL,
    SegundoApellido VARCHAR2(10) NOT NULL,
    NumTelefono INTEGER,
    IdDireccion INTEGER NOT NULL,
    FOREIGN KEY (IdDireccion) REFERENCES Direccion(IdDireccion)
    );

CREATE TABLE Clientes (
    IdCliente INTEGER NOT NULL PRIMARY KEY,
    NIT VARCHAR2(12) NOT NULL,
    IdPersona INTEGER NOT NULL,
    FOREIGN KEY (IdPersona) REFERENCES Personas(IdPersona)
    );

CREATE TABLE Proveedores (
    IdProveedor INTEGER NOT NULL PRIMARY KEY ,
    Organizacion VARCHAR(50) NOT NULL,
    Estado Varchar(1) DEFAULT 1,
    IdPersona INTEGER NOT NULL,
    FOREIGN KEY (IdPersona) REFERENCES Personas(IdPersona)
    );

CREATE TABLE FacturaVenta (
    IdFacturaVenta INTEGER NOT NULL PRIMARY KEY ,
    IdCliente INTEGER NOT NULL,
    Fecha DATE NOT NULL,
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente)
    );

CREATE TABLE FacturaCompra (
    IdFactura INTEGER NOT NULL PRIMARY KEY ,
    IdProveedor INTEGER NOT NULL,
    Fecha DATE NOT NULL,
    FOREIGN KEY (IdProveedor) REFERENCES Proveedores(IdProveedor)
    );

CREATE TABLE DetalleCompras (
    IdDetalleCompra INTEGER NOT NULL PRIMARY KEY,
    IdFactura INTEGER NOT NULL,
    IdProducto INTEGER NOT NULL,
    Descripcion INTEGER NOT NULL,
    Cantidad INTEGER NOT NULL,
    Precio DECIMAL(9,2) NOT NULL,
    FOREIGN KEY (IdFactura) REFERENCES FacturaCompra(IdFactura)
    );

CREATE TABLE DetalleVentas (
    IdDetalleCompra INTEGER NOT NULL PRIMARY KEY ,
    IdFacturaVenta INTEGER NOT NULL,
    IdProducto INTEGER NOT NULL,
    Cantidad INTEGER NOT NULL,
    Precio DECIMAL NOT NULL,
    FOREIGN KEY (IdFacturaVenta) references FacturaVenta(IdFacturaVenta),
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto)
    );

CREATE TABLE Productos (
    IdProducto INTEGER NOT NULL PRIMARY KEY ,
    Nombre VARCHAR(25) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    CodigoProducto VARCHAR(8) NOT NULL UNIQUE ,
    Canitdad INTEGER NOT NULL,
    PrecioCompra DECIMAL(9,2) NOT NULL,
    PrecioVenta DECIMAL(9,2) NOT NULL,
    Estado VARCHAR(1) DEFAULT 1
    );