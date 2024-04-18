CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_estudios`(IN nombreEstudio VARCHAR(100), IN descripcionEstudio VARCHAR(500))
BEGIN
    INSERT INTO Estudios(nombre, descripcion) VALUES (nombreEstudio, descripcionEstudio);
END