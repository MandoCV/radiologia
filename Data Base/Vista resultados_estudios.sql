CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `radiologia_e_imagen`.`vw_resumen_resultados_por_persona` AS
    SELECT 
        `re`.`id_persona` AS `ID_Persona`,
        COUNT(`re`.`id`) AS `Total_Resultados`,
        GROUP_CONCAT(DISTINCT `re`.`Resultado`
            SEPARATOR '; ') AS `Listado_Resultados`
    FROM
        `radiologia_e_imagen`.`resultados_estudios` `re`
    GROUP BY `re`.`id_persona`