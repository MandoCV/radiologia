CREATE DEFINER=`root`@`localhost` TRIGGER `citas_AFTER_UPDATE` AFTER UPDATE ON `citas` FOR EACH ROW BEGIN
    DECLARE cita_info_old VARCHAR(255);
    DECLARE cita_info_new VARCHAR(255);
    DECLARE paciente_info_old VARCHAR(255);
    DECLARE paciente_info_new VARCHAR(255);
    DECLARE medico_info_old VARCHAR(255);
    DECLARE medico_info_new VARCHAR(255);
    DECLARE tipo_estudio_info_old VARCHAR(100);
    DECLARE tipo_estudio_info_new VARCHAR(100);

    -- Obtener información de la cita antes de la actualización
    SET paciente_info_old = (SELECT CONCAT_WS(" ", p.Nombre, p.Primer_Apellido, p.Segundo_Apellido)
                             FROM personas p
                             WHERE p.id = OLD.paciente_id);
    SET medico_info_old = (SELECT CONCAT_WS(" ", m.Nombre, m.Primer_Apellido, m.Segundo_Apellido)
                           FROM personal_medico pm
                           JOIN personas m ON pm.Persona_ID = m.id
                           WHERE pm.Persona_ID = OLD.medico_id);
    SET tipo_estudio_info_old = (SELECT nombre FROM Estudios WHERE id = OLD.tipo_estudio_id);
    SET cita_info_old = CONCAT_WS(", ", CONCAT('Fecha: ', OLD.fecha), CONCAT('Hora: ', OLD.hora), CONCAT('Paciente: ', paciente_info_old), CONCAT('Médico: ', medico_info_old), CONCAT('Tipo de Estudio: ', tipo_estudio_info_old));

    -- Obtener información de la cita después de la actualización
    SET paciente_info_new = (SELECT CONCAT_WS(" ", p.Nombre, p.Primer_Apellido, p.Segundo_Apellido)
                             FROM personas p
                             WHERE p.id = NEW.paciente_id);
    SET medico_info_new = (SELECT CONCAT_WS(" ", m.Nombre, m.Primer_Apellido, m.Segundo_Apellido)
                           FROM personal_medico pm
                           JOIN personas m ON pm.Persona_ID = m.id
                           WHERE pm.Persona_ID = NEW.medico_id);
    SET tipo_estudio_info_new = (SELECT nombre FROM Estudios WHERE id = NEW.tipo_estudio_id);
    SET cita_info_new = CONCAT_WS(", ", CONCAT('Fecha: ', NEW.fecha), CONCAT('Hora: ', NEW.hora), CONCAT('Paciente: ', paciente_info_new), CONCAT('Médico: ', medico_info_new), CONCAT('Tipo de Estudio: ', tipo_estudio_info_new));

    -- Registrar en la bitácora la actualización de una cita
    INSERT INTO bitacora VALUES (
       DEFAULT, 'Citas', USER(), 'UPDATE',
       CONCAT_WS(" ", 'Se ha actualizado la CITA con el ID: ', OLD.id,
                         ', Datos Antiguos: [', cita_info_old, ']',
                         ', Datos Nuevos: [', cita_info_new, ']'),
       NOW()
    );

END