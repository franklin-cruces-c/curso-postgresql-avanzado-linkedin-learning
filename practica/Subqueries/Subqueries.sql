 
/*
 * prestamos cuya mora sea mayor al promedio
 */
select
      prestamo_id,
      libro_id,
      ejemplares,
      mora
from prestamo_detalle
where mora > (select avg(mora) from prestamo_detalle)
