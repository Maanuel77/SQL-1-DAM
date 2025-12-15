SELECT *
from vuelos;

-- APARTADO 1ss
SELECT count (*)
FROM vuelos
WHERE (desde = 'Berlín' and hasta = 'Londres')
  and (salida::text like '2020-10%' 
   or salida::text like '2020-11%'
   or salida::text like '2020-12%');

-- APARTADO 2

SELECT *, 
	Coalesce(ROUND(precio-(precio*descuento/100), 2), precio) as precio_final
FROM vuelos
WHERE salida::text like '2020-12%'
  and desde IN ('Sevilla', 'Málaga') 
  and hasta IN ('Madrid', 'Barcelona');


-- APARTADO 3

SELECT *
FROM vuelos 
WHERE descuento is NULL
  and hasta = 'Nueva York'
  and llegada ;