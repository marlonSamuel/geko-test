

--A Escriba la consulta en SQL que devuelva el nombre del proyecto y sus productos correspondientes del proyecto Premia cuyo c�digo es 1
SELECT P.NOMBRE, PPP.DESCRIPCION AS 'NOMBRE PRODUCTO' 
FROM PROYECTO P 
INNER JOIN PRODUCTO_PROYECTO PP ON P.COD_PROYECTO = PP.COD_PROYECTO
INNER JOIN PRODUCTO PPP ON PP.COD_PRODUCTO = PPP.COD_PRODUCTO
WHERE P.COD_PROYECTO = 1;

--B Escriba una consulta SQL que devuelva los distintos mensajes que hay, indicando a qu� proyecto y producto pertenecen.

SELECT M.COD_FORMATO, F.NOMBRE AS 'FORMATO MENSAJE', M.COD_MENSAJE,  PPP.NOMBRE AS 'NOMBRE PROYECTO', P.DESCRIPCION AS 'NOMBRE PRODUCTO'FROM MENSAJE M
INNER JOIN PRODUCTO_PROYECTO PP ON M.COD_PRODUCTO_PROYECTO = PP.COD_PRODUCTO_PROYECTO
INNER JOIN PRODUCTO P ON PP.COD_PRODUCTO = P.COD_PRODUCTO
INNER JOIN PROYECTO PPP ON PP.COD_PROYECTO = PPP.COD_PROYECTO
INNER JOIN FORMATO_MENSAJE F ON M.COD_FORMATO = F.COD_FORMATO

/*
Escriba una consulta SQL que devuelva los distintos mensajes que hay, indicando a qu� proyecto y producto pertenecen. Pero si el mensaje est� en todos los productos de un 
proyecto, en lugar de mostrar cada producto, debe mostrar el nombre del proyecto y un solo producto que diga �TODOS�.
*/

SELECT DISTINCT PROY.NOMBRE,
CASE
    WHEN SUBP.TOTAL_PROD >= (SELECT COUNT(*) FROM PRODUCTO) THEN 'TODOS'
    ELSE PRO.DESCRIPCION
END AS PRODUCTO
FROM (
SELECT pro.COD_PROYECTO, me.COD_FORMATO, count(DISTINCT pro.COD_PRODUCTO) as TOTAL_PROD from PRODUCTO_PROYECTO pro
inner join MENSAJE me on me.COD_PRODUCTO_PROYECTO = pro.COD_PRODUCTO_PROYECTO
group by pro.COD_PROYECTO, me.COD_FORMATO) AS SUBP
INNER JOIN PRODUCTO_PROYECTO PROP ON SUBP.COD_PROYECTO = PROP.COD_PROYECTO
INNER JOIN PRODUCTO PRO ON PROP.COD_PRODUCTO = PRO.COD_PRODUCTO
INNER JOIN PROYECTO PROY ON PROY.COD_PROYECTO = PROP.COD_PROYECTO

