/*
 * Ciclo For en PostgreSQL
 * Procedimiento almacenado que calcula el factorial de un numero
 */


CREATE OR REPLACE
PROCEDURE factorial(IN numero integer DEFAULT 1,INOUT resultado integer DEFAULT 1)
 LANGUAGE plpgsql
AS $$
  DECLARE
     _contador INTEGER := 0;
  BEGIN
    FOR _contador IN 1.. numero
      LOOP       
         resultado := resultado * _contador;
      END LOOP;
  END;
$$;
CALL factorial(1);
CALL factorial(2);
CALL factorial(3);
CALL factorial(5);
CALL factorial(10);




