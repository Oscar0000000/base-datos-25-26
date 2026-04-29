-- Practica 74
-- Descripcion Uso transacciones
-- Alumno Oscar Amaaya

-- 1 Incluye una transaccion un proceso que realice las siguientes actualizaciones

Use geslibros;
Start transaction;
update libros set precio_venta = precio_venta *0.9
where id in (select libro_id from libros_temas where tema_id = 
(select id from temas where tema = 'novela'));

-- Los libros de la editorial Anaya se incrementa el precio en un 6%
update libros set precio_venta = precio_venta * 1.06
where editorial_id = (select id from editoriales where nombre like '%Anaya%');

-- mientras que el resto de editoriales se reduce en un 4,5%
update libros set precio_venta = precio_venta *0.955
where editorial_id != (select id from editoriales where nombre like '%Anaya%');

-- Finalizar la transacción deshaciendo las operaciones anteriores. Comprobar
ROLLBACK;

-- Inicia una una transaccion que contenga  los siguientes operaciones
USE geslibros;
START TRANSACTION;

-- 1. Añadir dos libros
INSERT INTO libros (titulo, precio_venta, editorial_id)
VALUES 
('Libro 1', 20, 1),
('Libro 2', 25, 1);

-- 2. Añadir una venta
INSERT INTO ventas (cliente_id, fecha)
VALUES (1, NOW());

-- 3. Añadir 3 líneas de detalle
INSERT INTO detalle_ventas (venta_id, libro_id, cantidad, precio)
VALUES 
(1, 1, 2, 20),
(1, 2, 1, 25),
(1, 1, 1, 20);

-- 4. Confirmar cambios
COMMIT;

USE geslibros;
START TRANSACTION;

-- Insertar dos libros
INSERT INTO libros (titulo, precio_venta, editorial_id)
VALUES 
('Libro A', 15, 1),
('Libro B', 18, 1);

-- Insertar dos clientes
INSERT INTO clientes (nombre)
VALUES 
('Cliente 1'),
('Cliente 2');

-- SAVEPOINT A
SAVEPOINT a;

-- Subir precios 10%
UPDATE libros 
SET precio_venta = precio_venta * 1.10;

-- SAVEPOINT B
SAVEPOINT b;


-- Volver al SAVEPOINT A 
ROLLBACK TO a;