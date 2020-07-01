-- Cruce de 2 bases de datos y uso del inner join 

use dbPendientes;
select * from personas;

use dbEmployees;
select * from employees;

-- insertas estos datos
insert into employees
values(1,'1981-10-16','Juan','Tinajero','M','2008-02-01');

insert into employees
values(4,'1982-12-20','Jose Luis','De la Rosa','M','2009-02-01');

-- actualmente me encuentro en la dbEmployees
-- indica que hara referencia a la tabla personas de la dbPendientes
-- on indica el campo comun, la llave primera 
select * from dbPendientes.personas
inner join dbEmployees.employees on dbPendientes.personas.id_personas = emp_no;   

-- las columnas son los mismo pero cambian de posicion, los registros son 
-- las mismas que en la consulta anterior 
select * from  dbEmployees.employees
inner join dbPendientes.personas on dbPendientes.personas.id_personas = emp_no;  

-- self-join se usa para hacer cruce con la tabla misma 
-- la tabla debe llevar un alias para poer cruarla 
-- agregar el campo para el uso de self-join
-- modificar la tabla personas agregando una columna nueva
ALTER TABLE personas
ADD COLUMN idPersonaJefe int(11) null after telefono;

-- actualizar los jefes para cada personas 
update personas
set idPersonaJefe = 4
where id_personas not in (2,3,6,7,9,10);

-- seleccionamos todos los registros
select * from personas;

-- hacemos una consulta con el uso de self-join
select *
from personas
join personas jefes on personas.idPersonaJefe = jefes.id_personas; 

select personas.id_personas,personas.nombre, personas.correo, personas.telefono,
		jefes.nombre, jefes.correo
from personas
join personas jefes on personas.idPersonaJefe = jefes.id_personas; 


