CREATE DATABASE attendance;

\c databaseName --conectarse a la base de datos

CREATE TABLE Administrador (
  admin_id VARCHAR(50),
  sede_id VARCHAR(50),
  nombre VARCHAR(50),
  contrasena VARCHAR(50),
  PRIMARY KEY (admin_id)--,
  --FOREIGN KEY (sede_id)
      --REFERENCES Sede (sede_id)
);




--push 18

CREATE TABLE Sede (
  identificacion VARCHAR(50),
  nombre VARCHAR(50),
  direccion VARCHAR(50),
  ciudad VARCHAR(50),
  PRIMARY KEY (identificacion)
);

INSERT INTO Sede (identificacion,nombre,direccion,ciudad)
VALUES
  ('1','Cali','Carrera 56A No. 51 - 81','Cali'),
  ('2','Popayán','Mayerlin Fergusson','Popayán'),
  ('3','Popayán Norte','Carrera 56A No. 51 - 81','Popayán');

\d Sede
SELECT * FROM Sede;

ALTER TABLE Administrador 
ADD CONSTRAINT fk_Administrator 
FOREIGN KEY (sede_id) 
REFERENCES Sede (identificacion);


\d Administrador

--error, no unicidad: solucion: añadir como pk a sede_id tambien.
INSERT INTO Administrador (admin_id,sede_id,nombre,contrasena)
VALUES
  ('1456','3','Carlos Hernández','12345'),
  ('3456','2','Mayerlin Fergusson','12345'),
  ('1456','1','Carlos Hernández','12345');

DROP TABLE Administrador;--elimino la tabla

CREATE TABLE Administrador (
  admin_id VARCHAR(50),
  sede_id VARCHAR(50),
  nombre VARCHAR(50),
  contrasena VARCHAR(50),
  PRIMARY KEY (admin_id,sede_id)
);

SELECT * FROM Administrador;

INSERT INTO Administrador (admin_id,sede_id,nombre,contrasena)
VALUES
  ('1456','3','Carlos Hernández','12345'),
  ('3456','2','Mayerlin Fergusson','12345'),
  ('1456','1','Carlos Hernández','12345');

ALTER TABLE Administrador 
ADD CONSTRAINT fk_Administrator 
FOREIGN KEY (sede_id) 
REFERENCES Sede (identificacion);

SELECT * FROM Administrador;

-- a este punto se crearon las tablas administrador y sede, cada una con su llave primaria y llave foranea.