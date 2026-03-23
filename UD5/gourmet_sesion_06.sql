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
from p
-- EJERCICIO 2:
-- Mostrar las ventas cuyo precio total es superior al precio medio de todas las ventas.

select nombre, pvp, ROUND((SELECT AVG (pvp) From producto),2) as media
from producto 

SELECT nombre, round (pvp)
FROM producto
WHERE round (pvp) IN (
    SELECT round (pvp)
    FROM producto
    GROUP BY round (pvp)
    HAVING COUNT(*) > 1
);

select nombre, pvp 
from producto 
where pvp > any (
	select pvp
	from producto
	where nombre ilike '%cerveza%'
)
order by pvp;

-- seleccionar nombre, pvp 
-- del producto más caro de todos
-- no se puede usar MAX o MIN

select nombre, pvp 
from producto 
where pvp > all (
	select pvp 
	from producto
)

-- Mostrar ventas cuyo precio total es igual a alguna otra venta

SELECT id_cliente,  (precio_total)
FROM venta
WHERE  (precio_total) IN (
    SELECT  (precio_total)
    FROM producto
    GROUP BY  (precio_total)
	having count(*) > 1
);


-- Mostrar los productos cuyo precio es menor que todos los productos con precio superior a 100.

select nombre, pvp
from producto 
where pvp in (
	select pvp 
	from producto
	where pvp > 100
)
