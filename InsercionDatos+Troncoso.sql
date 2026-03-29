USE CineDB;

-- Países
INSERT INTO Paises (nombre) VALUES 
('Japón'), 
('Estados Unidos'), 
('Argentina');

-- geneeros
INSERT INTO Generos (nombre) VALUES 
('Anime / Animación'), 
('Acción / Gaming'), 
('Documental Deportivo');

-- directores (con paises)
INSERT INTO Directores (nombre, id_pais) VALUES 
('Tetsurō Araki', 1),
('Shūhei Yabuta', 1),
('Simon McQuoid', 2),
('Federico Peretti', 3);

-- usuarios
INSERT INTO Usuarios (username, email, fecha_registro) VALUES 
('ErenJ', 'eren@libertad.com', '2026-01-15'),
('Thorfinn_K', 'thorfinn@peace.com', '2026-02-10'),
('GamerChubut', 'gamer_sur@email.com', '2026-03-01');

-- pelis 
INSERT INTO Peliculas (titulo, anio, duracion_minutos, id_genero, id_director) VALUES 
('Shingeki no Kyojin: Guren no Yumiya', 2014, 119, 1, 1),
('Vinland Saga: The Movie (Concept)', 2026, 130, 1, 2),
('Mortal Kombat', 2021, 110, 2, 3),
('River Plate: El Más Grande', 2019, 92, 3, 4);

-- Actores
INSERT INTO Actores (nombre, id_pais) VALUES 
('Yūki Kaji', 1),
('Yūto Uemura', 1),
('Joe Taslim', 2),
('Marcelo Gallardo', 3);

-- Repartoi
INSERT INTO Reparto (id_pelicula, id_actor, nombre_personaje) VALUES 
(1, 1, 'Eren Yeager'),
(2, 2, 'Thorfinn'),
(3, 3, 'Sub-Zero / Bi-Han'),
(4, 4, 'Él mismo');

-- resenias
INSERT INTO resenias (puntaje, comentario, fecha, id_usuario, id_pelicula) VALUES 
(5, 'Increíble animación y banda sonora.', '2026-03-20', 1, 1),
(5, 'Una historia de redención espectacular.', '2026-03-22', 2, 2),
(4, 'Muy buenas peleas, fiel al videojuego.', '2026-03-25', 3, 3),
(5, 'Emocionante revivir la final de Madrid.', '2026-03-28', 3, 4);