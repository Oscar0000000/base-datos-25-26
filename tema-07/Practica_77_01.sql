-- Practica 77_01
-- Funciones Cadena Caracteres

UPDATE empleados SET apellidos = CONCAT(apellidos, ' García') WHERE id = 1;
UPDATE empleados SET apellidos = CONCAT(apellidos, ' López') WHERE id = 2;
UPDATE empleados SET apellidos = CONCAT(apellidos, ' Martínez') WHERE id = 3;
UPDATE empleados SET apellidos = CONCAT(apellidos, ' Sánchez') WHERE id = 4;
UPDATE empleados SET apellidos = CONCAT(apellidos, ' Pérez') WHERE id = 5;

-- Consulta: apellidos, nombre
SELECT 
    id,
    nss,
    CONCAT(apellidos, ', ', nombre) AS nombre
FROM empleados;

-- Separar apellido1 y apellido2
SELECT 
    id,
    nss,
    nombre,
    SUBSTRING_INDEX(apellidos, ' ', 1) AS apellido1,
    SUBSTRING_INDEX(apellidos, ' ', -1) AS apellido2
FROM empleados;

-- Dirección en orden invertido


SELECT 
    id,
    nombre,
    apellidos,
    nss,
    SUBSTRING_INDEX(direccion, ', ', -1) AS estado,
    SUBSTRING_INDEX(SUBSTRING_INDEX(direccion, ', ', -2), ', ', 1) AS provincia,
    SUBSTRING_INDEX(SUBSTRING_INDEX(direccion, ', ', -3), ', ', 1) AS ciudad,
    SUBSTRING_INDEX(direccion, ', ', 1) AS codigo_postal
FROM empleados;

-- Creacion generado
SELECT 
    id,
    apellidos,
    nombre,
    nss,
    CONCAT(
        RIGHT(nss, 3),
        UPPER(LEFT(nombre, 2)),
        UPPER(LEFT(SUBSTRING_INDEX(apellidos, ' ', 1), 2)),
        UPPER(LEFT(SUBSTRING_INDEX(apellidos, ' ', -1), 2))
    ) AS codigo_generado
FROM empleados;