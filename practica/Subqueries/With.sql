 
/*
 * La clausula with es muy util cuando la subconsulta se ejecuta muchas veces,
 * incluso es mejor que usar las tablas temporales.
 * Ayuda a dividir consultas grandes y complicadas en formas mas simples y legibles.
 * Se crean tablas temporales que existen para una sola consulta
 */

with libros_prestados as(
	select
	      libro_id,
	      sum(ejemplares) total_prestamos
	from prestamo_detalle
	group by libro_id
	order by 1
)
select l.id,
       l.titulo,
       lp.total_prestamos
from libro l
left join libros_prestados lp on lp.libro_id = l.id;
