CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_consumible`(
    IN _nombre VARCHAR(100),
    IN _cantidad INT,
    IN _precio DECIMAL(10, 2)
)
BEGIN
    INSERT INTO Consumibles (nombre, cantidad, precio)
    VALUES (_nombre, _cantidad, _precio);

END