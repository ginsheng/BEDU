#Reto 1
	/**
    * Usando la base de datos tienda, escribe consultas que permitan responder
    * las siguientes preguntas.
    */
    USE tienda;

    -- ¿Qué artículos incluyen la palabra Pasta en su nombre? -- [17 artículos]
    SELECT
      *
    FROM
      articulo
    WHERE
      nombre LIKE '%Pasta%';
    -- ¿Qué artículos incluyen la palabra Cannelloni en su nombre? -- Sólo uno,
    -- con el id 233
    SELECT
      *
    FROM
      articulo
    WHERE
      nombre LIKE '%Cannelloni%';
    -- ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
    -- -- [767 artículos]
    SELECT
      *
    FROM
      articulo
    WHERE
      nombre LIKE '%-%';
#Reto 2
	/**
    * Usando la base de datos tienda, escribe consultas que permitan responder
    * las siguientes preguntas.
    */
    USE tienda;

    -- ¿Cuál es el promedio de salario de los puestos? -- $19,595.05
    SELECT
      AVG(salario)
    FROM
      puesto;
    -- ¿Cuántos artículos incluyen la palabra Pasta en su nombre? -- [Parece que
    -- les escapó esta pregunta]
    SELECT
      COUNT(id_articulo)
    FROM
      articulo
    WHERE
      nombre LIKE '%Pasta%';
    -- ¿Cuál es el salario mínimo y máximo? -- $10,013.44 y $29,996.58
    -- respectivamente
    SELECT
      MIN(salario), MAX(salario)
    FROM
      puesto;
    -- ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
    -- $79,690.05
    SELECT
      SUM(salario)
    FROM
      puesto
    WHERE
      id_puesto > 995;
# Reto 3
	/**
    * Usando la base de datos tienda, escribe consultas que permitan responder
    * las siguientes preguntas.
    */
    USE tienda;
    -- ¿Cuántos registros hay por cada uno de los puestos? --  [181 grupos
    -- distintos]
    SELECT
      nombre `Puesto`, COUNT(id_puesto) `Registros`
    FROM
      puesto
    GROUP BY
      nombre
    ORDER BY
      nombre;
    -- ¿Cuánto dinero se paga en total por puesto? -- [De nuevo: 181 grupos
    -- distintos]
    SELECT
      nombre `Puesto`, SUM(salario) `Pago Total`
    FROM
      puesto
    GROUP BY
      nombre
    ORDER BY
      `Pago Total`;
    -- ¿Cuál es el número total de ventas por vendedor?
    SELECT
      id_empleado `ID del vendedor`, COUNT(id_venta) `Ventas`
    FROM
      venta
    GROUP BY
      id_empleado
    ORDER BY
      id_empleado;
    -- ¿Cuál es el número total de ventas por artículo?
    SELECT
      id_articulo `ID del artículo`, COUNT(id_venta) `Total de Ventas`
    FROM
      venta
    GROUP BY
      id_articulo
    ORDER BY
      `Total de Ventas`;
# Reto 4
	/**
    * Usando la base de datos tienda, escribe consultas que permitan responder
    * las siguientes preguntas.
    */
    USE tienda;
    -- ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
    -- -- Ninguno (ningún puesto tiene salario menor a 10000)
    SELECT
      nombre
    FROM
      empleado
    WHERE
      id_puesto IN (SELECT
                      id_puesto
                    FROM
                      puesto
                    WHERE
                      salario < 10000);
    -- ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado? -- A
    -- menos que se acote la consulta (quizá por fechas) no hay manera de
    -- obtener mínimos y máximos
    SELECT
      nombre `Empleado`, (SELECT
                            MAX(id_venta)
                          FROM
                            venta
                          WHERE
                            venta.id_empleado = empleado.id_empleado) `Ventas`
      FROM
        empleado;
    -- ¿Cuál es el nombre del puesto de cada empleado?
    SELECT
      nombre `Empleado`, (SELECT
                            nombre
                          FROM
                            puesto
                          WHERE
                            puesto.id_puesto = empleado.id_puesto) `Puesto`
                          FROM
                            empleado ORDER BY `Empleado`;
