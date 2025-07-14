/*
 * fecha mas reciente entre fecha de devolucion y fecha devuelto
 */
select
      p.id,
      p.usuario_id,
      pd.libro_id,
      greatest(p.fecha_devolucion ,pd.fecha_devuelto) fecha_mas_reciente
from prestamo p
left join prestamo_detalle pd on p.id  = pd.prestamo_id
