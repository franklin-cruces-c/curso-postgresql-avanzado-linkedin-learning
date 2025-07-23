/*
 * Renombrar, eliminar y modificar funciones en PostgreSQL
 */

ALTER FUNCTION informacion_usuario(integer)
RENAME TO informacion_personal_usuario;

SELECT * FROM informacion_personal_usuario(1);

DROP FUNCTION IF EXISTS informacion_personal_usuario(integer);

CREATE OR REPLACE FUNCTION informacion_personal_usuario(id_usuario integer DEFAULT 1)
 RETURNS TABLE(_nombre character varying, _apellido character varying, 
               _email character varying, _telefono character VARYING,
               _direccion text)
 LANGUAGE plpgsql
AS $$
BEGIN 
	RETURN QUERY
    SELECT nombre,apellido,email,telefono,direccion
    FROM usuario
    WHERE id= id_usuario;
END;
$$
SELECT * FROM informacion_personal_usuario(1);