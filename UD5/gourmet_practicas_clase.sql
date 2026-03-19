

select id_venta, sum(cantidad) as Cantidad_total
from lineaventa
where id_venta < 20
group by id_venta
order by Cantidad_total asc;

adadadaadadselect id_cliente, sum (cantidad)
from lineaventa lv join venta v using(id);

select * 
from cliente;

select apellidos, nombre, id, pvp
from cliente join venta usin
group by id;

select *
from venta;

select id_cliente, sum(precio_total)
from venta 
where extract (month from fecha) = 3
group by id_cliente
order by sum desc;

/*
El where filtra antes de agrupar, por lo que antes se ha podido hacer, primero cogía todos los datos de marzo y después lo agrupaba,
sin embargo, en el siguiente ejemplo no se podrá realizar de esta manera ya que en este caso está filtrando datos ya agrupados y 
no se pueden modificar dichos datos, en vez de usar WHERE ahora vamos a usar HAVING.
*/

-- Clientes con mas de 10 pedidos

select id_cliente, sum(precio_total)
  from venta 
	group by id_cliente
	having count (*) > 10
order by sum desc;

-- Clientes con mas de 5 pedidos en el primer semestre del año

select id_cliente, sum(precio_total)
  from venta 
	where extract (month from fecha) <= 6
  group by id_cliente
  having count (*) > 5
order by sum desc;



