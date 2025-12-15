SELECT fecha, estacion, provincia, temperatura_maxima
FROM climatologia ORDER BY temperatura_maxima DESC;

--Si seleccionas un texto puedes ejecutar únicamente ese. (este es un comentario de una línea)
/*

Así se pone un comentario de varias líneas.

*/

SELECT *
FROM climatologia;

SELECT estacion, provincia, temperatura_maxima, fecha
FROM climatologia order by estacion;

-- DISTINCT es para que no se repita los valores seleccionados, en caso de ser una pareja lo que no se puede repetir es dicha pareja.
SELECT DISTINCT estacion
from climatologia;

--Desde el SELECT hasta el ; es una sentencia y cada una de las líneas es una sentencia
/*Clausula*/SELECT DISTINCT provincia, estacion
/*Clausula*/FROM climatologia 
/*Clausula*/ORDER BY provincia DESC, estacion ASC;

SELECT DISTINCT provincia, estacion, temperatura_maxima
FROM climatologia 
WHERE temperatura_maxima <= 10
ORDER BY temperatura_maxima DESC;

