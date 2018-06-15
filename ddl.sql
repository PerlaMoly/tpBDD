/* CREACION BASE DE DATOS */

CREATE DATABASE IF NOT EXISTS tp_bdd1_2018;
-- DROP DATABASE IF EXISTS tp_bdd1_2018;

/* USO DE BASE DE DATOS */

USE tp_bdd1_2018;

/* CREACION TABLAS */

CREATE TABLE persona (cod_persona int primary key auto_increment,
					  nombre varchar(25),
					  tipo varchar(13));

CREATE TABLE participante (cod_participante int primary key, 
						   fecha_nac date,
						   fecha_debut date,
                           tipo varchar(17));

CREATE TABLE autoridad (cod_autoridad int primary key,
						cod_tipo int);

CREATE TABLE tipo (cod_tipo int primary key auto_increment,
				   descripcion varchar(10));

CREATE TABLE jugador (cod_jugador int primary key,
					  cant_goles int, 
					  cod_pos int,
                      cod_equipo int);

CREATE TABLE director_tecnico (cod_dt int primary key,
							   anios_exp int,
                               cod_nac int);

CREATE TABLE posicion (cod_pos int primary key auto_increment,
						descripcion varchar(20));

CREATE TABLE nacionalidad (cod_nac int primary key auto_increment,
						   descripcion varchar(20));

CREATE TABLE autoridad_partido (cod_autoridad int,
								cod_partido int);

CREATE TABLE partido (cod_partido int primary key auto_increment,
					  fecha_hora datetime,
                      cod_fase int,
                      cod_estadio int,
                      cod_equipo1 int,
                      cod_equipo2 int,
                      gol_equipo1 int,
                      gol_equipo2 int);

CREATE TABLE fase (cod_fase int primary key auto_increment,
					descripcion varchar(20));

CREATE TABLE estadio (cod_estadio int primary key auto_increment,
						capacidad int,
                        cod_loc int,
                        descripcion varchar(30));

CREATE TABLE localidad (cod_loc int primary key auto_increment,
						descripcion varchar(30),
						cod_prov int);

CREATE TABLE provincia (cod_prov int primary key auto_increment,
						descripcion varchar(30));

CREATE TABLE equipo (cod_equipo int primary key auto_increment,
					 nombre varchar(30),
					 cod_grupo int);

CREATE TABLE grupo (cod_grupo int primary key auto_increment,
					 descripcion varchar(2));

/* FOREING KEYS */

ALTER TABLE participante ADD FOREIGN KEY (cod_participante)
REFERENCES persona (cod_persona);

ALTER TABLE autoridad ADD FOREIGN KEY (cod_autoridad)
REFERENCES persona (cod_persona);

ALTER TABLE autoridad ADD FOREIGN KEY (cod_tipo)
REFERENCES tipo (cod_tipo);

ALTER TABLE jugador ADD FOREIGN KEY (cod_jugador)
REFERENCES participante (cod_participante);

ALTER TABLE jugador ADD FOREIGN KEY (cod_pos)
REFERENCES posicion (cod_pos);

ALTER TABLE jugador ADD FOREIGN KEY (cod_equipo)
REFERENCES equipo (cod_equipo);

ALTER TABLE director_tecnico ADD FOREIGN KEY (cod_dt)
REFERENCES participante (cod_participante);

ALTER TABLE autoridad_partido ADD FOREIGN KEY (cod_autoridad)
REFERENCES autoridad (cod_autoridad);

ALTER TABLE autoridad_partido ADD FOREIGN KEY (cod_partido)
REFERENCES partido (cod_partido);

ALTER TABLE partido ADD FOREIGN KEY (cod_fase)
REFERENCES fase (cod_fase);

ALTER TABLE partido ADD FOREIGN KEY (cod_estadio)
REFERENCES estadio (cod_estadio);

ALTER TABLE partido ADD FOREIGN KEY (cod_equipo1)
REFERENCES equipo (cod_equipo);

ALTER TABLE partido ADD FOREIGN KEY (cod_equipo2)
REFERENCES equipo (cod_equipo);

ALTER TABLE estadio ADD FOREIGN KEY (cod_loc)
REFERENCES localidad (cod_loc);

ALTER TABLE localidad ADD FOREIGN KEY (cod_prov)
REFERENCES provincia (cod_prov);

