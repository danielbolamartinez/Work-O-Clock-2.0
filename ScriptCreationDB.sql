-- 1️⃣ Crear la base de datos
CREATE DATABASE IF NOT EXISTS workoclock
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE workoclock;

-- 2️⃣ Tabla de empleados
CREATE TABLE empleado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    contrasena_hashed VARCHAR(255) NOT NULL,
    fecha_alta DATETIME DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE
);

-- 3️⃣ Tabla de roles
CREATE TABLE rol (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
);

-- 4️⃣ Tabla intermedia Empleado-Rol (muchos a muchos)
CREATE TABLE empleado_rol (
    empleado_id INT NOT NULL,
    rol_id INT NOT NULL,
    PRIMARY KEY (empleado_id, rol_id),
    FOREIGN KEY (empleado_id) REFERENCES empleado(id) ON DELETE CASCADE,
    FOREIGN KEY (rol_id) REFERENCES rol(id) ON DELETE CASCADE
);

-- 5️⃣ Tabla de jornadas
CREATE TABLE jornada (
    id INT AUTO_INCREMENT PRIMARY KEY,
    empleado_id INT NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    dias_semana VARCHAR(50), -- ej: "Lunes-Viernes"
    FOREIGN KEY (empleado_id) REFERENCES empleado(id) ON DELETE CASCADE
);

-- 6️⃣ Tabla de fichajes
CREATE TABLE fichaje (
    id INT AUTO_INCREMENT PRIMARY KEY,
    empleado_id INT NOT NULL,
    tipo ENUM('ENTRADA','SALIDA') NOT NULL,
    fichaje DATETIME NOT NULL,
    latitud DECIMAL(10,7),
    longitud DECIMAL(10,7),
    FOREIGN KEY (empleado_id) REFERENCES empleado(id) ON DELETE CASCADE,
    INDEX idx_empleado_fichaje (empleado_id, fichaje)
);

-- 7️⃣ Tabla de auditoría
CREATE TABLE auditoria (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    empleado_id INT NOT NULL,
    accion VARCHAR(255) NOT NULL,
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (empleado_id) REFERENCES empleado(id) ON DELETE CASCADE
);

-- 8️⃣ Insertar roles iniciales
INSERT INTO rol (nombre, descripcion) VALUES
('ADMIN', 'Administrador del sistema'),
('USER', 'Empleado normal');
