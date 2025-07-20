/*
 * Ciclo Loop en PostgreSQL
 * Procedimiento almacenado que calcula la potencia de un numero
 */


CREATE OR REPLACE
PROCEDURE potencia(IN base integer DEFAULT 1, IN exponente integer DEFAULT 1,INOUT resultado integer DEFAULT 1)
 LANGUAGE plpgsql
AS $$
  DECLARE
     _contador INTEGER := 0;
  BEGIN
    LOOP
       IF _contador = exponente THEN
          EXIT;
       END IF;
       _contador := _contador + 1;
       resultado := resultado * base;
    END LOOP;
  END;
$$;
CALL potencia(2,2);
CALL potencia(2,3);
CALL potencia(4,2);
CALL potencia(3,2);
CALL potencia(3,3);



