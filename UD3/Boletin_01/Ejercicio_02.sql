

/*

== EJERCICIO 2 ==

*/
-- 1

select first_name, last_name
from employees join departments using(department_id)
where department_name in('IT', 'Finance')
  and to_char(hire_date, 'MM')='04';

-- 2

select first_name, last_name
from employees join departments using (department_id)
where department_name='Administration';


-- 3

select country_name
from countries 
join locations using(country_id)
join departments using(location_id)
where department_name='Public Relations';


-- 4

select *
from employees 
join departments using(department_id)
join locations using(location_id)
join countries using(country_id)
join 
where country_name='United States of America';
