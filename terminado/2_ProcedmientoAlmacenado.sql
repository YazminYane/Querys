-- ----------------------------------------------------------------------------------------------------------
-- PROCEDIMIENTOS ALMACENADOS  (SQL AVANZADO)   while
-- ----------------------------------------------------------------------------------------------------------
drop procedure usoWhile;

-- WHILE : hace repetitivos ciertas sentencias
delimiter //
create procedure usoWhile()
begin
    declare cont int default 1;                
    declare s varchar(100) default '';         
    
    while cont <= 5 do                          
         set s = concat(s,' cont =',cont,'|');
         set cont = cont + 1;
    end while;
    select s as mensaje;
    
end//
call usoWhile;

-- ----------------------------------------------------------------------------------------------------------
-- PROCEDIMIENTOS ALMACENADOS  (SQL AVANZADO)   repeat
-- ----------------------------------------------------------------------------------------------------------
drop procedure usoRepeat;
delimiter //
create procedure usoRepeat()
begin
    declare cont int default 1;
    declare s varchar(100) default '';
    repeat
         set s = concat(s,' cont =',cont,'|');
         set cont = cont + 1;
         until cont = 6
    end repeat;
    
    select s as mensaje;
    
end//
call usoRepeat;

-- ----------------------------------------------------------------------------------------------------------
-- PROCEDIMIENTOS ALMACENADOS  (SQL AVANZADO)   loop
-- ----------------------------------------------------------------------------------------------------------
drop procedure usoLoop;
delimiter //
create procedure usoLoop()
begin
    declare cont int default 1;
    declare s varchar(100) default '';
    declare testLoop varchar(10);
    testLoop : LOOP
         set s = concat(s,' cont =',cont,'|');
         set cont = cont +1;
         
         if cont = 4 then
            LEAVE testLoop;
         end if;
         
    end loop testLoop;
    
    select s as mensaje;
end//
call usoLoop;

