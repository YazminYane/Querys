-- importando datos a la tabla de estatusPendiente
load data infile 'c:\\archivos\\1.- Tabla EstatusPendiente.csv' 
into table estatusPendiente 
fields terminated by ',' 
enclosed by '"' 
lines terminated by '\r\n' 
ignore 1 rows;        
        
        
-- importando datos a la tabla de personas
load data infile 'c:\\archivos\\2.- personas.csv' 
into table personas 
fields terminated by ',' 
enclosed by '"' 
lines terminated by '\r\n' 
ignore 1 rows;         
        
-- importando datos a la tabla de usuarios
load data infile 'c:\\archivos\\3.- tabla usuarios.csv' 
into table usuarios 
fields terminated by ',' 
enclosed by '"' 
lines terminated by '\r\n' 
ignore 1 rows;

-- importando datos a la tabla de pendientes
load data infile 'c:\\archivos\\4.- tabla pendientes.csv' 
into table pendientes 
fields terminated by ',' 
enclosed by '"' 
lines terminated by '\r\n' 
ignore 1 rows;


-- importando datos a la tabla de tipoIngEg
load data infile 'c:\\archivos\\A.- tabla TipoIngEg.csv' 
into table tipoIngEg 
fields terminated by ',' 
enclosed by '"' 
lines terminated by '\r\n' 
ignore 1 rows;


-- importando datos a la tabla de grupoIngEg
load data infile 'c:\\archivos\\B.- tabla grupoIngEg.csv' 
into table grupoIngEg 
fields terminated by ',' 
enclosed by '"' 
lines terminated by '\r\n' 
ignore 1 rows;

-- importando datos a la tabla de ingresosEgresos
load data infile 'c:\\archivos\\C.- tabla IngresosEgresos.csv' 
into table ingresosEgresos 
fields terminated by ',' 
enclosed by '"' 
lines terminated by '\r\n' 
ignore 1 rows;

-- importando datos a la tabla de entradaSalidaDinero
load data infile 'c:\\archivos\\D.- tabla EntradaSalidaDinero.csv' 
into table entradaSalidaDinero 
fields terminated by ',' 
enclosed by '"' 
lines terminated by '\r\n' 
ignore 1 rows;

