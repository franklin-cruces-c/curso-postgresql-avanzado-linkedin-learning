/*
 * Insertar datos JSON en postgresql 
 * Desde la version 9.2 PostgreSQL admite JSON como dato nativo
 * Existen 2 tipos de datos JSON y JSONB
 * JSON es mas rapido de insertar pero mas lento al procesar
 * JSONB es mas lento de insertar y mas rapido de procesar. Se almacena en Binario. 
 * Tambien acepta indexacion.
 *
 * 
 * Traer libros que no se encuentran en la biblioteca (generar una orden de pedido)
 */
CREATE TABLE orden
(
  id SERIAL NOT NULL,
  informacion JSONB NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO orden (informacion)
VALUES ('{"nombre":"Nancy Monge","telefono":"(123) 4254-2345","email":"nancymonge@test.com","libros":[{"titulo":"Cocina oriental","autor":"Luis Ruiz"},{"titulo":"Datos orientales más recientes","autor":"Juan Herrera"}]}');


