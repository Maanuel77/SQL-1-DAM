/*

== EJERCICIO 2 ==

*/

-- APARTADO 1 
/*

Seleccionar el FIRST_NAME y LAST_NAME de los empleados del departamento
de IT o Finance cuya fecha de alta (HIRE_DATE) fuera un día cualquiera 
de Abril o Junio.

*/

select estacion, fecha, precipitacion_total
from climatologia 
where 
-- fecha between make_date (2019,4,1)
-- and make_date (2019,4,30)
to_char (fecha, 'MM/YYYY') = '04/2019';
extract (from month )
and provincia = 'Sevilla'

------------------------------------------------------------------------------------

select * 
from climatologia
where provincia in ('Cuenca', 'Guadalajara', 'Toledo', 'Albacete', 'Ciudad Real')
and fecha BETWEEN make_date (2019,3,21)