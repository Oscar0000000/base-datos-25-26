-- Juego caracteres mysql
show character set;

-- Muestro las colecciones
show collation;

-- Crear base de datos ejemplo
create database ejemplo;

-- Crear la base de datos ejemplo solo si existe
create database if not exists ejemplo;

-- Crear la base de datos Banco Multilingue con UTF8
create database if not exists BANCO
character set utf8 collate utf8_general_ci;

-- Crear la Base de Datos BANCO para español con UTF8MB4
Create Database If Not Exists BANCO
Character Set Utf8mb4 Collate Utf8mb4_spanish_ci;

-- Crear la Base de Datos BANCO para español con LATIN1
CReate dAtabase iF nOt eXists bANCO
CHaracter sEt lAtin1 cOllate lAtin1_spanish_ci;

-- Crear la Base de Datos BANCO MultilingÜe con LATIN1
CREate daTabase if noT exIsts baNCO
CHAracter seT laTin1 coLlate laTin1_genearl_ci;

-- Opciones por defecto 
CREATE DATABASE IF NOT EXISTS geslibros
CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;


