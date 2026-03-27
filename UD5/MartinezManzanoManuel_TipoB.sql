-- ejercicio 1
select p.nombre, p.pvp, c.nombre as categoria
from producto p
join categoria c on p.id_categoria = c.id
where p.pvp < (
    select avg(p2.pvp)
    from producto p2
    where p2.id_categoria = p.id_categoria
)
order by c.nombre asc, p.pvp asc;

-- ejercicio 2
select id_cliente, count(id) as total_ventas
from venta
group by id_cliente
having count(id) > (
    select avg(ventas_por_cliente)
    from (
        select count(id) as ventas_por_cliente
        from venta
        group by id_cliente
    ) as subconsulta
)
order by total_ventas desc;

-- ejercicio 3
select c.nombre, count(p.id) as total_productos
from categoria c
join producto p on c.id = p.id_categoria
group by c.nombre
having count(p.id) > 5
order by c.nombre asc;

-- ejercicio 4
select distinct nombre
from producto
where id in (
    select id_producto
    from lineaventa
    where id_venta in (
        select id
        from venta
        where id_cliente in (
            select id
            from cliente
            where lower(nombre) = 'juan'
        )
    )
);

-- ejercicio 5
with totales_ventas as (
    select id_venta, sum(cantidad * precio_unitario * (1 - coalesce(descuento, 0))) as importe_total
    from lineaventa
    group by id_venta
)
select id_venta, importe_total
from totales_ventas
where importe_total < (
    select avg(importe_total)
    from totales_ventas
);