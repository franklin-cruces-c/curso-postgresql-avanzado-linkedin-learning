/*
 * Crear vistas en postgresql 
 */
CREATE OR REPLACE VIEW informacion_prestamo AS
SELECT p.id,
       u.nombre,
       u.apellido,
       l.titulo,
       p.fecha_salida,
       p.fecha_devolucion
FROM prestamo p
LEFT JOIN prestamo_detalle pd ON pd.prestamo_id = p.id 
LEFT JOIN usuario u ON p.usuario_id  = u.id
LEFT JOIN libro l ON pd.libro_id = l.id; 

 
SELECT * FROM informacion_prestamo;
