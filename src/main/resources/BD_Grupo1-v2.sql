CREATE DATABASE prevencion_riesgos;
USE prevencion_riesgos;

-- Tabla "Usuarios"
CREATE TABLE Usuarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  tipo ENUM('Cliente', 'Administrativo', 'Profesional') NOT NULL,
  pass VARCHAR(20) NOT NULL
);

-- Tabla "Capacitaciones"
CREATE TABLE Capacitaciones (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  detalle TEXT
);

-- Tabla "Visitas"
CREATE TABLE Visitas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  fecha_visita DATE,
  detalle TEXT,
  profesional_id INT,
  FOREIGN KEY (cliente_id) REFERENCES Usuarios(id),
  FOREIGN KEY (profesional_id) REFERENCES Usuarios(id)
);

-- Tabla "Chequeos"
CREATE TABLE Chequeos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  visita_id INT,
  detalle TEXT,
  estado ENUM('Pendiente', 'Completado'),
  FOREIGN KEY (visita_id) REFERENCES Visitas(id)
);

-- Tabla "Pagos"
CREATE TABLE Pagos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  monto DECIMAL(10,2),
  fecha_pago VARCHAR(45)
);

-- Tabla "Asesorias"
CREATE TABLE Asesorias (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  detalle TEXT,
  profesional_id INT,
  FOREIGN KEY (profesional_id) REFERENCES Usuarios(id)
);

-- Tabla "Accidentes"
CREATE TABLE Accidentes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  fecha_accidente DATE,
  detalle TEXT,
  FOREIGN KEY (cliente_id) REFERENCES Usuarios(id)
);

-- Tabla "Asistentes"
CREATE TABLE Asistentes (
  capacitacion_id INT,
  usuario_id INT,
  FOREIGN KEY (capacitacion_id) REFERENCES Capacitaciones(id),
  FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
  PRIMARY KEY (capacitacion_id, usuario_id)
);

-- INSERT
INSERT INTO `capacitaciones` VALUES (1,'Curso Full Stack Java','Curso de capacitación nivel desarrollador Java Full Stack Trainee.'),(2,'Curso Python 2023','Curso desarrollador Python trainee.'),(3,'Curso PHP','Curso PHP');
INSERT INTO `usuarios` VALUES (1,'userCliente','Cliente','1234'),(2,'userAdministrativo','Administrativo','1234'),(3,'userProfesional','Profesional','1234');
