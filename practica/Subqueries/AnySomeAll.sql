 
/*
 * libros que han sido prestados mas de 20 veces
 *
 */
select * from libro
where id = ANY(
               select libro_id
               from prestamo_detalle pd
               group by libro_id
               having sum(ejemplares) > 20
)
order by 1


/*
 * libros que han sido prestados mas de 20 veces
 *
 */
select * from libro
where id = SOME(
               select libro_id
               from prestamo_detalle pd
               group by libro_id
               having sum(ejemplares) > 20
)
order by 1


/*
 * Lista de los usuarios que tienen morosidad mayor al promedio de morosidad
 */
select p.id,p.usuario_id , u.nombre, u.apellido,
       avg(date_part('day',now()::timestamp-p.fecha_devolucion::timestamp)) as promedio_dias_morosidad
from prestamo p
left join usuario u on p.usuario_id = u.id
group by p.id,p.usuario_id , u.nombre, u.apellido
having avg(date_part('day',now()::timestamp-p.fecha_devolucion::timestamp))> all
 (
    select avg(date_part('day',now()::timestamp-p.fecha_devolucion::timestamp))
    from prestamo p
    left join prestamo_detalle pd on p.id = pd.prestamo_id
    where not pd.devuelto
    group by p.usuario_id
 )
