SELECT nombre, pvp
FROM producto
WHERE pvp > (
    SELECT AVG(pvp)
    FROM producto
);

SELECT nombre, pvp, ROUND((SELECT AVG (pvp) From producto),2)
FROM producto
WHERE pvp > (
    SELECT AVG(pvp)
    FROM producto
);


SELECT nombre, pvp, ROUND((SELECT AVG (pvp) From producto),2) as media,
					pvp - ROUND((SELECT AVG (pvp) From producto),2) as diferencia
FROM producto
WHERE pvp > (
    SELECT AVG(pvp)
    FROM producto
);

select *
from producto;

select *
from venta;

-- EJERCICIO 2:
-- Mostrar las ventas cuyo precio total es superior al precio medio de todas las ventas.

select id, precio_total, ROUND((SELECT AVG (precio_total) From venta),2) as media
from venta 
WHERE precio_total > (
    SELECT AVG(precio_total)
    FROM venta
)
order by precio_total asc;

-- Seleccionar el número medio de productos diferentes por ventas
select avg (num_prd)
from (
	select v.id, count(*) as "num_prd"
	from venta v join lineaventa lv on (v.id = lv.id_venta)
	group by v.id
) d;