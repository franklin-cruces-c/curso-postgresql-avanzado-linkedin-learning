/*
 * Disparador antes o despues de actualizar en postgresql 
 * validar el email del usuario antes de ser actualizado
 */

CREATE OR REPLACE FUNCTION actualizar_email_usuario() 
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  valido BOOLEAN;
BEGIN 
    valido := NEW.email ILIKE '%@%.%';
    IF valido THEN
       RETURN NEW;
    ELSE 
       RETURN OLD;
    END IF;
END;
$$;

CREATE TRIGGER actualizar_email_usuario_trigger BEFORE UPDATE ON usuario
FOR EACH ROW EXECUTE PROCEDURE actualizar_email_usuario();

SELECT * FROM usuario WHERE id = 1;

UPDATE usuario
SET email = 'test@'
WHERE id=1;

SELECT * FROM usuario WHERE id = 1;

UPDATE usuario
SET email = 'test@test.com'
WHERE id=1;

SELECT * FROM usuario WHERE id = 1;

UPDATE usuario
SET email = 'katlynnhyatt@test.com'
WHERE id=1;

SELECT * FROM usuario WHERE id = 1;


/*
 * Actualizar libro clasico despues de actualizar libro
 */
CREATE OR REPLACE FUNCTION actualizar_libro_clasico() 
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN     
    UPDATE libro_clasico
    SET titulo = NEW.titulo,
        fecha_publicacion = NEW.fecha_publicacion
    WHERE libro_id = OLD.id;
    RETURN NEW;
END;
$$;

CREATE TRIGGER actualizar_libro_clasico_trigger AFTER UPDATE ON libro
FOR EACH ROW EXECUTE PROCEDURE actualizar_libro_clasico();

SELECT * FROM libro WHERE id = 18;
SELECT * FROM libro_clasico WHERE libro_id = 18;

UPDATE libro
SET titulo = 'Comienzo con nuevo libro hoy'
WHERE id=18;

SELECT * FROM libro WHERE id = 18;
SELECT * FROM libro_clasico WHERE libro_id = 18;
