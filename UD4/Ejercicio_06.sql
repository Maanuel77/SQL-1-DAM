
--1

select *
from inmueble
join operacion 
where provincia like 'Sevilla'
  and to_char (fecha_alta, 'YYYY') = '2023'
 order by precio
 limit 3;

--2

select *
from inmueble join operacion using (id_inmueble)
where extract (month from fecha_operacion) in (7,8)
  and provincia = 'Málaga'
  and tipo_operacion = 'Alquiler';


--3

select *
from inmueble join operacion using (id_inmueble)
where provincia in ('Jaén', 'Córdoba')
  and to_char(fecha_operacion, 'Q') = '4'
  and extract(year from fecha_operacion)
  			in (2022,2023);

--4

select round (avg (precio_final), 2)
 from inmueble join operacion using (id_inmueble)
		join tipo on (tipo_inmueble = id_tipo)
where provincia = 'Huelva'
  and tipo.nombre = 'Parking'
  and extract (isodow from fecha_operacion)
  			between 1 and 5;


 --5

 select *
 from inmueble join operacion using (id_inmueble)
 		join tipo on ( tipo_inmueble = id_tipo)
where provincia = 'Granada'
  and tipo.nombre = 'Piso'
  and tipo_operacion = 'Venta'
  and age(fecha_operacion, fecha_alta)
		between interval '3 months' and 
				interval '6 months';

select age(CURRENT_DATE, make_date(2007,2,7));

--20 septiembre cumpleaños luismi