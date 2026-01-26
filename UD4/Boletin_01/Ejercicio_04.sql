-- Consultar tabla orders
select *
from orders;
-- Consultar tabla shippers
select *
from shippers;

/*
-- 2.
Seleccionar el COMPANY_NAME y CONTACT_NAME de 
aquellos CUSTOMERS que hayan hecho pedidos (ORDERS).
*/

select count(orders.order_id) as numero_de_pedidos
from orders join shippers on orders.ship_via = shippers.shipper_id
where
	shippers.company_name in ('Federal Shipping', 'United Package')
	/*and orders.shipped_date >= make_date(1990,1,1)
	and orders.shipped_date <= make_date(1999,12,31);*/
--	and to_char (shipped_date, 'YYYY') like '199%';
	and (shipped_date, shipped_date)
		overlaps 
		(make_date(1990,1,1), make_date(1999,12,31));

/*
Seleccionar el nombre de aquellos productos
que han sido solicitados en algún pedido.
*/
SELECT DISTINCT p.product_name
FROM products p
JOIN order_details od ON p.product_id = od.product_id;

SELECT SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_cobrado
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
WHERE o.order_date >= '1996-01-01' 
  AND o.order_date <= '1996-12-31';