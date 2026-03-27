
-- Seleccionar el producto más caro de cada categoría
-- category_name, product_name, unit_price

select category_name, product_name, unit_price
from products p1 join categories using (category_id)
where p1.unit_price >= all (
	select p2.unit_price
	from products p2
	where p1.category_id = p2.category_id
)

SELECT p1.product_name, p1.unit_price, p1.category_id
FROM products p1
WHERE p1.unit_price >
(
    SELECT AVG(p2.unit_price)
    FROM products p2
    WHERE p2.category_id = p1.category_id
);