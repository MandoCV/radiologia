CREATE DEFINER=`root`@`localhost` TRIGGER `Estudios_AFTER_INSERT` AFTER INSERT ON `estudios` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, 'estudios', USER(), 'INSERT',
       CONCAT_WS(" ", 'Se ha agregado un nuevo ESTUDIO con el ID:', NEW.id,
                         ', Nombre:', NEW.nombre,
                         ', Descripción:', NEW.descripcion),
       NOW()
    );
END
----------------------------------------------------------------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` TRIGGER `Estudios_AFTER_DELETE` AFTER DELETE ON `estudios` FOR EACH ROW BEGIN
    DECLARE nombre_estudio VARCHAR(100);
    SET nombre_estudio = OLD.nombre;

    INSERT INTO bitacora VALUES (
       DEFAULT, 'estudios', USER(), 'DELETE',
       CONCAT_WS(" ", 'Se ha eliminado el ESTUDIO con el ID:', OLD.id,
                         ', Nombre:', nombre_estudio),
       NOW()
    );
END