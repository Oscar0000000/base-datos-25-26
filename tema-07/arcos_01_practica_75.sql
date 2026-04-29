-- practica 75_01_arcos

-- Seleccionar la base de datos
USE geslibros;

-- Seleccionar todos los clientes de la provincia de Guadalajara
-- Esta acción está permitida aunque haya bloqueo READ
SELECT * FROM clientes
WHERE provincia = 'Guadalajara';

-- Intentar insertar un cliente
-- Esto fallará si la tabla clientes está bloqueada en modo READ
INSERT INTO clientes (nombre, provincia)
VALUES ('Cliente Prueba', 'Guadalajara');

-- Comprobar si el cliente se ha insertado correctamente
-- Solo funcionará después de que se haga UNLOCK
SELECT * FROM clientes;

-- Bloquear la tabla libros en modo escritura
-- Solo este usuario podrá leer y escribir en esta tabla
LOCK TABLES libros WRITE;

-- Insertar un nuevo libro
-- Esta operación sí está permitida
INSERT INTO libros (titulo, precio_venta)
VALUES ('Libro Nuevo', 25);

-- Desbloquear la tabla libros
-- Permite que otros usuarios vuelvan a acceder
UNLOCK TABLES;

-- Iniciar una transacción
START TRANSACTION;

-- Bloquear en modo compartido las tablas editoriales y autores
-- Permite lectura pero evita modificaciones por otros usuarios
SELECT * FROM editoriales LOCK IN SHARE MODE;
SELECT * FROM autores LOCK IN SHARE MODE;

-- Insertar dos nuevos libros dentro de la transacción
INSERT INTO libros (titulo, precio_venta)
VALUES ('Libro A', 15);

INSERT INTO libros (titulo, precio_venta)
VALUES ('Libro B', 18);

-- Confirmar la transacción
-- Guarda definitivamente los cambios realizados
COMMIT;
