\c parcial_1

--creo tabla curso y meto los registros
CREATE TABLE Curso (
  curso_id VARCHAR(50),
  nombre VARCHAR(50),
  PRIMARY KEY (curso_id)
);

INSERT INTO Curso (curso_id,nombre)
VALUES
  ('100','Discretas'),
  ('120','BD'),
  ('140','FLP');
