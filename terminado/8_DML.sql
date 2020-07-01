-- -------------------------------------------------------------------------------------
-- SECUENCIA 8     VISTAS 
-- -------------------------------------------------------------------------------------
-- CREANDO UNA VISTA CON UNA SOLA TABLA IMPLICADA
-- LA TABLA DE PERSONAS Y SOLO MOSTRANDO DOS CAMPOS
use dbPendientes;

create view personasView as
select nombre,correo from personas;

create or replace view personasview as
select nombre,correo,telefono from personas;

-- ejecutando la vista personasview
select * from personasView;

-- VOLVER A CREAR LA MISMA VISTA PERO AHORA QUE SOLO FILTRE
-- LAS PERSONAS QUE TIENEN CORREO DE HOTMAIL Y LAS DE YAHOO
create or replace view personasview as
select nombre,correo,telefono from personas
WHERE CORREO like '%hotmail%'
union 
select nombre,correo,telefono from personas
WHERE CORREO like '%yahoo%';

-- selecciona las personas que tengan mas de 8 movimientos y ademas que muestre la suma
-- de dichos movimientos de la tabla entradasalidadinero
create view movimientosPorPersona as
select nombre,count(*),sum(montoie) 
from entradaSalidaDinero
inner join personas on personas.id_personas=entradaSalidaDinero.idPersonas
group by 1
having count(*)>8;

-- elmiminar la vista llamada personasview
drop view personasview;

-- actualiza la vista 
update personasview
set nombre = concat(nombre,'-')

