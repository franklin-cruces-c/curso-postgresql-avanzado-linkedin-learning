/*
 * Insertar datos XML en postgresql 
 */

CREATE TABLE comentario 
(
   id serial NOT NULL,
   detalle XML NOT NULL,
   PRIMARY KEY (id)
);
/*
 <?xml version="1.0"?>
<comentario>
    <libro>Creacion de aviones modernos</libro>
    <comentario>Excelente libro</comentario>
    <usuario>
        <nombre>Tanmail</nombre>
        <apellido>Patil</apellido>
        <email>tanmailpatil@test.com</email>
        </usuario>
</comentario>
 */
INSERT INTO comentario(detalle)
VALUES ('<?xml version="1.0"?>
<comentario>
    <libro>Creacion de aviones modernos</libro>
    <comentario>Excelente libro</comentario>
    <usuario>
        <nombre>Tanmail</nombre>
        <apellido>Patil</apellido>
        <email>tanmailpatil@test.com</email>
        </usuario>
</comentario>');

SELECT * FROM comentario ORDER BY 1;
