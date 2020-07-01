-- importando datos a la tabla de estatusPendiente
--  mysql tiene la variable secure_file_priv en su motor, se usa con el fin de limitar las operaciones 
-- de carga y descarga de datos
-- para importar tablas en linux se debe buscar el archivo que aparezca con este comando es Mysql:
-- SHOW VARIABLES LIKE "secure_file_priv", dentro de esa carpeta se deben poner todos los archivos a importar 
-- Recordar que se deben llenar primero las tablas que no tengan fk

-- --------------------------------------------------------------------------------------------------------
-- importando datos a la tabla de estatusPendiente 
-- --------------------------------------------------------------------------------------------------------
load data infile '/var/lib/mysql-files/tablas_importar/1.- Tabla EstatusPendiente.csv' 
into table estatusPendiente 
fields terminated by ',' 
enclosed by '"' 
lines terminated by '\r\n' 
ignore 1 rows;

-- --------------------------------------------------------------------------------------------------------
-- importando datos a la tabla de personas
-- --------------------------------------------------------------------------------------------------------
load data infile '/var/lib/mysql-files/tablas_importar/2.- personas.csv' 
into table personas 
fields terminated by ',' 
enclosed by '"' 
lines terminated by '\r\n' 
ignore 1 rows;         

-- --------------------------------------------------------------------------------------------------------        
-- importando datos a la tabla de usuarios
-- --------------------------------------------------------------------------------------------------------
load data infile '/var/lib/mysql-files/tablas_importar/3.- tabla usuarios.csv' 
into table usuarios 
fields terminated by ',' 
enclosed by '"' 
lines terminated by '\r\n' 
ignore 1 rows;

-- --------------------------------------------------------------------------------------------------------
-- importando datos a la tabla de pendientes
-- --------------------------------------------------------------------------------------------------------
load data infile '/var/lib/mysql-files/tablas_importar/4.- tabla pendientes.csv' 
into table pendientes 
fields terminated by ',' 
enclosed by '"' 
lines terminated by '\r\n' 
ignore 1 rows;

-- --------------------------------------------------------------------------------------------------------
-- importando datos a la tabla de tipoIngEg
-- --------------------------------------------------------------------------------------------------------
load data infile '/var/lib/mysql-files/tablas_importar/A.- tabla TipoIngEg.csv' 
into table tipoIngEg 
fields terminated by ',' 
enclosed by '"' 
lines terminated by '\r\n' 
ignore 1 rows;

-- --------------------------------------------------------------------------------------------------------
-- importando datos a la tabla de grupoIngEg
-- --------------------------------------------------------------------------------------------------------
load data infile '/var/lib/mysql-files/tablas_importar/B.- tabla grupoIngEg.csv' 
into table grupoIngEg 
fields terminated by ',' 
enclosed by '"' 
lines terminated by '\r\n' 
ignore 1 rows;

-- --------------------------------------------------------------------------------------------------------
-- importando datos a la tabla de ingresosEgresos
-- --------------------------------------------------------------------------------------------------------
load data infile '/var/lib/mysql-files/tablas_importar/C.- tabla IngresosEgresos.csv' 
into table ingresosEgresos 
fields terminated by ',' 
enclosed by '"' 
lines terminated by '\r\n' 
ignore 1 rows;

-- --------------------------------------------------------------------------------------------------------
-- importando datos a la tabla de entradaSalidaDinero
-- --------------------------------------------------------------------------------------------------------
load data infile '/var/lib/mysql-files/tablas_importar/D.- tabla EntradaSalidaDinero.csv' 
into table entradaSalidaDinero 
fields terminated by ',' 
enclosed by '"' 
lines terminated by '\r\n' 
ignore 1 rows;       
        

 