-- Consultas basicas 
-- Listado de todos los jugadores
SELECT * FROM jugadores;
-- Listado de todos los equipos
SELECT * FROM equipos;
-- Listado de todos los equipos
SELECT * FROM partidos;
-- Listado de los tres ultimos partidos disputados
SELECT * 
FROM partidos
ORDER BY fecha DESC
LIMIT 3;

-- Consultas con limit
-- Listado de los 5 goles mas tempranos
SELECT *
FROM goles
ORDER BY minuto
LIMIT 5;

-- Listado de goles del 5 al 10
SELECT *
FROM goles
LIMIT 4,6;

-- Listado de los tres ultimos partidos disputados
SELECT *
FROM partidos
ORDER BY fecha DESC
LIMIT 3;

-- Listado de sólo 1 partido donde intervino el Betis como equipo de fuera
SELECT *
FROM partidos
WHERE equipo_fuera_id = 5
LIMIT 1;

-- Listado de 1 partido donde el equipo de fuera no marcó
SELECT *
FROM partidos
WHERE goles_fuera = 0
LIMIT 1;

-- Listar 5 goles a partir del gol 4	
SELECT *
FROM goles
LIMIT 3,5;

-- Consultas

-- Mostrar el id, nombre y id_equipo de todos los jugadores
SELECT id, nombre, equipo_id
FROM jugadores;

-- Usando alias con AS
SELECT id AS Numero,
       nombre AS "Nombre Jugador",
       equipo_id AS "Código Equipo"
FROM jugadores;

-- Sin usar AS
SELECT id Numero,
       nombre "Nombre Jugador",
       equipo_id "Código Equipo"
FROM jugadores;

-- Usando prefijos de tabla
SELECT jugadores.id,
       jugadores.nombre,
       jugadores.equipo_id
FROM jugadores;

-- Usando prefijo de base de datos y tabla
SELECT futbol.jugadores.id,
       futbol.jugadores.nombre,
       futbol.jugadores.equipo_id
FROM futbol.jugadores;

-- Realizar cálculo
SELECT (32 + (0.33 * 10)) / 4;

-- Con predicados where

-- Jugadores del equipo 2 (Barcelona)ç
SELECT *
FROM jugadores
WHERE equipo_id = 2;

-- Jugador cuyo id es 4
SELECT *
FROM jugadores
WHERE id = 4;

-- Tres jugadores más jóvenes del equipo 2
SELECT *
FROM jugadores
WHERE equipo_id = 2
ORDER BY fecha_nac DESC
LIMIT 3;

-- Equipos con estadio de capacidad superior a 10000
SELECT *
FROM equipos
WHERE aforo > 10000;

-- Equipos con estadio >12000 y fundados después de 1970
SELECT *
FROM equipos
WHERE aforo > 12000
AND fundacion > 1970;

-- Goles marcados por el jugador 1
SELECT *
FROM goles
WHERE jugador_id = 1;

-- Goles del jugador 1 jugando como local
SELECT g.*
FROM goles g
JOIN partidos p ON g.partido_id = p.id
JOIN jugadores j ON g.jugador_id = j.id
WHERE j.id = 1
AND p.equipo_casa_id = j.equipo_id;

-- Comprobar si hay algún jugador llamado Lamine
SELECT *
FROM jugadores
WHERE nombre LIKE 'Lamine%';

-- Jugador del equipo 1 llamado Jude
SELECT *
FROM jugadores
WHERE equipo_id = 1
AND nombre LIKE 'Jude%';

-- Partidos ganados en casa por el equipo 3
SELECT *
FROM partidos
WHERE equipo_casa_id = 3
AND goles_casa > goles_fuera;

-- Partidos ganados por el equipo local
SELECT *
FROM partidos
WHERE goles_casa > goles_fuera;

-- Partidos acabados en empate
SELECT 
    *
FROM
    partidos
WHERE
    goles_casa = goles_fuera
    ;

-- Partidos ganados por el equipo visitante
SELECT *
FROM partidos
WHERE goles_fuera > goles_casa;

-- Partidos ganados por más de 1 gol de diferencia
SELECT *
FROM partidos
WHERE ABS(goles_casa - goles_fuera) > 1;

-- Operadores in between, like

-- Jugadores de Real Madrid, Barcelona o Betis
SELECT *
FROM jugadores
WHERE equipo_id IN (1,2,5);

-- Equipos con estadio entre 40.000 y 80.000
SELECT *
FROM equipos
WHERE aforo BETWEEN 40000 AND 80000;

-- Equipos cuyo estadio no tenga menos de 30.000
SELECT *
FROM equipos
WHERE aforo >= 30000;

-- Jugadores nacidos entre 1995 y 2000
SELECT *
FROM jugadores
WHERE fecha_nac BETWEEN '1995-01-01' AND '2000-12-31';

-- Jugadores cuyo nombre empieza por D
SELECT *
FROM jugadores
WHERE nombre LIKE 'D%';

-- Jugador llamado Alarcón
SELECT *
FROM jugadores
WHERE nombre LIKE '%Alarcón%';

-- Con criterios de ordenacion order by

-- Jugadores en orden alfabético descendente
SELECT *
FROM jugadores
ORDER BY nombre DESC;

-- Equipos ordenados por estadio de mayor a menor aforo
SELECT *
FROM equipos
ORDER BY aforo DESC;

-- Jugadores ordenados por equipo y luego por nombre
SELECT *
FROM jugadores
ORDER BY equipo_id, nombre;

-- Jugadores del equipo 1 del más veterano al más joven
SELECT *
FROM jugadores
WHERE equipo_id = 1
ORDER BY fecha_nac ASC;

-- Jugadores del equipo 2 del más joven al más veterano
SELECT *
FROM jugadores
WHERE equipo_id = 2
ORDER BY fecha_nac DESC;