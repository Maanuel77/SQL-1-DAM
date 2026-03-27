/*Obtén el nombre, apellidos y email de
los clientes que han comprado el producto
más caro de todo el catálogo.*/

select *
from cliente;

select *
from producto;

select *
from categoria;

select c.nombre, c.apellidos, c.email, p.pvp
from cliente c 
	join venta v on (c.id = v.id_cliente)
	join lineaventa lv on (v.id = lv.id_venta)
	join producto p on (lv.id_producto = p.id)
where p.pvp =
	(select max(pvp)
		from producto
	);

/*
Muestra el nombre y el PVP de aquellos 
productos cuyo precio es estrictamente
superior al de todos los productos que
pertenecen a la categoría "Salsas y condimentos" 
(asume que no sabes el ID de esta categoría
de antemano).
*/

select p.nombre, p.pvp
from producto p
	join categoria c on (p.id_categoria = c.id)
where pvp > any (
	select sum(p.pvp)
	from producto p
	join categoria c on (p.id_categoria = c.id)
	where c.nombre = 'Salsas y condimentos'
) 

-- V2

SELECT nombre, pvp
FROM producto 
WHERE pvp > ALL (
	SELECT p.pvp
	FROM producto p
	JOIN categoria c ON (p.id_categoria = c.id)
	WHERE c.nombre = 'Salsas y condimentos'
);

/*
Lista el nombre, el primer apellido y la fecha 
de alta de aquellos empleados que fueron contratados
antes que su propio jefe (es decir, su fecha de alta
es más antigua que la fecha de alta del empleado 
indicado en su JEFE_ID).
*/

select *
from empleado;

SELECT e.nombre, e.apellido1, e.fecha_alta
FROM empleado e
WHERE e.fecha_alta < (
    SELECT jefe.fecha_alta
    FROM empleado jefe
    WHERE jefe.id_empleado = e.jefe_id
);

SELECT MAX(total_venta) AS venta_mas_alta
FROM (
    -- Paso 1: Esta es nuestra "tabla inventada" (vista en línea)
    SELECT id_venta, SUM(precio_unitario * cantidad - descuento) AS total_venta
    FROM lineaventa
    GROUP BY id_venta
) AS resumen_ventas;

select *
from categoria;

select *
from producto;
/*
Queremos saber qué categoría de productos es la más 
rentable. Muestra el nombre de la categoría que ha 
generado la mayor cantidad de ingresos históricos. 
Para calcular el ingreso de una línea de venta, usa
la fórmula: (PRECIO_UNITARIO * CANTIDAD) - DESCUENTO
*/

SELECT c.nombre, SUM(p.pvp) AS suma_categoria
FROM producto p
JOIN categoria c ON (p.id_categoria = c.id)
GROUP BY c.nombre  
HAVING SUM(p.pvp) >= ALL (
    SELECT SUM(p2.pvp)
    FROM producto p2
    GROUP BY p2.id_categoria
);

/*
Obtén el nombre del cliente que más
dinero ha gastado con cada empleado específico.
*/

select nombre
from cliente

