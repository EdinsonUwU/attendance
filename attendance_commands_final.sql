CREATE DATABASE attendance;
\c attendance

CREATE TABLE Sede (
    identificacion VARCHAR(50),
    nombre VARCHAR(50),
    direccion VARCHAR(50),
    ciudad VARCHAR(50),
    PRIMARY KEY (identificacion)
);

CREATE TABLE Administrador (
    admin_id VARCHAR(50),
    sede_id VARCHAR(50),
    nombre VARCHAR(50),
    contrasena VARCHAR(50),
    PRIMARY KEY (admin_id, sede_id)
);

ALTER TABLE Administrador
ADD CONSTRAINT fk_Administrator FOREIGN KEY (sede_id) REFERENCES Sede (identificacion);

CREATE TABLE Persona (
    codigo VARCHAR(50),
    nombre VARCHAR(50),
    direccion VARCHAR(50),
    ciudad VARCHAR(50),
    PRIMARY KEY (codigo)
);

CREATE TABLE Asiste (
    asistencia_id VARCHAR(50),
    sede_id VARCHAR(50),
    persona_id VARCHAR(50),
    fecha_hora TIMESTAMP,
    PRIMARY KEY (asistencia_id)
);
ALTER TABLE Asiste
ADD CONSTRAINT fk_asiste_a FOREIGN KEY (sede_id) REFERENCES Sede (identificacion);
ALTER TABLE Asiste
ADD CONSTRAINT fk_persona_codigo FOREIGN KEY (persona_id) REFERENCES Persona (codigo);

CREATE TABLE Personal (
    codigo VARCHAR(50),
    arl VARCHAR(50),
    profesor BOOLEAN,
    salario INT,
    eps VARCHAR(50),
    trabajo_misional BOOLEAN,
    PRIMARY KEY (codigo)
);
ALTER TABLE Personal
ADD CONSTRAINT fk_personal FOREIGN KEY (codigo) REFERENCES Persona (codigo);

CREATE TABLE Estudiante(
    codigo VARCHAR(50),
    matricula_id VARCHAR(50),
    PRIMARY KEY (codigo)
);

CREATE TABLE Matricula (
    matricula_id VARCHAR(50),
    curso_id VARCHAR(50),
    PRIMARY KEY (matricula_id)
);

ALTER TABLE Estudiante
ADD CONSTRAINT fk_estudiante_1 FOREIGN KEY (codigo) REFERENCES Persona (codigo);
ALTER TABLE Estudiante
ADD CONSTRAINT fk_estudiante_2 FOREIGN KEY (matricula_id) REFERENCES Matricula (matricula_id);

CREATE TABLE Curso (
    curso_id VARCHAR(50),
    nombre VARCHAR(50),
    PRIMARY KEY (curso_id)
);

ALTER TABLE Matricula
ADD CONSTRAINT fk_curso FOREIGN KEY (curso_id) REFERENCES Curso (curso_id);

--fin creacion tables, inicia el insertado de resgistros
INSERT INTO Sede (identificacion, nombre, direccion, ciudad)
VALUES ('1', 'Cali', 'Carrera 56A No. 51 - 81', 'Cali'),
    ('2', 'Popayán', 'Mayerlin Fergusson', 'Popayán'),
    ('3','Popayán Norte','Carrera 56A No. 51 - 81','Popayán');

INSERT INTO Administrador (admin_id, sede_id, nombre, contrasena)
VALUES ('1456', '3', 'Carlos Hernández', '12345'),
    ('3456', '2', 'Mayerlin Fergusson', '12345'),
    ('1456', '1', 'Carlos Hernández', '12345');

INSERT INTO Persona (codigo, nombre, direccion, ciudad)
VALUES ('10','Noah Moreira','Calle 10 # 5-51','Popayán'),
    ('12','Adrian Caceres','Calle 53 No 10-60/46','Popayán'),
    ('13','Erica Galiano','Calle 9 # 9 – 62','Cali'),
    ('33','Caicedo Monte','Calle 100 # 11B-27','Cali'),
    ('34','Miguel Ruiz','Carrera 20 B # 29-18.','Cali'),
    ('35','Alma Cristina','Calle 53 No 10-60/46','Cali');

INSERT INTO Asiste (asistencia_id, sede_id, persona_id, fecha_hora)
VALUES ('1', '3', '10', '2022/01/15 8:00:00'),
    ('2', '2', '12', '2022/01/10 8:00:00'),
    ('3', '1', '13', '2022/01/15 10:00:00');

INSERT INTO Personal (codigo,arl,profesor,salario,eps,trabajo_misional)
VALUES ('10','Gr.empre.occ.',FALSE,1000000,'ADRES',FALSE),
    ('12', 'sura', TRUE, 2000000, 'AIC', TRUE),
    ('13', 'sura', FALSE, 1000040, 'AIC', FALSE);

INSERT INTO Curso (curso_id, nombre)
VALUES ('100', 'Discretas'),
    ('120', 'BD'),
    ('140', 'FLP');

INSERT INTO Matricula (matricula_id, curso_id)
VALUES ('500', '100'),
    ('501','100'),
    ('502', '120');

INSERT INTO Estudiante (codigo, matricula_id)
VALUES ('33', '500'),
    ('34', '501'),
    ('35', '502');
