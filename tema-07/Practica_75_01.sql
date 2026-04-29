-- PRACTICA 75_01
-- bLOQUE DE TABLAS

use geslibros;

-- 1 creo usuarios

CREATE USER ubrique_01@localhost identified by 'ubrique_01';
CREATE USER arcos_01@localhost identified by 'arcos_01';

GRANT ALL PRIVILEGES ON *.* TO ubrique_01@localhost, arcos_01@localhost;

SELECT 
    *
FROM
    mysql.user;