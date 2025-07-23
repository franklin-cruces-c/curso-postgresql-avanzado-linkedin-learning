/*
 * Cursores en las funciones en PostgreSQL
 * En PostgreSQL, un cursor es una construcción de programación 
 * que te permite procesar un conjunto de resultados de una 
 * consulta (un SELECT) fila por fila, en lugar de 
 * procesar todo el conjunto de resultados de una vez.
 * La utilidad principal de un cursor radica en su capacidad 
 * para manejar grandes conjuntos de resultados de forma 
 * eficiente y controlada, especialmente cuando no puedes 
 * o no quieres cargar todas las filas en la memoria de 
 * una sola vez.
 * 
 * Funcion que muestra en el log de postgresql 
 * los titulos de libro
 */


CREATE OR REPLACE
FUNCTION titulo_libro()
RETURNS VOID
LANGUAGE plpgsql
AS $$
  DECLARE
     _registro RECORD;
     _cursor_libro CURSOR for SELECT titulo FROM libro ORDER BY titulo;
  BEGIN
     OPEN _cursor_libro;
     FETCH _cursor_libro INTO _registro;

     WHILE FOUND
         LOOP
           RAISE NOTICE 'Procesando libro %',_registro;
           FETCH _cursor_libro INTO _registro;
         END LOOP;
     CLOSE _cursor_libro;
     RETURN;
  END;
$$;

SELECT titulo_libro();
