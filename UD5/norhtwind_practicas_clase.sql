Select *
from categories;

select *
from customer_customer_demo;

select *
customer_demographics;

select *
from customers;

select * 
from orders;

select * 
from order_details;

-- Mostrar el número de pedidos por cliente.

select customer_id, count (*) as numero_pedidos
  from orders
	group by customer_id
  order by numero_pedidos desc;

-- Mostrar los clientes con más de 10 pedidos.

select customer_id, count (*) as numero_pedidos
  from orders
	group by customer_id
	having count (*) >10
  order by numero_pedidos desc;


-- Mostrar el número de pedidos gestionados por cada empleado.

select *
from employees;

select * 
from orders;

select employee_id, count (*), 
  from orders o 
	group by employee_id
  order by employee_id asc;

-- Mostrar los empleados que han gestionado más de 50 pedidos.

select employee_id, count (*)
  from orders 
	group by employee_id
	having count (*) > 50
  order by employee_id asc;
  


