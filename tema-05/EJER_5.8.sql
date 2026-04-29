-- tema 5 
-- OSCAR AMAYA

CREATE DATABASE Horarios;
USE Horarios;

CREATE TABLE departamentos (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    cod_departamento CHAR(3) NOT NULL,
    CONSTRAINT uq_departamentos_cod UNIQUE (cod_departamento)
);

CREATE TABLE profesor (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    fecha_ingreso DATE NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    nrp VARCHAR(20) NOT NULL,
    departamento_id INT NOT NULL,
    CONSTRAINT uq_profesor_email UNIQUE (email),
    CONSTRAINT uq_profesor_nrp UNIQUE (nrp),
    CONSTRAINT fk_profesor_departamento
        FOREIGN KEY (departamento_id)
        REFERENCES departamentos(id)
);

CREATE TABLE horario (
    id INT PRIMARY KEY,
    profesor_id INT NOT NULL,
    dia INT NOT NULL,
    tramo INT NOT NULL,
    turno INT NOT NULL,
    asignatura_id INT NOT NULL,
    horas INT NOT NULL,
    CONSTRAINT fk_horario_profesor
        FOREIGN KEY (profesor_id)
        REFERENCES profesor(id),
    CONSTRAINT fk_horario_asignatura
        FOREIGN KEY (asignatura_id)
        REFERENCES asignatura(id),
    CONSTRAINT chk_dia CHECK (dia BETWEEN 1 AND 5),
    CONSTRAINT chk_tramo CHECK (tramo BETWEEN 1 AND 6),
    CONSTRAINT chk_turno CHECK (turno IN (1,2))
);
