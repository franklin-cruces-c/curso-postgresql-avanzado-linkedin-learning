/*
 * Consultar a datos JSON en postgresql 
 */
INSERT 	INTO orden (informacion)
VALUES ('{"nombre":"Juan Rojas","telefono":"(123) 3444-5667","email":"juanrojas@test.com","libros":[{"titulo":"Creación de aviones","autor":"Alina Castaño"}]}');

INSERT 	INTO orden (informacion)
VALUES ('{"nombre":"Luis Vargas","telefono":"(123) 2345-7540","email":"luisvargas@test.com","libros":[{"titulo":"Cocina oriental","autor":"Jose Carlos Castello"}]}');

--Extraer el nombre
SELECT informacion->'nombre' nombre FROM orden;--formato JSONB
SELECT informacion->>'nombre' nombre FROM orden;--formato TEXT

--Extraer los libros
SELECT informacion->'libros' libros FROM orden;
SELECT informacion->'libros'->0 libros FROM orden;--primer elemento del array
SELECT informacion->'libros'->0->'titulo' libros FROM orden;--solo el titulo del primer elemento del array (JSONB)
SELECT informacion->'libros'->0->>'titulo' libros FROM orden;--solo el titulo del primer elemento del array (TEXT)



