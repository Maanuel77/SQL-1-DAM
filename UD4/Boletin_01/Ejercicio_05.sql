/*
Seleccionar el COMPANY_NAME y CONTACT_NAME de 
aquellos CUSTOMERS que hayan hecho pedidos (ORDERS).

*/
select
	count(orders.order_id) as numero_de_pedidos
from orders join shippers on orders.ship_via = shippers.shipper_id
where
	shi.company_name in ('Federal Shipping', 'United Package')
	and o.shipped_date >= '1990-01-01'
	and o.shipped_date <= '1999-12-31';

select distinct p.product_name, c.category_name
from products p 
join categories c ON p.category_id = c.category_id
join order_details od on p.product_id = od.product_id
join orders o on od.order_id = o.order_id
where extract (MONTH FROM o.order_date) = 8;

select company_name
from customers;

select distinct e.first_name
e.last_name
from employees e 
join orders o on e.employee_id = o.employee_id
join customers c on o.customer_id = c.customer_id
where c.country = 'Brazil';

select distinct cat.category_name, p.product_name
from employees e
join orders o on e.employee_id = o.employee_id
join order_details ON order_details.order_id = od.order_id