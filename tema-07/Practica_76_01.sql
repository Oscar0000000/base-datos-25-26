-- Practica_76_01
-- 1 Crear la base de datos fmatematicas
DROP DATABASE IF EXISTS fmatematicas;
CREATE DATABASE IF NOT EXISTS fmatematicas;

USE fmatematicas;

-- 2 Crear la tabla angulos los valores con maxima precision
CREATE TABLE angulos(
	id int unsigned auto_increment primary key,
    grados SMALLINT UNSIGNED,
    radianes DOUBLE(31,30),
    seno DOUBLE(31,30),
    coseno DOUBLE(31,30),
    tangente DOUBLE(31,30)
);


-- 3 Insertar registros
INSERT INTO Angulos (grados) VALUES
(0),
(45),
(90),
(135),
(180),
(225),
(270),
(315),
(360);



-- 4 UPDATE Angulos
SET 
    seno = SIN(radianes),
    coseno = COS(radianes),
    tangente = TAN(radianes);