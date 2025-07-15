/*
 * Los libros clasicos que son los que la fecha de publicacion es anterior
 * al 1 de enero de 1970
 */

DROP TABLE IF EXISTS libro_clasico;

CREATE TABLE libro_clasico (
    libro_id int4 NOT NULL,
    titulo varchar(80) NOT NULL,
    fecha_publicacion date NULL,
    CONSTRAINT libro_clasico_pkey PRIMARY KEY (libro_id),
    CONSTRAINT libro_clasico_libro_fk FOREIGN KEY (libro_id) REFERENCES public.libro(id) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO libro_clasico(libro_id,titulo,fecha_publicacion)
SELECT id, titulo, fecha_publicacion
FROM libro
WHERE fecha_publicacion < '1970-01-01'
ORDER BY 1;
