/*
--3
(INMO) Selecciona el nombre del comprador, el nombre del vendedor,
la provincia y la fecha de operación de las viviendas (casa y piso)
alquiladas en el tercer trimestre de año en las provincias de 
Huelva, Sevilla y Almería. Ordena la salida por fecha de operación descendentemente.
*/

select comprador.nombre, vendedor.nombre, 
from comprador join operacion using (id_cliente)
			   join vendedor using (id_vendedor)
			   join inmueble using (id_inmueble)
where inmueble.provincia in ('Huelva')