/*
 * Eventos en postgresql 
 * Event triggers permite generar disparadores basados en los comandos DDL
 * Muy util para hacer auditorias
 */
CREATE TABLE auditoria_logs(fecha TIMESTAMP, evento TEXT);



CREATE OR REPLACE FUNCTION logs_eventos() 
RETURNS EVENT_TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN     
    INSERT INTO auditoria_logs(fecha,evento)
    VALUES(NOW(),TG_TAG);
END;
$$;

CREATE EVENT TRIGGER event_trigger_logs ON  DDL_COMMAND_START 
EXECUTE PROCEDURE logs_eventos();

SELECT * FROM auditoria_logs;

CREATE TABLE editorial(
    id SERIAL NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    PRIMARY KEY (id)
);

SELECT * FROM auditoria_logs;


/*
 * Ejemplo mas completo , se ejecuta despues de que un comando DDL ha finalizado
 */
-- 1. Crear una tabla para almacenar los registros de auditoría
CREATE TABLE ddl_audit_log (
    log_id              SERIAL PRIMARY KEY,
    event_time          TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    event_type          TEXT,
    schema_name         TEXT,
    object_type         TEXT,
    object_identity     TEXT,
    command_tag         TEXT,
    original_command    TEXT,
    current_user_name   TEXT,
    session_user_name   TEXT,
    client_ip           INET,
    application_name    TEXT,
    backend_pid         INTEGER
);
-- 2. Crear una función para el EVENT TRIGGER
CREATE OR REPLACE FUNCTION log_ddl_commands()
RETURNS EVENT_TRIGGER AS $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN SELECT * FROM pg_event_trigger_ddl_commands() LOOP
        INSERT INTO ddl_audit_log (
            event_type,
            schema_name,
            object_type,
            object_identity,
            command_tag,
            original_command,
            current_user_name,
            session_user_name,
            client_ip,
            application_name,
            backend_pid
        ) VALUES (
            TG_EVENT,
            r.schema_name,
            r.object_type,
            r.object_identity,
            r.command_tag,
            current_query(),--r.command::TEXT,
            CURRENT_USER,
            SESSION_USER,
            inet_client_addr(),
            current_setting('application_name', true),
            pg_backend_pid()
        );
    END LOOP;
END;
$$ LANGUAGE plpgsql;
-- 3. Crear el EVENT TRIGGER
-- Este trigger se activará después de que un comando DDL se haya ejecutado.
CREATE EVENT TRIGGER ddl_audit_trigger
ON ddl_command_end
EXECUTE FUNCTION log_ddl_commands();

--DROP TABLE IF EXISTS editorial_test;
CREATE TABLE editorial_test(
    id SERIAL NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    PRIMARY KEY (id)
);

SELECT * FROM ddl_audit_log;
