
/*
--3
(INMO) Selecciona el nombre del comprador, el nombre del vendedor,
la provincia y la fecha de operación de las viviendas (casa y piso)
alquiladas en el tercer trimestre de año en las provincias de 
Huelva, Sevilla y Almería. Ordena la salida por fecha de operación descendentemente.
*/
select
	c.nombre,
	v.nombre,
	i.provincia,
	o.fecha_operacion
from
	comprador c
	join operacion o using (id_cliente)
	join vendedor v using (id_vendedor)
	join inmueble i using (id_inmueble)
	join tipo t on (t.id_tipo = i.tipo_inmueble)
where
	t.nombre in ('Casa', 'Piso')
	and to_char(o.fecha_operacion, 'MM') in ('12', '11', '10')
	and i.provincia in ('Huelva', 'Sevilla', 'Almería')
order by
	o.fecha_operacion desc;
/*
--4
(INMO) Modifica la consulta anterior para que las viviendas
que fueran vendidas en un plazo de entre 35 y 45
días desde que se dieron de alta en la inmobiliaria.

*/
select
	c.nombre,
	v.nombre,
	i.provincia,
	o.fecha_operacion
from
	comprador c
	join operacion o using (id_cliente)
	join vendedor v using (id_vendedor)
	join inmueble i using (id_inmueble)
	join tipo t on (t.id_tipo = i.tipo_inmueble)
where
	t.nombre in ('Casa', 'Piso')
	and age (o.fecha_operacion, i.fecha_alta) between '35' and '45'
	and i.provincia in ('Huelva', 'Sevilla', 'Almería')
order by
	o.fecha_operacion desc;
/*
--5
 (INMO) Calcula el precio máximo y precio mínimo por metro 
 cuadrado de venta de inmuebles que no sean viviendas 
 (no sean Piso o Casa) en provincias que contengan una 
 (mayúscula o minúscula), siempre que los inmuebles se 
 hayan vendido en un mes que escrito de forma completa 
 en inglés tenga entre 5 y 7 caracteres.
*/
select
	max(precio / superficie) as max_m2,
	min(precio / superficie) as min_m2
from
	inmueble i
	join tipo t on (t.id_tipo = i.tipo_inmueble)
	join operacion o using (id_inmueble)
where
	t.nombre in (
		'Industrial',
		'Local',
		'Oficina',
		'Parking',
		'Suelo'
	)
	and i.provincia ilike '%n%'
	and length(trim(to_char(o.fecha_operacion, 'Month'))) between 5 and 7;

-- 6

select
	round(avg(descuento), 2)
from
	vuelo v
	join aeropuerto a_desde on (v.desde = a_desde.id_aeropuerto)
	join aeropuerto a_hasta on (v.hasta = a_hasta.id_aeropuerto)
where
	a_desde.ciudad in (
		'Sevilla',
		'Madrid',
		'Málaga',
		'Barcelona',
		'Bilbao'
	)
	and a_hasta.ciudad in (
		'Sevilla',
		'Madrid',
		'Málaga',
		'Barcelona',
		'Bilbao'
	)
	and extract(
		isodow
		from
			salida
	) between 6 and 7
	or (
		(
			extract(
				isodow
				from
					salida
			) = 5
			and cast(v.salida as time) >= '15:00'
		)
	);