
/*
Seleccionar el vuelo más largo (con mayor duración)
de cada día de la semana. Debe aparecer el nombre 
del aeropuerto de salida, el de llegada, la fecha y
hora de salida y llegada y la duración.
*/
select v1.desde, v1.hasta, v1.salida, v1.llegada,
	age(v1.llegada, v1.salida) "duracion",
	extract (isodow from v1.salida) "dia_seman
	a"
from vuelos v1
where age (llegada, salida) >= all (
	select age(v2.llegada,v2.salida)
	from vuelos v2
	where extract (isodow from v1.salida) = 
		  extract (isodow from v2.salida)
)