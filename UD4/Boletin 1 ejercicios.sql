/*
APARTADO 2
Seleccionar el nombre de aquellos departamentos en los que 
trabaja un empleado que fue contratado a lo largo del año 1993.*/

Select departments.department_name
from departments join employees using (department_id)
where employees.hire_date::text like '1993%';

/*
APARTADO 4
Seleccionar el nombre de aquellos empleados cuyo jefe 
directo tenga un apellido que empiece por D, H o S.*/

SELECT e.first_name
FROM employees e
JOIN employees m ON (e.manager_id = m.employee_id)
WHERE m.last_name LIKE 'D%' 
   OR m.last_name LIKE 'H%' 
   OR m.last_name LIKE 'S%';

select CURRENT_DATE - '2007-02-07'::date as "Número de dias en la tierra";

select age(current_date, '2007-02-07')

select to_char (CURRENT_DATE, 'Day, DD-MM-YYYY')

select INTERVAL '1 year 2 months 3 days 04:05:06';

select to_char (current_date, 'TMMonth');

ALTER SYSTEM SET lc_time = 'es_ES.UTF-8';




