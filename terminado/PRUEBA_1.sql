create database if not exists dbPruebas;

drop table empleados;
create table if not exists empleados(
	
    id_empleados     int          auto_increment,
    nombre        varchar(30)     not null,
    correo        varchar(30)      unique         default 'sin correo',
    telefono      varchar(15)     not null,
    primary key (id_empleados)
    
)engine InnoDB;

-- INTENTAR INSERTAR ESTOS DATOS 
insert into empleados(nombre, correo, telefono) 
	values ('Daniel Marin Cardenas', 'daniel@gmail.com','5517959758');
insert into empleados(nombre, correo, telefono) 
	values ('Maria Marin Cardenas', 'maria@gmail.com','5517959758');
insert into empleados(nombre, correo, telefono) 
	values ('Jose Marin Cardenas', 'jose@gmail.com','5517959758');
insert into empleados(nombre, correo, telefono) 
	values ('Carlos Marin Cardenas', 'jose@gmail.com','5517959758');
insert into empleados(nombre, correo, telefono) 
	values ('Diana Marin Cardenas', 'diana@gmail.com','5517959758');
insert into empleados(nombre, correo, telefono) 
	values ('Karla Marin Cardenas', 'karla@gmail.com','5517959758');
    
-- UNO DE LOS CORREOS ESTA DUPLICADO EN UN CAMPO UNIQUE, EL AUTOINCREMENTAL SE SUMARA EN UNO 
-- AUNQUE NO LO INSERTE 

