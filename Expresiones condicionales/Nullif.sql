 
/*
 * por ejemplo si la direccion1 esta vacia, y la direccion2 tambien entonces se muestra direccion no informada
 * COALESCE(NULLIF(TRIM(direccion1),''), NULLIF(TRIM(direccion2),''), 'Sin direccion informada')
 */
select
      id,
      nombre,apellido, coalesce(nullif(trim(direccion),''),'Direccion no informada') direccion
from usuario
