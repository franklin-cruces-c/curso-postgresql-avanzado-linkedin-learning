/*
 * Manejo de excepciones
 */

-- DROP PROCEDURE ingresar_libro_id(integer, varchar, date, int4);

CREATE OR REPLACE
PROCEDURE ingresar_libro_id(IN id_libro integer, IN titulo_libro CHARACTER VARYING, IN fecha_publicacion_libro date, IN isbn_libro integer)
 LANGUAGE plpgsql
AS $procedure$
  BEGIN
     INSERT INTO libro (id,titulo,	fecha_publicacion,	isbn)
     VALUES(id_libro,titulo_libro, fecha_publicacion_libro, isbn_libro);
  END;
$procedure$;

--CALL ingresar_libro_id(1,'Desarrollo Profesional','2017-04-20',98765);
/*
 * SQL Error [23505]: ERROR: duplicate key value violates unique constraint "libro_pkey"
  Detail: Key (id)=(1) already exists.
  Where: SQL statement "INSERT INTO libro (id,titulo,	fecha_publicacion,	isbn)
     VALUES(id_libro,titulo_libro, fecha_publicacion_libro, isbn_libro)"
PL/pgSQL function ingresar_libro_id(integer,character varying,date,integer) line 3 at SQL statement
 */

CREATE OR REPLACE
PROCEDURE ingresar_libro_id(IN id_libro integer, IN titulo_libro CHARACTER VARYING, IN fecha_publicacion_libro date, IN isbn_libro integer)
 LANGUAGE plpgsql
AS $procedure$
  BEGIN
     INSERT INTO libro (id,titulo,	fecha_publicacion,	isbn)
     VALUES(id_libro,titulo_libro, fecha_publicacion_libro, isbn_libro);
     EXCEPTION
         WHEN sqlstate '23505' THEN
              RAISE EXCEPTION 'El libro con el id % ya existe!',id_libro;
  END;
$procedure$;

CALL ingresar_libro_id(1,'Desarrollo Profesional','2017-04-20',98765);
/**
 * SQL Error [P0001]: ERROR: El libro con el id 1 ya existe!
  Where: PL/pgSQL function ingresar_libro_id(integer,character varying,date,integer) line 7 at RAISE 
 /
