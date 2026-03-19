-- EJERCICIO 1

-- 1.

select d.department_name, max(e.salary) 
from employees e 
join departments d on e.department_id = d.department_id 
group by d.department_name;

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
order by count(employee_id) desc 
limit 1;


-- 6

select extract(year from hire_date) as year, count(employee_id) 
from employees 
group by extract(year from hire_date) 
order by extract(year from hire_date);