/*
 * Modificar datos XML en postgresql 
 */
SELECT detalle FROM comentario c 
WHERE c.id = 1;
-- Actualizar el nombre del usuario con la funcion XML y replace
UPDATE comentario c 
SET detalle = XML(REPLACE(detalle::text,'Tanmay','Tammy'))
WHERE id = 1;

SELECT detalle FROM comentario c 
WHERE c.id = 1;

-- Actualizar el email modificando directamente todo el xml
SELECT detalle FROM comentario c 
WHERE c.id = 3;

UPDATE comentario c 
SET detalle  = '<?xml version="1.0"?>
<comentario>
    <libro>Aprende un nuevo deporte en 21 días</libro>
    <comentario>Es muy práctico</comentario>
    <usuario>
        <nombre>George</nombre>
        <apellido>Weissnat</apellido>
        <email>newemail@test.com</email>
    </usuario>
</comentario>'
WHERE id = 3;

SELECT detalle FROM comentario c 
WHERE c.id = 3;

--rollback
UPDATE comentario c 
SET detalle  = '<?xml version="1.0"?>
<comentario>
    <libro>Aprende un nuevo deporte en 21 días</libro>
    <comentario>Es muy práctico</comentario>
    <usuario>
        <nombre>George</nombre>
        <apellido>Weissnat</apellido>
        <email>georgeweissnat@test.com</email>
    </usuario>
</comentario>'
WHERE id = 3;

SELECT detalle FROM comentario c 
WHERE c.id = 3;
