/*
 * Ciclo While en PostgreSQL
 * Procedimiento almacenado que calcula la sumatoria de los numeros desde 1 hasta el numero
 */


CREATE OR REPLACE
PROCEDURE sumatoria(IN numero integer DEFAULT 1,INOUT resultado integer DEFAULT 0)
 LANGUAGE plpgsql
AS $$
  DECLARE
     _contador INTEGER := 0;
  BEGIN
    WHILE _contador <= numero
    LOOP       
       resultado := resultado + _contador;
       _contador := _contador + 1;
    END LOOP;
  END;
$$;
CALL sumatoria(1);
CALL sumatoria(2);
CALL sumatoria(3);
CALL sumatoria(5);
CALL sumatoria(10);




