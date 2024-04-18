CREATE DEFINER=`root`@`localhost` TRIGGER `Citas_AFTER_INSERT` AFTER INSERT ON `Citas`
FOR EACH ROW BEGIN
    -- Declarar variables para almacenar datos de las llaves foráneas
    DECLARE nombre_paciente VARCHAR(255);
    DECLARE nombre_medico VARCHAR(255);
    DECLARE descripcion_estudio VARCHAR(255);
    
    -- Obtener los nombres relacionados a partir de los ID
    SET nombre_paciente = (SELECT CONCAT_WS(" ", p.Nombre, p.Primer_Apellido, p.Segundo_Apellido)
                           FROM pacientes p
                           WHERE p.Persona_ID = NEW.paciente_id);
    SET nombre_medico = (SELECT CONCAT_WS(" ", pm.Nombre, pm.Primer_Apellido, pm.Segundo_Apellido)
                         FROM personal_medico pm
                         WHERE pm.Persona_ID = NEW.medico_id);
    SET descripcion_estudio = (SELECT e.Descripcion
                               FROM Estudios e
                               WHERE e.id = NEW.tipo_estudio_id);
    
    -- Registrar la inserción en la bitácora
    INSERT INTO bitacora VALUES (
       DEFAULT, 'Citas', USER(), 'INSERT',
       CONCAT_WS(" ", 'Se ha registrado una nueva CITA con el ID: ', NEW.id,
                         ', Fecha: ', NEW.fecha,
                         ', Hora: ', NEW.hora,
                         ', Paciente: ', nombre_paciente,
                         ', Médico: ', nombre_medico,
                         ', Estudio: ', descripcion_estudio),
       NOW()
    );
END;
