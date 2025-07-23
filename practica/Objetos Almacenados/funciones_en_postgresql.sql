/*
 * Funciones en PostgreSQL
 * Funcion que devuelve el total de usuarios
 */


CREATE OR REPLACE
FUNCTION total_usuarios()
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
  DECLARE
     _total INTEGER := 0;
  BEGIN
    SELECT COUNT(0)INTO _total
    FROM  usuario;
    RETURN _total;
  END;
$$;

SELECT total_usuarios();

/*
 * Funcion que devuelve una tabla con nombre,apellido y telefono
 */
DROP FUNCTION IF EXISTS informacion_usuario(integer);
CREATE OR REPLACE FUNCTION informacion_usuario(id_usuario INTEGER DEFAULT 1)
RETURNS TABLE (_nombre VARCHAR,_apellido VARCHAR,_email VARCHAR, _telefono VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN 
	RETURN QUERY
    SELECT nombre,apellido,email,telefono
    FROM usuario
    WHERE id= id_usuario;
END;
$$;

SELECT * FROM informacion_usuario(1);
