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