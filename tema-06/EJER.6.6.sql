-- EJERCICIO 6.6
-- Obtener los 3 empleados con mayor salario
SELECT * 
FROM empleados
ORDER BY salario DESC
LIMIT 3;

-- Obtener los 5 empleados con menor salario
SELECT *
FROM empleados
ORDER BY salario ASC
LIMIT 5;

-- Obtener los empleados ordenados alfabéticamente
SELECT *
FROM empleados
ORDER BY nombre ASC;

-- Obtener los 3 primeros departamentos
SELECT *
FROM departamentos
ORDER BY id
LIMIT 3;

-- Obtener los 3 empleados con mayores salarios del departamento 3
SELECT *
FROM empleados
WHERE departamento_id = 3
ORDER BY salario DESC
LIMIT 3;


-- Función COUNT()

-- Número total de departamentos
SELECT COUNT(*) AS total_departamentos
FROM departamentos;

-- Número total de beneficiarios de sexo ‘M’
SELECT COUNT(*) AS mujeres
FROM beneficiarios
WHERE genero = 'M';

-- Número de empleados con salario entre 20000 y 50000
SELECT COUNT(*)
FROM empleados
WHERE salario BETWEEN 20000 AND 50000;

-- Número de empleados nacidos después de 1970
SELECT COUNT(*)
FROM empleados
WHERE fecha_nac > '1970-01-01';

-- Número total de proyectos del departamento 3
SELECT COUNT(*)
FROM proyectos
WHERE departamento_id = 3;

-- Número de departamentos que están realizando un proyecto
SELECT COUNT(DISTINCT departamento_id)
FROM proyectos;

-- Número de empleados que trabajan en algún proyecto
SELECT COUNT(DISTINCT empleado_id)
FROM empleados_proyectos;

-- Función SUM()

-- Total de horas trabajadas en todos los proyectos
SELECT SUM(horas)
FROM empleados_proyectos;

-- Total de horas trabajadas en el proyecto 2
SELECT SUM(horas)
FROM empleados_proyectos
WHERE proyecto_id = 2;

-- Suma total de salarios
SELECT SUM(salario)
FROM empleados;

-- Suma de salarios del departamento 5
SELECT SUM(salario)
FROM empleados
WHERE departamento_id = 5;

-- Suma de salarios de empleados cuyo supervisor es 3
SELECT SUM(salario)
FROM empleados
WHERE supervisor_id = 3;

-- Número de empleados y suma de salarios del departamento 4
SELECT COUNT(*) AS total_empleados,
       SUM(salario) AS suma_salarios
FROM empleados
WHERE departamento_id = 4;

-- Función AVG()
-- Media total de horas trabajadas en proyectos
SELECT AVG(horas)
FROM empleados_proyectos;

-- Número total de jornadas, suma y media de horas
SELECT COUNT(*) AS jornadas,
       SUM(horas) AS total_horas,
       AVG(horas) AS media_horas
FROM empleados_proyectos;

-- Número empleados, suma salarios y media salarios del departamento 3
SELECT COUNT(*) AS empleados,
       SUM(salario) AS suma_salarios,
       AVG(salario) AS media_salarios
FROM empleados
WHERE departamento_id = 3;

-- Salario medio de todos los empleados
SELECT AVG(salario)
FROM empleados;

-- Número total de empleados, salario medio y suma total
SELECT COUNT(*) AS total_empleados,
       AVG(salario) AS salario_medio,
       SUM(salario) AS total_salarios
FROM empleados;

-- Número de empleados y salario medio nacidos entre 1960 y 1980
SELECT COUNT(*) AS empleados,
       AVG(salario) AS salario_medio
FROM empleados
WHERE fecha_nac BETWEEN '1960-01-01' AND '1980-12-31';

-- Empleados con salario por encima del salario medio
SELECT *
FROM empleados
WHERE salario > (SELECT AVG(salario) FROM empleados);

-- Empleados con salario por debajo del salario medio del departamento 3
SELECT *
FROM empleados
WHERE salario < (
    SELECT AVG(salario)
    FROM empleados
    WHERE departamento_id = 3
);

-- NSS, nombre y apellidos de empleados con horas trabajadas por encima de la media
SELECT e.nss, e.nombre, e.apellidos
FROM empleados e
JOIN empleados_proyectos ep 
ON e.id = ep.empleado_id
WHERE ep.horas > (SELECT AVG(horas) FROM empleados_proyectos);

-- Funciones MIN() y MAX()
-- Salario máximo
SELECT MAX(salario)
FROM empleados;

-- Salario mínimo
SELECT MIN(salario)
FROM empleados;

-- Máximo de horas trabajadas en un proyecto
SELECT MAX(horas)
FROM empleados_proyectos;

-- Datos de los empleados con salario máximo
SELECT *
FROM empleados
WHERE salario = (SELECT MAX(salario) FROM empleados);

-- Datos de empleados con salario mínimo
SELECT *
FROM empleados
WHERE salario = (SELECT MIN(salario) FROM empleados);

-- NSS del empleado con máximo de horas en un proyecto
SELECT e.nss
FROM empleados e
JOIN empleados_proyectos ep
ON e.id = ep.empleado_id
WHERE ep.horas = (SELECT MAX(horas) FROM empleados_proyectos);

-- NSS, nombre y apellidos con horas máximas
SELECT e.nss, e.nombre, e.apellidos
FROM empleados e
JOIN empleados_proyectos ep
ON e.id = ep.empleado_id
WHERE ep.horas = (SELECT MAX(horas) FROM empleados_proyectos);

-- NSS de empleados con horas mínimas
SELECT e.nss
FROM empleados e
JOIN empleados_proyectos ep
ON e.id = ep.empleado_id
WHERE ep.horas = (SELECT MIN(horas) FROM empleados_proyectos);

-- NSS, nombre y apellidos con horas mínimas
SELECT e.nss, e.nombre, e.apellidos
FROM empleados e
JOIN empleados_proyectos ep
ON e.id = ep.empleado_id
WHERE ep.horas = (SELECT MIN(horas) FROM empleados_proyectos);