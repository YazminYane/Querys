-- ----------------------------------------------------------------------------------------------------------
-- PROCEDIMIENTO DINAMICO
-- ----------------------------------------------------------------------------------------------------------
drop procedure sqlDinamico;

DELIMITER //
create procedure sqlDinamico(campoSelecionado int, valor varchar(50))
begin
	declare paramWhere varchar(50);   -- variable que formara la instrucion where al final 
    declare campo varchar(30);        -- variable que guardara el valor del campo selecionado en parametros
    set campo = '';
    
    if(campoSelecionado = 1) then  -- si el usuario selecciono o envio como parametro 1 es porque quiere buscar por nombre
		set campo = concat(" nombre = ", "'", valor, "'");
    end if;
    
    if(campoSelecionado = 2) then  -- si el usuario selecciono o envio como parametro 2 es porque quiere buscar por correo
		set campo = concat(" correo = ", "'", valor, "'");
    end if;
    
    if(campoSelecionado = 3) then  -- si el usuario selecciono o envio como parametro 3 es porque quiere buscar por telefono
		set campo = concat(" telefono = ", "'", valor, "'");
    end if; 
    
    if(campoSelecionado = 4) then  -- si el usuario selecciono o envio como parametro 3 es porque quiere buscar por telefono
		set campo = concat(" id_personas = ", valor);
    end if; 
    
    if(campoSelecionado = 5) then  -- si el usuario selecciono o envio como parametro 3 es porque quiere buscar por telefono
		set campo = concat(" nombre like '%", valor, "%'");
    end if; 
    
    -- @ indica que es una sentencia
    set @sqlSentencia = concat('select id_personas, nombre, correo, telefono
							   from personas where', campo);
    
    -- formamos una instruccion con la sintaxis mostrada que representa una
    -- cadena con toda la instruccion sql
    -- estas tres instrucciones son necesariasn para que se prepare, ejecute y mande a salida los datos arrojados 
    prepare select_invoices_statement from @sqlSentencia;
    execute select_invoices_statement;
    deallocate prepare select_invoices_statement;
    
end //
DELIMITER ;

call sqlDinamico(1, 'juan perez garcia'); 
call sqlDinamico(2, 'juanis@gmail.com'); 
call sqlDinamico(3, '4935405678'); 

call sqlDinamico(4, '2'); 
call sqlDinamico(5, 'an'); 
