-- ----------------------------------------------------------------------
--  SECUENCIA 1 
-- ----------------------------------------------------------------------
-- Mostrar la descripccion de una tabla 
desc productos;

-- agregar una columna a la tabla llamada color
alter table productos
	add color varchar(20);
    
-- agregar una columna llamada color a la tabla productos despues del campo costo 
alter table productos
	add color varchar(30) after costo;
    
 -- Agregar una comlumna a la tabla productos  siendo el primer campo de la definicion ddl   
alter table productos
	add color2 varchar(30) first;
    
-- Borrar un campo de la tabla productos, la existencia (no se puede borrar algun campo que viole
-- la integridad referencial)
alter table productos
	drop column existencia;

-- Cambiar el tamaño de una columna (nombreProducto), no te dejara cambiarlo si violas el tamaño de los 
-- registros que ya tengan información
alter table productos
modify nombreProducto varchar(50) not null;

-- Cambiar el tipo de dato de una columna, no te permitira hacer el cambio
-- si tu campo no acepta el tipo de dato con los datos que ya se tengan almacenados
alter table productos
modify nombreProducto char(50)  null;
desc productos;

-- Cambiar el valor default para un registro cuando se inserte
alter table productos
modify nombreProducto char(50)  null  default 'coloqueNombreDelProducto';

-- Cambiar el nombre de un campo
alter table productos
change column costo precioCompra decimal(8,2);

-- agregar la llave primaria en la tabla detalleVenta siendo la llave primaria el campo id
ALTER TABLE dbTempNueva.detalleVenta
ADD primary key(id_DetalleVenta);

-- agregar una llave foranea(si se nos olvida ponerla en la definicion )
ALTER TABLE detalleVenta
ADD 
   constraint fkDetalleVentaProductos
   foreign key (idProductos)
   references productos (id_Productos)
   on delete no action;
   
ALTER TABLE detalleVenta
ADD
   constraint fkDetalleVentaClientes
   foreign key (idClientes)
   references clientes (id_clientes)
   on delete no action;

-- Borrar la llave primaria de una tabla 
ALTER TABLE detalleVenta
	drop primary key;

-- Borrar la llave foranea de una tabla    
ALTER TABLE detalleVenta
	drop foreign key  fkDetalleVentaProductos;

ALTER TABLE detalleVenta
	drop foreign key  fkDetalleVentaClientes;
    
desc detalleVenta;

-- renombrar la tabla clientes por nuevo nombre llamado cliente 
-- este cambio no cambia en la integridad referencial
rename table clientes to cliente;
rename table productos to articulo;

-- Borra todos los registros de la tabla
-- destruye la tabla y la  vuelve a crear lo deja vacio 
truncate table detalleVenta;

-- Al ejecutar elimina los registros pero el indice empieza desde ael anterior 
delete from detalleVenta;

-- elimina por completo una tabla esta tabla dejara eliminarla
-- porque no tiene referencia otra tabla.
drop table detalleVenta;



    
