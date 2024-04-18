CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `radiologia_e_imagen`.`vw_detalle_citas` AS
    SELECT 
        `c`.`id` AS `ID_Cita`,
        `c`.`fecha` AS `Fecha`,
        `c`.`hora` AS `Hora`,
        CONCAT_WS(' ',
                `p`.`Nombre`,
                `p`.`Primer_Apellido`,
                `p`.`Segundo_Apellido`) AS `Nombre_Paciente`,
        `m`.`Nombre` AS `Nombre_Medico`,
        `e`.`nombre` AS `Tipo_Estudio`
    FROM
        (((((`radiologia_e_imagen`.`citas` `c`
        JOIN `radiologia_e_imagen`.`pacientes` `pa` ON ((`c`.`paciente_id` = `pa`.`Persona_ID`)))
        JOIN `radiologia_e_imagen`.`personas` `p` ON ((`pa`.`Persona_ID` = `p`.`ID`)))
        JOIN `radiologia_e_imagen`.`personal_medico` `pm` ON ((`c`.`medico_id` = `pm`.`Persona_ID`)))
        JOIN `radiologia_e_imagen`.`personas` `m` ON ((`pm`.`Persona_ID` = `m`.`ID`)))
        JOIN `radiologia_e_imagen`.`estudios` `e` ON ((`c`.`tipo_estudio_id` = `e`.`id`)))
    WHERE
        (`c`.`fecha` >= CURDATE())