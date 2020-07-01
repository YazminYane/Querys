-- uso del inner join
 
use dbPendientes;

select * from usuarios
order by nombre asc;

-- Muestra todos los campos de la tabla
select * from usuarios
order by nombre desc;

-- extrae campos nombre y password
select nombre, password from usuarios
order by nombre asc;

-- seleccionar la fecha,idtipoingeg y monto monetario de la tabla entradasalidadinero
-- al mismo tiempo multiplicacion por 2, pero solo del mes de enero de 2018 y que 
-- el tipo de ingreso sea 34
desc entradaSalidaDinero;
select fechaES,idIngresosEgresos,montoIE, montoIE * 2  as doble
from entradaSalidaDinero
where idIngresosEgresos = 34 and (fechaES between '2018-01-01' and '2018-01-31')
order by doble desc;

-- Selecciona los distintos idIngresosEgresos montos en una solo cadena separados con -
-- date_format: da formato a la fecha d-> dia m->mes y->año2 digitos Y-> año 4 digitos 
select distinct concat('ID=', idIngresosEgresos, 'MONTO=', montoIE, 
'Con Fecha', date_format(fechaES, '%d%m%Y')) as salida
from entradaSalidaDinero; 

-- '<>' / '!=' significan distino de
-- -- REALIZAR UNA CONSULTA EN LA CUAL EL MONTO DE INGRESO - EGRESO SEA MENOR A 1000
SELECT * 
FROM entradaSalidaDinero
WHERE montoIE <1000;

-- REALIZAR UNA CONSULTA EN LA CUAL EL MONTO ESTE ENTRE CIERTO RANGO DE GASTO ENTRE 1000 Y 3000
SELECT *
FROM entradaSalidaDinero
WHERE montoIE >= 1000 and montoIE <= 3000; 

-- REALIZAR UNA CONSULTA EN LA CUAL EL MONTO SEA DISTINTO DE 2000
SELECT *
FROM entradaSalidaDinero
WHERE montoIE != 2000;

-- REALIZAR UNA CONSULTA EN LA QUE LA FECHA SEA MENOR AL DIA DE HOY ( FECHA ACTUAL )
-- current_date(): obtiene la fecha de hoy 
SELECT * ,curdate()
FROM entradaSalidaDinero
WHERE fechaES < current_date();

-- REALIZAR CONSULTA EN LA QUE MONTO SEA >= 2000
SELECT *
FROM entradaSalidaDinero
WHERE montoIE >= 2000;

-- SELECCIONA LAS PERSONAS CUYOS PRIMEROS TRES DIGITOS DEL TELEFONO INICIEN CON 492 O 493left(telefono,3)='493'
-- indica que tomara los primeros caracteres de la izquierda left(telefono,3)='493'
select *, left(telefono,3) as lada
from personas
where left(telefono,3)='493' or left(telefono,3)='492' ;

-- SELECCIONA LAS PERSONAS CUYOS PRIMEROS TRES DIGITOS DEL TELEFONO no INICIEN CON 492 O 493
select *, left(telefono,3) as lada
from personas
where not(left(telefono,3)='493' or left(telefono,3)='492') ;

-- SELECCIONA LAS PERSONAS CUYOS PRIMEROS TRES DIGITOS DEL TELEFONO INICIEN CON 492 O 493 HACIENDO
-- USO DE LA CLAUSULA IN
select *, left(telefono,3) as lada
from personas
where left(telefono,3) not in('492','493');

-- HACER UNA CONSULTA A LA TABLA DE PERSONAS EN LA QUE UTILICES LA CLAUSULA IN, DENTRO DE ELLA
-- IRA UNA SUBCONSULTA LA CUAL DELIMITARA A MOSTRAR SOLO A LAS PERSONAS CUYO TAMAÑO DE NOMBRE SEA MENOR A 4 CARACTERES
select * from personas
where nombre in('Luz','Juan');

select nombre from personas
where length(nombre) <= 4;

select * from personas
where nombre in(select nombre from personas
                where length(nombre)>5);

-- HACER UNA CONSULTA EN LA CUAL SE REGRESEN TODOS LOS NOMBRES DE PERSONAS CUYO CORREO CONTENGA LA PALABRA
-- HOTMAIL Y LA LADA (3 PRMERAS LINEAS DEL NUMERO ) COMIENCEN CON 493
-- LIKE('%hotmail%'): indica que el registro debe contener la palabra hotmail
SELECT * FROM personas
WHERE left(telefono,3)='493' AND CORREO LIKE('%hotmail%');

-- SELECCIONA LAS PRIMERAS 3 PERSONAS CON CORREO DE HOTMAIL, ORDENALAS POR NOMBRE Y POR TELEFONO
-- limit 2: limitara a mostrar lo primeros 2
-- limit 2,3 brinca lo primeros 2 resultados y de ahi trae los 3 siguientes
SELECT * FROM personas
WHERE  CORREO LIKE('%hotmail%')
order by nombre,telefono 
limit 2,3;

-- con esta consulta en los campos de id que son fk se observa una relacion numerica
select * from entradaSalidaDinero;
desc entradaSalidaDinero;
desc personas;

-- une una parte de la tabla izquierda con la tabla a la derecha
select * from 
entradaSalidaDinero inner join personas on (entradaSalidaDinero.idPersonas=personas.id_personas);

select  personas.nombre, entradaSalidaDinero.idIngresosEgresos, 
		entradaSalidaDinero.FechaES, entradaSalidaDinero.montoIE, 
		ingresosEgresos.descripcion, tipoIngEg.descripcion,
        grupoIngEg.descripcion 
from entradaSalidaDinero 
					inner join personas on (entradaSalidaDinero.idPersonas = personas.id_personas)
					inner join ingresosEgresos on (entradaSalidaDinero.idIngresosEgresos = id_ingresosEgresos)
					inner join tipoIngEg on (ingresosEgresos.idTipoIngEg = tipoIngEg.id_tipoIngEg)
                    inner join grupoIngEg on(ingresosEgresos.idGrupoIngEg = grupoIngEg.id_grupoIngEg);
		
-- expresiones regulares
