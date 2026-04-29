-- Ejercicio 5.4 TEMA5
-- ÓSCAR AMAYA

DROP TABLE IF EXISTS tipos_datos_string;

CREATE TABLE IF NOT EXISTS tipos_datos_string (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_postal VARCHAR(10),
    telefono VARCHAR(20), 
    apellidos VARCHAR(100),
    nombre VARCHAR(100),
    nombre_acronimo VARCHAR(20),
    historial TEXT,
    direccion VARCHAR(255),
    provincia VARCHAR(100),
    observaciones TEXT, 
    contenido_libro LONGTEXT,
    categoria ENUM('Primera', 'Segunda', 'Tercera', 'Regional'),
    created_at DATETIME,
    updated_at DATETIME
);

INSERT INTO tipos_datos
(id, codigo_postal, telefono, apellidos, nombre, nombre_acronimo, historial, direccion, provincia, observaciones, contenido_libro, categoria, created_at, updated_at)
VALUES
(1, '28001', '+34 600123456', 'Garcia Lopez', 'Juan', 'JGL',
 'Paciente sin alergias conocidas.',
 'Calle Mayor 10', 'Madrid',
 'Alumno participativo y responsable.',
 'Erase una vez un libro con muchas historias interesantes...',
 'Primera',
 '2024-01-10 09:30:00', '2024-01-10 09:30:00'),

(2, '08015', '+34 611987654', 'Martínez Pérez', 'Ana', 'AMP',
 'Historial con tratamiento previo.',
 'Avenida Diagonal 200', 'Barcelona',
 'Necesita mejorar la puntualidad.',
 'Este libro contiene conocimientos avanzados de programación.',
 'Segunda',
 '2024-02-15 12:00:00', '2024-02-20 18:45:00'),

(3, '41005', '+34 622456789', 'Ruiz Sánchez', 'Carlos', 'CRS',
 'Paciente con antecedentes familiares.',
 'Calle Sevilla 45', 'Sevilla',
 'Buen rendimiento académico.',
 'Manual completo sobre historia contemporánea.',
 'Regional',
 '2024-03-01 08:15:00', '2024-03-05 10:00:00');
SELECT * FROM tipos_datos;

