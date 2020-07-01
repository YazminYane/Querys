-- SEGURIDAD EN LAS BASES DE DATOS
-- ------------------------------------------------------------------------------------------------
-- INSTRUCCION GRANT 
-- ------------------------------------------------------------------------------------------------
-- muestra privilegios
show privileges;

-- crear un usuario llamado usuario con password 12345 en localhost
-- despues crearlo por medio de la herramienta management  pero con nombre usuario1
-- localhost se reemplaza por ip si fuera un servidor 
-- Para verificar que se creo hay que intentar una conexion con ese usuario y contraseña 
CREATE USER usuario@localhost identified BY '12345';

-- seleccionamos usuario y host de la tabla user de la base de datos mysql
use mysql;
select user,host from user;

-- asignar todos los permisos al usuario llamado usuario sobre la base de datos bdpendientes
-- al entrar a la conexin no se tienen esquemas para dar permiso a una bd 
-- despues el comando se debe establecer una conexion con el usuario y se debe ver
-- la base de datos bdPendientes
grant all
on bdpendientes.*
to usuario@localhost with grant option;

-- mostramos los permisos de usuario
show grants for usuario@localhost;

-- creando un usuario llamado usuario2 con password = 321 en locahost que solo tenga permisos para seleccionar e insertar datos
CREATE USER usuario2@localhost identified BY '321';

-- este ususario solo tiene permisos para los comandos insert y select 
grant select, insert
on dbpendientes.*
to usuario2@localhost with grant option;

-- ------------------------------------------------------------------------------------------------
-- INSTRUCCION REVOKE 
-- ------------------------------------------------------------------------------------------------
-- muestra los permisos actuales de usuario2@localhost
show grants for usuario2@localhost;

-- revoca o elimina dichos permisos del usuario    usuario2@localhost
revoke all, grant option from usuario2@localhost;


-- renombra a usuario y llamalo como user1
rename user usuario@localhost to user1@localhost;

-- elimina al usuario usuario2@localhost
drop user user1@localhost;








