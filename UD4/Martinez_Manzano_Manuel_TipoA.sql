--Ver tablas

select *
from comprador

select *
from inmueble

select *
from vendedor

select * 
from tipo

select *
from operacion

-- 1
select c.nombre, fecha_operacion
from inmueble i
	join operacion o using (id_inmueble)
	join comprador c using (id_cliente)
	join tipo t ON t.id_tipo = i.tipo_inmueble
where provincia in ('Sevilla', 'Córdoba', 'Jaén')
  and t.nombre = 'Piso'
  and i.superficie < 100
  and (extract (month from fecha_operacion) = 09
  	   or extract (month from fecha_operacion) = 10);

-- 2
select avg (o.precio_final)
from inmueble i
	join operacion o using (id_inmueble)
	join tipo t ON t.id_tipo = i.tipo_inmueble
where provincia in ('Jaén', 'Granada');

-- 3
select c.nombre
from inmueble i
	join operacion o using (id_inmueble)
	join comprador c using (id_cliente);


-- 4
select c.nombre
from inmueble i
	join operacion o using (id_inmueble);
	

-- 5

select c.nombre, fecha_operacion, t.nombre
from inmueble i
	join operacion o using (id_inmueble)
	join comprador c using (id_cliente)
	join tipo t ON t.id_tipo = i.tipo_inmueble
	join vendedor v using (id_vendedor);
