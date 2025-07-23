/*
 * Funciones de utilidad para datos JSON en postgresql 
 */

SELECT id,informacion FROM orden;

-- Extraer conjunto de JSON a pares clave valor (se convierte a JSON porque está en JSONB)
SELECT * 
FROM JSON_EACH(
                (
                  SELECT TO_JSON(informacion)
                  FROM orden
                  WHERE id = 1
                )
               );
-- JSONB
SELECT * 
FROM JSONB_EACH(
                (
                  SELECT informacion
                  FROM orden
                  WHERE id = 1
                )
               );

-- Devolver en formato texto
SELECT * 
FROM JSONB_EACH_TEXT(
                (
                  SELECT informacion
                  FROM orden
                  WHERE id = 1
                )
               );

SELECT jsonb_extract_path(informacion, 'libros') FROM orden;
--Devolver en formato texto
SELECT jsonb_extract_path_text(informacion, 'libros') FROM orden;

-- Tamaños de los arrays que se encuentren dentro del JSON
SELECT jsonb_array_length(informacion->'libros') FROM orden;




