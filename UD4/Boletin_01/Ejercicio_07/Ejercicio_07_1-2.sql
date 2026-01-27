select *
from employees


/*
--1
(HR) Selecciona el número de empleados que fueron contratados en el 
año 1997 en la que trabajen en una oficina situada en Bélgica.
*/

select count (*) 
from employees 
	join departments using (department_id)
	join locations using (location_id)
	join countries using (country_id)
where to_char (employees.hire_date, 'YYYY') = '1997'
  and countries.country_name = 'Belgium';


/*
--2
(HR) Selecciona la media de salario máximo de los 
trabajadores de Administration en Asia.
*/

select coalesce(avg(max_salary),0) as media_salario_max_Asia
from jobs 
	join employees using (job_id)
	join departments using (department_id)
	join locations using (location_id)
	join countries using (country_id)
	join regions using (region_id)
where regions.region_name = 'Asia'
and departments.department_name ilike 'Administration';

















