# Reto 1
	/**
	 Usando la base de datos tienda, muestra la descripción de las tablas
	 articulo, puesto y venta
	 */
		USE tienda;

    DESCRIBE articulo;
    DESCRIBE puesto;
    DESCRIBE venta;

# Reto 2
	/**
	 Usando la base de datos cursos (solo encontré el schema «tienda»), escribe
	 consultas que permitan responder las siguientes preguntas.
	 */
		USE tienda;
		--    ¿Cuál es el nombre de los empleados con el puesto 4?
		SELECT
			nombre
		FROM
			empleado
		WHERE id_puesto = 4; -- Norrie, Maxy
		--    ¿Qué puestos tienen un salario mayor a $10,000?
		SELECT
			nombre
		FROM
			puesto
		WHERE salario > 10000; -- [mil puestos]
		--    ¿Qué artículos tienen un precio mayor a $1,000 y un iva mayor a 100?
		SELECT
			nombre
		FROM
			articulo
		WHERE precio > 1000 AND iva > 100; -- [787 artículos]
		--    ¿Qué ventas incluyen los artículos 135 o 963 y fueron hechas por los
		-- empleados 835 o 369?
		SELECT
			id_venta
		FROM
			venta
		WHERE id_articulo IN (135, 963) AND id_empleado IN (835, 369); -- Ventas con
		 -- los id: 7 y 6

# Reto 3
	-- Usando la base de datos tienda, escribe una consulta que permita obtener el
	-- top 5 de puestos por salarios.
    USE tienda;
    SELECT
			nombre, salario
		FROM
			puesto
		ORDER BY salario DESC LIMIT 5;
