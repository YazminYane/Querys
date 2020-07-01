-- ------------------------------------------------------------------------------------------------------
-- 	CURSORES :	 un select en varios renglones 
-- ------------------------------------------------------------------------------------------------------
-- Elimina el sursor 
drop procedure cursores;

-- 1. select de todas las personas que tien hotmail en su correo, arrojara varias personas
-- 2. por cada persona y con dato de lefeno se guardara con update en la tabla de pendientes
-- despues actualizar el campo de observaciones y en este campo poner el numero de tel de la persona 
-- que tiene hotmail

DELIMITER //
create procedure cursores()
begin

    -- declaracion de variables 
    declare id_personas_var int;
    declare telefono_var    varchar(30);
    declare row_not_found   tinyint default false;   -- indicara si ya no hay renglones en el record set 
    declare update_count    int default 0; --  nmero de renglones que fueron actualizados
    
    -- declarando el cursor
    -- consulta que regresará mas de un renglon
    declare id_persona_cursor cursor for          -- es un cursor para
    select id_personas, telefono from personas
    where correo like '%hotmail%';            -- selecciona a todo los usuarios con hotmail 
    
    -- declarando un manejador de errores para cuando el cursor no encuentre mas renglones
    -- -- declara la continuacion del manejador para cuando no encuentres ningun registro
    declare continue handler for not found   
    set row_not_found = true;
    
    -- abrir el cursor
    open id_persona_cursor;
    
    while row_not_found = false do  -- esta bandera cambiara cuando ya no se encuentre un renglon
        
        -- obteniendo los valores del renglon y almacenandolos en variables
    	fetch id_persona_cursor into id_personas_var, telefono_var;
         
		if length(telefono_var) > 0 then
			update pendientes
			set observaciones = telefono_var
			where id_pendientes = id_personas_var;
		else   
			update pendientes
			set observaciones = 'FAVOR DE SOLICITAR EL NUMERO DE TELEFONO'
			where id_pendientes = id_personas_var;
			set update_count = update_count + 1;     
		end if;
        
    end while;
    
    -- cerrando el cursor
    CLOSE id_persona_cursor;
    SELECT CONCAT(update_count,' NECESITAN TELEFONO');  
    
end //

call cursores;




