SELECT *
FROM climatologia
where temperatura_maxima between 10 and 20 
	and provincia = 'Sevilla'
ORDER BY temperatura_maxima ASC;

Select *
from climatologia 
where temperatura_maxima between 10 and 20
	or temperatura_minima between 

select fecha, estacion, provincia, temperatura_maxima
from climatologia;

/*
COMENTARIO
*/
--COMENTARIO

SELECT estacion, provincia
from climatologia
order by estacion;



select distinct provincia, estacion
from climatologia
order by provincia desc, estacion asc;



select *
from climatologia
where temperatura_maxima <10 and provincia = 'Granada'
order by temperatura_maxima desc;



select *
from climatologia
where temperatura_maxima BETWEEN 10 and 20 and provincia = 'Sevilla';



select *
from climatologia
where (temperatura_maxima BETWEEN 10 and 20
   or temperatura_minima BETWEEN 5 and 10)
  and provincia = 'Jaén';
  /*Poner and y or implica que vas a tener que usar paréntesis ya que el and manda más que el or*/



select *
from climatologia
/*where provincia='Cáceres' or provincia='Badajoz';*/
where provincia IN ('Cáceres', 'Badajoz');



select *
from climatologia
where provincia ilike 'jaén';



select *
from climatologia
where provincia like 'A%' or provincia like 'Á%';



select *
from climatologia
where EST like 'A%' or provincia like 'Á%';
