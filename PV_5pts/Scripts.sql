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
