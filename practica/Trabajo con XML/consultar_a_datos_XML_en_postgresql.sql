/*
 * Consultar a datos XML en postgresql 
 */

SELECT * FROM comentario ORDER BY 1;

insert into comentario (detalle) values ('<?xml version="1.0"?>
<comentario>
    <libro>Descubre el maravilloso mundo de las flores</libro>
    <comentario>Muy interesante</comentario>
    <usuario>
        <nombre>Manuel</nombre>
        <apellido>Walsh</apellido>
        <email>manuelwalsh@test.com</email>
    </usuario>
</comentario>');


insert into comentario (detalle) values ('<?xml version="1.0"?>
<comentario>
    <libro>Aprende un nuevo deporte en 21 días</libro>
    <comentario>Es muy práctico</comentario>
    <usuario>
        <nombre>George</nombre>
        <apellido>Weissnat</apellido>
        <email>georgeweissnat@test.com</email>
    </usuario>
</comentario>');

SELECT detalle FROM comentario;
-- el usuario
SELECT unnest(xpath('//usuario',detalle)) AS usuario
FROM comentario c 
WHERE c.id =3;

-- el nombre
SELECT unnest(xpath('//usuario/nombre',detalle)) AS nombre
FROM comentario c 
WHERE c.id =3;

-- libro
SELECT unnest(xpath('//libro',detalle)) AS libro
FROM comentario c 
WHERE c.id =3;