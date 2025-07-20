/*
 * Actualizar y eliminar procedimientos almacenados 
 */
ALTER PROCEDURE actualizar_email_usuario(integer, varchar)
RENAME TO actualizar_usuario;

DROP PROCEDURE actualizar_usuario(int4, varchar);

CREATE OR REPLACE PROCEDURE actualizar_usuario(IN usuario_id integer, IN nuevo_email character VARYING, IN nuevo_telefono CHARACTER varying)
 LANGUAGE SQL 
 AS $BODY$
   UPDATE usuario 
   SET email = nuevo_email,
       telefono = nuevo_telefono 
   WHERE id = usuario_id;
$BODY$;

DROP PROCEDURE actualizar_usuario(int4, varchar);
SELECT * FROM usuario u WHERE ID = 1;
CALL actualizar_usuario(1, 'nuevoemail@test.com','(123) 1234-1234');
SELECT * FROM usuario u WHERE ID = 1;
CALL actualizar_usuario(1, 'katlynnhyatt@test.com','(123) 6567-9242');
SELECT * FROM usuario u WHERE ID = 1;

