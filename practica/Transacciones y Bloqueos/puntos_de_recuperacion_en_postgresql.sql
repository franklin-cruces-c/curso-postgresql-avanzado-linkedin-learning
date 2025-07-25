/*
 * Puntos de recuperacion en postgresql 
 * se establece un punto de guardado
 * el cual permite revertir los cambios hasta el punto en que se guardó
 */


BEGIN;

DELETE FROM usuario
WHERE id=20;

SAVEPOINT eliminar_usuario;

DELETE FROM usuario
WHERE id=21;

SELECT * FROM usuario ORDER BY id;

ROLLBACK TO SAVEPOINT eliminar_usuario;

COMMIT;

SELECT * FROM usuario ORDER BY id;

--Recupero de forma manual el usuario 20, que no fue recuperado por rollback savepoint
INSERT INTO public.usuario(id,nombre, apellido, telefono, email, direccion)VALUES (20,'George', 'Weissnat', '(123) 6599-8313', 'georgeweissnat@test.com', 'Berlin, Alemania');

SELECT * FROM usuario ORDER BY id;
