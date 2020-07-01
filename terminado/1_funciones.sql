-- ----------------------------------------------------------------------------------------------------------
-- FUNCIONES : ESTAS REGRESAN SOLO UN VALOR Y USAN RETURN, NO USAN INSERT UPDATE Y DELETE 
-- ----------------------------------------------------------------------------------------------------------
select * from entradaSalidaDinero;   -- contiene el pago realizado por cada gasto 
select * from ingresosEgresos;       -- contiene los gastos 
drop function montosIngresosEgresos;

-- HACER UNA FUNCION QUE COMO PARAMETRO RECIB EL ID
-- Y QUE AL MANDARLA A LLAMAR REGRESE EL MONTO TOTAL DE TRANSACIONES DE ESE ID 

delimiter //
CREATE FUNCTION montosIngresosEgresos(idIngresoEgreso int)
returns decimal(7,2)  -- EL TIPO DE DATO A REGRESAR
begin
    -- DECLARACION DE VARIABLE
    declare sumatoria decimal(7,2) default 0 ;
    
    -- CONSULTA
    select sum(montoIE)
    into sumatoria
    from entradaSalidaDinero
    where idIngresosEgresos = idIngresoEgreso;  -- 4
    
    -- return sumatoria; 
    -- VALIDACIONES: sin la validacion y encuentra un null, regresara un nullo
    if sumatoria > 0 then
       return sumatoria;
	else
      return 0;
   end if;      
    
end //
delimiter ;

select * from ingresosEgresos;
select * from entradaSalidaDinero;

select idIngresosEgresos, sum(montoIE) from entradaSalidaDinero
where idIngresosEgresos = 4;  -- 26170

select sum(montoIE)
    from entradaSalidaDinero
    where idIngresosEgresos = 4;

select descripcion from ingresosEgresos;

select id_ingresosEgresos, descripcion, montosIngresosEgresos(4) from ingresosEgresos
where id_ingresosEgresos = 4;

select id_ingresosEgresos, descripcion, montosIngresosEgresos(id_ingresosEgresos) from ingresosEgresos
WHERE id_ingresosEgresos = id_ingresosEgresos;

