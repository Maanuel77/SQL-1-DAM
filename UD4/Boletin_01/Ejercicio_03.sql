--Apartado 1

SELECT *
FROM employees
where department_id > 8 
and department_id < 12;

--Apartado 2

SELECT *
FROM countries
where country_name ILIKE '_a%';

--Apartado 3

SELECT first_name, last_name, salary * 14 as "salario_bruto"
FROM employees
where salary * 14 >= 100000
and job_id != 6
order by "salario_bruto" asc;

--Apartado 4

SELECT *
FROM departments
where department_name ILIKE '%t%t%';

--Apartado 5

SELECT *
FROM locations 
where city IN ('Toronto', 'Oxford')
   or state_province = 'California';

--Explicación funciones

SELECT sum (salary) as suma_total_salario
from employees;
