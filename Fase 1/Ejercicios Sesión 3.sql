/**
  * Todos los ejercicios debes hacerlos usando la base classicmodels.
  * Todas las consultas que realices deberás mantenerlas dentro del editor de
	* textos de MySQL Workbench.
  * Al finalizar, guarda este archivo, llendo al menú File > Save script.
  * Recuerda añadir a todos los nombres te tus vistas el sufijo con tu
	* identificador.
 **/

 -- Para estas consultas usa INNER JOIN

		-- 1. Obtén la cantidad de productos de cada orden.
		SELECT
			o.orderNumber `Orden`,
			SUM(od.quantityOrdered) `Productos`
	 	FROM
	 		orders o
	 	INNER JOIN
	 		orderdetails od on o.orderNumber = od.orderNumber
	 	GROUP BY
	 		`Orden`;

     -- 2. Obtén el número de orden, estado y costo total de cada orden.
	 	SELECT
			o.orderNUmber `Orden`,
	    o.`status` `Status`,
	    CONCAT('$',FORMAT ((od.quantityOrdered * priceEach),2)) `Costo Total`
	 	FROM
	 		orders o
	 	INNER JOIN
	 		orderdetails od ON o.orderNumber = od.orderNumber;

     -- 3. Obtén el número de orden, fecha de orden, línea de orden, nombre del
		 -- producto, cantidad ordenada y precio de cada pieza.
	 	SELECT
			o.orderNumber `Número de orden`,
			DATE_FORMAT(o.shippedDate, '%d/%m/%Y') `Fecha de orden`,
			od.orderLineNumber `Línea de orden`,
			p.productName `Producto`,
			od.quantityOrdered `Cantidad ordenada`,
			od.priceEach `Precio por pieza`
	 	FROM
	 		orders o
	 	INNER JOIN
	 		orderdetails od ON o.orderNumber = od.orderNumber
	 	INNER JOIN
	 		products p ON p.productCode = od.productCode;

     -- 4. Obtén el número de orden, nombre del producto, el precio sugerido de
		 -- fábrica (msrp) y precio de cada pieza.
 	SELECT
 		o.orderNumber `Número de orden`,
		p.productName `Producto`,
		CONCAT('$', FORMAT(p.MSRP,2)) `Precio sugerido de fábrica`,
		CONCAT('$', FORMAT(p.buyPrice,2)) `Precio`
 	FROM
 		orders o
 	INNER JOIN
 		orderdetails od on o.orderNumber = od.orderNumber
 	INNER JOIN
 		products p ON p.productCode = od.productCode;

 -- Para estas consultas usa LEFT JOIN

     -- 5. Obtén el número de cliente, nombre de cliente, número de orden y
		 -- estado de cada orden hecha por cada cliente. ¿De qué nos sirve hacer
		 -- LEFT JOIN en lugar de JOIN?
 	SELECT
 		c.customerNumber `Número de cliente`,
		c.customerName `Nombre del cliente`,
		o.orderNumber `Número de orden`,
		o.`status` `Estado de la orden`
 	FROM
 		customers c
 	LEFT JOIN
 		orders o ON c.customerNumber = o.customerNumber;

 	/**
 	  * Sirve, en este caso, para obener una lista de todos los clientes... y
		* cada orden que hayan colocado (inclusive traerá los clientes que no han
		* colocado una orden)
		*/

     -- 6. Obtén los clientes que no tienen una orden asociada.
     SELECT
		 	c.customerNumber `Número de cliente`,
			c.customerName `Nombre del cliente`,
			o.orderNumber `Número de orden`,
			o.`status` `Estado de la orden`
		FROM
			customers c
		LEFT JOIN
			orders o ON c.customerNumber = o.customerNumber
		WHERE
			o.orderNumber IS NULL;

     -- 7. Obtén el apellido de empleado, nombre de empleado, nombre de cliente,
		 -- número de cheque y total, es decir, los clientes asociados a cada
		 -- empleado.
		 SELECT
		 	e.lastName `Apellido del empleado`,
			e.firstName `Nombre del empleado`,
			c.customerName `Nombre del cliente`,
			p.checkNumber `Número de cheque`,
			p.amount `Total`
		FROM
			employees e
		LEFT JOIN
			customers c ON e.employeeNumber = c.salesRepEmployeeNumber
		LEFT JOIN
			payments p ON p.customerNumber = c.customerNumber
		WHERE
			c.customerNumber IS NOT NULL;

 -- Para estas consultas usa RIGHT JOIN

		-- 8. Repite los ejercicios 5 a 7 usando RIGHT JOIN. ¿Representan lo mismo?
		-- Explica las diferencias en un comentario. Para poner comentarios usa --.
						-- 5...
						SELECT
							c.customerNumber `Número de cliente`,
							c.customerName `Nombre del cliente`,
							o.orderNumber `Número de orden`,
							o.`status` `Estado de la orden`
						FROM
							customers c
						RIGHT JOIN
							orders o ON c.customerNumber = o.customerNumber;
				 	-- 6...
						SELECT
							c.customerNumber `Número de cliente`,
							c.customerName `Nombre del cliente`,
							o.orderNumber `Número de orden`,
							o.`status` `Estado de la orden`
						FROM
							customers c
						RIGHT JOIN
							orders o ON c.customerNumber = o.customerNumber
						WHERE
							o.orderNumber IS NULL;
					-- 7...
						SELECT
							e.lastName `Apellido del empleado`,
							e.firstName `Nombre del empleado`,
							c.customerName `Nombre del cliente`,
							p.checkNumber `Número de cheque`,
							p.amount `Total`
						FROM
							employees e
						RIGHT JOIN
							customers c ON e.employeeNumber = c.salesRepEmployeeNumber
						RIGHT JOIN
							payments p ON p.customerNumber = c.customerNumber
						WHERE
							c.customerNumber IS NOT NULL;
 	/**
 	  * Representan el "espejo" de la selección. Mientras que LEFT JOIN trae todo
		* lo de la tabla izquierda (la primera en mencionarse) aunque no haya
    * coincidencias con la tabla de la derecha, RIGHT JOIN trae todo lo de la
		* tabla derecha (la segunda en mencionarse) aunque no haya coincidencias
    * con la tabla de la izquierda.
    */
    -- Escoge 3 consultas de los ejercicios anteriores, crea una vista y escribe
		-- una consulta para cada una.
		-- Nota personal: no me quedó tan clara esta asignación. Dejo el snippet de
		-- la creación de la vista, pero no intentaré ejecutarlo en la BD
		CREATE VIEW view_orders_144 AS
		SELECT
			o.orderNumber,
			o.orderDate,
			o.`status`,
			c.customerName,
			e.employeeNumber,
			r.productName,
			od.quantityOrdered,
			od.priceEach
		FROM
			orders o
		INNER JOIN
			orderdetails od ON o.orderNumber = od.orderNumber
		INNER JOIN
			customers c ON c.customerNumber = o.customerNumber
		INNER JOIN
			employees e ON e.employeeNumber = c.salesRepEmployeeNumber
		INNER JOIN
			products r ON r.productCode = od.productCode;
