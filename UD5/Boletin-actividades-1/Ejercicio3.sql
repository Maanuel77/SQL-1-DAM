-- Selecciona los clientes que han comprado casas en Almería, siendo el precio final mayor que el precio medio de las casas vendidas en Almería.

Select nombre
from comprador join operacion using (id_cliente)
	 		   join inmueble using (id_inmueble)
where provincia = 'Almería'
  and tipo_operacion = 'Venta'
  and precio_final > any (
	select avg (precio_final)
	from operacion
  )
