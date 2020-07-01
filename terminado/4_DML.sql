-- ---------------------------------------------------------------------
-- SECUENCIA 4
-- ---------------------------------------------------------------------


-- llena la base de datos

-- insertar 5 clientes en la tabla cliente
insert into clientes(id_Clientes, nombreCliente, ciudad, telefono) values (1, 'José Manuel García', 'cd. de México', '014898989');
insert into clientes(id_Clientes, nombreCliente, ciudad, telefono) values (2, 'Ma. del Carmen de Loera', 'Morelia', '0143432389');
insert into clientes(id_Clientes, nombreCliente, ciudad, telefono) values (3, 'Victor Contreras', 'La paz california', '234323423432');
insert into clientes(id_Clientes, nombreCliente, ciudad, telefono) values (4, 'Manuel Felix', 'Fresnillo', '354345345');
insert into clientes(id_Clientes, nombreCliente, ciudad, telefono) values (5, 'Julio Arteaga', 'Calera', '5546254845');
select * from clientes;

-- insertar 3 productos en la tabla productos
insert into productos(id_Productos, nombreProducto, costo, precioVenta, existencia ) values (1, 'Teclado usb', 100, 130, 5);
insert into productos(id_Productos, nombreProducto, costo, precioVenta, existencia ) values (2, 'Mouse alambrico', 120, 170, 6);
insert into productos(id_Productos, nombreProducto, costo, precioVenta, existencia ) values (3, 'Computadora de escritorio', 1000, 1300, 2);
select * from productos;

-- insertar una venta  de dos productos para el cliente 1 
insert into detalleVenta(id_DetalleVenta, fechaVenta, idClientes, idProductos, cantidadVendida, costo, precioVenta)
		values(1, '2019-12-31', 1, 1, 2, 100, 130);

insert into detalleVenta(id_DetalleVenta, fechaVenta, idClientes, idProductos, cantidadVendida, costo, precioVenta)
		values(2, '2019-12-31', 1, 2, 1, 120, 170);

-- INSERT QUE VIOLA LA INTEGRIDAD REFERENCIAL DE LOS DATOS YA QUE EL CLIENTE QUE SE QUIERE INSERTAR NO EXISTE
-- sin la integridad referencial este se puedeinsertar 
insert into detalleVenta(id_DetalleVenta, fechaVenta, idClientes, idProductos, cantidadVendida, costo, precioVenta)
		values(3, '2019-12-31', 10, 30, 1, 120, 170);        

-- este al respetar la integridadreferencial insertará el dato 
insert into detalleVenta(id_DetalleVenta, fechaVenta, idClientes, idProductos, cantidadVendida, costo, precioVenta)
		values(3, '2019-12-31', 3, 3, 1, 120, 170); 
select * from detalleVenta;

-- no sepueden eliminar tablas que tengan datos referenciadoscon estainstrucion:  on delete no action
-- este no se puede eliminar
delete from clientes
where id_Clientes = 1;

-- este si 
delete from clientes
where id_Clientes = 2;
select * from clientes;

-- si se cambia por : on delete cascade si se puede pero lo elimina de todas las tablas 
delete from clientes
where id_Clientes = 3;
select * from clientes;
select * from detalleVenta;

