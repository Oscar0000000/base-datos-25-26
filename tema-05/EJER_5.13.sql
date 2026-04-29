-- Tema 5
-- Modulo: Base de datos
-- Curso 25/26
-- Nombre: Oscar Amaya

-- Creacion de la base de datos
DROP DATABASE IF exists proyectos;
CREATE DATABASE IF NOT EXISTS proyectos;

-- Usar base de datos taller
USE taller;

-- Crear tabla clientes
DROP TABLE IF EXISTS clientes;
CREATE TABLE IF NOT EXISTS clientes (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    nif CHAR(9) UNIQUE NOT NULL
);

-- Crear la tabla Telefonos de clientes
DROP TABLE IF EXISTS telefono_clientes;
CREATE TABLE IF NOT EXISTS telefonos_clientes(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT UNSIGNED NOT NULL,
    telefono CHAR(9) NOT NULL,
    UNIQUE(cliente_id, telefono),
	FOREIGN KEY(cliente_id) REFERENCES clientes(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- Crear la tabla empleados
DROP TABLE IF EXISTS empleados;
CREATE TABLE IF NOT EXISTS empleados(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    dni CHAR(9) UNIQUE NOT NULL,
    proyecto_id INT UNSIGNED,
    supervisor_id INT UNSIGNED,
	-- las restricciones FOREING KEY se añaden al final
    -- mediante ALTER TABLE
);

-- Crear la tabla telefonos_empleados
DROP TABLE IF EXISTS telefonos_empleados
CREATE TABLE IF NOT EXISTS telefonos_empleados(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT UNSIGNED NOT NULL,
    telefono CHAR(9) NOT NULL,
    UNIQUE(empleadoo_id, telefono),
	FOREIGN KEY(empleado_id) 
		REFERENCES empleados(id)
		ON DELETE CASCADE ON UPDATE CASCADE
);

-- Crear la tabla beneficionarios

DROP TABLE IF EXISTS beneficiarios;
CREATE TABLE IF NOT EXISTS beneficiarios(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fecha_nac DATE NOT NULL,
    empleado_id INT UNSIGNED,
    FOREIGN KEY(empleado_id) REFERENCES empleados(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- Crear tabla proyectos
DROP TABLE IF EXISTS proyectos;
CREATE TABLE IF NOT EXISTS proyectos(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    proyecto VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    presupuesto DECIMAL(10,2)
    cliente_id INT UNSIGNED,
    jefe_id INT UNSIGNED,
    
);