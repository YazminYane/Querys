-- ---------------------------------------------------------------------
-- SECUENCIA 3
-- ---------------------------------------------------------------------
-- crear y borrar DBs, Tablas, fk y pk 

-- Borrar la DB
DROP DATABASE IF EXISTS dbTempNueva;

-- Crear la db
CREATE DATABASE IF NOT EXISTS dbTempNueva;

-- Seleccionar la DB a trabajar
USE dbTempNueva;

-- crea la tabla de clientes
CREATE TABLE clientes (
	id_Clientes   int   PRIMARY KEY    auto_increment,
	nombreCliente varchar(30)   NOT NULL   unique,
	ciudad varchar (30),
	telefono varchar(30)
);

-- crea la tabla de productos
CREATE TABLE IF NOT EXISTS dbTempNueva.productos (
	id_Productos int    primary key    not null     unique       auto_increment,
	nombreProducto varchar(30)   unique,
	costo decimal(8,2)           not null    default 0,
	precioVenta decimal(8,2)     not null    default 0,
	existencia decimal(8,2)      not null    default 0
);

-- Crea la tabla detalleVenta
CREATE TABLE IF NOT EXISTS detalleVenta(
	id_detalleVenta int     primary key    not null   unique   auto_increment,
    fechaVenta     date    not null,
    idClientes     int     not null,
    idProductos    int     not null,
    cantidadVendida  decimal(8,2)    not null,
    costo            decimal(8,2)    not null    default 0,
    precioVenta      decimal(8,2)    not null,
    
    constraint fkDetalleVentaProductos
    foreign key (idProductos)
    references productos (id_Productos)
    on delete no action,
    
    constraint fkDetalleVentaClientes
    foreign key (idClientes)
    references clientes (id_clientes)
    on delete cascade

);
use dbTempNueva;
show tables;






