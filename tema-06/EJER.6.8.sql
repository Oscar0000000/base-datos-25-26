-- 1 Realiza un prodcuto cartesiano entre las tabblas juagdores y equipos
SELECT * 
FROM jugadores, equipos;

-- 2 Realiza un producto cartesiano entre las tablas jugadores y goles
SELECT * 
FROM goles,jugadores;

-- 3 Realiza un producto cartesiano entre las tablas jugadores y equipos eliminando los registros espurios (where).
SELECT * FROM jugadores,equipos 
WHERE jugadores.equipo_id = equipos.id;

-- 4 Realiza un producto cartesiano entre las tablas jugadores y goles eliminando los registros espurios (where)
SELECT * FROM jugadores,goles
WHERE jugadores.id = goles.jugador_id;

-- 5 Realiza INNER JOIN correcto entre las tablas jugadores y equipos, devolver todas las columnas de jugadores y de equipos.
SELECT * FROM jugadores
INNER JOIN equipos
ON jugadores.equipo_id = equipos.id;

-- 6 Realiza INNER JOIN correcto entre las tablas jugadores y equipos, devolver las columnas id, nombre, edad y equipo
SELECT jugadores.id,
       jugadores.nombre,
       TIMESTAMPDIFF(YEAR, jugadores.fecha_nac, CURDATE()) AS edad,
       equipos.nombre AS equipo
FROM jugadores
INNER JOIN equipos
ON jugadores.equipo_id = equipos.id;


-- 7 Realizar INNER JOIN correcto entre las tablas jugadores y goles.
SELECT * FROM jugadores
INNER JOIN goles
ON jugadores.id = goles.jugador_id;

-- 8 Realiza INNER JOIN correcto entre las tablas jugadores y goles, devolver las columnas id, nombre, minuto, descripción
SELECT 		  jugadores.id,
			  jugadores.nombre,
              goles.minuto,
              goles.descripcion
FROM jugadores
INNER JOIN goles
ON jugadores.id = goles.jugador_id;

-- 9 Realizar INNER JOIN correcto entre las tablas jugadores, equipos y goles.
SELECT * FROM jugadores 
INNER JOIN equipos ON jugadores_equipo_id = equipos.id
INNER JOIN goles ON jugadores.id = goles.jugador_id;

-- 10 Realiza INNER JOIN correcto entre las tablas jugadores y goles, devolver las columnas id, nombre, equipo, minuto, descripción
SELECT jugadores.id,
       jugadores.nombre,
       equipos.nombre AS equipo,
       goles.minuto,
       goles.descripcion
FROM jugadores
INNER JOIN equipos ON jugadores.equipo_id = equipos.id
INNER JOIN goles ON jugadores.id = goles.jugador_id;

-- 11 Realizar INNER JOIN correcto entre las tablas jugadores, equipos, goles y partidos. Todas las columnas
SELECT *
FROM jugadores
INNER JOIN equipos ON jugadores.equipo_id = equipos.id
INNER JOIN goles ON jugadores.id = goles.jugador_id
INNER JOIN partidos ON goles.partido_id = partidos.id;

-- 12 Realiza INNER JOIN correcto entre las tablas jugadores y goles, devolver las columnas id, nombre, equipo, minuto, descripción, observaciones
SELECT jugadores.id,
       jugadores.nombre,
       equipos.nombre AS equipo,
       goles.minuto,
       goles.descripcion,
       partidos.observaciones
FROM jugadores
INNER JOIN equipos ON jugadores.equipo_id = equipos.id
INNER JOIN goles ON jugadores.id = goles.jugador_id
INNER JOIN partidos ON goles.partido_id = partidos.id;