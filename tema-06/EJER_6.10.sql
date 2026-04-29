-- EJERCICIO 6.10

-- Mostrar los detalles sobre empleados y departamentos.
SELECT 
    e.id,
    e.nombre,
    e.apellidos,
    e.nss,
    TIMESTAMPDIFF(YEAR, e.fecha_nac, CURDATE()) AS Edad,
    e.salario,
    d.nombre AS Departamento
FROM 
    empleados AS e
LEFT JOIN 
    departamentos AS d
ON 
    e.departamento_id = d.id
ORDER BY 
    e.id;


-- Mostrar detalles a cerca de los departamentos.
SELECT 
    d.id,
    d.nombre,
    d.jefe_departamento_id,
    j.nombre AS NombreJefe,
    e.id AS EmpleadoID,
    e.nombre AS NombreEmpleado,
    e.apellidos
FROM 
    departamentos AS d
LEFT JOIN 
    empleados AS j
ON 
    d.jefe_departamento_id = j.id
LEFT JOIN 
    empleados AS e
ON 
    e.departamento_id = d.id
ORDER BY 
    d.id;



-- Mostrar los detalles sobre los empleados que hayan trabajado en algún proyecto.
SELECT 
    e.id AS EmpleadoID,
    e.nombre AS NombreEmpleado,
    e.apellidos,
    d.nombre AS Departamento,
    p.nombre AS Proyecto,
    ep.horas AS HorasTrabajadas
FROM 
    empleados AS e
LEFT JOIN 
    departamentos AS d
ON 
    e.departamento_id = d.id
LEFT JOIN 
    empleados_proyectos AS ep
ON 
    e.id = ep.empleado_id
LEFT JOIN 
    proyectos AS p
ON 
    ep.proyecto_id = p.id
ORDER BY 
    ep.horas DESC;


-- Mostrar los siguientes detalles sobre proyectos
SELECT 
    p.id,
    p.nombre,
    p.num_proyecto,
    p.fecha_inicio,
    d.nombre AS Departamento,
    e.nombre AS NombreEmpleado,
    e.apellidos,
    ep.horas AS HorasTrabajadas
FROM 
    proyectos AS p
LEFT JOIN 
    empleados_proyectos AS ep
ON 
    p.id = ep.proyecto_id
LEFT JOIN 
    empleados AS e
ON 
    ep.empleado_id = e.id
LEFT JOIN 
    departamentos AS d
ON 
    e.departamento_id = d.id
ORDER BY 
    ep.horas DESC;