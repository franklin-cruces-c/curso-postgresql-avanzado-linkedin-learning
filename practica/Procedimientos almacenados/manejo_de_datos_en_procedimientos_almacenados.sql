/*
 * Procedimientos almacenados ingresar, actualizar 
 * y eliminar libro
 */


-- DROP PROCEDURE actualizar_libro(integer,varchar, date, int4);

CREATE OR REPLACE PROCEDURE actualizar_libro(IN id_libro integer,IN titulo_libro character varying, IN fecha_publicacion_libro date, IN isbn_libro integer)
 LANGUAGE sql
AS $procedure$
     UPDATE libro 
     SET titulo=titulo_libro,
         fecha_publicacion=fecha_publicacion_libro,
         isbn=isbn_libro
     WHERE id=id_libro;
$procedure$;

-- DROP PROCEDURE eliminar_libro(integer);

CREATE OR REPLACE PROCEDURE eliminar_libro(IN id_libro integer)
 LANGUAGE sql
AS $procedure$
     DELETE FROM libro 
     WHERE id=id_libro;
$procedure$;


SELECT * FROM libro WHERE titulo iLIKE '%cocina%italiana%';
CALL ingresar_libro('Cocina Italiana','2019-03-05',45678);
SELECT * FROM libro WHERE titulo iLIKE '%cocina%italiana%';
CALL actualizar_libro(17,'Cocina Italiana volumen 2','2019-10-01',45679);
SELECT * FROM libro WHERE titulo iLIKE '%cocina%italiana%';
CALL eliminar_libro(17);
SELECT * FROM libro WHERE titulo iLIKE '%cocina%italiana%';


