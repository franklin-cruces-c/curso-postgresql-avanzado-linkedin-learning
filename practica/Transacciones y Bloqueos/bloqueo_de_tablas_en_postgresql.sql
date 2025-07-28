/*
 * Bloqueo de tablas en postgresql 
 * Se pueden bloquear tablas o filas de una tabla para garantizar que
 * solo la transaccion actual es la única que realiza modificaciones
 */


SELECT * FROM 
autor a ORDER BY id;

BEGIN;
LOCK TABLE autor IN ACCESS EXCLUSIVE MODE;

INSERT INTO autor(nombre, apellido) 
VALUES('Oscar','Mora');

SELECT * FROM 
autor a ORDER BY id;

-- Ejecutar esto en otra ventana antes y despues de hacer el COMMIT en esta ventana
SELECT * FROM 
autor a ORDER BY id;

-- COMMIT
COMMIT;
