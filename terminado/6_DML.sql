-- ---------------------------------------------------------------------------------------------
-- SECUENCIA 6    EJEMPLO DE FUNCIONES DE AGREGACION Y UPDATE
-- ---------------------------------------------------------------------------------------------
-- cuantos trabajadores existen en la tabla employees
select count(*) from employees;    -- 300026

-- cuantos trabajadores cumplen años en cada mes del año
select month(birth_date), count(*) 
from employees
group by month(birth_date);

select month(birth_date), count(*) 
from employees
group by 1
order by 1; 

-- cuantos trabajadores cumplen años en cada dia del año diferente
-- group by 1,2 : agrupo de acuerdo al campo month(1) y al day(2) 
select month(birth_date), day(birth_date), count(*) 
from employees
group by 1,2
order by 1,2; 

-- ---------------------------------------------------------------------------------------------
-- EJEMPLO DE UPDATE
-- ---------------------------------------------------------------------------------------------
-- Para actualizar en linux se debe desactivar  "modode actualizacion segura"
-- ir a MySQL Workbench => [ Edit ] => [ Preferences ] -> [ SQL Editor ] -> Uncheck "Safe Updates" -> save
-- desconectar la sesion y volver a iniciarla

-- actualizar los números de telefono a null de la tabla personas
update tmppersonas
set telefono=null;

-- incrementar un 10% a todos los montos de la tabla entradasalidadinero
-- donde la fecha sea igual al 3 de enero de 2018
use dbPendientes;
select * from entradaSalidaDinero;

update entradaSalidaDinero
set montoIE = montoIE * 1.10
where fechaES = '2018/01/03';

-- cambiar el password a todos los usuarios cuyo correo del dueño sea de hotmail
select * from personas 
where correo like '%hotmail%';

select * from usuarios;

update usuarios
set password = 'nuevopassword'
where idPersonas in(select id_personas from personas
				   where correo like '%hotmail%');
                   
-- actualizar una tabla a partir de otra tabla en la que la primer tabla
-- solo traen nombre las personas y en la segunda ya traen apellido
select * from personas;

-- mi db no tiene la tabla tmpPersonas 
update personas                  
set personas.nombre = (select tmppersonas.nombre from tmppersonas where personas.id=tmppersonas.id)
where personas.id = (select tmppersonas.id from tmppersonas where personas.id=tmppersonas.id)





