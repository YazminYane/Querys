-- ----------------------------------------------------------------------------------------------------------
-- PROCEDIMIENTO TRANSACIONES
-- ----------------------------------------------------------------------------------------------------------
-- PARA USAR TRANSACCIONES SE DEBE TENER LA INGENIERIA INNODB
DROP PROCEDURE transacciones;

DELIMITER //
CREATE PROCEDURE transacciones()
BEGIN
    DECLARE sql_error tinyint DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR sqlexception
	SET sql_error = true;
    
    start transaction;
	
    -- instruccion valida
	delete from tmpPersonas;

	-- instruccion valida
	insert into tmpPersonas select * from personas;
    
	-- instruccion valida
	update tmpPersonas set telefono = '450';

    -- instruccion no valida porque lleva nulo el campo de nombre y no es permitido un dato nulo en este campo
    -- insert into tmpPersonas 
    --  values(0,'aqui ya va un dato valido','ventas@hotmail.com','4789856789',3);
     
	-- intruccion valida
    insert into tmpPersonas 
      values(0,'karina Santiago Gutierez','ventas@hotmail.com','4789856789', null);
     
    if sql_error= false then
       commit;
       select 'La transacción fue ejecutada';
    else
       rollback;
       select 'La transacción no fue ejecutada';
    end if;
END //

CALL transacciones;


