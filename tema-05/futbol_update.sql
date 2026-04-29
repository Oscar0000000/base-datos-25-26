-- BASE DE DATOS TEMA 6
-- Oscar amaya 
USE futbol;
-- 1 cambia el nombre del equipo girona fc a girona futbol club

UPDATE equipos
SET
	nombre = 'Girona futbol club'
WHERE
	nombre = 'Girona FC';
    
-- aCTUALIZAR CIUDAD
UPDATE equipos
SET 
	ciudadd = "Villa-real"
WHERE
	nombre = 'Villareal CF';
    
-- Incremento aforo estadio
UPDATE equipos
SET
	aforo = aforo +1000
WHERE
	aforo > 50000;
    
-- cAMBIAR equipo de jugador
UPDATE jugadores
SET
	equipo_id = 7
WHERE
	nombre = 'Hugo Duro';

-- cORREGIR FFECHA NAC
UPDATE jugadores
SET
	fecha_nac = '2001-06-05'
WHERE
	nombre  = 'Takefusa Kubo';
    
-- Ajustar goles partido
UPDATE partidos
SET
	goles_casa = 2,
    goles_fuera = 1
WHERE
	id = 7 LIMIT 1;
    
-- Actualizar observaciones ultimos 3 partidos
UPDATE partidos
SET
	observaciones = concat_ws(' ',observaciones, ' (actualizado)')
ORDER BY fecha DESC LIMIT 3;

-- Cambiar muinutos goles por penalti
UPDATE goles
SET
	minuto = minuto + 1
WHERE
	descripción LIKE '%penalti%';
    
-- Asignar goles partidos a jugador
UPDATE goles
SET
	id_jugador = 18
WHERE
	id_partido = 13 AND es_local= 1;
    
-- Incrementar minutos de iñaki
UPDATE goles
SET
	minuto = minuto + 1
WHERE 
	id_jugador = (SELECT
			id_jugador
		FROM
			jugadores
		WHERE
			nombre = 'Iñaki Williams') ORDER BY minuto LIMIT 2;

-- Modificar estadio
UPDATE equipos 
SET 
	estadio = 'Reale arena mnuevo'
WHERE
	nombre = 'Real Sociedad';

-- Mover jugadores de girona a athletic
UPDATE jugadores
SET
	id_equipo = 8
WHERE
	id_equipo  = (SELECT
			id_equipo
		FROM
			equipos
		WHERE
			nombre = 'Girona Futbol CLub');

-- Incrementar goles como local de valencia
UPDATE partidos
SET
	goles_casa = goles_casa + 1
WHERE
	id_equipo_casa = 6;
    
-- Corregir minutos de goles antiguos

UPDATE goles
SET
	minuto = minuto - 2
WHERE
	minuto >  80;
    
-- Renombrar un jugador
UPDATE jugadores 
SET 
    nombre = 'Jose Gaya'
WHERE
    id = 16;