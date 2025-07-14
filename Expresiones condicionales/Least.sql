 
/*
 * ordenar por nombre o apellido segun este primero en el orden
 */
select
      nombre,
      apellido,
      least(nombre,apellido) as order_nombre
from usuario
order by order_nombre
