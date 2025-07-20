/*
 * Parametros INOUT en los procedimientos almacenados 
 * En los procedimientos almacenados los parametros INOUT
 * permiten tener un valor previamente asignado el cual puede
 * ser modificado dentro del procedimiento almacenado
 * y una vez ejecutado quedan con el valor asignado dentro del procedimiento.
 * Este procedimiento almacenado busca en la tabla libros el titulo de un libro
 * utilizando parte del titulo
 */
CREATE OR REPLACE PROCEDURE buscar_libro_titulo(INOUT _valor TEXT DEFAULT null)
LANGUAGE plpgsql AS 
$$
  begin
   	select titulo from libro where titulo like _valor into _valor;
  end
$$;

CALL buscar_libro_titulo('%Cocina%');


