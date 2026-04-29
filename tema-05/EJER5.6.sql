-- actividad 5.6
-- ejercicip tablas completas 
USE test;

DROP TABLE IF EXISTS alumnos;
CREATE TABLE IF NOT EXISTS alumnos(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(45) NOT NULL
	nif CHAR(9) UNIQUE NOT NULL,
    fecha_nac DATE,
    edad INT(100) UNIQUE NOT NULL,
    poblacion_maximo INT(20) UNIQUE,
    direccion_maximo(255) UNIQUE,
    cpostal(4) UNIQUE,
    
