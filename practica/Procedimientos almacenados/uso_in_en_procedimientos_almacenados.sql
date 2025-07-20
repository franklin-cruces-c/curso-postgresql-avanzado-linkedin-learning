/*
 * En los procedimientos almacenados los parametros 
 * por defecto(cuando se omite como en isbn_libro) son de tipo IN
 * Este procedimiento almacenado crea un libro en la tabla libros
 */
CREATE OR REPLACE PROCEDURE ingresar_libro(IN titulo_libro CHARACTER VARYING, IN fecha_publicacion_libro date, isbn_libro integer)
LANGUAGE SQL 
AS $$
     INSERT INTO libro (titulo, fecha_publicacion,isbn)
     VALUES(titulo_libro,fecha_publicacion_libro,isbn_libro);
$$;

SELECT * FROM libro WHERE isbn = 45678;
CALL ingresar_libro('Cocina Italiana','2019-03-05',45678);
SELECT * FROM libro WHERE isbn = 45678;

