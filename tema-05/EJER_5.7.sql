-- tema 5
-- OSCAR AMAYA

CREATE TABLE pacientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    nss VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(15),
    poblacion VARCHAR(50) NOT NULL,
    expediente VARCHAR(30) NOT NULL,
    dni VARCHAR(15) NOT NULL,
    historial_clinico TEXT NOT NULL,
    fecha_nac DATE NOT NULL,
    edad INT NOT NULL
);
