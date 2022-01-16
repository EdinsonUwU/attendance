CREATE DATABASE attendance;

\c databaseName --conectarse a la base de datos

CREATE TABLE [IF NOT EXISTS] table_name (
   column1 datatype(length) column_contraint,
   column2 datatype(length) column_contraint,
   column3 datatype(length) column_contraint,
   table_constraints
);

CREATE TABLE Administrador (
  admin_id VARCHAR(50),
  sede_id VARCHAR(50),
  nombre VARCHAR(50),
  contrasena VARCHAR(50),
  PRIMARY KEY (admin_id)
);

\d Administrador