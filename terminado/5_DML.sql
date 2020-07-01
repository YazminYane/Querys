-- ---------------------------------------------------------------------------------------------
-- SECUENCIA 5 EJEMPLO INSERT Y DELETE
-- ---------------------------------------------------------------------------------------------

-- creamos una copia de una tabla de personas
-- esta instruccion crea la tabla aunque no le inserta datos, no cuida la integridad referencial 
-- porque no hay ID -1
create table tmpPersonas as
select * from personas
where id_personas = -1 ;

-- borramos la tabla tmppersonas
drop table tmpPersonas;

select * from tmpPersonas;

-- insertamos un renglon sin usar la lista de las columnas
insert into tmpPersonas
values (0,'JAIME','jaime_1@hotmail.com','4921301446','1');


-- insertamos el mismo renglon en la tabla de personas pero sin utilizar
-- nombres de columnas en la sintaxis
insert into tmpPersonas
values (0,'JAIMEs','jaime_s@hotmail.com','4921301446','1');

-- hacemos la insercion de un registro para la tabla de usuarios
-- haciendo uso de los nombres de las columnas
insert into usuarios(nombre,password,idPersonas)
values('PEDRO','Admin321','7');

-- hacemos un insert multiple con varios registros en una misma instruccion
insert into tmpPersonas values
(0,'JUAN','juan@gmail.com','789686886766',3),
(1,'VICTOR','victor1@hotmail.com','4789859219',4),
(2,'ALEJANDRA','alejandra@gmail.com','4921345678',5);

-- insertar todos los registros de la tabla personas hacia la tabla tmppersonas
-- pero solo los que tengan correo de hotmail
select * from personas
where correo like '%hotmail%';

insert into tmpPersonas
select * from personas
where correo like '%hotmail%';

select * from tmpPersonas;

-- ---------------------------------------------------------------------------------------------
-- EJEMPLO DELETE
-- ---------------------------------------------------------------------------------------------
-- borrar los registros que el tamaño de cadena del nombre sea mayor o igual a 15 de la tabla tmppersonas
delete from tmpPersonas
where length(nombre) >= 15;

-- borrar todos los registros de la tabla personas que esten dentro de la tabla tmppersonas
delete from usuarios
where idPersonas in( select id_usuarios from personas where id_usuarios < 3);

-- borrar todos los registros de la tabla personas con los ids indicados
delete from tmpPersonas;



