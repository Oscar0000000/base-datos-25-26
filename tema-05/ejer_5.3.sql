-- Actividad 5.3
-- TEMA 5 TIPOS DATOS NUMERICOS


-- borro y creo la base de datos si existe y no existe respectivamente
DROP DATABASE IF EXISTS tipo_datos;
CREATE DATABASE IF NOT EXISTS tipo_datos;

-- poner base de datos activo tipo_Datos
USE tipo_datos;

-- borro y creo la tabla tupo datos_num
DROP TABLE IF EXISTS tipo_datos_num;
CREATE TABLE IF NOT EXISTS tipo_datos_num (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
num_camiseta TINYINT UNSIGNED,
diferencia_goles SMALLINT,
goles_a_favor SMALLINT UNSIGNED,
goles_encontra SMALLINT UNSIGNED,
num_habitantes INT UNSIGNED,
humedad FLOAT(3,2) UNSIGNED,
precipitaciones DECIMAL(6,2),
temperatura_maxima DECIMAL(5,2),
temperatura_minima DECIMAL(5,2),
velocidad_viento DECIMAL(5,2),
altura INT UNSIGNED,
precio DECIMAL(10,2),
sueldo DECIMAL(10,2),
seno DOUBLE(30,29),
coseno DOUBLE(30,29),
tangente SMALLINT UNSIGNED
) CHARACTER SET = 'UTF8MB4' COLLATE = 'utf8mb4_general_ci';

-- añado tres registros validos
INSERT INTO tipo_datos_num VALUES
(
	NULL,
    34,
    -5,
    56,
    45,
    345000,
    0.90,
    300,
    45.46,
    -12.78,
    500,
    10000,
    45.67,
    45000,
    0.5678,
    0.785,
    34
);
