/**
Se deben tener en cuenta reglas de negocio
¿se aceptan devoluciones parciales en cada prestamo es decir devolver unos libros y otros despues?
¿solo se aceptan todos los libros o ninguno en cada prestamo al hacer la devolucion?
¿se aceptan devoluciones parciales pero sigue quedando en mora si aun no se devuelven todos los libros?
**/
Select
      p.id,
	  p.usuario_id,
	  pd.libro_id,
	  Date_part('day', now()::timestamp - pd.fecha_devuelto::timestamp) as dias_morosidad,
	  case
	    when Date_part('day', now()::timestamp - pd.fecha_devuelto::timestamp) <= 50 then'Morosidad baja'
		when Date_part('day', now()::timestamp - pd.fecha_devuelto::timestamp) <= 120 then'Morosidad media'
		when Date_part('day', now()::timestamp - pd.fecha_devuelto::timestamp) > 120 then'Morosidad alta'
       end nivel_morosidad
from prestamo p
left join prestamo_detalle pd on p.id = pd.prestamo_id
where not pd.devuelto
