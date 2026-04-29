-- Eliminar un jugador concreto
DELETE FROM jugadores
WHERE nombre = 'Aleix García';

-- Borrar goles de un partido
DELETE FROM goles
WHERE partido_id = 7;

-- Eliminar goles tardios
DELETE FROM goles
WHERE minuto > 85;

-- Eliminar partidos sin goles
DELETE FROM partidos
WHERE goles_casa = 0 AND goles_fuera = 0;

-- Borrar jugadores sin equipo
DELETE FROM jugadores
WHERE equipo_id IS NULL;

-- Eliminar goles de un jugador
DELETE FROM goles
WHERE jugador_id = (
    SELECT id 
    FROM jugadores 
    WHERE nombre = 'Gerard Moreno'
);

-- Eliminar los goles ultimos registrados
DELETE FROM goles
ORDER BY id DESC
LIMIT 2;

-- Borrar partidos antiguos 
DELETE FROM partidos
WHERE fecha < '2024-04-01';

-- Elimnar goles de un partido concreto
DELETE FROM goles
WHERE partido_id = 11
AND minuto < 30;

-- Eliminar un equipo sin jugadores 
DELETE FROM equipos
WHERE nombre = 'Girona Futbol Club'
AND id NOT IN (
    SELECT equipo_id FROM jugadores WHERE equipo_id IS NOT NULL
);