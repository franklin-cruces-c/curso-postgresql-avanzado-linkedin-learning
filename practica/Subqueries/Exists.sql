 /*
 * Setencia exists
 * Listado de usuarios morosos
 */
select * from usuario u
where exists(
select 1 from prestamo p
left join prestamo_detalle pd on p.id = pd.prestamo_id
where not pd.devuelto
      and u.id = p.usuario_id
)
order by 1

/*
 * Listado de usuarios no morosos
 */
select * from usuario u
where not exists(
select 1 from prestamo p
left join prestamo_detalle pd on p.id = pd.prestamo_id
where not pd.devuelto
      and u.id = p.usuario_id
)
order by 1
