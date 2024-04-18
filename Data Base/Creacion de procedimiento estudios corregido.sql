CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_estudios_radiologicos`(v_cantidad INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_tipo_estudio VARCHAR(100);
    DECLARE v_descripcion VARCHAR(500);
    
    WHILE i <= v_cantidad DO
    
        -- Elegir un tipo de estudio de forma aleatoria
        SET v_tipo_estudio = ELT(FLOOR(1 + (RAND() * 9)), 
            'Radiografía',
            'Tomografía Computarizada',
            'Imagen por Resonancia Magnética',
            'Ultrasonido',
            'Medicina Nuclear',
            'Gammagrafía',
            'Tomografía por Emisión de Positrones',
            'Mamografía',
            'Fluoroscopia',
            'Angiografía');
            
        SET v_descripcion = ELT(FLOOR(1 + (RAND() * 9)), 
            ('Utiliza radiación para crear imágenes de estructuras internas del cuerpo, especialmente huesos.'),
             'Combina múltiples imágenes de rayos X tomadas desde diferentes ángulos para producir imágenes en secciones transversales del cuerpo.',
             'Utiliza campos magnéticos y ondas de radio para crear imágenes detalladas de los órganos y tejidos del cuerpo.',
             'Emplea ondas sonoras de alta frecuencia para visualizar órganos y estructuras internas del cuerpo, útil en obstetricia y diagnósticos.',
             'Utiliza pequeñas cantidades de material radiactivo para diagnosticar o tratar enfermedades y evaluar la función de órganos específicos.',
             'Técnica de medicina nuclear que mide y crea imágenes de la actividad radiactiva en el cuerpo.',
			'Tipo de imagen de medicina nuclear que permite observar el funcionamiento metabólico de los tejidos.',
            'Radiografía de las mamas utilizada principalmente para la detección temprana del cáncer de mama.',
            'Técnica de imagenología que muestra un vídeo continuo de rayos X, útil para guiar procedimientos en tiempo real.',
             'Procedimiento de imagen que utiliza rayos X para visualizar los vasos sanguíneos tras la inyección de un medio de contraste.');
             
        -- Generar una fecha aleatoria para el estudio
        -- SET v_fecha_estudio = DATE_ADD(NOW(), INTERVAL FLOOR(-365 + (RAND() * 730)) DAY);
        
        -- Elegir un paciente de forma aleatoria
        -- SET v_id_paciente = FLOOR(1 + (RAND() * v_total_pacientes));
        
        -- Elegir un médico de forma aleatoria
       -- SET v_id_medico = FLOOR(1 + (RAND() * v_total_medicos));
        
        -- Insertar el registro en la tabla
        INSERT INTO estudios(nombre, descripcion)
        VALUES (v_tipo_estudio, v_descripcion);
        
        SET i = i + 1;
    END WHILE;
END