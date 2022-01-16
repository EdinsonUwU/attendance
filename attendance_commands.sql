CREATE DATABASE attendance;
\ c databaseName --conectarse a la base de datos
CREATE TABLE Administrador (
  admin_id VARCHAR(50),
  sede_id VARCHAR(50),
  nombre VARCHAR(50),
  contrasena VARCHAR(50),
  PRIMARY KEY (admin_id) --,
  --FOREIGN KEY (sede_id)
  --REFERENCES Sede (sede_id)
);
CREATE TABLE Sede (
  identificacion VARCHAR(50),
  nombre VARCHAR(50),
  direccion VARCHAR(50),
  ciudad VARCHAR(50),
  PRIMARY KEY (identificacion)
);
ALTER TABLE Administrador
ADD CONSTRAINT fk_Administrator FOREIGN KEY (sede_id) REFERENCES Sede (identificacion);
INSERT INTO Sede (identificacion, nombre, direccion, ciudad)
VALUES ('1', 'Cali', 'Carrera 56A No. 51 - 81', 'Cali'),
  ('2', 'Popayán', 'Mayerlin Fergusson', 'Popayán'),
  (
    '3',
    'Popayán Norte',
    'Carrera 56A No. 51 - 81',
    'Popayán'
  );
\ d Sede
SELECT *
FROM Sede;
\ d Administrador --error, no unicidad: solucion: añadir como pk a sede_id tambien.
INSERT INTO Administrador (admin_id, sede_id, nombre, contrasena)
VALUES ('1456', '3', 'Carlos Hernández', '12345'),
  ('3456', '2', 'Mayerlin Fergusson', '12345'),
  ('1456', '1', 'Carlos Hernández', '12345');
DROP TABLE Administrador;
--elimino la tabla
CREATE TABLE Administrador (
  admin_id VARCHAR(50),
  sede_id VARCHAR(50),
  nombre VARCHAR(50),
  contrasena VARCHAR(50),
  PRIMARY KEY (admin_id, sede_id)
);
SELECT *
FROM Administrador;
INSERT INTO Administrador (admin_id, sede_id, nombre, contrasena)
VALUES ('1456', '3', 'Carlos Hernández', '12345'),
  ('3456', '2', 'Mayerlin Fergusson', '12345'),
  ('1456', '1', 'Carlos Hernández', '12345');
ALTER TABLE Administrador
ADD CONSTRAINT fk_Administrator FOREIGN KEY (sede_id) REFERENCES Sede (identificacion);
SELECT *
FROM Administrador;
CREATE TABLE Persona (
  codigo VARCHAR(50),
  nombre VARCHAR(50),
  direccion VARCHAR(50),
  ciudad VARCHAR(50),
  PRIMARY KEY (id),
);
INSERT INTO Persona (codigo, nombre, direccion, ciudad)
VALUES ('10', 'Noah Moreira', 'Calle 10 # 5-51', 'Popayán'),
  (
    '12',
    'Adrian Caceres',
    'Calle 53 No 10-60/46',
    'Popayán'
  ),
  ('13', 'Erica Galiano', 'Calle 9 # 9 – 62', 'Cali'),
  ('33', 'Caicedo Monte', 'Calle 100 # 11B-27', 'Cali'),
  (
    '34',
    'Miguel Ruiz',
    'Carrera 20 B # 29-18.',
    'Cali'
  ),
  (
    '35',
    'Alma Cristina',
    'Calle 53 No 10-60/46',
    'Cali'
  );
CREATE TABLE Asiste (
  asistencia_id VARCHAR(50),
  sede_id VARCHAR(50),
  persona_id VARCHAR(50),
  fecha_hora timestamp,
  PRIMARY KEY (asistencia_id),
);
ALTER TABLE Asiste
ADD CONSTRAINT fk_asiste FOREIGN KEY (sede_id) REFERENCES Sede (identificacion);
ALTER TABLE Asiste
ADD CONSTRAINT fk_persona FOREIGN KEY (persona_id) REFERENCES Persona (codigo);
INSERT INTO Asiste (asistencia_id, sede_id, persona_id, fecha_hora)
VALUES ('1', '3', '10', '2022/01/15 8:00:00'),
  ('2', '2', '12', '2022/01/10 8:00:00'),
  ('3', '1', '13', '2022/01/15 10:00:00');
-- a este punto se crearon las tablas administrador y sede, cada una con su llave primaria y llave foranea.
--creo tabla personal y meto los registros
CREATE TABLE Personal (
  codigo VARCHAR(50),
  arl VARCHAR(50),
  profesor ? BOOLEAN,
  salario: INT,
  eps VARCHAR(50),
  trabajo_misional ? BOOLEAN,
  PRIMARY KEY (codigo)
);
ALTER TABLE Personal
ADD CONSTRAINT fk_personal FOREIGN KEY (codigo) REFERENCES Persona (codigo);
INSERT INTO Personal (
    codigo,
    arl,
    profesor ?,
    salario,
    eps,
    trabajo_misional ?
  )
VALUES ('10', 'Gr.empre.occ.', FALSE, 1000000, 'ADRES', FALSE),
  ('12', 'sura', TRUE, 2000000, 'AIC', TRUE),
  ('13', 'sura', FALSE, 1000040, 'AIC', FALSE);
--creo tabla estudiante y meto los registros
CREATE TABLE Estudiante(
  codigo VARCHAR(50),
  matricula_id VARCHAR(50),
  PRIMARY KEY (codigo)
);
ALTER TABLE Estudiante
ADD CONSTRAINT fk_estudiante_1 FOREIGN KEY (codigo) REFERENCES Persona (codigo);
ALTER TABLE Estudiante
ADD CONSTRAINT fk_estudiante_2 FOREIGN KEY (matricula_id) REFERENCES Matricula (matricula_id);
INSERT INTO Estudiante (codigo, matricula_id)
VALUES ('33', '500'),
  ('34', '501'),
  ('35', '502');
--creo tabla matricula y meto los registros
CREATE TABLE Matricula (
  matricula_id VARCHAR(50),
  curso_id VARCHAR(50),
  estudiante_id VARCHAR(50),
  PRIMARY KEY (matricula_id)
);
ALTER TABLE Matricula
ADD CONSTRAINT fk_curso FOREIGN KEY (curso_id) REFERENCES Curso (curso_id);
ALTER TABLE Matricula
ADD CONSTRAINT fk_estudiante FOREIGN KEY (estudiante_id) REFERENCES Estudiante (codigo);
INSERT INTO Matricula (matricula_id, curso_id, estudiante_id)
VALUES ('500', '100', '33'),
  (
    '501',
    '100',
    '34' ('502', '120', '35');
--creo tabla curso y meto los registros
CREATE TABLE Curso (
  curso_id VARCHAR(50),
  nombre VARCHAR(50),
  PRIMARY KEY (curso_id)
);
INSERT INTO Curso (curso_id, nombre)
VALUES ('100', 'Discretas'),
  ('120', 'BD'),
  ('140', 'FLP');