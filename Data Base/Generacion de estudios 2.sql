CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_estudios_radiologia`(
    v_cantidad INT,
    v_tipo_estudio VARCHAR(50)
)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_fecha_estudio DATE;
    DECLARE v_fecha_actual DATE;
    DECLARE v_paciente_id INT;
    DECLARE v_medico_id INT;
    DECLARE v_descripcion VARCHAR(255);
    DECLARE v_resultado VARCHAR(1000);
    DECLARE v_nombre_estudio VARCHAR(100);

    -- Obtener la fecha actual
    SET v_fecha_actual = CURDATE();

    WHILE(i <= v_cantidad) DO
        -- Seleccionar un paciente y un médico de manera aleatoria de la base de datos
        -- Supongamos que las tablas se llaman pacientes y medicos respectivamente
        -- y que ambas tienen un campo id
        SET v_paciente_id = (SELECT id FROM pacientes ORDER BY RAND() LIMIT 1);
        SET v_medico_id = (SELECT id FROM medicos ORDER BY RAND() LIMIT 1);
        
        -- Asignar un tipo de estudio si no se proporcionó uno específico
        IF v_tipo_estudio IS NULL THEN
            SET v_nombre_estudio = ELT(RAND()*4+1, 'Radiografía', 'Tomografía', 'Resonancia Magnética', 'Ecografía');
        ELSE
            SET v_nombre_estudio = v_tipo_estudio;
        END IF;

        -- Generar una descripción y resultado aleatorio para el estudio
        -- Esto es solo un ejemplo simplificado. Se podrían generar descripciones más complejas y realistas.
        SET v_descripcion = CONCAT('Estudio de ', v_nombre_estudio, ' realizado sin incidencias destacables.');
        SET v_resultado = CONCAT('Resultado del estudio de ', v_nombre_estudio, ': Todo normal.');

        -- Generar una fecha para el estudio. Aquí simplemente usamos la fecha actual para simplificar
        SET v_fecha_estudio = v_fecha_actual;

        -- Insertar el estudio de radiología e imagen en la tabla correspondiente
			INSERT INTO Estudios (nombre, descripcion)
			VALUES (v_nombre_estudio, v_descripcion);


        SET i = i + 1;
    END WHILE;
END