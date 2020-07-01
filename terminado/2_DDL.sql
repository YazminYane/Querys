-- ----------------------------------------------------------------------
-- SECUENCIA 2
-- ----------------------------------------------------------------------
-- videos de de la 26 a la 32
-- crea un BD y  y tablas

-- Crear una DB marca un error si ya existe la DB
CREATE DATABASE dbTempNueva;

-- Crea la DB si no existe, etsa indica un advertencia y no un error 
CREATE DATABASE IF NOT EXISTS dbTempNueva;

-- Elimina una DB 
DROP DATABASE dbTempNueva;

-- marca una advartencia si ya existe la db
DROP DATABASE IF EXISTS dbTempNueva;

-- Indicar que DB usará
USE dbTempNueva;

-- crear la estructura de una tabla sin atributos
CREATE TABLE clientes (
	id_Clientes int,
	nombreCliente varchar(30),
	ciudad varchar (30),
	telefono varchar(30)
);

-- crear una tabla que tenga atributos en sus columnas y defina el nombre de la base de datos
-- unique no permite dos nombre iguales, marcará un error
CREATE TABLE IF NOT EXISTS dbTempNueva.productos
(
  id_Productos int   not null     unique       auto_increment,
  nombreProducto varchar(30)   unique,
  costo decimal(8,2)           not null    default 0,
  precioVenta decimal(8,2)     not null    default 0,
  existencia decimal(8,2)      not null    default 0
);

insert into productos values( 0, "refresco de lata", 10.50, 11.50, 5);
insert into productos values( 0, "refresco de lata chico", 10.50, 11.50, 5);

-- estos datos se pueden insetar por los valores default en los ultimos campos de la tabla
insert into productos (id_Productos, nombreProducto)values( 0, "refresco de lata grande");

select * from productos;

-- CREANDO UNA TABLA TEMPORAL  ( SOLO DURARA CON LA SECCION ACTIVA ) esta contará con datos de productos
-- Las tablas temporales no se muestran en el navegador de la izquierda 
CREATE TEMPORARY TABLE tmpProductos SELECT * FROM productos;
SELECT * FROM tmpProductos;

-- si despues no se desea borra la tabla temporal, para guardarla se puede:
-- sirve para pasar los datos de una tabla a otra que recien se crea
CREATE TABLE tmpProductos SELECT * FROM productos;

-- Pasa solo la estructura de una tabla a otra, sin los datos 
CREATE TABLE tmpProductos1 like productos;
SELECT * FROM tmpProductos1;

-- CONSTRAIN: Restringe los datos que puede ser almacenado para cuidar la integridad de los mismo 
-- para eso se pueden usar : not null, primary key, Unique
-- se tienen constrain a nivel columna y nivel tabla 

-- constrain nivel columna
-- de esta forma el constrain tiene el nombre que el sistema le asigna
CREATE TABLE clientes (
  id_Clientes   int   PRIMARY KEY    auto_increment,
  nombreCliente varchar(30)   NOT NULL   unique,
  ciudad varchar (30),
  telefono varchar(30)
);

-- constrain nivel tabla
-- de esta forma el constrain tiene el nombre que nosotros le damos
CREATE TABLE clientes (
  id_clientes int   auto_increment,
  nombreCliente varchar(30)   NOT NULL,
  ciudad varchar (30),
  telefono varchar(30),
  constraint clientes_pk primary key(id_Clientes),
  constraint combreCliente_uq unique (nombreCliente)
);
















