-- Volcado de MariaDB 10.19 Distrib 10.4.27-MariaDB, para Win64 (AMD64)
--
-- Host: localhost Base de datos: futbol2023
-- ------------------------------------------------------
-- Versión del servidor 10.4.27-MariaDB

/*!40101 ESTABLECER @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 ESTABLECER @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 ESTABLECER @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 ESTABLECER NOMBRES utf8mb4 */;
/*!40103 ESTABLECER @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 ESTABLECER ZONA_HORARIA='+00:00' */;
/*!40014 ESTABLECER @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 ESTABLECER @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 ESTABLECER @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 ESTABLECER @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Crear base de datos Futbol203
--
ELIMINAR LA BASE DE DATOS SI EXISTE futbol2023;
CREAR BASE DE DATOS SI NO EXISTE futbol2023;
USE futbol2023;

--
-- Estructura de tabla para tabla `clasificacion`
--

DROP TABLE IF EXISTE `clasificacion`;
/*!40101 ESTABLECER @saved_cs_client = @@character_set_client */;
/*!40101 ESTABLECER character_set_client = utf8 */;
CREAR TABLA `clasificacion` (
  `id` int(10) sin signo NO NULO AUTO_INCREMENTO,
  `equipo_id` int(10) sin signo PREDETERMINADO NULO,
  `goles_favor` tinyint(3) sin signo PREDETERMINADO NULO,
  `goles_contra` tinyint(3) sin signo PREDETERMINADO NULO,
  `dif_goles` tinyint(4) POR DEFECTO NULO,
  `partidos_ganados` tinyint(3) unsigned DEFAULT NULL,
  `partidos_perdidos` tinyint(3) unsigned DEFAULT NULL,
  `partidos_empatados` tinyint(3) unsigned DEFAULT NULL,
  `partidos_jugados` tinyint(3) unsigned DEFAULT NULL,
  `puntos` tinyint(3) unsigned DEFAULT NULL,
  CLAVE PRIMARIA (`id`),
  CLAVE `equipo_id` (`equipo_id`),
  RESTRICCIÓN `clasificacion_ibfk_1` CLAVE EXTRANJERA (`equipo_id`) REFERENCIAS `equipos` (`id`) AL ELIMINAR CASCADA AL ACTUALIZAR CASCADA
) MOTOR=InnoDB AUTO_INCREMENT=7 CONJUNTO DE CARACTERES PREDETERMINADO=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 ESTABLECER character_set_client = @saved_cs_client */;

--
-- Volviendo datos para la tabla `clasificacion`
--

BLOQUEAR TABLAS `clasificacion` ESCRIBIR;
/*!40000 ALTER TABLE `clasificacion` DISABLE KEYS */;
INSERTAR EN VALORES `clasificacion` (1,1,0,0,0,0,0,0,0,0),(2,2,0,0,0,0,0,0,0,0),(3,3,0,0,0,0,0,0,0,0), (4,4,0,0,0,0,0,0,0,0),(5,5,0,0,0,0,0,0,0,0),(6,6,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `clasificacion` ENABLE KEYS */;
DESBLOQUEAR TABLAS;

--
-- Estructura de la tabla `equipos`
--

ELIMINAR TABLA SI EXISTE `equipos`;
/*!40101 ESTABLECER @saved_cs_client = @@character_set_client */;
/*!40101 ESTABLECER character_set_client = utf8 */;
CREAR TABLA `equipos` (
  `id` int(10) sin signo NO NULO AUTO_INCREMENTO,
  `nombre` varchar(50) PREDETERMINADO NULL,
  `estadio` varchar(50) NOT NULL,
  `aforo` int(6) VALOR PREDETERMINADO NULO,
  `fundación` int(4) sin signo PREDETERMINADO NULO,
  `ciudad` varchar(50) PREDETERMINADO NULL,
  CLAVE PRIMARIA (`id`)
) MOTOR=InnoDB AUTO_INCREMENT=7 CONJUNTO DE CARACTERES PREDETERMINADO=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 ESTABLECER character_set_client = @saved_cs_client */;

--
-- Volcando datos para la tabla `equipos`
--

BLOQUEAR TABLAS `equipos` ESCRIBIR;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'Real Madrid','Santiago Bernabeu',81044,1902,'Madrid'),(2,'Barcelona','Nou Camp',99354,1899,'Barcelona'),(3,'At. Madrid','Wanda Metropolitano ',68476,1903,'Madrid'),(4,'Valencia','Mestalla',48600,1919,'Valencia'),(5,'Sevilla','Ramón Sánchez-Pizjuán',43883,1890,'Sevilla'),(6,'Betis','Benito Villamarín',60721,1907,'Sevilla');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
DESBLOQUEAR TABLAS;

--
-- Estructura de tabla para mesa `estadisticas`
--

ELIMINAR TABLA SI EXISTE `estadísticas`;
/*!40101 ESTABLECER @saved_cs_client = @@character_set_client */;
/*!40101 ESTABLECER character_set_client = utf8 */;
CREAR TABLA `estadísticas` (
  `id` int(10) sin signo NO NULO AUTO_INCREMENTO,
  `jugador_id` int(10) sin signo PREDETERMINADO NULO,
  `goles` tinyint(3) sin signo PREDETERMINADO 0,
  CLAVE PRIMARIA (`id`),
  CLAVE `jugador_id` (`jugador_id`),
  RESTRICCIÓN `estadisticas_ibfk_1` CLAVE EXTRANJERA (`jugador_id`) REFERENCIAS `jugadores` (`id`) AL BORRAR CASCADA AL ACTUALIZAR CASCADA
) MOTOR=InnoDB AUTO_INCREMENT=45 CONJUNTO DE CARACTERES PREDETERMINADO=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 ESTABLECER character_set_client = @saved_cs_client */;

--
-- Dumping de datos para tabla `estadisticas`
--

BLOQUEAR MESAS `estadisticas` ESCRIBIR;
/*!40000 ALTER TABLE `estadisticas` DESHABILITAR TECLAS */;
INSERTAR EN VALORES `estadisticas` (1,1,0),(2,2,0),(3,3,0),(4,4,0),(5,5,0),(6,6,0),(7,7,0),(8,8,0),(9,9,0),(10,10,0),(11,11,0),(12,12,0),(13 ,13,0),(14,14,0),(15,15,0),(16,16,0),(17,17,0),(18,18,0),(19,19,0),(20,20,0),(21,21,0),(22,22,0),(23,23,0) ,(24,24,0),(25,25,0),(26,26,0),(27,27,0),(28,28,0),(29,29,0),(30,30,0),(31,31,0),(32,32,0),(33,33,0),(34,34,0),(35,35,0),(36,36,0),(37,37,0),(38,38,0),(39,39,0),(40,40,0),(41,41,0),(42,42,0),(43,43,0),(44,44,0);
/*!40000 ALTER TABLE `estadisticas` TECLAS HABILITADA */;
DESBLOQUEAR TABLAS;

--
-- Estructura de la tabla `goles`
--

ELIMINAR TABLA SI EXISTE `goles`;
/*!40101 ESTABLECER @saved_cs_client = @@character_set_client */;
/*!40101 ESTABLECER character_set_client = utf8 */;
CREAR TABLA `goles` (
  `id` int(10) sin signo NO NULO AUTO_INCREMENTO,
  `partido_id` int(10) sin signo PREDETERMINADO NULO,
  `minuto` tinyint(3) sin firmar DEFAULT NULL,
  texto `descripcion` DEFAULT NULL,
  `jugador_id` int(10) sin signo PREDETERMINADO NULO,
  `goles_casa` tinyint(3) unsigned DEFAULT NULL,
  `goles_fuera` tinyint(3) unsigned DEFAULT NULL,
  `equipo_id` int(10) sin signo PREDETERMINADO NULO,
  CLAVE PRIMARIA (`id`),
  CLAVE `partido_id` (`partido_id`),
  CLAVE `jugador_id` (`jugador_id`),
  CLAVE `equipo_id` (`equipo_id`),
  RESTRICCIÓN `goles_ibfk_1` CLAVE FORÁNEA (`partido_id`) REFERENCIAS `partidos` (`id`) AL ELIMINAR ESTABLECER NULL AL ACTUALIZAR EN CASCADA,
  RESTRICCIÓN `goles_ibfk_2` CLAVE FORÁNEA (`jugador_id`) REFERENCIAS `jugadores` (`id`) AL ELIMINAR ESTABLECER NULL AL ACTUALIZAR EN CASCADA,
  RESTRICCIÓN `goles_ibfk_3` CLAVE FORÁNEA (`equipo_id`) REFERENCIAS `equipos` (`id`) AL ELIMINAR ESTABLECER NULL AL ACTUALIZAR EN CASCADA
) MOTOR=InnoDB AUTO_INCREMENT=28 CONJUNTO DE CARACTERES PREDETERMINADO=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 ESTABLECER character_set_client = @saved_cs_client */;

--
-- Volcando datos para la tabla `goles`
--

BLOQUEAR TABLAS `goles` ESCRIBIR;
/*!40000 ALTER TABLE `goles` DISABLE KEYS */;
INSERT INTO `goles` VALUES (1,1,9,'Golazo de cabeza',3,1,0,1),(2,1,19,'Carambola',11,1,1,2),(3,1,45,'Zurdazo impresionantes',11,1,2,2),(4,1,90,'De penalti',8,2,2,1),(5,2,9,'Golazo de cabeza',20,1,0,3),(6,2,19,'Carambola',26,2,0,3),(7,2,45,'Zurdazo impresionantes',25,3,0,3),(8,3,9,'Golazo de cabeza',38,0,1,6),(9,3,19,'Carambola',40,0,2,6),(10,3,45,'Zurdazo Impresionantes',42,0,3,6),(11,4,9,'Golazo de cabeza',4,1,0,1),(12,4,19,'Carambola',8,2,0,1),(13,5,9,'Golazo de cabeza',11,1,0,2),(14,5,19,'Carambola',17,2,0,2),(15,5,45,'Carambola',16,3,0,2),(16,5,65,'Centro y remate',26,3,1,4),(17,6,9,'Golazo de cabeza',20,1,0,3),(18,7,30,'Golazo de cabeza',12,1,0,2),(19,7,32,'Carambola',17,13,2,2),(20,7,55,'Carambola',21,2,1,3),(21,8,13,'Golazo de cabeza',28,1,0,4),(22,8,20,'Carambola',29,2,0,4),(23,8,65,'Carambola',31,2,1,5),(24,8,90,'Centro y remate',34,2,2,5),(25,9,13,'Golazo de cabeza',11,1,0,2),(26,9,20,'Carambola',21,1,1,3),(27,9,65,'Carambola',22,1,2,3);
/*!40000 ALTER TABLE `goles` ENABLE KEYS */;
DESBLOQUEAR TABLAS;

--
-- Estructura de mesa para mesa `jugadores`
--

ELIMINAR TABLA SI EXISTE `jugadores`;
/*!40101 ESTABLECER @saved_cs_client = @@character_set_client */;
/*!40101 ESTABLECER character_set_client = utf8 */;
CREAR TABLA `jugadores` (
  `id` int(10) sin signo NO NULO AUTO_INCREMENTO,
  `nombre` varchar(50) NOT NULL,
  `puesto` varchar(50) DEFAULT NULL,
  `fecha_nac` fecha PREDETERMINADO NULO,
  `nacionalidad` varchar(40) DEFAULT NULL,
  `equipo_id` int(10) sin signo PREDETERMINADO NULO,
  CLAVE PRIMARIA (`id`),
  CLAVE `equipo_id` (`equipo_id`),
  RESTRICCIÓN `jugadores_ibfk_1` CLAVE FORÁNEA (`equipo_id`) REFERENCIAS `equipos` (`id`) AL ELIMINAR ESTABLECER NULL AL ACTUALIZAR CASCADA
) MOTOR=InnoDB AUTO_INCREMENT=45 CONJUNTO DE CARACTERES PREDETERMINADO=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 ESTABLECER character_set_client = @saved_cs_client */;

--
-- Volcado de datos para tabla `jugadores`
--

BLOQUEAR TABLAS `jugadores` ESCRIBIR;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES (1,'Thibaut Courtois','Portero','1962-05-11','Bélgica',1),(2,'Dani Carvajal','Defensa','1992-04-01','España',1),(3,'Sergio Ramos','Defensa','1990-02-02','España',1),(4,'Raphael Varane','Defensa','1995-01-05','Francia',1),(5,'Toni Kroos','Centrocampista','1990-05-02','Alemania',1),(6,'Marco Asensio','Delantero','1998-05-03','España',1),(7,'Rodrygo Va','Delantero','2000-11-01','Brasil',1),(8,'Vinicius','Delantero','2000-03-12','Brasil',1),(9,'Éder Militão','Defensa','1999-11-03','Brasil',1),(10,'Lionel Messi','Delantero','1987-04-01','Argentina',2),(11,'Gerard Piqué','Defensa','1987-02-02','España',2),(12,'Sergio Busquets','Centrocampista','1988-01-05','España',2),(13,'Jordi Alba','Defensa','1989-05-02','España',2),(14,'Frenkie de Jong','Centrocampista','1997-05-03','Holanda',2),(15,'Pedri','Centrocampista','2002-11-01','España',2),(16,'Ousmane Dembélé','Delantero','1997-03-12','Francia',2),(17,'Marc-André ter Stegen','Portero','1992-11-03','Alemania',2),(18,'Jan Oblak','Portero','1993-05-03','Eslovenia',3),(19,'José María Giménez','Defensa','1995-11-01','México',3),(20,'Mario Hermoso','Defensa','1195-03-12','España',3),(21,'Marcos Llorente ','Centrocampista','1995-11-03','España',3),(22,'Koke ','Centrocampista ','1992-11-01','España',3),(23,'Saúl Ñíguez','Centrocampista','1994-03-12','España',3),(24,'Ángel Correa','Delantero','1987-11-03','Argentina',3),(25,'José Gayà','Defensa','1195-05-03','España',4),(26,'Toni Lato','Defensa','1997-11-01','España',4),(27,'Hugo Guillamón','Defensa','2000-03-12','España',4),(28,'Carlos Soler','Centrocampista','1997-11-03','España',4),(29,'Jasper Cillessen','Portero ','1989-11-01','Holanda',4),(30,'Yassine Bounou','Portero','1989-05-03','Marruecos',5),(31,'Jesús Navas','Delantero','1985-11-01','España',5),(32,'Joan Jordan','Centrocampista','1994-03-12','España',5),(33,'Ivan Rakitic','Centrocampista','1988-11-03','Croacia',5),(34,'Nemanja Gudelj','Defensa','1991-11-01','Serbia',5),(35,'Suso','Delantero','1993-11-01','España',5),(36,'Youssef En-Nesyri','Delantero','1997-11-01','Marruecos',5),(37,'Juan Miranda','Defensa','2000-05-03','España',6),(38,'Álex Moreno','Defensa','1993-11-01','España',6),(39,'Andrés Guardado','Centrocampista','1986-03-12','México',6),(40,'Guido Rodríguez','Centrocampista','1994-11-03','Argentina',6),(41,'William Carvalho','Centrocampista','1992-11-01','Portugal',6),(42,'Nabil Fekir','Delantero','1993-11-01','Francia',6),(43,'Sergio Canales','Delantero','1991-11-01','España',6),(44,'Joaquín ','Delantero','1981-11-01','España',6);
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
DESBLOQUEAR TABLAS;

--
-- Estructura de la tabla `partidos`
--

ELIMINAR TABLA SI EXISTE `partidos`;
/*!40101 ESTABLECER @saved_cs_client = @@character_set_client */;
/*!40101 ESTABLECER character_set_client = utf8 */;
CREAR TABLA `partidos` (
  `id` int(10) sin signo NO NULO AUTO_INCREMENTO,
  `jornada` tinyint(3) unsigned DEFAULT NULL,
  `equipo_casa_id` int(10) sin signo PREDETERMINADO NULO,
  `equipo_fuera_id` int(10) sin signo PREDETERMINADO NULO,
  `fecha` marca de tiempo NO NULO PREDETERMINADO current_timestamp(),
  `goles_casa` smallint(6) PREDETERMINADO NULL,
  `goles_fuera` smallint(6) DEFAULT NULL,
  texto `observaciones` DEFAULT NULL,
  CLAVE PRIMARIA (`id`),
  CLAVE `equipo_casa_id` (`equipo_casa_id`),
  CLAVE `equipo_fuera_id` (`equipo_fuera_id`),
  RESTRICCIÓN `partidos_ibfk_1` CLAVE EXTRANJERA (`equipo_casa_id`) REFERENCIAS `equipos` (`id`) EN ACTUALIZACIÓN EN CASCADA,
  RESTRICCIÓN `partidos_ibfk_2` CLAVE EXTRANJERA (`equipo_fuera_id`) REFERENCIAS `equipos` (`id`) EN ACTUALIZACIÓN EN CASCADA,
  RESTRICCIÓN `partidos_ck` CHECK (`equipo_casa_id` <> `equipo_fuera_id`)
) MOTOR=InnoDB AUTO_INCREMENT=10 CONJUNTO DE CARACTERES PREDETERMINADO=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 ESTABLECER character_set_client = @saved_cs_client */;

--
-- Volcando datos para la tabla `partidos`
--

BLOQUEAR TABLAS `partidos` ESCRIBIR;
/*!40000 ALTER TABLE `partidos` DISABLE KEYS */;
INSERT INTO `partidos` VALUES (1,1,1,2,'2023-10-08 18:00:00',1,2,'Se aplazó al día siguiente'),(2,1,3,4,'2023-10-08 19:00:00',2,0,'4 penaltis para el equipo de casa'),(3,1,5,6,'2023-10-08 16:00:00',4,2,'Se inundó el vestuario de billetes de 500 €'),(4,2,1,5,'2023-10-15 17:00:00',0,2,'Las abejas no dejaron de picar al árbitro'),(5,2,2,4,'2023-10-15 18:00:00',0,0,'Un rayo se cargó la pelota'),(6,2,3,6,'2023-10-15 19:00:00',2,2,'Los jugadores estaban algo distraidos'),(7,3,1,6,'2023-10-15 17:00:00',0,2,'Las abejas no dejaron de picar al árbitro'),(8,3,4,5,'2023-10-15 18:00:00',0,0,'Un rayo se cargó la pelota'),(9,3,2,3,'2023-10-15 19:00:00',2,2,'Los jugadores estaban algo distraidos');
/*!40000 ALTER TABLE `partidos` HABILITAR TECLAS */;
DESBLOQUEAR TABLAS;
/*!40103 ESTABLECER ZONA_HORARIA=@ZONA_HORARIA_ANTIGUA */;

/*!40101 ESTABLECER SQL_MODE=@OLD_SQL_MODE */;
/*!40014 ESTABLECER COMPROBACIONES_DE_CLAVE_EXTRANJERA=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 ESTABLECER UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 ESTABLECER CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 ESTABLECER CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 ESTABLECER COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 ESTABLECER SQL_NOTES=@OLD_SQL_NOTES */;

-- Volcado completado el 14/05/2023 a las 21:18:10