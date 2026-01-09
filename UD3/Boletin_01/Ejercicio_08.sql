-- 1.
SELECT *,
       ROUND(PRECIO * (1 - COALESCE(DESCUENTO, 0) / 100.0), 2) AS precio_final,
       ROUND(PRECIO * (COALESCE(DESCUENTO, 0) / 100.0), 2) AS ahorro
FROM VUELOS
WHERE SALIDA::TEXT like '2019-12%'
  AND DESDE IN ('Sevilla', 'Málaga')
  AND HASTA IN ('Madrid', 'Barcelona')
  AND PRECIO >= 80;


-- 2.
SELECT ID, 
       DESDE, 
       HASTA, 
       PRECIO,
       UPPER(LEFT(DESDE, 3)) || '-' || UPPER(LEFT(HASTA, 3)) || '-' || RIGHT('0000' || CAST(ID AS TEXT), 4) AS codigo_ruta
FROM VUELOS
WHERE EXTRACT(YEAR FROM SALIDA) = 2020
  AND DESDE IN ('Madrid', 'Barcelona')
  AND HASTA IN ('París', 'Londres')
  AND (DESCUENTO IS NULL OR DESCUENTO = 0);


-- 3.
SELECT *,
       CASE 
           WHEN DESCUENTO IS NULL OR DESCUENTO = 0 THEN 'SIN_DESCUENTO'
           WHEN DESCUENTO >= 30 THEN 'DESCUENTO_ALTO'
           ELSE 'DESCUENTO_BAJO'
       END AS tipo_descuento,
       ROUND(PRECIO * (1 - COALESCE(DESCUENTO, 0) / 100.0), 2) AS precio_final
FROM VUELOS
WHERE SALIDA >= '2020-03-01' AND SALIDA < '2020-04-01'
  AND (DESDE IN ('Londres', 'París') OR HASTA IN ('Sevilla', 'Málaga'))
  AND PRECIO BETWEEN 60 AND 300
  AND ((DESCUENTO IS NOT NULL AND DESCUENTO > 0) OR PRECIO > 200);

-- 4.

SELECT COUNT(*) AS numero_total_vuelos,
       MAX(PRECIO) AS precio_maximo,
       MIN(PRECIO) AS precio_minimo,
       ROUND(AVG(PRECIO), 2) AS precio_medio,
       -- AVG de descuento considerando nulos como 0
       AVG(COALESCE(DESCUENTO, 0)) AS descuento_medio
FROM VUELOS
WHERE EXTRACT(YEAR FROM SALIDA) = 2020
  AND DESDE IN ('Madrid', 'Barcelona', 'Sevilla', 'Málaga')
  AND PRECIO BETWEEN 60 AND 500
  AND DESDE != HASTA;


-- 5.
SELECT ID, 
       DESDE, 
       HASTA, 
       PRECIO,
       UPPER(TRIM(DESDE)) AS origen_limpio,
       UPPER(TRIM(HASTA)) AS destino_limpio,
       ROUND(PRECIO, -1) AS precio_redondeado,
       ABS(PRECIO - ROUND(PRECIO, -1)) AS diferencia_absoluta
FROM VUELOS
WHERE EXTRACT(YEAR FROM SALIDA) = 2019
  AND (HASTA LIKE 'B%' OR HASTA LIKE 'Á%')
  AND COALESCE(DESCUENTO, 0) >= 10
  AND PRECIO < 200;


---------------------------------------------------
  select *,
  Coalesce(round(precio-(precio*descuento/100),2), precio) as Precio_Final,
Coalesce(round((precio*descuento/100),2), 0) as Ahorro
from vuelos
where salida::text like '2019-12%'
   and desde in('Sevilla', 'Málaga')
   and hasta in('Madrid', 'Barcelona')
   and precio >=80;


select id, desde, hasta, precio,
lower(upper(left(desde, 3)) || '-' || upper(left(hasta, 3)) || '-' || right('0000' || cast(id as text), 4)) as codigo_ruta
from vuelos
where salida::text like '2020%'
  and desde in ('Madrid', 'Barcelona')
  and hasta in ('París', 'Londres')
  and (descuento is null);


select *,
       case
           when descuento is null or descuento = 0 then 'sin_descuento'
           when descuento >= 30 then 'descuento_alto'
           else 'descuento_bajo'
       end as tipo_descuento,
       round(precio * (1 - coalesce(descuento, 0) / 100.0), 2) as precio_final
from vuelos
where salida::text like '2020-03%'
  and (desde in ('Londres', 'París') or hasta in ('Sevilla', 'Málaga'))
  and precio between 60 and 300
  and ((descuento > 0) or (precio > 200));



select count(*) as total_vuelos,
       max(precio) as precio_maximo,
       min(precio) as precio_minimo,
       round(avg(precio), 2) as precio_medio,
       avg(coalesce(descuento, 0)) as descuento_medio
from vuelos
where salida::text like '2020%'
  and desde in ('Madrid', 'Barcelona', 'Sevilla', 'Málaga')
  and precio between 60 and 500
  and desde != hasta;



select id, desde, hasta, precio,
       upper(trim(desde)) as origen_limpio,
       upper(trim(hasta)) as destino_limpio,
       round(precio, -1) as precio_redondeado,
       abs(precio - round(precio, -1)) as diferencia_absoluta
from vuelos
where salida::text like '2019%'
  and (hasta like 'B%' or hasta like 'Á%')
  and coalesce(descuento, 0) >= 10
  and precio < 200;