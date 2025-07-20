/*
 * Parametros VARIADIC en los procedimientos almacenados 
 * En los procedimientos almacenados los parametros VARIADIC
 * permiten tener una lista variable de parametros de un mismo tipo de datos.
 * Este procedimiento almacenado encuentra el valor maximo de una lista
 * variable de valores enviandos
 */
CREATE OR REPLACE PROCEDURE maximo_valor(INOUT _valor integer DEFAULT NULL, VARIADIC arr integer[] DEFAULT null)
LANGUAGE plpgsql AS 
$$
  begin
   	--select max($2[i]) from generate_subscripts($2,1) g(i) into _valor;
    select max(_lista_variable) from unnest(arr) as _lista_variable into _valor;
  end
$$;
CALL maximo_valor(0,VARIADIC ARRAY[10,-2,5,8,9])
CALL maximo_valor(null,3,7,8,11,9,-15);


