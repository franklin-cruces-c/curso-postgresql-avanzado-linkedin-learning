/*
 * Ciclo Foreach en PostgreSQL
 * Procedimiento almacenado suma los elementos de un array numerico y devuelve el resultado
 */


CREATE OR REPLACE
PROCEDURE suma_array(IN elementos NUMERIC[],INOUT resultado integer DEFAULT 0)
 LANGUAGE plpgsql
AS $$
  DECLARE
     _elemento INTEGER := 0;
  BEGIN
    FOREACH _elemento IN ARRAY elementos
      LOOP       
         resultado := resultado + _elemento;         
      END LOOP;
  END;
$$;
CALL suma_array(ARRAY[1,7,8,9,10,20]);
CALL suma_array(ARRAY[1,2,3,4]);





