/*
 * Actualizar vistas en postgresql 
 */
CREATE OR REPLACE VIEW informacion_prestamo AS
SELECT p.id,
       u.nombre,
       u.apellido,
       l.titulo,
       p.fecha_salida,
       p.fecha_devolucion,
       CASE pd.devuelto
       WHEN TRUE THEN 'SI'
       WHEN FALSE THEN 'NO'
       END devuelto
FROM prestamo p
LEFT JOIN prestamo_detalle pd ON pd.prestamo_id = p.id 
LEFT JOIN usuario u ON p.usuario_id  = u.id
LEFT JOIN libro l ON pd.libro_id = l.id; 

 
SELECT * FROM informacion_prestamo;

/*
 * Eliminar vistas en postgresql 
 */
CREATE OR REPLACE VIEW informacion_total_prestamo AS
SELECT p.id,
       u.nombre,
       u.apellido,
       l.titulo,
       p.fecha_salida,
       p.fecha_devolucion,
       CASE pd.devuelto
       WHEN TRUE THEN 'SI'
       WHEN FALSE THEN 'NO'
       END devuelto,
       CASE WHEN pd.mora ISNULL THEN 0
       ELSE  pd.mora
       END mora
FROM prestamo p
LEFT JOIN prestamo_detalle pd ON pd.prestamo_id = p.id 
LEFT JOIN usuario u ON p.usuario_id  = u.id
LEFT JOIN libro l ON pd.libro_id = l.id; 

SELECT * FROM informacion_total_prestamo;

DROP VIEW informacion_total_prestamo;
