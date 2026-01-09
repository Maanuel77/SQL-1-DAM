

SELECT *
from vuelos;

-- APARTADO 1
SELECT count (*)
FROM vuelos
WHERE (desde = 'Berlín' and hasta = 'Londres')
  and (salida::text like '2020-10%' 
   or salida::text like '2020-11%'
   or salida::text like '2020-12%');

-- APARTADO 2

SELECT *, 
	ROUND(precio*(1-descuento/100), 2) as precio_final
FROM vuelos
WHERE salida::text like '2020-12%'
  and desde IN ('Sevilla', 'Málaga') 
  and hasta IN ('Madrid', 'Barcelona');


-- APARTADO 3

SELECT *
FROM vuelos
WHERE descuento is null
  and hasta = 'Nueva York'
  and right(left(llegada::text, 7), 2) = '10'
  and substr(llegada::text,9,2)::int
  		between 1 and 15;

-- APARTADO 4

SELECT *
FROM vuelos
WHERE jjjjj