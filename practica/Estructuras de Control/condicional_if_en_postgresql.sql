/*
 * Condicional IF en PostgreSQL
 */


CREATE OR REPLACE
PROCEDURE populaidad_libro(IN id_libro integer DEFAULT 1, INOUT mensaje text DEFAULT null)
 LANGUAGE plpgsql
AS $procedure$
  DECLARE
     num_ejemplares INTEGER := 0;
  BEGIN
     SELECT SUM(ejemplares)
     INTO num_ejemplares
     FROM prestamo_detalle
     WHERE libro_id=id_libro
     GROUP BY libro_id;

     IF num_ejemplares <= 5 THEN
        mensaje := 'Poco popular';
     ELSEIF num_ejemplares <= 20 THEN
        mensaje := 'Medio popular';
     ELSEIF num_ejemplares > 20 THEN
        mensaje := 'Muy popular';
     ELSE
        mensaje := 'N/A';
     END IF;
  END;
$procedure$;

CALL populaidad_libro(1);
CALL populaidad_libro(11);
CALL populaidad_libro(6);

