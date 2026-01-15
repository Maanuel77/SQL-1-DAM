
select
	first_name,
	last_name,
	department_name,
	employee_id
	
from
	departments,
	employees
	/*
	Se puede poner un alias:
	from departments d, employees e
	*/
where
	departments.department_id = employees.department_id --Esto es un join entre dos tablas
	and (
		departments.department_name = 'IT'
		or departments.department_name = 'Administration'
	)
order by
	employee_id;

------------------------------------------------------------------------------------------------

select
	first_name,
	last_name,
	region_name
from
	employees
	join departments using (department_id)
	join locations using (location_id)
	join countries using (country_id)
	join regions using (region_id)
where
	region_name in ('Americas', 'Europe');

--------------------------------------------------------------------------------------------------

select first_name, last_name, email

from employees
join departments using (department_id)
join locations using (location_id )
join countries using (country_id)

where country_name = 'United Kingdom';


--------------------------------------------------------------------------------------------------

select
	distinct regions.region_name
from
	employees
	join departments using (department_id)
	join locations using (location_id)
	join countries using (country_id)
	join regions using (region_id)

where employees.salary < 10000;

---------------------------------------------------------------------------------------------------

select
	count(*)
from
	employees
select
	count(*)
from
	employees
	join departments using (department_id)
update employees
set
	department_id = null
where
	employees.employee_id = 100;


select
	*
from
	employees
	full join departments using (department_id);

-- seleccionar el nombre de aquellos departamentos que no tienen empleados

select departments.department_name
from employees right join departments using (department_id)
where employees.employee_id is null;

 ---------------------
 -- COSAS DE FECHAS --
 ---------------------
 
select estacion, fecha, precipitacion_total
from climatologia 
where 
-- fecha between make_date (2019,4,1)
-- and make_date (2019,4,30)
to_char (fecha, 'MM/YYYY') = '04/2019';
extract (from month )
and provincia = 'Sevilla'

------------------------------------------------------------------------------------

select * 
from climatologia
where provincia in ('Cuenca', 'Guadalajara', 'Toledo', 'Albacete', 'Ciudad Real')
and fecha BETWEEN make_date (2019,3,21)
















