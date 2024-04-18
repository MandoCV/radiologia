CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agendar_cita_radiologia`(v_cantidad INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_fecha DATE;
    DECLARE v_hora TIME;
    DECLARE v_paciente_id INT UNSIGNED;
    DECLARE v_medico_id INT UNSIGNED;
    DECLARE v_tipo_estudio_id INT UNSIGNED;

    WHILE i <= v_cantidad DO
        -- Generar una fecha y hora aleatoria dentro del próximo mes
        SET v_fecha = DATE_ADD(CURDATE(), INTERVAL FLOOR(RAND() * 30) DAY);
        SET v_hora = MAKETIME(FLOOR(RAND() * 23), FLOOR(RAND() * 59), 0);

        -- Elegir un paciente, médico y tipo de estudio de forma aleatoria
        SELECT Persona_ID INTO v_paciente_id FROM pacientes ORDER BY RAND() LIMIT 1;
        SELECT Persona_ID INTO v_medico_id FROM personal_medico ORDER BY RAND() LIMIT 1;
        SELECT id INTO v_tipo_estudio_id FROM Estudios ORDER BY RAND() LIMIT 1;

        -- Llamar a la función existente para agendar la cita
        CALL AgendarCitaRadiologica(v_fecha, v_hora, v_paciente_id, v_medico_id, v_tipo_estudio_id);

        SET i = i + 1;
    END WHILE;
END