ventas.a <- c(18,26,14,22,34,46,37)
ventas.b <- c(58,28,35,16,5,19,11)

devoluciones.a <- c(0,4,2,0,12,20,8)
devoluciones.b <- c(25,0,8,0,0,0,2)

(ventas.netas.a <- ventas.a - devoluciones.a)
(ventas.netas.b <- ventas.b - devoluciones.b)

(ingresos.netos.a <- ventas.netas.a * 15.5)
(ingresos.netos.b <- ventas.netas.b * 7.8)

(costos.netos.a <- ventas.netas.a * 5.9)
(costos.netos.b <-  ventas.netas.b * 2.4)

(ingresos.dia <- rbind(ingresos.netos.a, ingresos.netos.b))
(costos.dia <- rbind(costos.netos.a, costos.netos.b))

(utilidad.bruta.dia <- ingresos.dia - costos.dia)
(utilidad.neta.dia <- (ingresos.dia - costos.dia) *0.9)

(utilidad.neta.prod <- colSums(utilidad.neta.dia, na.rm = FALSE, dims = 1))

(utilidad.semanal <- sum(utilidad.bruta.dia, na.rm = FALSE))