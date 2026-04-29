-- Examen_tema06_subnombre.sql
-- 1 Insertar libro
USE Geslibros;
INSERT into libros ( 
isbn,
ean, 
titulo, 
autor_id, 
editorial_id, 
precio_coste, 
precio_venta, 
stock, 
stock_min,
stock_max, 
fecha_edicion)
VALUES 
('9788408096528', '9788888199587', 'El Retrato de Dorian Gray', 
 2, 4, 18.00, 24.00, 12, 5, 25, '2015-03-15');
 SET libro_id = last_insert_id();

-- 2 Insertar-Libros_Temas
INSERT INTO libros_temas (libro_id, tema_id) VALUES
(libro_id, 3),
(libro_id, 9); 

-- 3 Insertar-Ventas
INSERT INTO ventas (cliente_id, fecha, importe_bruto, importe_iva, importe_total)
VALUES (1, '2014-05-10', 0, 0, 0);

-- 4 Insertar Lineas ventas
INSERT INTO lineasventas (venta_id, numero_linea, libro_id, iva, cantidad, precio, importe)
VALUES (venta_id, 1, 1, 0.21, 2, 30.00, 60.00),
(venta_id, 2, 2, 0.21, 1, 34.00, 34.00);

-- 5 UPDATE-Libros 
-- Actualizar el precio de venta de todos los libros de la editorial Planeta incrementandolo un 15%
UPDATE libros
SET precio_venta = precio_venta * 1.15
WHERE editorial_id = 4;

-- 6 Update -Libros
-- Reducir el stock de todos los libros de la editorial planeta incrementandolo en un 15%
UPDATE libros
SET stock = stock * 0.8
WHERE stock > 15;

-- 7 Delete- Libros
-- Eliminar de la base de datos todos los libros de tematica viajes
DELETE l FROM libros l
JOIN libros_temas lt ON l.id = lt.libro_id
WHERE lt.tema_id = 4;

-- 8 Script Clientes
-- Mostrar aquellos clientes cuya direccion de email pertenezca al dominio gmail.com y que esten ubicados en la provincia de Guadalajara
SELECT 
c.id, 
c.nombre, 
c.direccion, 
c.c_postal, 
c.nif, 
c.telefono, 
c.email
FROM clientes c
JOIN provincias p ON c.provincia_id = p.id
WHERE c.email LIKE '%gmail.com'
AND p.provincia = 'Guadalajara'
ORDER BY c.nombre;

-- 9 Script Ventas
SELECT
v.id, c.nombre, v.fecha, v.importe_bruto, v.importe_iva, v.importe_total
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id
WHERE YEAR(v.fecha) = 2013
ORDER BY v.importe_total ASC
LIMIT 5;

-- 10 Cript Libros
SELECT 
l.id, 
l.titulo, 
a.nombre AS autor, 
e.nombre AS editorial,
l.stock, 
l.precio_coste, 
l.precio_venta
FROM libros l
JOIN autores a ON l.autor_id = a.id
JOIN editoriales e ON l.editorial_id = e.id
WHERE YEAR(l.fecha_edicion) = 2014
AND l.stock < 10
ORDER BY l.titulo;

-- 11 Script Libros
SELECT
l.id,
l.titulo,
a.nombre AS autor,
e.nombre AS editorial,
l.tema,
l.preciocoste,
l.precioventa
FROM libros l
JOIN autores a ON l.autor_id = a.id
JOIN editoriales e  ON l.editorial_id = e.id
JOIN libros_temas lt ON l.librostemas_id = lt.id
JOIN temas t ON l.temas_id = t.id
WHERE t.tema = Novela  AND precio_venta > 20
ORDER BY l.titulo;

-- 12 Script Libros
SELECT
l.id,
l.titulo,
a.nombre AS n,
e.nombre AS editorial,
l.precioventa
FROM libros l
JOIN autores a ON l.autor_id = a.id
JOIN editoriales e ON l.editorial_id = e.id
AVG precio_venta > precio_coste
WHERE precio_venta > precio_coste
ORDER BY l.precio_venta DESC

-- 13 Script Ventas
SELECT 
c.id AS c,
c.nombre AS n,
v.numeroventas,
v.importetotal
FROM ventas v
JOIN clientes c ON v.clientes_id = c.id
WHERE precio_venta, precio_coste
ORDER BY numero_ventas ASC

-- 14 Script Estadisticias de ventas por libro
SELECT
l.id,
l.titulo,
lv.unidadesvendidas,
lv.importetotal,
lv.preciomedio
FROM libros l
JOIN lineasventas lv ON l.lineasventas = lv.id
WHERE ALL libros_vendidos
ORDER BY importetotal DESC