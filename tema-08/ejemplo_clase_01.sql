DELIMITOR $$
ELIMINAR FUNCIÓN SI EXISTE test.estado$$
CREAR FUNCIÓN test.estado(in_estado CHAR(1))
	DEVUELVE VARCHAR(20)
COMENZAR
DECLARE estado VARCHAR(20);
	SI in_estado='P' ENTONCES
		ESTABLECER estado='caducado';
	SI NO, SI in_estado='O' ENTONCES
		ESTABLECER estado='activo';
	SI NO, SI in_estado='N' ENTONCES
		SET estado='nuevo';
	FIN SI;
RETORNO(estado);
FIN$$

-- Determina si un número es par o impar
DELIMITOR $$
ELIMINAR FUNCIÓN SI EXISTE test.par$$
CREAR FUNCIÓN test.par(numero INT)
	DEVUELVE booleano
COMENZAR
	SI MOD(numero,2)=0 ENTONCES
		DEVOLVER VERDADERO;
	DEMÁS
		DEVOLVER FALSO;
	FIN SI;
FIN$$

-- Ejemplo de uso de funciones dentro de un procedimiento
DELIMITOR $$
PROCEDIMIENTO DE BAJA SI EXISTE test.muestra_estado$$
CREAR PROCEDIMIENTO test.muestra_estado(en numero int)
COMENZAR
	SI (prueba.par(numero)) ENTONCES
		SELECT CONCAT(numero, " es par");
	DEMÁS
		SELECT CONCAT(numero, " es impar");
	FIN SI;
FIN$$

-- Ejemplo07: importar_bruto
-- DEVOLUCIONES: el import bruto de una venta
-- Parémtros: id de la venta
DELIMITOR $$
ELIMINAR FUNCIÓN SI EXISTE geslibros.importe_bruto$$
CREAR FUNCIÓN geslibros.importe_bruto(id_venta INT UNSIGNED)
	DEVUELVE DECIMAL(10,2)
COMENZAR
	DECLARAR import_bruto DECIMAL(10,2);
	ESTABLECER importar_bruto =
	 (SELECCIONE SUMA(importe) DESDE geslibros.lineasventas DONDE venta_id = id_venta);

DEVOLVER(importe_bruto);
FIN$$

-- Ejemplo08: actualizar_importe_ventas
-- Parémtros: id venta
-- Descripción: usando la función importventa para actualizar la columna
-- importbruto de la tabla ventas.
DELIMITOR $$
PROCEDIMIENTO DE BAJA SI EXISTE geslibros.actualizar_importe_bruto $$
CREAR PROCEDIMIENTO geslibros.actualizar_importe_bruto(IN venta_id INT UNSIGNED)
COMENZAR
	ACTUALIZAR geslibros.ventas SET importar_bruto = geslibros.importe_bruto(venta_id) DONDE
	id = venta_id;
FIN $$

-- Ejemplo09: importar_iva
-- DEVOLUCIONES: el importado iva de una venta
-- Parémtros: id de la venta
DELIMITOR $$
ELIMINAR FUNCIÓN SI EXISTE geslibros.importe_iva$$
CREAR FUNCIÓN geslibros.importe_iva(id_venta INT UNSIGNED)
	DEVUELVE DECIMAL(10,2)
COMENZAR
	DECLARAR import_iva DECIMAL(10,2);
	ESTABLECER importar_iva =
	 (SELECCIONAR SUMA(importe * iva) DESDE geslibros.lineasventas DONDE venta_id = id_venta);

	DEVOLVER(importe_iva);
FIN$$

-- Ejemplo10: actualizar_importe_iva
-- Parémtros: id venta
-- Descripción: usando la función import_iva para actualizar la columna
-- import_iva de la tabla ventas.
DELIMITOR $$
PROCEDIMIENTO DE BAJA SI EXISTE geslibros.actualizar_importe_iva $$
CREAR PROCEDIMIENTO geslibros.actualizar_importe_iva(IN venta_id INT UNSIGNED)
COMENZAR
	ACTUALIZAR geslibros.ventas SET importar_iva = geslibros.importe_iva(venta_id) DONDE
	id = venta_id;
FIN $$

-- Ejemplo11: actualizar_importe_total
-- Tipo: Procedimiento
-- Descripción: Actualizar la importación total de una venta a partir de la importación bruta y la importación iva
DELIMITOR $$
PROCEDIMIENTO DE BAJA SI EXISTE geslibros.actualizar_importe_total $$
CREAR PROCEDIMIENTO geslibros.actualizar_importe_total(venta_id INT UNSIGNED)
COMENZAR
	ACTUALIZACIÓN geslibros.ventas
    SET importación_total = importación_bruto(venta_id) + importación_iva(venta_id)
	-- SET importar_total = importar_bruto + importar_iva
    DONDE id = venta_id;
FIN $$

