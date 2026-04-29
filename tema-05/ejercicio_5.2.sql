-- Actividad 5.2
-- TEMA 5 Lenguaje SQL
-- Oscar Amaya Cortes

-- Crear la base de datos ajedrez, usar siempre la clausula IF NOT EXISTS 
-- Indicar el juego de caracteres y la coleccion establecida por defecto
-- UTF8BM4
-- utf8mb4_general_ci

CREATE DATABASE IF NOT EXISTS ajedrez
CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

ALTER DATABASE ajedrez
CHARACTER SET hp8 COLLATE hp8_english_ci;

DROP DATABASE  IF EXISTS ajedrez;

CREATE DATABASE IF NOT EXISTS futbol
CHARACTER SET utf16 COLLATE  utf16_general_ci;

ALTER DATABASE futbol
CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

DROP DATABASE IF EXISTS futbol;
