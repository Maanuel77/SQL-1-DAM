-- EJERCICIO 2: 

-- 1

select e.first_name, e.last_name, count(o.order_id) as total_pedidos
from employees e
join orders o on e.employee_id = o.employee_id
group by e.employee_id, e.first_name, e.last_name
having count(o.order_id) between 100 and 150;

-- 2

select c.company_name
from customers c
left join orders o on c.customer_id = o.customer_id
where o.order_id is null;

-- 3

select c.category_name, count(distinct od.product_id) as total_productos_distintos
from categories c
join products p on c.category_id = p.category_id
join order_details od on p.product_id = od.product_id
group by c.category_id, c.category_name
order by total_productos_distintos desc
limit 1;

-- 4

select c.category_name, p.product_name, round(cast(sum(od.unit_price * od.quantity * (1 - od.discount) * 0.25) as numeric), 2) as beneficio_total
from categories c
join products p on c.category_id = p.category_id
join order_details od on p.product_id = od.product_id
group by c.category_id, c.category_name, p.product_id, p.product_name
order by c.category_name, p.product_name;

-- 5

select c.company_name
from CUSTOMERS c
join orders o on c.customer_id = o.customer_id
join SHIPPERS s on o.ship_via = s.shipper_id
group by c.customer_id, c.company_name
having count(o.order_id) = count(case when s.company_name = 'United Package' then 1 end);





