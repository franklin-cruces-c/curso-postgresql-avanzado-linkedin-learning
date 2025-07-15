/*
 * Los procedimientos almacenados no devuelven ningun resultado a diferencia
 * de las funciones.
 * A partir de postgreSQL 11 se incorporan procedimientos almacenados
 * permitiendo el manejo de transacciones, a diferencia de las funciones en
 * las cuales se emula este comportamiento con bloques BEGIN EXCEPTION
 */

CREATE OR REPLACE PROCEDURE actualizar_email_usuario(usuario_id integer, nuevo_email character varying)
LANGUAGE SQL
AS $$
UPDATE usuario SET email = nuevo_email WHERE id = usuario_id;
$$;


SELECT * FROM usuario WHERE id = 1;
CALL actualizar_email_usuario(1,'test@test.com');
SELECT * FROM usuario WHERE id = 1;
CALL actualizar_email_usuario(1,'katlynnhyatt@test.com');
SELECT * FROM usuario WHERE id = 1;
