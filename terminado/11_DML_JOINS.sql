-- ---------------------------------------------------------------------------------------------
-- EJEMPLO DE SELFT JOIN 
-- ---------------------------------------------------------------------------------------------
-- self-join se usa para hacer cruce con la tabla misma 
-- la tabla debe llevar un alias para poer cruarla 
-- agregar el campo para el uso de self-join
-- modificar la tabla personas agregando una columna nueva
select *
from personas
join personas jefes on personas.idPersonaJefe = jefes.id_personas; 

select personas.id_personas,personas.nombre, personas.correo, personas.telefono,
		jefes.nombre, jefes.correo
from personas
join personas jefes on personas.idPersonaJefe = jefes.id_personas; 

-- ---------------------------------------------------------------------------------------------
-- EJEMPLO DE INNER JOIN
-- ---------------------------------------------------------------------------------------------
-- actualmente me encuentro en la dbEmployees
-- indica que hara referencia a la tabla personas de la dbPendientes
-- on indica el campo comun, la llave primera 
select * from dbPendientes.personas
inner join dbEmployees.employees on dbPendientes.personas.id_personas = emp_no;   

-- las columnas son los mismo pero cambian de posicion, los registros son 
-- las mismas que en la consulta anterior 
select * from  dbEmployees.employees
inner join dbPendientes.personas on dbPendientes.personas.id_personas = emp_no;  

-- ---------------------------------------------------------------------------------------------
-- EJEMPLO DE LEFT JOIN
-- ---------------------------------------------------------------------------------------------
-- tener cuidado en las tablas en donde ponerlas porque unas pueden tener muchos datos 
use dbPendientes;

-- Los id de estos nombres son 1 y 4 
select * from personas 
where nombre = 'JUAN PEREZ GARCIA' or nombre = 'JOSE LUIS MONTEZ QUIÑONES';

-- la llave primaria de estos coincide con los de la ta persona de la consulta anterior 
select * from dbEmployees.employees
where emp_no = 1 or emp_no = 4 ;

select * from dbEmployees.employees;
select * from personas;

-- left join: muestra todos los datos que coinciden en ambas tablas(con la llave primaria)
-- y muestra todos los datos de la tabla de la izquierda que es personas y al resto de los datos
-- los pone en null. 
select * from personas
left join dbEmployees.employees on (dbEmployees.employees.emp_no = personas.id_personas);  

-- ---------------------------------------------------------------------------------------------
-- EJEMPLO DE RIGHT JOIN
-- ---------------------------------------------------------------------------------------------
-- tener cuidado en las tablas en donde ponerlas porque unas pueden tener muchos datos 
-- Muestra todos los datos que coinciden en ambas tablas (con la llave primaria)
-- y muestra todos los datos de la tabla de la derecha employees colocando null en el 
-- resto de  los datos que no coinciden 
select * from personas 
right join dbEmployees.employees on (dbEmployees.employees.emp_no = personas.id_personas);

select * from dbEmployees.employees
right join personas on (dbEmployees.employees.emp_no = personas.id_personas);

-- ---------------------------------------------------------------------------------------------
-- EJEMPLO CON USIGN 
-- ---------------------------------------------------------------------------------------------
use dbEmployees;

select count(*) from employees
inner join titles on employees.emp_no = titles.emp_no;  -- 443308

-- es quivalente a la anterior consulta 
select count(*) from employees
inner join titles using(emp_no);  -- 443308

select count(*) from employees
inner join titles on employees.emp_no = titles.emp_no
inner join salaries on salaries.emp_no = employees.emp_no;  -- 4638507

select count(*) from employees
inner join titles using(emp_no)
inner join salaries using(emp_no);  -- 4638507

-- ---------------------------------------------------------------------------------------------
-- EJEMPLO CON NATURAL
-- ---------------------------------------------------------------------------------------------
select count(*) from employees
natural join titles 
inner join salaries using(emp_no);  -- 4638507

