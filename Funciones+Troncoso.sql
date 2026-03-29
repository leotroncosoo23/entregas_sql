USE CineDB;

-- 1. Vistas
CREATE OR REPLACE VIEW vw_detalles_peliculas AS
SELECT 
    p.id_pelicula,
    p.titulo,
    p.anio,
    p.duracion_minutos,
    g.nombre AS genero,
    d.nombre AS director
FROM Peliculas p
JOIN Generos g ON p.id_genero = g.id_genero
JOIN Directores d ON p.id_director = d.id_director;


-- 2. FUNCIONES (FUNCTIONS)
DROP FUNCTION IF EXISTS fn_promedio_puntaje;
DELIMITER $$

CREATE FUNCTION fn_promedio_puntaje (p_id_pelicula INT) 
RETURNS DECIMAL(5,2)
READS SQL DATA
BEGIN
    DECLARE v_promedio DECIMAL(5,2);
    SELECT AVG(puntaje) INTO v_promedio 
    FROM Resenias 
    WHERE id_pelicula = p_id_pelicula;
    IF v_promedio IS NULL THEN
        SET v_promedio = 0;
    END IF;
    RETURN v_promedio;
END$$
DELIMITER ;

-- -----

DELIMITER $$

CREATE PROCEDURE sp_insertar_pelicula (
    IN p_titulo VARCHAR(150),
    IN p_anio INT,
    IN p_duracion INT,
    IN p_id_genero INT,
    IN p_id_director INT
)
BEGIN
    INSERT INTO Peliculas (titulo, anio, duracion_minutos, id_genero, id_director)
    VALUES (p_titulo, p_anio, p_duracion, p_id_genero, p_id_director);
        SELECT * FROM Peliculas ORDER BY anio DESC;
END$$

DELIMITER ;


-- 4. TRIGGERS

CREATE TABLE Log_Resenias (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    accion VARCHAR(50),
    id_resenia INT,
    usuario_db VARCHAR(100),
    fecha_hora DATETIME
);

DELIMITER $$

CREATE TRIGGER tr_after_insert_resenia
AFTER INSERT ON Resenias
FOR EACH ROW
BEGIN
    INSERT INTO Log_Resenias (accion, id_resenia, usuario_db, fecha_hora)
    VALUES ('NUEVA RESEÑA', NEW.id_resenia, USER(), NOW());
END$$

DELIMITER ;









