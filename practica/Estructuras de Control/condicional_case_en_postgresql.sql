/*
 * Condicional CASE en PostgreSQL
 * Procedimiento almacenado que calcula los dias por mora
 * de prestamos de libros en la biblioteca.
 * Si dias de mora son 50 o menos se pagan 2 dolares
 * Si los dias son mas de 50 y menos o igual a 100 se pagan 2.5 dolares
 * Si los dias son mas de 100 y menos o igual a 200 se paga 3 dolares
 * y si son mas de 200 dias paga 4 dolares
 * Si no tiene mora se debe indicar que el pago es 0 
 * Los montos son por dia con lo cual se debe 
 * pagar ese valor por cada dia de mora
 */


CREATE OR REPLACE
PROCEDURE pago_morosidad(IN id_prestamo integer DEFAULT 1, INOUT monto numeric DEFAULT 0)
 LANGUAGE plpgsql
AS $$
  DECLARE
     _dias_mora INTEGER := 0;
     _correccion_fecha_paso_del_tiempo NUMERIC := 0;
  BEGIN
     --tiempo a restar por paso del tiempo con respecto a la base de datos
     SELECT DATE_PART('day',now()-max(fecha_devolucion::timestamp)) 
     INTO _correccion_fecha_paso_del_tiempo 
     FROM prestamo;
     --Calculo dias de mora
     SELECT DATE_PART('day', now() - p.fecha_devolucion) -_correccion_fecha_paso_del_tiempo
        INTO _dias_mora
     FROM prestamo p
     LEFT JOIN prestamo_detalle pd ON p.id = pd.prestamo_id
     WHERE NOT pd.devuelto AND p.id = id_prestamo
     GROUP BY p.id;
RAISE NOTICE '%',coalesce(_dias_mora,0);
     CASE
         WHEN _dias_mora > 0 AND _dias_mora <= 50 THEN monto = _dias_mora * 2;
         WHEN _dias_mora > 50 AND _dias_mora <= 100 THEN monto = _dias_mora * 2.5;
         WHEN _dias_mora > 100 AND _dias_mora <= 200 THEN monto = _dias_mora * 3;
         WHEN _dias_mora > 200 THEN monto = _dias_mora * 4;
     ELSE 
         monto = 0;
     END CASE;

  END;
$$;
CALL pago_morosidad(1);
CALL pago_morosidad(7);
CALL pago_morosidad(13);
CALL pago_morosidad(14);
CALL pago_morosidad(27);
CALL pago_morosidad(35);


