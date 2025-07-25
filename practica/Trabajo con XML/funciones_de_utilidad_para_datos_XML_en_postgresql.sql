/*
 * Funciones de utilidad para datos XML en postgresql 
 */
-- Funcion XMLCONCAT
SELECT XMLCONCAT(detalle, '<biblioteca>Central</biblioteca>') 
FROM comentario c 
WHERE id = 1;	

-- Funcion XMLPARSE
SELECT XMLPARSE(CONTENT detalle::text)
FROM comentario c; 

SELECT XMLPARSE(DOCUMENT detalle::text)
FROM comentario c; 

-- Funcion XMLROOT
SELECT XMLROOT(XMLPARSE(DOCUMENT detalle::text),VERSION '1.0',STANDALONE YES)
FROM comentario c;

-- Funcion XMLAGG -> AGRUPA TODOS LOS REGISTROS EN UN SOLO DOCUMENTO
SELECT XMLAGG(detalle ORDER BY id DESC) 
FROM comentario c;

--Funcion ISDOCUMENT -> DEVUELVE VERDADERO SI ES UN DOCUMENTO XML ADECUADO
SELECT 	detalle IS DOCUMENT
FROM comentario c;

--Funcion XML_IS_WELL_FORMED -> DEVUELVE VERDADERO SI ES UNA CADENA DE TEXTO ES
-- UN DOCUMENTO XML BIEN FORMADO
SELECT 	XML_IS_WELL_FORMED(c.detalle::TEXT)
FROM comentario c;

--Funcion XPATH
SELECT XPATH('//usuario/email',detalle)
FROM comentario c;

SELECT XPATH('//usuario/email',detalle)::TEXT
FROM comentario c;

--Funcion XPATH_EXISTS -> devuelve verdadero si existe el path
SELECT XPATH_EXISTS('//usuario/email',detalle)
FROM comentario c;

