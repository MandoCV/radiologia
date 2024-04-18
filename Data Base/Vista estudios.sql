CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `radiologia_e_imagen`.`vw_lista_estudios` AS
    SELECT 
        `e`.`id` AS `ID_Estudio`,
        `e`.`nombre` AS `Nombre_Estudio`,
        `e`.`descripcion` AS `Descripcion`
    FROM
        `radiologia_e_imagen`.`estudios` `e`