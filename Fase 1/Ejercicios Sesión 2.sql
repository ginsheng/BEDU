
	USE classicmodels;
    /**
    * 1. Dentro de la tabla employees, obtén el número de empleado, apellido y
		* nombre de todos los empleados cuyo nombre empiece con A.
    */
	SELECT
		employeeNumber, lastName, firstName
	FROM
		employees
	WHERE
		firstName LIKE 'A%';
    /**
    * 2. Dentro de la tabla employees, obtén el número de empleado, apellido y
		* nombre de todos los empleados cuyo apellido termina con on.
    */
	SELECT
		employeeNumber, lastName, firstName
	FROM
		employees
	WHERE
		lastName LIKE '%on';
    /**
    * 3. Dentro de la tabla employees, obtén el número de empleado, apellido y
		* nombre de todos los empleados cuyo nombre incluye la cadena on.
    */
	SELECT
		employeeNumber, lastName, firstName
	FROM
		employees
	WHERE
		firstName LIKE '%on%';
    /**
    * 4. Dentro de la tabla employees, obtén el número de empleado, apellido y
		* nombre de todos los empleados cuyos nombres tienen seis letras e inician
		* con G.
    */
	SELECT
		employeeNumber, lastName, firstName
	FROM
		employees
	WHERE
		firstName LIKE 'G_____';
    /**
    * 5. Dentro de la tabla employees, obtén el número de empleado, apellido y
		* nombre de todos los empleados cuyo nombre no inicia con B.
    */
	SELECT
		employeeNumber, lastName, firstName
	FROM
		employees
	WHERE
		firstName NOT LIKE 'B%';
    /**
    * 6. Dentro de la tabla products, obtén el código de producto y nombre de
		* los productos cuyo código incluye la cadena _20.
    */
	SELECT
		productCode, productName
	FROM
		products
	WHERE
		productCode LIKE '%\_20%';
    /**
    * 7. Dentro de la tabla orderdetails, obtén el total de cada orden.
    */
	SELECT
		orderNumber, quantityOrdered * priceEach `Total`
	FROM
		orderdetails;
    /**
    * 8. Dentro de la tabla orders obtén el número de órdenes por año.
    */
	SELECT
		YEAR(requiredDate) `Año`, COUNT(orderNumber) `Órdenes`
	FROM
		orders
	GROUP BY
		`Año`;
    /**
    * 9. Obtén el apellido y nombre de los empleados cuya oficina está ubicada
		* en USA.
    */
	SELECT
		lastName, firstName
	FROM
		employees
	WHERE
		officeCode IN (	SELECT
											officeCode
										FROM
											offices
										WHERE
											country = 'USA');
    /**
    * 10. Obtén el número de cliente, número de cheque y cantidad del cliente
		* que ha realizado el pago más alto.
    */
	SELECT
		customerNumber, checkNumber, amount
	FROM
		payments
	WHERE
		amount = (SELECT
								MAX(amount)
							FROM
								payments);
    /**
    * 11. Obtén el número de cliente, número de cheque y cantidad de aquellos
		* clientes cuyo pago es más alto que el promedio.
    */
	SELECT
		customerNumber, checkNumber, amount
	FROM
		payments
	WHERE
		amount > (SELECT
								AVG(amount)
							FROM
								payments);
    /**
    * 12. Obtén el nombre de aquellos clientes que no han hecho ninguna orden.
    */
	SELECT
		customerName
	FROM
		customers
	WHERE
		customerNumber NOT IN (	SELECT
															customerNumber
														FROM
															orders);
    /**
    * 13. Obtén el máximo, mínimo y promedio del número de productos en las
		* órdenes de venta.
    */
	SELECT
		MAX(quantityOrdered) `Máximo`, MIN(quantityOrdered) `Mínimo`
		, AVG(quantityOrdered) `Promedio`
	FROM
		orderdetails;
    /**
    * 14. Dentro de la tabla orders, Obtén el número de órdenes que hay por cada
		* estado.
    */
	SELECT
		(SELECT
			state
		FROM
			customers
		WHERE
			customers.customerNumber = orders.customerNumber) `Estado`
			, COUNT(orderNumber) `Órdenes`
		FROM
			orders
		GROUP BY
			`Estado`
		HAVING
			`Estado` IS NOT NULL ORDER BY `Órdenes`;
