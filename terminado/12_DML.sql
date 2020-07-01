-- ----------------------------------------------------------------------------------------------------------
-- CHARACTER SETS Y COLLATIONS SET
-- ----------------------------------------------------------------------------------------------------------
      
SHOW CHAR SET;

-- muestra  todos los character set en un servidor de la base de datos 
show char set like '%utf8mb4%';

-- mostrar el character set default para un servidor
show variables like 'character_set_server';

-- mostrar el character para una base de datos
show variables like 'character_set_database';

-- mostrar las collections disponibles en un servidor
show collation;

show collation
where charset like 'utf8mb4%'; 

-- saber la collection default para un servidor
show variables like 'collation_server';

-- mostrar el collation asignado a cada tabla de una base de datos 
select table_name, table_collation
from information_schema.tables
where table_schema = 'dbPendientes';

-- mostrar el character set defult y collaction para una base de datos
show variables like 'collation_database';
show variables like 'character_set_database';

-- creamos un base de datos temporal para ver que charset y collation le asigna default
drop database dbPendientes12;
create database if not exists dbPendientes12 charset 'utf8mb3' collate 'utf8_general_ci';

-- el collaction queda en el dafault 
alter database dbPendientes12 charset 'utf8mb4';





