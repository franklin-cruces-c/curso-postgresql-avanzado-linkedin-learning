
/*
 * Setencia libros prestados despues del 1 de marzo de 2020
 * Listado de usuarios morosos
 */
select * from libro l
where l.id in(
select pd.libro_id from prestamo p
left join prestamo_detalle pd on p.id = pd.prestamo_id
where date(p.fecha_salida) > date('2020-03-01')
)
order by 1

/*
 * Listado de libros que no se han prestado despues del 1 de marzo de 2020
 */
select * from libro l
where l.id not in(
select pd.libro_id from prestamo p
left join prestamo_detalle pd on p.id = pd.prestamo_id
where date(p.fecha_salida) > date('2020-03-01')
)
order by 1
