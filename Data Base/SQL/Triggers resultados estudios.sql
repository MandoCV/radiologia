CREATE DEFINER=`root`@`localhost` TRIGGER `Resultados_Estudios_AFTER_INSERT` AFTER INSERT ON `resultados_estudios` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, 'resultados_estudios', USER(), 'INSERT',
       CONCAT_WS(" ", 'Se ha agregado un nuevo RESULTADO DE ESTUDIO con el ID:', NEW.id,
                         ', ID del Estudio:', NEW.estudio_id,
                         ', ID de la Cita:', NEW.cita_id,
                         ', ID de la Persona:', NEW.id_persona,
                         ', Resultado:', NEW.Resultado),
       NOW()
    );
END

---------------------------------------------------------------------------------------------------------------
