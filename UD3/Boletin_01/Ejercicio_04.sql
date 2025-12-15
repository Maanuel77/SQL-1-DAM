
--Apartado 1 (Me da problema no sé porque)

/*
Select hombres, provincia, anio
from demografia_basica
where anio between (2002, 2003)
and provincia In ('Cáceres', 'Badajoz');
*/

--Apartado 2

Select * 
from demografia_basica
where hombres >= 600000 or mujeres >= 600000
ORDER BY provincia desc, anio desc;

--Apartado 3

Select * 
from demografia_basica
where hombres + mujeres >= 600000
and (anio > 2019 - 5)
ORDER BY (hombres + mujeres) desc;

--Apartado 4

Select provincia, rango_edad, numero_habitantes
from demografia_avanzada
where sexo ilike '%M%'
and (edad_menor >= 20 and edad_mayor <= 29)
order by numero_habitantes asc;

--Apartado 5


