/*
 * Modificar datos JSON en postgresql 
 */

SELECT id,informacion FROM orden;

UPDATE orden
SET informacion = JSONB_SET(informacion,'{nombre}','"Nancy Monge Rojas"')
WHERE id = 1;

--Agregar un dato más
UPDATE orden
SET informacion = JSONB_SET(informacion, '{direccion}', '"Alajuela, Costa Rica"')
WHERE id = 3;

--Actualizar el titulo de un libro (elemento del array)
UPDATE orden
SET informacion = JSONB_SET(informacion, '{libros,0,titulo}','"Creacion de aviones modernos"')
WHERE id = 2;

