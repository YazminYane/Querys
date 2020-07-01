-- ----------------------------------------------------------------------------------------------------------
-- PROCEDIMIENTOS ALMACENADOS (STORE PROCEDURE)  /  EJEMPLO 1
-- ----------------------------------------------------------------------------------------------------------
-- creando un procedimiento que mande llamar a un mensaje
use dbPendientes;

-- Elimina el procedimiento
drop procedure prueba2;

DELIMITER //
CREATE PROCEDURE prueba2()
BEGIN

    DECLARE nuevos INT;
    DECLARE finalizados INT;
    DECLARE leidos INT;
    DECLARE deshabilitados INT;
    
    SELECT COUNT(*)
    INTO nuevos
    FROM dbPendientes.pendientes
    INNER JOIN estatusPendiente on (estatusPendiente.id_EstatusPendiente = pendientes.idEstatusPendiente)
    WHERE estatusPendiente.estatus = 'NUEVO';
    
    SELECT COUNT(*)
    INTO finalizados
    FROM dbPendientes.pendientes
    INNER JOIN estatusPendiente on (estatusPendiente.id_EstatusPendiente = pendientes.idEstatusPendiente)
    WHERE estatusPendiente.estatus = 'FINALIZADO';
    
    SELECT COUNT(*)
    INTO leidos
    FROM dbPendientes.pendientes
    INNER JOIN estatusPendiente on (estatusPendiente.id_EstatusPendiente = pendientes.idEstatusPendiente)
    WHERE estatusPendiente.estatus = 'LEIDO';
    
    SELECT COUNT(*)
    INTO deshabilitados
    FROM dbPendientes.pendientes
    INNER JOIN estatusPendiente on (estatusPendiente.id_EstatusPendiente = pendientes.idEstatusPendiente)
    WHERE estatusPendiente.estatus = 'DESHABILITADO';
    
    SELECT nuevos AS pendientesNuevos,
           finalizados AS pendientesFinalizados,
           leidos AS pendientesLeidos,
           deshabilitados AS pendientesDeshabilitados;
		
END //
DELIMITER ;

-- llama al procedure pruebA
call prueba2();

-- ----------------------------------------------------------------------------------------------------------
-- PROCEDIMIENTOS ALMACENADOS (INSTRUCCION if)
-- ----------------------------------------------------------------------------------------------------------
use dbPendientes;

-- Elimina el procedimiento
drop procedure totalPendientes;

DELIMITER //
CREATE PROCEDURE totalpendientes(in varIdPersonaAsignado int, out frase varchar(50), out persona varchar(50))
BEGIN

    declare totalpendientes int;
    
    -- indica cuantos pendientes tiene una persorna 
    select count(*)
    into totalpendientes
    from pendientes
    where idPersonaAsignado = varIdPersonaAsignado;

    -- indica el nombre de la persona
    select nombre
    into persona
    from personas
    where id_personas = varIdPersonaAsignado;
    
    -- dependiendo de los pendientes que tenga, dirá que tan ocupado esta
    -- con SET se le indica que a esa variable se le va a asignar ese valor
    if totalpendientes = 0 then
       set frase = 'NO TIENE PENDIENTES';
    elseif totalpendientes > 1 and totalpendientes < 3 then
        set frase = CONCAT('ESTA ALGO OCUPADO TIENE ',totalpendientes,' PENDIENTES');
    elseif totalpendientes>=4 then
        set frase = CONCAT('TIENE MUCHO TRABAJO ',totalpendientes,' PENDIENTES');    
    end if;   

END //
DELIMITER ;

-- los parametros de salida llevan @ y el nombre del campo. Esta instruccion va a ejecutar el procedimiento 
call totalpendientes (3,@frase,@persona);

-- para poder ver la salida del procemiento 
select @frase,@persona;

-- ----------------------------------------------------------------------------------------------------------
-- PROCEDIMIENTOS ALMACENADOS  (INSTRUCCION CASE)
-- ----------------------------------------------------------------------------------------------------------
-- este procedimiento hace lo mismo que el anterior pero en vez de usar if usa case 
drop procedure totalpendientesCASE;

DELIMITER //
CREATE PROCEDURE totalpendientesCASE(in varIdPersonaAsignado int, out frase varchar(50), out persona varchar(50))
BEGIN
    declare totalpendientes int;
    
    select count(*)
    into totalpendientes
    from pendientes
    where idPersonaAsignado = varIdPersonaAsignado;
    
    select nombre
    into persona
    from personas
    where id_personas = varIdPersonaAsignado;
    
    CASE 
      WHEN totalpendientes > 1 and totalpendientes < 3 THEN
           set frase = CONCAT('ESTA ALGO OCUPADO TIENE ',totalpendientes,' PENDIENTES');
      WHEN totalpendientes >= 4 THEN
           set frase = CONCAT('TIENE MUCHO TRABAJO ',totalpendientes,' PENDIENTES');    
      else 
          SET FRASE = 'ESTA LIBRE NO TIENE PENDIENTES';  
    end CASE;   
END //
DELIMITER ;


call totalpendientesCASE (4,@frase,@persona);
select @frase,@persona;




