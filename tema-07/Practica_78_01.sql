-- practica _78_01
-- funciones fecha hora

-- 1 Añadir tres corredores
USE maratoon;

INSERT INTO corredores(nombre, apellidos, ciudad, fechaNacimiento, sexo, club_id) values
('Javier', 'Mosoco Granados', 'Villaluenga', '1994-07-14', 'H', '5'),
('Maria', 'Rodriguez Perez', 'Villaluenga', '1954-07-14', 'M', '5'),
('Juan', 'Clavijo Moreno', 'Grazalema', '1993-07-14', 'H', '5');

-- 2 Actualizar la edad de todos los corredores, incluidos los añadidos en el aparatado anterior
UPDATE corredores SET edad = timestampdiff(YEAR, fechaNacimiento, now());

-- 3 Actualiza la categoria asignada a cada corredor a partir del siguiente criterio y mostrar corredores

UPDATE corredors SET categoria_id =
CASE
	WHEN edad < 12 THEN 1
    WHEN edad < 15 THEN 2
	WHEN edad < 18 THEN 3
	WHEN edad < 30 THEN 4
	WHEN edad < 40 THEN 5
	WHEN edad < 50 THEN 6
	WHEN edad < 60 THEN 7
    ELSE 8
END;

SELECT c.id, c.nombre, c.apellidos, c.fechaNacimiento, c.edad,
       cat.nombre_corto AS categoria,
       cl.nombre_corto AS club
FROM corredores c
JOIN categorias cat ON c.categoria_id = cat.id
JOIN clubes cl ON c.club_id = cl.id;

-- Cumplen año el mes que viene
SELECT c.id, c.nombre, c.apellidos, c.fechaNacimiento, c.edad,
       cat.nombre_corto, cl.nombre_corto
FROM corredores c
JOIN categorias cat ON c.categoria_id = cat.id
JOIN clubes cl ON c.club_id = cl.id
WHERE MONTH(c.fechaNacimiento) = MONTH(DATE_ADD(NOW(), INTERVAL 1 MONTH));

-- Cumplen la semana que viene
SELECT c.id, c.nombre, c.apellidos, c.fechaNacimiento, c.edad,
       cat.nombre_corto, cl.nombre_corto
FROM corredores c
JOIN categorias cat ON c.categoria_id = cat.id
JOIN clubes cl ON c.club_id = cl.id
WHERE WEEK(c.fechaNacimiento) = WEEK(DATE_ADD(NOW(), INTERVAL 1 WEEK));

-- Nacidos en el 2º Cuatrimestre
SELECT c.id, c.nombre, c.apellidos, c.fechaNacimiento, c.edad,
       cat.nombre_corto, cl.nombre_corto
FROM corredores c
JOIN categorias cat ON c.categoria_id = cat.id
JOIN clubes cl ON c.club_id = cl.id
WHERE MONTH(c.fechaNacimiento) BETWEEN 5 AND 8;

-- 4 Maraton Sevilla
INSERT INTO registros (id, maraton_id, corredor_id, salida, llegada, tiempoInvertido)
VALUES
(NULL, 2, 2, '2019-12-02 09:00:00', '2019-12-02 11:15:30', NULL),
(NULL, 2, 3, '2019-12-02 09:00:00', '2019-12-02 11:20:10', NULL),
(NULL, 2, 4, '2019-12-02 09:00:00', '2019-12-02 11:35:45', NULL),
(NULL, 2, 5, '2019-12-02 09:00:00', '2019-12-02 11:50:00', NULL),
(NULL, 2, 6, '2019-12-02 09:00:00', '2019-12-02 12:05:20', NULL);

-- 5 Tiempo Invertido
UPDATE registros
SET tiempoInvertido = TIMEDIFF(llegada, salida)
WHERE maraton_id = 2;

-- 6 Muestra Clasificacion
SELECT 
    r.id,
    c.nombre,
    c.apellidos,
    cl.nombre AS club,
    cat.nombre AS categoria,
    r.tiempoInvertido
FROM
    registros r
        JOIN
    corredores c ON r.corredor_id = c.id
        JOIN
    clubes cl ON c.club_id = cl.id
        JOIN
    categorias cat ON c.categoria_id = cat.id
WHERE
    r.maraton_id = 2
ORDER BY r.tiempoInvertido ASC;



