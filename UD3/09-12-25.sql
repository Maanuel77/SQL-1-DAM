select *,
	round((mujeres ::numeric /
		(hombres+mujeres)) * 100, 2) as "Porcentaje de mujeres",
		
	round ((hombres::numeric /
	(hombres + mujeres))* 100, 2) as "Porcentaje de hombres",
	
	mujeres + hombres as "Total"
from demografia_basica
order by "Porcentaje de mujeres" desc;
