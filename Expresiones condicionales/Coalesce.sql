 
/*
 * En esta query tambien se puede obtener el mismo resultado utilizando case en lugar de coalesce,
 * y tienen el mismo rendimiento, con coalesce es mas facil de leer la consulta.
 */
select
      prestamo_id,
      libro_id,
      coalesce(mora,0) mora
from prestamo_detalle
