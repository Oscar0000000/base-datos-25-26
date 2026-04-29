--  Cambiar nombre de equipo 
UPDATE equipos
SET nombre = 'Girona Futbol Club'
WHERE nombre = 'Girona FC';

-- Actualizar ciudad de equuipo 
UPDATE equipos
SET ciudad = 'Vila-real'
WHERE nombre = 'Villarreal CF';

-- Incrementar aforo de estadios grandes
UPDATE equipos
SET aforo = aforo + 1000
WHERE aforo > 50000;

-- Cambiar el equipo de un jugador
UPDATE jugadores
SET equipo_id = 7
WHERE nombre = 'Hugo Duro';

-- Corregir la fecha de nacimiento
UPDATE jugadores
SET fecha_nac = '2001-06-05'
WHERE nombre = 'Takefusa Kubo';

-- Ajustar goles de un partido
UPDATE jugadores
SET fecha_nac = '2001-06-05'
WHERE nombre = 'Takefusa Kubo';

-- Actualizar observaciones de partidos recientes
UPDATE partidos
SET observaciones = CONCAT(observaciones, ' (actualizado)')
ORDER BY id DESC
LIMIT 3;

-- Cambiar minutos de goles por penaltis
UPDATE goles
SET minuto = minuto + 1
WHERE descripcion LIKE '%penalti%';

-- Asignar jugadores de un partido
UPDATE goles
SET jugador_id = 18
WHERE partido_id = 13
AND jugador_id IN (
    SELECT id FROM jugadores
    WHERE equipo_id = (
        SELECT equipo_casa_id
        FROM partidos
        WHERE id = 13
    )
);

-- Incrementar goles de iñaki williams
UPDATE goles
SET minuto = minuto + 1
WHERE jugador_id = 20
ORDER BY minuto
LIMIT 2;

-- Modificar el estadio  de un equipo
UPDATE equipos
SET estadio = 'Reale Arena Nuevo'
WHERE nombre = 'Real Sociedad';

-- Actualizar el estadio de un equipo
UPDATE jugadores
SET equipo_id = 8
WHERE equipo_id = (
    SELECT id
    FROM equipos
    WHERE nombre = 'Girona Futbol Club'
);

-- Incrementar goles de partido donde valencia sea local
UPDATE partidos
SET goles_casa = goles_casa + 1
WHERE equipo_casa_id = (
    SELECT id
    FROM equipos
    WHERE nombre = 'Valencia CF'
);

-- Corregir minutos de goles antiguos
UPDATE goles
SET minuto = minuto - 2
WHERE minuto > 80;

-- Renombrar un jugador
UPDATE jugadores
SET nombre = 'José Gayà'
WHERE nombre = 'José Luis Gayà';