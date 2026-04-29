-- ejercicio_75_01_ubrique

-- Seleccionar la base de datos con la que se va a trabajar
USE geslibros;

-- Bloquear la tabla clientes en modo lectura
-- Esto permite que otros usuarios lean pero no escriban
LOCK TABLES clientes READ;

-- Intentar consultar la tabla libros
-- Esto dará error porque solo se puede acceder a tablas bloqueadas
SELECT * FROM libros;

-- Desbloquear todas las tablas
-- A partir de aquí todo vuelve a la normalidad
UNLOCK TABLES;

-- Intentar ver los libros
-- Esto fallará si el otro usuario ha bloqueado la tabla en modo WRITE
SELECT * FROM libros;

-- Intentar bloquear la tabla libros en modo lectura
-- Esto fallará si otro usuario tiene un bloqueo WRITE activo
LOCK TABLES libros READ;

-- Iniciar una transacción
START TRANSACTION;

-- Bloquear los registros de la columna precio_venta para actualización
-- Impide que otros usuarios modifiquen esos registros
SELECT precio_venta FROM libros FOR UPDATE;

-- Reducir el precio de todos los libros un 30%
UPDATE libros
SET precio_venta = precio_venta * 0.7;

-- Confirmar la transacción y guardar los cambios
COMMIT;