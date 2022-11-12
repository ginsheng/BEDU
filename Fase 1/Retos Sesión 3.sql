#Reto 1

 /**
   * Usando la base de datos tienda, escribe consultas que permitan responder
	 * las siguientes preguntas.
  **/
	 USE tienda;

-- ¿Cuál es el nombre de los empleados que realizaron cada venta?
    SELECT
		e.nombre `empleado`,
        v.*
		FROM
			empleado e
		JOIN
			venta v ON v.id_empleado = e.id_empleado;

-- ¿Cuál es el nombre de los artículos que se han vendido?
    SELECT
		a.nombre `Artículo`,
        v.*
		FROM
			articulo a
		JOIN
			venta v ON v.id_articulo = a.id_articulo;
-- ¿Cuál es el total de cada venta?
    SELECT
		v.*,
        CONCAT('$', FORMAT(a.precio + a.iva, 2)) `Total`
		FROM
			venta v
		JOIN
			articulo a ON a.id_articulo = v.id_articulo;

# Reto 2

/**
  * Usando la base de datos tienda, define las siguientes vistas que permitan
	* obtener la siguiente información.
  * AÑADE A TODOS LOS NOMBRES DE TUS VISTAS EL SUFIJO _<tu identificador>.
	* Por ejemplo mi_vista_hermosa_144
 **/

	USE tienda;

-- Obtener el puesto de un empleado.
	CREATE VIEW vista_empleados_144 AS
		SELECT
			p.nombre `Puesto`,
			e.nombre `Empleado`
		FROM
			empleado e
		INNER JOIN
			puesto p ON e.id_puesto = p.id_puesto
		ORDER BY `Puesto`, `Empleado`;
-- Saber qué artículos ha vendido cada empleado.
	CREATE VIEW vista_articulos_por_empleado_144 AS
		SELECT
			DISTINCT e.nombre `Empleado`,
						a.nombre `Artículo`
		FROM
			empleado e
		INNER JOIN
			venta v ON v.id_empleado = e.id_empleado
		INNER JOIN
			articulo a ON a.id_articulo = v.id_articulo
		ORDER BY `Empleado`, `Artículo`;
-- Saber qué puesto ha tenido más ventas.
	CREATE VIEW vista_ventas_por_puesto_144 AS
		SELECT
			p.nombre `Puesto`,
			COUNT(id_venta) `Ventas`
		FROM
			venta v
		INNER JOIN
			empleado e ON v.id_empleado = e.id_empleado
		INNER JOIN
			puesto p ON p.id_puesto = e.id_puesto
		GROUP BY
			`Puesto`
		ORDER BY
			`Ventas` DESC
		LIMIT 1;
