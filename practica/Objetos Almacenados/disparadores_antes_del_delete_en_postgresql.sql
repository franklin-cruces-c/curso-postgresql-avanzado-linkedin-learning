/*
 * Disparador antes o despues de eliminar en postgresql 
 * Eliminar libro clasico antes de eliminar libro
 */
--cambiamos CASCADE por RESTRICT en la llave foranea de libro_clasico
--(borrando y volviendo a crear la llave foranea)
ALTER TABLE libro_clasico DROP CONSTRAINT libro_clasico_libro_fk;

ALTER TABLE libro_clasico ADD CONSTRAINT libro_clasico_libro_fk 
FOREIGN KEY (libro_id) REFERENCES libro(id) ON UPDATE RESTRICT ON DELETE RESTRICT;

-- Esta instruccion genera error porque se modificó la llave foranea a restrict
DELETE FROM libro
WHERE id=18;


SELECT * FROM libro WHERE id = 18;
SELECT * FROM libro_clasico WHERE libro_id = 18;

CREATE OR REPLACE FUNCTION eliminar_libro_clasico() 
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN     
    DELETE FROM libro_clasico
    WHERE libro_id = OLD.id;
    RETURN OLD;
END;
$$;

CREATE TRIGGER eliminar_libro_clasico_trigger BEFORE DELETE ON libro
FOR EACH ROW EXECUTE PROCEDURE eliminar_libro_clasico();

SELECT * FROM libro WHERE id = 18;
SELECT * FROM libro_clasico WHERE libro_id = 18;

DELETE FROM libro
WHERE id=18;

SELECT * FROM libro WHERE id = 18;
SELECT * FROM libro_clasico WHERE libro_id = 18;
