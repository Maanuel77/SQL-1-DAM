

/*
EXAMEN SQL UD3
*/

-- Ver tabla
Select *
from climatologia;

--EJERCICIO 1

select
	round(avg(racha_viento), 2) as media_racha_viento
from
	climatologia
where
	provincia in ('A Coruña', 'Pontevedra', 'Ourense', 'Lugo')
	and fecha::text like '2019-05%'
	and racha_viento >= 50;

-- EJERCICIO 2

select
	*,
	round((temperatura_maxima + temperatura_minima) / 2, 2) as temperatura_media
from
	climatologia
where
	(
		estacion ilike '%á%'
		or estacion ilike '%é%'
		or estacion ilike '%í%'
		or estacion ilike '%ó%'
		or estacion ilike '%ú%'
	)
	and fecha::text like '2019-01%'
	order by estacion asc;

--EJERCICIO 3

select
	*
from
	climatologia
where
	right(estacion, 2) = 'ón'
	and (precipitacion_total between 10 and 20)
	and (
		temperatura_minima < 10
		and (
			fecha::text like '2019-03%'
			or fecha::text like '2019-02%'
		)
	);
/*CASE
	WHEN 30 < temperatura_maxima and temperatura_maxima < 35 then 'Caluroso'
	WHEN 35 <= temperatura_maxima and temperatura_maxima < 38 then 'Muy caluroso'
	WHEN 38 <= temperatura_maxima 'Extremadamente caluroso'
	END
	*/
-- EJERCICIO 4

select
	estacion,
	provincia,
	fecha,
	temperatura_maxima,
	case
		when temperatura_maxima > 30
		and temperatura_maxima < 35 then 'Caluroso'
		when temperatura_maxima <= 35
		and temperatura_maxima < 38 then 'Muy caluroso'
		when temperatura_maxima >= 38 then 'Extremadamente caluroso'
	end
from
	climatologia
where
	temperatura_maxima > 30
	and hora_temperatura_maxima = '17:00'
	and (
		fecha::text like '2019-06%'
		or fecha::text like '2019-07%'
		or fecha::text like '2019-08%'
	)
order by
	temperatura_maxima desc;

--EJERCICIO 5

select
	provincia,
	estacion,
	fecha,
	velocidad_maxima_viento,
	racha_viento,
	round(
		(
			(racha_viento - velocidad_maxima_viento) / (racha_viento + 0.00001)
		) * 100,
		2
	) as "porcentaje_superior_racha"
from
	climatologia
where
	round(
		(
			(racha_viento - velocidad_maxima_viento) / (racha_viento + 0.00001)
		) * 100,
		2
	) between 20 and 40
order by
	provincia asc,
	estacion asc,
	fecha desc;