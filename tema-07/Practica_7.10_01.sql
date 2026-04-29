-- Practica 7.10_01
-- 1 accede usuario por modo consola
mysql -h localhost -u root

-- 2 comando sql
show databases;
use geslibros;
show tables;
select host, user, password from mysql.user;
show grants for root@localhost;
show grants for current_user();

-- 3 crear usuarios
CREATE USER lopez@localhost identified by '1234567';
GRANT CREATE, ALTER, UPDATE ON maratoon.corredores TO lopez@localhost;

-- 4 cambiar password
ALTER USER 'lopez'@'localhost' IDENTIFIED BY '654321';

--  5 transaccion tablas
START TRANSACTION;

UPDATE libros 
SET precio = precio * 1.10;

SELECT * FROM libros;

ROLLBACK;

-- 6 bloqueo de tablas 
LOCK TABLE libros READ;

-- (NO ejecutar)
-- SELECT * FROM autores;

UNLOCK TABLES;

SELECT * FROM autores;

-- 7 operaciones 
START TRANSACTION;

SELECT * FROM clientes 
WHERE provincia = 'Cadiz' 
FOR UPDATE;

SELECT * FROM clientes 
WHERE provincia <> 'Cadiz';

COMMIT;

-- 8 base de datos maratoon
USE maratoon;

UPDATE corredores 
SET edad = timestampdiff(YEAR, fechaNacimiento, now());

SELECT id, apellidos, nombre, edad, club, categoria 
FROM corredores;

-- 9 fhicero con formato csv a partir de comando select los corredores de villamartin
SELECT 
    *
FROM
    corredores
WHERE
    ciudad = 'Villamartin' INTO OUTFILE 'C/Users/Oscar Amaya/Downloads/corredores_villamartin.csv' FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '
'autoresprovincias;