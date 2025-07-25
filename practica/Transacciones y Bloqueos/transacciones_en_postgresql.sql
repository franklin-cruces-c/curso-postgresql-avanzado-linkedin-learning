/*
 * Transacciones en postgresql 
 */
--ACID
--A -> Atomicidad -> Todo o nada
--C -> Consistencia -> Cambios coherentes -> Cambios Validos y sigue reglas predefinidas
--I -> Isolated(Aislamiento-Aislada) -> Determina como la integridad de la transaccion es visible para otras transacciones
--D -> Durabilidad -> Las transacciones que se han comprometido se almacenaran de forma permanente

-- Actualizar con trasacciones la fecha en las tablas libro y libro_clasico a 1967-06-05 para el id=3


SELECT * FROM 
libro WHERE id = 3;
SELECT * FROM 
libro_clasico WHERE libro_id = 3;
-- con error se hace rollback - libro_clasico no tiene id, tiene libro_id
BEGIN;
 UPDATE libro
 SET fecha_publicacion = '1967-06-05'
 WHERE id = 3;
	
 UPDATE libro_clasico
 SET fecha_publicacion = '1967-06-05'
 WHERE id = 3;

COMMIT;
END

SELECT * FROM 
libro WHERE id = 3;
SELECT * FROM 
libro_clasico WHERE libro_id = 3;

-- Se actualiza con trasaccion
BEGIN;
 UPDATE libro
 SET fecha_publicacion = '1967-06-05'
 WHERE id = 3;
	
 UPDATE libro_clasico
 SET fecha_publicacion = '1967-06-05'
 WHERE libro_id = 3;

COMMIT;
END

SELECT * FROM 
libro WHERE id = 3;
SELECT * FROM 
libro_clasico WHERE libro_id = 3;
