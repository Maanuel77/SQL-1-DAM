/*
Selecciona cuál ha sido el porcentaje de hombres en las provincias de 
Extremadura (Cáceres y Badajoz) 
entre los años 2000 y 2010 (demografía_básica). Debe aparecer el 
año, el nombre de la provincia, el número 
de hombres, el % de hombres, y la población total de la provincia.
Ordena la salida por año, ascendentemente; y por número de hombres, 
descendentemente.
*/

-- 1

SELECT provincia, anio, hombres, 
	ROUND((hombres::numeric/(hombres+mujeres))*100,2) AS porcentaje_hombres,
	(hombres + mujeres) AS poblacion_total
	
From demografia_basica
	where (anio between 2000 and 2010)
	and provincia IN ('Cáceres', 'Badajoz')
	order by anio asc, hombres desc;

/*
Modifica (copia y pega) la consulta anterior para mostrar el 
promedio del % de hombres (que cumpla la condición de la 
consulta anterior). 
*/

-- 2

Select AVG((hombres::numeric/(hombres+mujeres))*100) as porcentaje_hombres
from demografia_basica
where anio between 2000 and 2010


