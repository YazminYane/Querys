-- ----------------------------------------------------------------------------------------------------------
-- TRIGGERS
-- ----------------------------------------------------------------------------------------------------------
-- sintaxis para hacer un trigger : sirven para mantener la consistencia de los datos se puede crear un log
-- para llevar el control de los movientos

-- CREATE TRIGGER nombre_trigger
-- {BEFORE|AFTER} {INSERT|UPDATE|DELETE} ON nombre_tabla
-- FOR EACH ROW -- palagra reservada 
-- sql_block

drop trigger personas_before_update;

-- crear un trigger que cambie a minusculas el correo a actualizar de la tabla personas

delimiter //
CREATE TRIGGER personas_before_update
BEFORE UPDATE ON personas
FOR EACH ROW
begin

	if new.correo like '%gmail%' then    -- nem.correo; es el nuevo campo temporal
		SIGNAL SQLSTATE 'HY000'       -- el estatus de sql va ser un error, el error es HY000
        SET message_text = 'NO ACEPTO CORREOS DE GMAIL POR LO PRONTO';
    else
       set new.correo = lower(new.correo);   -- el nuevo campo de correo  
	end if;
    
end //
delimiter ;

update personas 
SET correo = 'micorreo@gmail.com'
WHERE id_personas <= 3;


select * from personas