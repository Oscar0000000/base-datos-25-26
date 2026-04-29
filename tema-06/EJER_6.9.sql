-- Empleados con su Departamento

-- Muestra todos los empleados ordenados por id.

SELECT 
    e.id,
    e.nombre,
    e.apellidos,
    e.salario,
    e.departamento_id,
    d.nombre AS nombre_departamento
FROM empleados e
INNER JOIN departamentos d 
    ON e.departamento_id = d.id
ORDER BY e.id;

-- Departamentos con su Jefe

-- Ordenado por nombre del departamento.

SELECT 
    d.id,
    d.nombre,
    d.localizacion,
    d.componentes,
    d.jefe_departamento_id,
    e.apellidos,
    e.nombre
FROM departamentos d
INNER JOIN empleados e 
    ON d.jefe_departamento_id = e.id
ORDER BY d.nombre;

-- Empleados con su Supervisor

-- Se conecta la tabla empleados consigo misma.

SELECT 
    e.id,
    e.nombre,
    e.apellidos,
    e.nss,
    e.salario,
    s.nombre AS supervisor_nombre,
    s.apellidos AS supervisor_apellidos
FROM empleados e
INNER JOIN empleados s 
    ON e.supervisor_id = s.id
ORDER BY e.id;

-- Beneficiarios con su Empleado
SELECT 
    b.id,
    b.nombre,
    b.genero,
    b.parentesco,
    b.fecha_nac,
    b.empleado_id,
    e.nombre,
    e.apellidos
FROM beneficiarios b
INNER JOIN empleados e 
    ON b.empleado_id = e.id;

-- Proyectos con su Departamento
SELECT 
    p.id,
    p.descripcion,
    p.num_proyecto,
    p.localizacion,
    p.fecha_inicio,
    p.fecha_fin,
    p.departamento_id,
    d.nombre AS departamento
FROM proyectos p
INNER JOIN departamentos d 
    ON p.departamento_id = d.id;

-- Proyectos con Departamento y Jefe
SELECT 
    p.id,
    p.descripcion,
    p.num_proyecto,
    p.localizacion,
    p.fecha_inicio,
    p.fecha_fin,
    p.departamento_id,
    d.nombre AS departamento,
    e.nombre,
    e.apellidos
FROM proyectos p
INNER JOIN departamentos d 
    ON p.departamento_id = d.id
INNER JOIN empleados e 
    ON d.jefe_departamento_id = e.id;

-- Informe empleados_proyectos

 -- Ordenado alfabéticamente por empleado.

SELECT 
    ep.empleado_id,
    ep.proyecto_id,
    ep.horas,
    e.nombre,
    e.apellidos,
    p.descripcion
FROM empleados_proyectos ep
INNER JOIN empleados e 
    ON ep.empleado_id = e.id
INNER JOIN proyectos p 
    ON ep.proyecto_id = p.id
ORDER BY e.apellidos, e.nombre;