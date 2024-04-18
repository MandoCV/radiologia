CREATE DEFINER=`root`@`localhost` TRIGGER `citas_AFTER_DELETE` AFTER DELETE ON `citas` FOR EACH ROW BEGIN
    DECLARE paciente_info VARCHAR(255);
    DECLARE medico_info VARCHAR(255);
    DECLARE tipo_estudio_nombre VARCHAR(100);
    DECLARE cita_info VARCHAR(255);

    -- Obtener información del paciente
    SET paciente_info = (SELECT CONCAT_WS(" ", p.Nombre, p.Primer_Apellido, p.Segundo_Apellido)
                         FROM personas p
                         WHERE p.id = OLD.paciente_id);

    -- Obtener información del médico
    SET medico_info = (SELECT CONCAT_WS(" ", m.Nombre, m.Primer_Apellido, m.Segundo_Apellido)
                       FROM personal_medico pm
                       JOIN personas m ON pm.Persona_ID = m.id
                       WHERE pm.Persona_ID = OLD.medico_id);

    -- Obtener el nombre del tipo de estudio
    SET tipo_estudio_nombre = (SELECT nombre FROM Estudios WHERE id = OLD.tipo_estudio_id);

    -- Componer la información completa de la cita eliminada para registro
    SET cita_info = CONCAT_WS(", ", CONCAT('Fecha: ', OLD.fecha), CONCAT('Hora: ', OLD.hora),
                              CONCAT('Paciente: ', paciente_info), CONCAT('Médico: ', medico_info),
                              CONCAT('Tipo de Estudio: ', tipo_estudio_nombre));

    -- Registrar en la bitácora la eliminación de una cita
    INSERT INTO bitacora VALUES (
       DEFAULT, 'Citas', USER(), 'DELETE',
       CONCAT_WS(" ", 'Se ha eliminado la CITA con el ID: ', OLD.id, ', Detalles: [', cita_info, ']'),
       NOW()
    );

END