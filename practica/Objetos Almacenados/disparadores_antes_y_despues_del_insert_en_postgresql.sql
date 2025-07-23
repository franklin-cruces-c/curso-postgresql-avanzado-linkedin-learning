/*
 * Disparador antes y despues de insertar en postgresql 
 * Primer trigger coloca en capital(la inicial en mayuscula y la demas en minuscula)
 *  el nombre y apellido aunque vengan en minuscula o mayusculas
 */

CREATE OR REPLACE FUNCTION before_insertar_autor() 
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN 
	NEW.nombre := INITCAP(NEW.nombre);
    NEW.apellido := INITCAP(NEW.apellido);
    RETURN NEW;
END;
$$;

CREATE TRIGGER insertar_autor_trigger BEFORE INSERT ON autor
FOR EACH ROW EXECUTE PROCEDURE before_insertar_autor();

INSERT INTO autor(nombre,apellido)
VALUES('juan','rojas');

SELECT * FROM autor WHERE nombre ILIKE 'juan'

-- DESPUES DEL INSERT
/*
 * Si se inserta un nuevo libro que la fecha de publicacion
 * sea menor a 1970 se va a insertar en la tabla libro clasico
 */
CREATE OR REPLACE FUNCTION insertar_libro_clasico() 
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN 
    IF NEW.fecha_publicacion < '1970-01-01' THEN
      INSERT INTO libro_clasico(libro_id,titulo,fecha_publicacion)
      VALUES(NEW.id, NEW.titulo, NEW.fecha_publicacion);
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER insertar_libro_clasico_trigger AFTER INSERT ON libro
FOR EACH ROW EXECUTE PROCEDURE insertar_libro_clasico();

INSERT INTO libro(titulo,fecha_publicacion,isbn)
VALUES('Comienza un nuevo libro','1960-03-20',34213);

SELECT * FROM libro_clasico l WHERE titulo ILIKE 'Comienza%';
