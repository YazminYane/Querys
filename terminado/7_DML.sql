-- ---------------------------------------------------------------------------------------
-- SECUENCIA 7   EXPRESIONES REGULARES 
-- ---------------------------------------------------------------------------------------
-- uso de Expresiones regulares 
-- se uso la  db Employees

use dbEmployees;
select count(*) from employees;

-- selecciona los empleados en donde el nombre tenga la frase SA y el apellido tambien contenga 
-- la frase sa
-- regexp 'SA': indica que debe buscar esa cadena en donde sea
select * from employees
where first_name regexp 'SA' and last_name regexp 'sa';

-- selecciona los empleados en donde el nombre comience con la frase sa
-- ademas el apellido tambien comience con la frase sa al principio
-- ^: indica que debe empezar con esa exprecion la palabra 
select * from employees
where first_name regexp '^sa' and last_name regexp '^Sa';

-- selecciona los empleados que su apellido y su nombre terminen con la frase na
-- <cadena>$ : se le indica que debe terminar con eso 
select * from employees
where first_name regexp 'na$' and last_name regexp 'nA$';

-- selecciona a los empleados cuyo nombre congenga la frase rs o la frase sn
-- y que el apellido contenga la frase rs o sn o an
-- | : indica o 
select * from employees
where first_name regexp 'rs|sn' and last_name regexp 'rs|sn|an';


-- selecciona los empleados cuyo nombre tenga la letra n seguida de una i o una a
-- y que el apellido contenga una letra n seguida de una u o una e
-- n[ia]: indica que debe hallar una n seguido de [ue]
select * from employees
where first_name regexp 'n[ia]' and last_name regexp 'n[ue]';

-- selecciona los empleados cuyo nombre contenga la letra n seguida de un caracter como a,b,c,d,e,f
-- y que el apellido tenga la letra n seguida de una f,g,h,i,j,k
-- n[a-f] : como la anterior pero indica un rango de valores 
select * from employees
where first_name regexp 'n[a-f]' and last_name regexp 'n[f-k]';

-- selecciona los empleados que contengan la frase mar seguida de una letra i o una y
-- y en seguida de esa letra que le presiga una a o una o en el campo del nombre
select * from employees
where first_name regexp 'mar[iy][ao]';

-- selecciona los empleados cuyo nombre ( la parte final) contenga la siguiente convinacion de caracteres
-- tenga una letra de la a a la z, en seguida de ese carater tiene que seguir una vocal,
-- despues de la vocal finaliza con una letra n
select * from employees
where first_name regexp '[a-z][aeiou]n$'
