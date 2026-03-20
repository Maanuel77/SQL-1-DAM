-- EJERCICIO 1

-- 1.

select d.department_name, max(e.salary) 
from employees e 
join departments d on e.department_id = d.department_id 
group by d.department_name
order by max(e.salary) desc;

-- Corrección (Para añadir la gente que no tiene departamento como una nueva fila)

select coalesce (department_name, 'Sin departamento'), 
				max(salary)
				
from employees left join 
	 departments using (department_id)
group by department_name
order by max(salary) desc;

-- 2

select d.department_name, min(e.salary) 
from employees e 
join departments d on e.department_id = d.department_id 
group by d.department_name 
having min(e.salary) < 5000;

-- 3

select l.street_address as "STREET_ADDRESS", count(e.employee_id) 
from locations l 
join departments d on l.location_id = d.location_id 
join employees e on d.department_id = e.department_id 
group by l.street_address 
order by count(e.employee_id) desc;

-- Corrección, estaba bien hecho pero para mejorarlo se le ha añadido la ciudad al final

select street_address || ', ' || city, count(*)
from employees join departments
		using (department_id)
	  join locations using (location_id)
group by street_address || ', ' || city
order by count(*) desc;

-- 4

select l.street_address as "STREET_ADDRESS", count(e.employee_id) 
from locations l 
left join departments d on l.location_id = d.location_id 
left join employees e on d.department_id = e.department_id 
group by l.street_address 
having count(e.employee_id) = 0;


-- 5

select salary, count(employee_id) 
from employees 
group by salary 
having count (*) > 1
order by count(employee_id) desc 
limit 1;


-- 6

select extract(year from hire_date) as year, count(employee_id) 
from employees 
group by extract(year from hire_date) 
order by extract(year from hire_date);
