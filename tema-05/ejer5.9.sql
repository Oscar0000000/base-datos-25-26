-- Actividad 5.9
CREATE DATABASE IF NOT EXISTS RestriccionesDefault
CHARACTER SET utf8
COLLATE utf8_general_ci;

USE RestriccionesDefault;

DROP TABLE resdefault;

CREATE TABLE resdefault (
    id INT AUTO_INCREMENT PRIMARY KEY,
    poblacion VARCHAR(50) DEFAULT 'Ubrique',
    provincia VARCHAR(50) DEFAULT 'Cádiz',
    nacionalidad VARCHAR(50) DEFAULT 'España',
    precio DECIMAL(6,2) DEFAULT 10.20,
    sueldo DECIMAL(8,2) DEFAULT 1500.00,
    fecha_hora_llegada DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_llegada DATE,
    hora_llegada TIME,
    casado BOOLEAN DEFAULT 1,
    carnet_conducir BOOLEAN DEFAULT 1
);

INSERT INTO resdefault () VALUES ();

INSERT INTO resdefault (poblacion, sueldo, casado)
VALUES ('Sevilla', 1800.00, 0);

INSERT INTO resdefault (provincia, nacionalidad, precio, carnet_conducir)
VALUES ('Málaga', 'Portugal', 15.50, 0);

