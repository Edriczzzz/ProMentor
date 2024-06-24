Use Promentor
-- Crear tabla de InformacionAsesoria
CREATE TABLE InformacionAsesoria (
  id_asesoria INT PRIMARY KEY IDENTITY(1,1),
  nombre_asesoria VARCHAR(50) NOT NULL,
  tema_asesoria VARCHAR(50) NOT NULL,
  descripcion_asesoria VARCHAR(255) NOT NULL,
  cupo_disponible INT NOT NULL,
  aula_asesoria VARCHAR(10) NOT NULL
);

-- Crear tabla de Grupo
CREATE TABLE Grupo (
  id_grupo INT PRIMARY KEY IDENTITY(1,1),
  grupo VARCHAR(10) NOT NULL
);

-- Crear tabla de UnidadAcademica
CREATE TABLE UnidadAcademica (
  id_unidadAcademica INT PRIMARY KEY IDENTITY(1,1),
  unidad_academica VARCHAR(50) NOT NULL
);

-- Crear tabla de Asesor
CREATE TABLE Asesor (
  boleta_asesor VARCHAR(10) PRIMARY KEY,
  nombre_asesor VARCHAR(50) NOT NULL,
  apellido_asesor VARCHAR(50) NOT NULL,
  descripcion VARCHAR(255) NOT NULL
);

-- Crear tabla de UnidadAprendizaje
CREATE TABLE UnidadAprendizaje (
  id_unidadAprendizaje INT PRIMARY KEY IDENTITY(1,1),
  unidad_aprendizaje VARCHAR(50) NOT NULL
);

-- Crear tabla de AsesoriaUsuario
CREATE TABLE AsesoriaUsuario (
  id_asesoriaUsuario INT PRIMARY KEY IDENTITY(1,1),
  calificacion_asesoria INT NOT NULL,
  hora_inicioAsesoria TIME NOT NULL,
  hora_finAsesoria TIME NOT NULL,
  id_asesoria INT NOT NULL,
  CONSTRAINT FK_InformacionAsesoria FOREIGN KEY (id_asesoria) REFERENCES InformacionAsesoria(id_asesoria)
);

-- Crear tabla de NotificacionAsesoria
CREATE TABLE NotificacionAsesoria (
  id_notificacionAsesoria INT PRIMARY KEY IDENTITY(1,1),
  fecha_notificacionAsesoria DATE NOT NULL,
  id_notificacion INT NOT NULL,
  id_asesoriaUsuario INT NOT NULL,
  CONSTRAINT FK_AsesoriaUsuario FOREIGN KEY (id_asesoriaUsuario) REFERENCES AsesoriaUsuario(id_asesoriaUsuario)
);

-- Crear tabla de Usuario
CREATE TABLE Usuario (
  boleta_usuario VARCHAR(10) PRIMARY KEY,
  password_usuario VARCHAR(30) NOT NULL,
  nombre_usuario VARCHAR(50) NOT NULL,
  apellido_usuario VARCHAR(50) NOT NULL,
  correo_usuario VARCHAR(50) NOT NULL,
  id_unidadAcademica INT NOT NULL,
  id_grupo INT NOT NULL,
  CONSTRAINT FK_UnidadAcademica FOREIGN KEY (id_unidadAcademica) REFERENCES UnidadAcademica(id_unidadAcademica),
  CONSTRAINT FK_Grupo FOREIGN KEY (id_grupo) REFERENCES Grupo(id_grupo)
);

-- Crear tabla de ListaAlumno
CREATE TABLE ListaAlumno (
  id_listaAlumno INT PRIMARY KEY IDENTITY(1,1),
  fecha_inicioAsesoria DATE NOT NULL,
  boleta_usuario VARCHAR(10) NOT NULL,
  id_asesoria INT NOT NULL,
  CONSTRAINT FK_Usuario_ListaAlumno FOREIGN KEY (boleta_usuario) REFERENCES Usuario(boleta_usuario) ON DELETE CASCADE,
  CONSTRAINT FK_InformacionAsesoria_Lista FOREIGN KEY (id_asesoria) REFERENCES InformacionAsesoria(id_asesoria)
);


-- Crear tabla de Calificaciones
CREATE TABLE Calificaciones (
  id_calificacion INT PRIMARY KEY IDENTITY(1,1),
  id_unidadAprendizaje INT NOT NULL,
  boleta_usuario VARCHAR(10) NOT NULL,
  boleta_asesor VARCHAR(10) NOT NULL,
  calificacion INT NOT NULL CHECK (calificacion BETWEEN 1 AND 10),
  numero_profesor VARCHAR(20) NOT NULL,
  CONSTRAINT FK_UnidadAprendizaje FOREIGN KEY (id_unidadAprendizaje) REFERENCES UnidadAprendizaje(id_unidadAprendizaje),
  -- Modificar la restricción FK_Usuario_Calificaciones en Calificaciones para ON DELETE CASCADE
 CONSTRAINT FK_Usuario_Calificaciones FOREIGN KEY (boleta_usuario) REFERENCES Usuario(boleta_usuario) ON DELETE CASCADE,  -- Luego la re-crea con ON DELETE CASCADE
 CONSTRAINT FK_Asesor FOREIGN KEY (boleta_asesor) REFERENCES Asesor(boleta_asesor)
);

-- SELECT DE LAS TABLAS SIN REGISTROS
SELECT * FROM InformacionAsesoria;
SELECT * FROM Grupo;
SELECT * FROM UnidadAcademica;
SELECT * FROM Asesor;
SELECT * FROM UnidadAprendizaje;
SELECT * FROM AsesoriaUsuario;
SELECT * FROM NotificacionAsesoria;
SELECT * FROM Usuario;
SELECT * FROM ListaAlumno;
SELECT * FROM Calificaciones;

---------------------------------------------------Registros-----------------------------------------------------
INSERT INTO InformacionAsesoria (nombre_asesoria, tema_asesoria, descripcion_asesoria, cupo_disponible, aula_asesoria) VALUES
('Redes de Computadoras', 'Protocolos de Comunicación', 'Estudio de los protocolos básicos de comunicación en redes.', 20, 'A101'),
('Programación Avanzada', 'Python para Redes', 'Uso de Python para la gestión y automatización de redes.', 25, 'B202'),
('Seguridad Informática', 'Criptografía', 'Introducción a la criptografía y su aplicación en la seguridad de la información.', 15, 'C303'),
('Sistemas Operativos', 'Linux', 'Administración y uso de sistemas operativos basados en Linux.', 18, 'D404'),
('Bases de Datos', 'SQL', 'Fundamentos y uso del lenguaje SQL para la gestión de bases de datos.', 22, 'E505'),
('Desarrollo Web', 'HTML y CSS', 'Introducción al desarrollo de páginas web con HTML y CSS.', 30, 'F606'),
('Redes Inalámbricas', 'Wi-Fi', 'Conceptos y configuración de redes inalámbricas Wi-Fi.', 28, 'G707'),
('Programación', 'JavaScript', 'Fundamentos de la programación en JavaScript.', 24, 'H808'),
('Administración de Servidores', 'Windows Server', 'Configuración y administración de servidores Windows.', 20, 'I909'),
('Telecomunicaciones', 'Tecnologías 5G', 'Estudio de las tecnologías y aplicaciones de las redes 5G.', 26, 'J101'),
('Seguridad en Redes', 'Firewalls', 'Implementación y configuración de firewalls en redes.', 25, 'K202'),
('IoT', 'Internet de las Cosas', 'Introducción al Internet de las Cosas y sus aplicaciones.', 20, 'L303'),
('Programación de Sistemas', 'C y C++', 'Desarrollo de software de sistemas utilizando C y C++.', 18, 'M404'),
('Administración de Redes', 'Cisco', 'Configuración de redes utilizando tecnologías y dispositivos Cisco.', 30, 'N505'),
('Ingeniería de Software', 'Metodologías Ágiles', 'Uso de metodologías ágiles en el desarrollo de software.', 15, 'O606'),
('Seguridad en la Nube', 'AWS', 'Implementación de seguridad en servicios de Amazon Web Services.', 25, 'P707'),
('Big Data', 'Hadoop', 'Introducción a las tecnologías Big Data y uso de Hadoop.', 28, 'Q808'),
('Inteligencia Artificial', 'Machine Learning', 'Fundamentos y aplicaciones del Machine Learning.', 22, 'R909'),
('Programación Móvil', 'Android', 'Desarrollo de aplicaciones móviles para Android.', 30, 'S101'),
('Virtualización', 'VMware', 'Implementación y gestión de entornos virtualizados con VMware.', 15, 'T202'),
('Redes de Computadoras II', 'IPv6', 'Transición y configuración de redes utilizando IPv6.', 18, 'U303'),
('Seguridad Informática Avanzada', 'Penetration Testing', 'Técnicas y herramientas para realizar pruebas de penetración.', 20, 'V404'),
('Programación para Redes', 'Sockets en Python', 'Desarrollo de aplicaciones de red utilizando sockets en Python.', 25, 'W505'),
('Computación en la Nube', 'Azure', 'Uso de servicios de Microsoft Azure para soluciones en la nube.', 20, 'X606'),
('Seguridad de Aplicaciones Web', 'OWASP', 'Mejores prácticas y herramientas para la seguridad de aplicaciones web según OWASP.', 18, 'Y707'),
('Blockchain', 'Tecnologías Blockchain', 'Introducción a las tecnologías blockchain y sus aplicaciones.', 30, 'Z808'),
('Redes Privadas Virtuales', 'VPN', 'Configuración y uso de redes privadas virtuales (VPN).', 15, 'A909'),
('Ingeniería de Software II', 'DevOps', 'Prácticas y herramientas DevOps para la integración continua.', 25, 'B101'),
('Computación Gráfica', 'OpenGL', 'Desarrollo de aplicaciones gráficas utilizando OpenGL.', 28, 'C202'),
('Sistemas Distribuidos', 'Microservicios', 'Arquitectura y desarrollo de sistemas distribuidos utilizando microservicios.', 22, 'D303');
INSERT INTO Grupo (grupo) VALUES
('Grupo A'),
('Grupo B'),
('Grupo C'),
('Grupo D'),
('Grupo E'),
('Grupo F'),
('Grupo G'),
('Grupo H'),
('Grupo I'),
('Grupo J'),
('Grupo K'),
('Grupo L'),
('Grupo M'),
('Grupo N'),
('Grupo O'),
('Grupo P'),
('Grupo Q'),
('Grupo R'),
('Grupo S'),
('Grupo T'),
('Grupo U'),
('Grupo V'),
('Grupo W'),
('Grupo X'),
('Grupo Y'),
('Grupo Z'),
('Grupo AA'),
('Grupo BB'),
('Grupo CC'),
('Grupo DD');
INSERT INTO UnidadAcademica (unidad_academica) VALUES
('Ingeniería en Telemática'),
('Ingeniería en Sistemas Computacionales'),
('Ingeniería Electrónica'),
('Ingeniería Mecatrónica'),
('Ingeniería Industrial'),
('Ingeniería Civil'),
('Ingeniería Mecánica'),
('Ingeniería Eléctrica'),
('Ingeniería en Energías Renovables'),
('Ingeniería Biomédica'),
('Ingeniería en Tecnologías de la Información'),
('Ingeniería en Telecomunicaciones'),
('Ingeniería en Software'),
('Ingeniería Química'),
('Ingeniería Ambiental'),
('Ingeniería en Alimentos'),
('Ingeniería en Materiales'),
('Ingeniería en Nanotecnología'),
('Ingeniería Geológica'),
('Ingeniería Petrolera'),
('Ingeniería Aeronáutica'),
('Ingeniería en Transporte'),
('Ingeniería Agrónoma'),
('Ingeniería Forestal'),
('Ingeniería Hidráulica'),
('Ingeniería en Minas'),
('Ingeniería Textil'),
('Ingeniería en Computación'),
('Ingeniería en Cibernética'),
('Ingeniería en Robótica');
INSERT INTO Asesor (boleta_asesor, nombre_asesor, apellido_asesor, descripcion) VALUES
('A0001', 'Juan', 'Pérez', 'Especialista en redes de computadoras y seguridad informática.'),
('A0002', 'María', 'García', 'Experta en programación en Python y desarrollo web.'),
('A0003', 'Luis', 'Martínez', 'Consultor en telecomunicaciones y tecnologías 5G.'),
('A0004', 'Ana', 'Rodríguez', 'Profesora de bases de datos y administración de sistemas.'),
('A0005', 'Carlos', 'López', 'Ingeniero de software con experiencia en metodologías ágiles.'),
('A0006', 'Elena', 'Hernández', 'Especialista en seguridad informática y criptografía.'),
('A0007', 'Jorge', 'González', 'Experto en sistemas operativos y virtualización.'),
('A0008', 'Laura', 'Sánchez', 'Desarrolladora de aplicaciones móviles y tecnologías IoT.'),
('A0009', 'Pedro', 'Ramírez', 'Consultor en big data y análisis de datos.'),
('A0010', 'Lucía', 'Cruz', 'Profesora de inteligencia artificial y machine learning.'),
('A0011', 'Miguel', 'Torres', 'Especialista en administración de redes y dispositivos Cisco.'),
('A0012', 'Sofía', 'Flores', 'Ingeniera en telecomunicaciones con enfoque en redes inalámbricas.'),
('A0013', 'Fernando', 'Jiménez', 'Experto en programación avanzada y desarrollo de sistemas.'),
('A0014', 'Isabel', 'Morales', 'Consultora en seguridad en la nube y servicios AWS.'),
('A0015', 'Ricardo', 'Ortiz', 'Ingeniero de software con experiencia en DevOps.'),
('A0016', 'Patricia', 'Gutiérrez', 'Profesora de computación gráfica y tecnologías de visualización.'),
('A0017', 'Héctor', 'Ramos', 'Especialista en seguridad de aplicaciones web y OWASP.'),
('A0018', 'Sandra', 'Ruiz', 'Consultora en blockchain y tecnologías distribuidas.'),
('A0019', 'Alberto', 'Muñoz', 'Ingeniero de redes con experiencia en IPv6 y VPN.'),
('A0020', 'Daniela', 'Paredes', 'Desarrolladora en sistemas distribuidos y microservicios.'),
('A0021', 'Raúl', 'Castillo', 'Experto en administración de servidores y sistemas operativos.'),
('A0022', 'Mónica', 'Vargas', 'Consultora en ingeniería de software y metodologías ágiles.'),
('A0023', 'Francisco', 'Delgado', 'Ingeniero en big data y análisis de datos.'),
('A0024', 'Gabriela', 'Ríos', 'Especialista en inteligencia artificial y machine learning.'),
('A0025', 'Tomás', 'Aguilar', 'Consultor en telecomunicaciones y redes 5G.'),
('A0026', 'Verónica', 'Mendoza', 'Desarrolladora en aplicaciones móviles y tecnologías IoT.'),
('A0027', 'Gustavo', 'Medina', 'Especialista en sistemas operativos y virtualización.'),
('A0028', 'Beatriz', 'Soto', 'Profesora de bases de datos y administración de sistemas.'),
('A0029', 'Eduardo', 'Peña', 'Ingeniero de software con experiencia en metodologías ágiles.'),
('A0030', 'Claudia', 'Navarro', 'Experta en seguridad informática y criptografía.');
INSERT INTO UnidadAprendizaje (unidad_aprendizaje) VALUES
('Protocolos de Comunicación'),
('Python para Redes'),
('Criptografía'),
('Linux'),
('SQL'),
('HTML y CSS'),
('Wi-Fi'),
('JavaScript'),
('Windows Server'),
('Tecnologías 5G'),
('Firewalls'),
('Internet de las Cosas'),
('C y C++'),
('Cisco'),
('Metodologías Ágiles'),
('AWS'),
('Hadoop'),
('Machine Learning'),
('Android'),
('VMware'),
('IPv6'),
('Penetration Testing'),
('Sockets en Python'),
('Azure'),
('OWASP'),
('Blockchain'),
('VPN'),
('DevOps'),
('OpenGL'),
('Microservicios');
INSERT INTO AsesoriaUsuario (calificacion_asesoria, hora_inicioAsesoria, hora_finAsesoria, id_asesoria) VALUES
(8, '09:00:00', '10:00:00', 1),
(9, '10:00:00', '11:00:00', 2),
(7, '11:00:00', '12:00:00', 3),
(10, '12:00:00', '13:00:00', 4),
(6, '13:00:00', '14:00:00', 5),
(8, '14:00:00', '15:00:00', 6),
(7, '15:00:00', '16:00:00', 7),
(9, '16:00:00', '17:00:00', 8),
(10, '17:00:00', '18:00:00', 9),
(8, '18:00:00', '19:00:00', 10),
(9, '09:00:00', '10:00:00', 11),
(7, '10:00:00', '11:00:00', 12),
(10, '11:00:00', '12:00:00', 13),
(6, '12:00:00', '13:00:00', 14),
(8, '13:00:00', '14:00:00', 15),
(7, '14:00:00', '15:00:00', 16),
(9, '15:00:00', '16:00:00', 17),
(10, '16:00:00', '17:00:00', 18),
(8, '17:00:00', '18:00:00', 19),
(9, '18:00:00', '19:00:00', 20),
(7, '09:00:00', '10:00:00', 21),
(10, '10:00:00', '11:00:00', 22),
(6, '11:00:00', '12:00:00', 23),
(8, '12:00:00', '13:00:00', 24),
(7, '13:00:00', '14:00:00', 25),
(9, '14:00:00', '15:00:00', 26),
(10, '15:00:00', '16:00:00', 27),
(8, '16:00:00', '17:00:00', 28),
(9, '17:00:00', '18:00:00', 29),
(7, '18:00:00', '19:00:00', 30);
INSERT INTO NotificacionAsesoria (fecha_notificacionAsesoria, id_notificacion, id_asesoriaUsuario) VALUES
('2024-06-01', 1, 1),
('2024-06-02', 2, 2),
('2024-06-03', 3, 3),
('2024-06-04', 4, 4),
('2024-06-05', 5, 5),
('2024-06-06', 6, 6),
('2024-06-07', 7, 7),
('2024-06-08', 8, 8),
('2024-06-09', 9, 9),
('2024-06-10', 10, 10),
('2024-06-11', 11, 11),
('2024-06-12', 12, 12),
('2024-06-13', 13, 13),
('2024-06-14', 14, 14),
('2024-06-15', 15, 15),
('2024-06-16', 16, 16),
('2024-06-17', 17, 17),
('2024-06-18', 18, 18),
('2024-06-19', 19, 19),
('2024-06-20', 20, 20),
('2024-06-21', 21, 21),
('2024-06-22', 22, 22),
('2024-06-23', 23, 23),
('2024-06-24', 24, 24),
('2024-06-25', 25, 25),
('2024-06-26', 26, 26),
('2024-06-27', 27, 27),
('2024-06-28', 28, 28),
('2024-06-29', 29, 29),
('2024-06-30', 30, 30);
INSERT INTO Usuario (boleta_usuario, password_usuario, nombre_usuario, apellido_usuario, correo_usuario, id_unidadAcademica, id_grupo)
VALUES
('U0001', 'password1', 'Juan', 'Pérez', 'juan.perez@example.com', 1, 1),
('U0002', 'password2', 'María', 'García', 'maria.garcia@example.com', 2, 2),
('U0003', 'password3', 'Carlos', 'Martínez', 'carlos.martinez@example.com', 3, 3),
('U0004', 'password4', 'Laura', 'Hernández', 'laura.hernandez@example.com', 4, 4),
('U0005', 'password5', 'Pedro', 'López', 'pedro.lopez@example.com', 5, 5),
('U0006', 'password6', 'Ana', 'Torres', 'ana.torres@example.com', 1, 2),
('U0007', 'password7', 'Javier', 'Díaz', 'javier.diaz@example.com', 2, 3),
('U0008', 'password8', 'Sofía', 'Jiménez', 'sofia.jimenez@example.com', 3, 4),
('U0009', 'password9', 'Diego', 'Gutiérrez', 'diego.gutierrez@example.com', 4, 5),
('U0010', 'password10', 'Mónica', 'Vázquez', 'monica.vazquez@example.com', 5, 1),
('U0011', 'password11', 'Raúl', 'Reyes', 'raul.reyes@example.com', 1, 3),
('U0012', 'password12', 'Lucía', 'Mendoza', 'lucia.mendoza@example.com', 2, 4),
('U0013', 'password13', 'Pablo', 'Castro', 'pablo.castro@example.com', 3, 5),
('U0014', 'password14', 'Elena', 'Ortega', 'elena.ortega@example.com', 4, 1),
('U0015', 'password15', 'Gonzalo', 'Sánchez', 'gonzalo.sanchez@example.com', 5, 2),
('U0016', 'password16', 'Valeria', 'Delgado', 'valeria.delgado@example.com', 1, 4),
('U0017', 'password17', 'Martín', 'Cruz', 'martin.cruz@example.com', 2, 5),
('U0018', 'password18', 'Luisa', 'Morales', 'luisa.morales@example.com', 3, 1),
('U0019', 'password19', 'Roberto', 'Núñez', 'roberto.nunez@example.com', 4, 2),
('U0020', 'password20', 'Paula', 'Rojas', 'paula.rojas@example.com', 5, 3),
('U0021', 'password21', 'Jorge', 'Guerrero', 'jorge.guerrero@example.com', 1, 5),
('U0022', 'password22', 'Carolina', 'Herrera', 'carolina.herrera@example.com', 2, 1),
('U0023', 'password23', 'Mateo', 'Cabrera', 'mateo.cabrera@example.com', 3, 2),
('U0024', 'password24', 'Renata', 'Pérez', 'renata.perez@example.com', 4, 3),
('U0025', 'password25', 'Héctor', 'Santana', 'hector.santana@example.com', 5, 4),
('U0026', 'password26', 'Alejandra', 'Cortés', 'alejandra.cortes@example.com', 1, 1),
('U0027', 'password27', 'Andrés', 'Vega', 'andres.vega@example.com', 2, 2),
('U0028', 'password28', 'Fernanda', 'Molina', 'fernanda.molina@example.com', 3, 3),
('U0029', 'password29', 'Gabriel', 'Ortiz', 'gabriel.ortiz@example.com', 4, 4),
('U0030', 'password30', 'Verónica', 'Guzmán', 'veronica.guzman@example.com', 5, 5);
INSERT INTO ListaAlumno (fecha_inicioAsesoria, boleta_usuario, id_asesoria) VALUES
('2024-06-01', 'U0001', 1),
('2024-06-02', 'U0002', 2),
('2024-06-03', 'U0003', 3),
('2024-06-04', 'U0004', 4),
('2024-06-05', 'U0005', 5),
('2024-06-06', 'U0006', 6),
('2024-06-07', 'U0007', 7),
('2024-06-08', 'U0008', 8),
('2024-06-09', 'U0009', 9),
('2024-06-10', 'U0010', 10),
('2024-06-11', 'U0011', 11),
('2024-06-12', 'U0012', 12),
('2024-06-13', 'U0013', 13),
('2024-06-14', 'U0014', 14),
('2024-06-15', 'U0015', 15),
('2024-06-16', 'U0016', 16),
('2024-06-17', 'U0017', 17),
('2024-06-18', 'U0018', 18),
('2024-06-19', 'U0019', 19),
('2024-06-20', 'U0020', 20),
('2024-06-21', 'U0021', 21),
('2024-06-22', 'U0022', 22),
('2024-06-23', 'U0023', 23),
('2024-06-24', 'U0024', 24),
('2024-06-25', 'U0025', 25),
('2024-06-26', 'U0026', 26),
('2024-06-27', 'U0027', 27),
('2024-06-28', 'U0028', 28),
('2024-06-29', 'U0029', 29),
('2024-06-30', 'U0030', 30);
INSERT INTO Calificaciones (id_unidadAprendizaje, boleta_usuario, boleta_asesor, calificacion, numero_profesor) VALUES
(1, 'U0001', 'A0001', 9, 'P001'),
(2, 'U0002', 'A0002', 8, 'P002'),
(3, 'U0003', 'A0003', 7, 'P003'),
(4, 'U0004', 'A0004', 10, 'P004'),
(5, 'U0005', 'A0005', 6, 'P005'),
(6, 'U0006', 'A0006', 8, 'P006'),
(7, 'U0007', 'A0007', 7, 'P007'),
(8, 'U0008', 'A0008', 9, 'P008'),
(9, 'U0009', 'A0009', 10, 'P009'),
(10, 'U0010', 'A0010', 8, 'P010'),
(11, 'U0011', 'A0011', 9, 'P011'),
(12, 'U0012', 'A0012', 7, 'P012'),
(13, 'U0013', 'A0013', 10, 'P013'),
(14, 'U0014', 'A0014', 6, 'P014'),
(15, 'U0015', 'A0015', 8, 'P015'),
(16, 'U0016', 'A0016', 7, 'P016'),
(17, 'U0017', 'A0017', 9, 'P017'),
(18, 'U0018', 'A0018', 10, 'P018'),
(19, 'U0019', 'A0019', 8, 'P019'),
(20, 'U0020', 'A0020', 9, 'P020'),
(21, 'U0021', 'A0021', 7, 'P021'),
(22, 'U0022', 'A0022', 10, 'P022'),
(23, 'U0023', 'A0023', 6, 'P023'),
(24, 'U0024', 'A0024', 8, 'P024'),
(25, 'U0025', 'A0025', 7, 'P025'),
(26, 'U0026', 'A0026', 9, 'P026'),
(27, 'U0027', 'A0027', 10, 'P027'),
(28, 'U0028', 'A0028', 8, 'P028'),
(29, 'U0029', 'A0029', 9, 'P029'),
(30, 'U0030', 'A0030', 7, 'P030');
--*******************************************************************  V  I  S  T  A  S  *********************************************************************--
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW VistaUsuariosConUnidadYGrupo AS
SELECT 
  U.boleta_usuario,
  U.nombre_usuario,
  U.apellido_usuario,
  U.correo_usuario,
  UA.unidad_academica,
  G.grupo
FROM 
  Usuario U
JOIN 
  UnidadAcademica UA ON U.id_unidadAcademica = UA.id_unidadAcademica
JOIN 
  Grupo G ON U.id_grupo = G.id_grupo;
SELECT * FROM VistaUsuariosConUnidadYGrupo	---VISTA DE USUARIOS CON SU UNIDAD ACADEMICA Y GRUPO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW VistaUsuariosConGrupoYAsesorias AS
SELECT 
  U.boleta_usuario,
  U.nombre_usuario,
  U.apellido_usuario,
  U.correo_usuario,
  G.grupo,
  IA.nombre_asesoria,
  IA.tema_asesoria,
  IA.descripcion_asesoria,
  IA.aula_asesoria,
  LA.fecha_inicioAsesoria
FROM 
  Usuario U
JOIN 
  Grupo G ON U.id_grupo = G.id_grupo
JOIN 
  ListaAlumno LA ON U.boleta_usuario = LA.boleta_usuario
JOIN 
  InformacionAsesoria IA ON LA.id_asesoria = IA.id_asesoria;
  
  SELECT * FROM VistaUsuariosConGrupoYAsesorias	--- VISTA USUARIOS CON GRUPO Y ASESORIAS
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW VistaAsesoriasDeUsuario AS
SELECT 
  U.boleta_usuario,
  U.nombre_usuario,
  U.apellido_usuario,
  IA.nombre_asesoria,
  IA.tema_asesoria,
  IA.descripcion_asesoria,
  IA.cupo_disponible,
  IA.aula_asesoria,
  LA.fecha_inicioAsesoria
FROM 
  Usuario U
JOIN 
  ListaAlumno LA ON U.boleta_usuario = LA.boleta_usuario
JOIN 
  InformacionAsesoria IA ON LA.id_asesoria = IA.id_asesoria;

    SELECT * FROM VistaAsesoriasDeUsuario WHERE boleta_usuario = 'U0003';		---VISTA DE ASESORIA Y USUARIO BUSCADO POR LA BOLETA

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER VIEW VistaDetalleUsuarioAsesorias
AS
SELECT
    U.boleta_usuario,
    U.nombre_usuario,
    IA.id_asesoria,
    IA.nombre_asesoria,
    IA.cupo_disponible,
    LA.fecha_inicioAsesoria
FROM
    Usuario U
INNER JOIN
    ListaAlumno LA ON U.boleta_usuario = LA.boleta_usuario
INNER JOIN
    InformacionAsesoria IA ON LA.id_asesoria = IA.id_asesoria;
	
	SELECT * FROM VistaDetalleUsuarioAsesorias; --VISTA DE ASESORIA Y USUARIO PARA APOYO EN PROCEDIMIENTO ALMACENADO
	-------------------------------------------------------------------------------------------------------------------------------------------------------------------

--*******************************************************************  F  I  N  V  *********************************************************************--

--*******************************************************************  T  R  I  G  G  E  R  S  *********************************************************************--
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----AUDITORIA DE CAMBIOS, ES NECESARIO QUE AGREGUEMOS UNA TABLA ADICIONAL PRA PODER VISUALIZAR LA INFORMACION
CREATE TABLE AuditoriaCambios (
    id_cambio INT PRIMARY KEY IDENTITY(1,1),
    tabla_afectada VARCHAR(100) NOT NULL,
    tipo_operacion VARCHAR(20) NOT NULL,
    fecha_operacion DATETIME NOT NULL,
);
---- AUDITORIA DE CAMBIOS EN LA TABLA USUARIOS
CREATE TRIGGER trg_AuditoriaUsuario
ON Usuario
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @tipo_operacion VARCHAR(20);

    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        SET @tipo_operacion = 'UPDATE';
    ELSE IF EXISTS (SELECT * FROM inserted)
        SET @tipo_operacion = 'INSERT';
    ELSE IF EXISTS (SELECT * FROM deleted)
        SET @tipo_operacion = 'DELETE';
    ELSE
        RETURN; -- No se hace nada si no hay cambios

    INSERT INTO AuditoriaCambios (tabla_afectada, tipo_operacion, fecha_operacion)
    VALUES ('Usuario', @tipo_operacion, GETDATE());
END;
SELECT * FROM AuditoriaCambios

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Crea disparador para evitar la eliminación de usuarios
CREATE TRIGGER Prevent_Delete_Usuario
ON Usuario
INSTEAD OF DELETE
AS
BEGIN
    RAISERROR('No está permitido eliminar usuarios.', 16, 1);
END;
-- Desactivar el disparador Prevent_Delete_Usuario
DISABLE TRIGGER Prevent_Delete_Usuario ON Usuario;

-- Habilitar nuevamente el disparador
ENABLE TRIGGER Prevent_Delete_Usuario ON Usuario;

-- Eliminar el usuario
DELETE FROM Usuario WHERE boleta_usuario = 'U0009';
SELECT * FROM VistaAsesoriasDeUsuario WHERE boleta_usuario = 'U0009';		---VISTA PARA BUSCAR USUARIO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Trigger que verifica que no se inscriban 2 alumnos en una misma asesoria y actualiza los cupos
CREATE OR ALTER TRIGGER trg_ActualizarCupoYVerificarDuplicado
ON ListaAlumno
AFTER INSERT, DELETE
AS
BEGIN
    DECLARE @id_asesoria INT;
    DECLARE @boleta_usuario VARCHAR(10);

    -- Verificar duplicados en el caso de una inserción
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        SELECT @id_asesoria = id_asesoria, @boleta_usuario = boleta_usuario FROM inserted;

        -- Verificar si el usuario ya está registrado en la misma asesoría
        IF EXISTS (
            SELECT 1
            FROM ListaAlumno
            WHERE id_asesoria = @id_asesoria AND boleta_usuario = @boleta_usuario AND id_listaAlumno <> (SELECT MAX(id_listaAlumno) FROM inserted)
        )
        BEGIN
            RAISERROR('El usuario ya está registrado en esta asesoría.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;
    END
    ELSE IF EXISTS (SELECT * FROM deleted)
    BEGIN
        SELECT @id_asesoria = id_asesoria FROM deleted;
    END

    -- Calcular el nuevo cupo disponible
    DECLARE @cupo_disponible INT;

    SELECT @cupo_disponible = cupo_disponible
    FROM InformacionAsesoria
    WHERE id_asesoria = @id_asesoria;

    -- Actualizar el campo cupo_disponible en InformacionAsesoria
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        -- Disminuir el cupo disponible si se inserta un nuevo registro
        UPDATE InformacionAsesoria
        SET cupo_disponible = @cupo_disponible - (SELECT COUNT(*) FROM inserted WHERE id_asesoria = @id_asesoria)
        WHERE id_asesoria = @id_asesoria;
    END
    ELSE IF EXISTS (SELECT * FROM deleted)
    BEGIN
        -- Aumentar el cupo disponible si se elimina un registro
        UPDATE InformacionAsesoria
        SET cupo_disponible = @cupo_disponible + (SELECT COUNT(*) FROM deleted WHERE id_asesoria = @id_asesoria)
        WHERE id_asesoria = @id_asesoria;
    END
END;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

--*******************************************************************  F  I  N  T  *********************************************************************--

--*******************************************************************  P  R  O  C  E  D  I  M  I  E  N  T  O  S  *********************************************************************--
CREATE PROCEDURE RegistrarUsuario
    @boleta_usuario VARCHAR(10),
    @password_usuario VARCHAR(30),
    @nombre_usuario VARCHAR(50),
    @apellido_usuario VARCHAR(50),
    @correo_usuario VARCHAR(50),
    @id_unidadAcademica INT,
    @id_grupo INT
AS
BEGIN
    -- Iniciar una transacción
    BEGIN TRANSACTION;
    
    -- Declarar una variable para almacenar errores
    DECLARE @ErrorMsg NVARCHAR(4000);

    -- Verificar si la unidad académica existe
    IF NOT EXISTS (SELECT 1 FROM UnidadAcademica WHERE id_unidadAcademica = @id_unidadAcademica)
    BEGIN
        SET @ErrorMsg = 'La unidad académica no existe.';
        RAISERROR (@ErrorMsg, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Verificar si el grupo existe
    IF NOT EXISTS (SELECT 1 FROM Grupo WHERE id_grupo = @id_grupo)
    BEGIN
        SET @ErrorMsg = 'El grupo no existe.';
        RAISERROR (@ErrorMsg, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Verificar si el usuario ya existe
    IF EXISTS (SELECT 1 FROM Usuario WHERE boleta_usuario = @boleta_usuario)
    BEGIN
        SET @ErrorMsg = 'El usuario con esa boleta ya existe.';
        RAISERROR (@ErrorMsg, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Insertar el nuevo usuario
    BEGIN
        INSERT INTO Usuario (boleta_usuario, password_usuario, nombre_usuario, apellido_usuario, correo_usuario, id_unidadAcademica, id_grupo)
        VALUES (@boleta_usuario, @password_usuario, @nombre_usuario, @apellido_usuario, @correo_usuario, @id_unidadAcademica, @id_grupo);
    END

    -- Confirmar la transacción
    COMMIT TRANSACTION;
END;

--Ejecucion del Procedimiento Almacenado (Registra Usuarios)
EXEC RegistrarUsuario 
    @boleta_usuario = 'U0000',
    @password_usuario = 'password123',
    @nombre_usuario = 'Alberto',
    @apellido_usuario = 'López',
    @correo_usuario = 'carlos.lopez@example.com',
    @id_unidadAcademica = 4,
    @id_grupo = 8;
	-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE RegistrarUsuarioEnAsesoria
    @boleta_usuario VARCHAR(10),
    @id_asesoria INT,
    @fecha_inicioAsesoria DATE
AS
BEGIN
    -- Verificar si el usuario existe
    IF NOT EXISTS (SELECT 1 FROM Usuario WHERE boleta_usuario = @boleta_usuario)
    BEGIN
        RAISERROR('El usuario especificado no existe.', 16, 1);
        RETURN;
    END;

    -- Verificar si la asesoría existe y tiene cupo disponible
    DECLARE @cupo_disponible INT;
    SELECT @cupo_disponible = cupo_disponible FROM InformacionAsesoria WHERE id_asesoria = @id_asesoria;

    IF @cupo_disponible <= 0
    BEGIN
        RAISERROR('La asesoría no tiene cupo disponible.', 16, 1);
        RETURN;
    END;

    -- Verificar si la combinación de id_asesoria y fecha_inicioAsesoria es válida
    IF NOT EXISTS (SELECT 1 FROM ListaAlumno WHERE id_asesoria = @id_asesoria AND fecha_inicioAsesoria = @fecha_inicioAsesoria)
    BEGIN
        RAISERROR('La combinación de id_asesoria y fecha_inicioAsesoria no coincide con los registros existentes.', 16, 1);
        RETURN;
    END;

    -- Insertar el registro en ListaAlumno
    INSERT INTO ListaAlumno (fecha_inicioAsesoria, boleta_usuario, id_asesoria)
    VALUES (@fecha_inicioAsesoria, @boleta_usuario, @id_asesoria);

    PRINT 'Usuario registrado exitosamente en la asesoría.';
END;

EXEC RegistrarUsuarioEnAsesoria
    @boleta_usuario = 'U000',
    @id_asesoria = 3,
    @fecha_inicioAsesoria = '2024-06-03';
	Select * from Usuario
	Select * from VistaDetalleUsuarioAsesorias		
	SELECT * FROM VistaAsesoriasDeUsuario WHERE boleta_usuario = 'U000';		---VISTA PARA BUSCAR USUARIO

	-------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Crea el procedimiento almacenado para eliminar un usuario
CREATE PROCEDURE spEliminarUsuario
    @boleta_usuario VARCHAR(10)
AS
BEGIN
    -- Comenzar la transacción
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Eliminar los registros relacionados en la tabla ListaAlumno
        DELETE FROM ListaAlumno
        WHERE boleta_usuario = @boleta_usuario;

        -- Eliminar los registros relacionados en la tabla Calificaciones
        DELETE FROM Calificaciones
        WHERE boleta_usuario = @boleta_usuario;

        -- Eliminar el usuario de la tabla Usuario
        DELETE FROM Usuario
        WHERE boleta_usuario = @boleta_usuario;

        -- Confirmar la transacción si todo ha salido bien
        COMMIT TRANSACTION;

        PRINT 'Usuario eliminado correctamente';
    END TRY
    BEGIN CATCH
        -- Revertir la transacción en caso de error
        ROLLBACK TRANSACTION;

        PRINT 'Error al eliminar el usuario';
    END CATCH
END;
EXEC spEliminarUsuario 'U0000';
SELECT * FROM Usuario;
-- Desactivar el disparador Prevent_Delete_Usuario
DISABLE TRIGGER Prevent_Delete_Usuario ON Usuario;

-- Habilitar nuevamente el disparador
ENABLE TRIGGER Prevent_Delete_Usuario ON Usuario;
SELECT * FROM Usuario
	-------------------------------------------------------------------------------------------------------------------------------------------------------------------

--*******************************************************************  F  I  N  P  *********************************************************************--
Use Promentor