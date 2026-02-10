-- creo mi base de datos
DROP DATABASE IF EXISTS CineDB;
CREATE DATABASE CineDB;
USE CineDB;

-- genero mis tablas 
CREATE TABLE Paises (
    id_pais INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);


CREATE TABLE Generos (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);


CREATE TABLE Directores (
    id_director INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_pais INT,
    FOREIGN KEY (id_pais) REFERENCES Paises(id_pais)
);


CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    fecha_registro DATE
);
-- guardo numeros y doy referencias
CREATE TABLE Peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150),
    anio INT,
    duracion_minutos INT,
    id_genero INT,   
    id_director INT,  
    FOREIGN KEY (id_genero) REFERENCES Generos(id_genero),
    FOREIGN KEY (id_director) REFERENCES Directores(id_director)
);


CREATE TABLE Actores (
    id_actor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_pais INT,
    FOREIGN KEY (id_pais) REFERENCES Paises(id_pais)
);


CREATE TABLE Reparto (
    id_reparto INT AUTO_INCREMENT PRIMARY KEY,
    id_pelicula INT,
    id_actor INT,
    nombre_personaje VARCHAR(100), 
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula),
    FOREIGN KEY (id_actor) REFERENCES Actores(id_actor)
);


CREATE TABLE Resenias (
    id_resenia INT AUTO_INCREMENT PRIMARY KEY,
    puntaje INT,
    comentario VARCHAR(200),
    fecha DATE,
    id_usuario INT,
    id_pelicula INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula)
);