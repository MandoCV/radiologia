/*TABLAS*/

/* Esta tabla almacena información sobre los distintos tipos de estudios que se pueden realizar en el departamento de radiología e imagen
 del hospital. Cada registro en esta tabla tiene un identificador único (id), un nombre que describe el tipo de estudio y una descripción
 que proporciona detalles adicionales sobre el estudio.*/
 
CREATE TABLE Estudios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(500)
);

 /*La tabla de citas registra las citas programadas para los pacientes que necesitan realizar algún estudio de radiología o imagen.
Cada cita tiene un identificador único (id), una fecha y hora programada, así como referencias al paciente y al médico asociados a la cita.
También incluye un campo para identificar el tipo de estudio programado, que se relaciona con la tabla de Estudios.*/
CREATE TABLE Citas (
    id INT unsigned AUTO_INCREMENT  PRIMARY KEY ,
    fecha DATE,
    hora TIME,
    paciente_id INT UNSIGNED,
    medico_id INT UNSIGNED,
    tipo_estudio_id INT UNSIGNED,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(Persona_ID),
    FOREIGN KEY (medico_id) REFERENCES personal_medico(Persona_ID),
    FOREIGN KEY (tipo_estudio_id) REFERENCES Estudios(id)
);


/*Esta tabla almacena los resultados de los estudios realizados durante las citas.
Cada registro en esta tabla tiene un identificador único (id), y contiene el resultado del estudio realizado y una imagen (en formato BLOB)
 asociada al resultado.
Además, esta tabla mantiene relaciones con las tablas de Estudios y Citas para registrar qué estudio se realizó durante qué cita.*/
CREATE TABLE Resultados_Estudios (
    id INT unsigned AUTO_INCREMENT PRIMARY KEY,
    estudio_id INT unsigned,
    cita_id INT unsigned,
    Resultado VARCHAR(500),
    imagen BLOB, 
    FOREIGN KEY (estudio_id) REFERENCES Estudios(id),
    FOREIGN KEY (cita_id) REFERENCES Citas(id)
);



/*La tabla de Consumibles registra los elementos consumibles utilizados en el departamento de radiología e imagen, 
como suministros médicos o materiales de uso cotidiano.
Cada elemento consumible tiene un identificador único (id), un nombre descriptivo, la cantidad disponible y su precio.*/
CREATE TABLE Consumibles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    cantidad INT,
    precio DECIMAL(10, 2)
);

															
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
------------------------------------------------------------------------------------------------------------------------------------------------------------------------														
                                                            /*PROCEDIMIENTOS*/
/*Prodimiento que perimmite automatizar la inserción de registros en una tabla destinada a almacenar estudios de radiología*/													
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_estudios_radiologia`(
    v_cantidad INT,
    v_tipo_estudio VARCHAR(50)
)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_fecha_estudio DATE;
    DECLARE v_fecha_actual DATE;
    DECLARE v_paciente_id INT;
    DECLARE v_medico_id INT;
    DECLARE v_descripcion VARCHAR(255);
    DECLARE v_resultado VARCHAR(1000);
    DECLARE v_nombre_estudio VARCHAR(100);

    -- Obtener la fecha actual
    SET v_fecha_actual = CURDATE();

    WHILE(i <= v_cantidad) DO
        -- Seleccionar un paciente y un médico de manera aleatoria de la base de datos
        -- Supongamos que las tablas se llaman pacientes y medicos respectivamente
        -- y que ambas tienen un campo id
        SET v_paciente_id = (SELECT id FROM pacientes ORDER BY RAND() LIMIT 1);
        SET v_medico_id = (SELECT id FROM medicos ORDER BY RAND() LIMIT 1);
        
        -- Asignar un tipo de estudio si no se proporcionó uno específico
        IF v_tipo_estudio IS NULL THEN
            SET v_nombre_estudio = ELT(RAND()*4+1, 'Radiografía', 'Tomografía', 'Resonancia Magnética', 'Ecografía');
        ELSE
            SET v_nombre_estudio = v_tipo_estudio;
        END IF;

        -- Generar una descripción y resultado aleatorio para el estudio
        -- Esto es solo un ejemplo simplificado. Se podrían generar descripciones más complejas y realistas.
        SET v_descripcion = CONCAT('Estudio de ', v_nombre_estudio, ' realizado sin incidencias destacables.');
        SET v_resultado = CONCAT('Resultado del estudio de ', v_nombre_estudio, ': Todo normal.');

        -- Generar una fecha para el estudio. Aquí simplemente usamos la fecha actual para simplificar
        SET v_fecha_estudio = v_fecha_actual;

        -- Insertar el estudio de radiología e imagen en la tabla correspondiente
			INSERT INTO Estudios (nombre, descripcion)
			VALUES (v_nombre_estudio, v_descripcion);


        SET i = i + 1;
    END WHILE;
END
------------------------------------------------------------------------------------------------------------------------------------------------


 /*Procedimiento para insertar los consumibles que se requieren en determinada area*/
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_consumible`(
    IN _nombre VARCHAR(100),
    IN _cantidad INT,
    IN _precio DECIMAL(10, 2)
)
BEGIN
    INSERT INTO Consumibles (nombre, cantidad, precio)
    VALUES (_nombre, _cantidad, _precio);

END







															/*FUNCIONES*/
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_estudios`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
 DECLARE estudio_generado VARCHAR(100) DEFAULT NULL;
 SET estudio_generado  = ELT(FLOOR(1 + RAND() * 12), 
           "Radiografía", "Ecografía (Ultrasonido)", "Tomografía Computarizada (TC o TAC)", "Resonancia Magnética (RM)",
           "Mamografía", "Fluoroscopía", "Angiografía", "Densitometría ósea", "PET (Tomografía por Emisión de Positrones)", 
           "SPECT (Tomografía Computarizada de Emisión de Fotón Único)", "Colangiopancreatografía retrógrada endoscópica (CPRE)", 
           "Ecocardiografía");
RETURN estudio_generado;
END








------------------------------------------------------------------------------------------------------------------------------------------------------------------------
															/*TRIGGERS*/
/*Correspondiente a la tabla estudios*/
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `Estudios_AFTER_INSERT` AFTER INSERT ON `estudios` FOR EACH ROW BEGIN

    INSERT INTO bitacora VALUES (
       DEFAULT, 'Estudios', USER(), 'INSERT',
       CONCAT_WS(" ", 'Se ha registrado un nuevo ESTUDIO con el ID: ', NEW.id,
                         ', Nombre: ', NEW.nombre,
                         ', Descripción: ', NEW.descripcion),
       NOW()
    );
END

// DELIMITER 
---------------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `estudios_AFTER_UPDATE` AFTER UPDATE ON `estudios` FOR EACH ROW BEGIN

    INSERT INTO bitacora VALUES (
       DEFAULT, 'Estudios', USER(), 'UPDATE',
       CONCAT_WS(" ", 'El ESTUDIO con el ID: ', OLD.id,
                         ' ha sido actualizado. Datos antiguos - Nombre: ', OLD.nombre,
                         ', Descripción: ', OLD.descripcion,
                         ', Datos nuevos - Nombre: ', NEW.nombre,
                         ', Descripción: ', NEW.descripcion),
       NOW()
    );
END
---------------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `Estudios_AFTER_DELETE`
AFTER DELETE ON `Estudios`
FOR EACH ROW
BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, 'Estudios', USER(), 'DELETE',
       CONCAT_WS(" ", 'El ESTUDIO con el ID: ', OLD.id,
                         ', Nombre: ', OLD.nombre,
                         ', Descripción: ', OLD.descripcion,
                         ' ha sido eliminado.'),
       NOW()
    );
END;

---------------------------------------------------------------------------------------------------------------------
/*Correspondiente a la tabla citas*/
CREATE DEFINER=`root`@`localhost` TRIGGER `citas_AFTER_INSERT` AFTER INSERT ON `citas` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, 'Citas', USER(), 'INSERT',
       CONCAT_WS(" ", 'Se ha agendado una nueva CITA con el ID: ', NEW.id,
                         ', Fecha: ', NEW.fecha,
                         ', Hora: ', NEW.hora,
                         ', Paciente ID: ', NEW.paciente_id,
                         ', Médico ID: ', NEW.medico_id,
                         ', Tipo de Estudio ID: ', NEW.tipo_estudio_id),
       NOW()
    );
END
---------------------------------------------------------------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` TRIGGER `citas_AFTER_UPDATE` AFTER UPDATE ON `citas` FOR EACH ROW BEGIN

    INSERT INTO bitacora VALUES (
       DEFAULT, 'Citas', USER(), 'UPDATE',
       CONCAT_WS(" ", 'La CITA con el ID: ', OLD.id,
                         ' ha sido actualizada. Datos antiguos - Fecha: ', OLD.fecha,
                         ', Hora: ', OLD.hora,
                         ', Datos nuevos - Fecha: ', NEW.fecha,
                         ', Hora: ', NEW.hora),
       NOW()
    );
END
---------------------------------------------------------------------------------------------------------------------
CREATE DEFINER = CURRENT_USER TRIGGER `radiologia_e_imagen`.`citas_AFTER_DELETE` AFTER DELETE ON `citas` FOR EACH ROW
BEGIN

    INSERT INTO bitacora VALUES (
       DEFAULT, 'Citas', USER(), 'UPDATE',
       CONCAT_WS(" ", 'La CITA con el ID: ', OLD.id,
                         ' ha sido actualizada. Datos antiguos - Fecha: ', OLD.fecha,
                         ', Hora: ', OLD.hora,
                         ', Datos nuevos - Fecha: ', NEW.fecha,
                         ', Hora: ', NEW.hora),
       NOW()
    );
END

---------------------------------------------------------------------------------------------------------------------
/*Correspondiente a la tabla Consumibles*/
CREATE DEFINER=`root`@`localhost` TRIGGER `consumibles_AFTER_INSERT` AFTER INSERT ON `consumibles` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, 'Consumibles', USER(), 'INSERT',
       CONCAT_WS(" ", 'Se ha registrado un nuevo CONSUMIBLE con el ID: ', NEW.id,
                         ', Nombre: ', NEW.nombre,
                         ', Cantidad: ', NEW.cantidad,
                         ', Precio: $', NEW.precio),
       NOW()
    );
END
---------------------------------------------------------------------------------------------------------------------
CREATE DEFINER = CURRENT_USER TRIGGER `radiologia_e_imagen`.`consumibles_AFTER_UPDATE` AFTER UPDATE ON `consumibles` FOR EACH ROW
BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, 'Consumibles', USER(), 'UPDATE',
       CONCAT_WS(" ", 'El CONSUMIBLE con el ID: ', OLD.id,
                         ' ha sido actualizado. Datos antiguos - Nombre: ', OLD.nombre,
                         ', Cantidad: ', OLD.cantidad,
                         ', Precio: $', OLD.precio,
                         ', Datos nuevos - Nombre: ', NEW.nombre,
                         ', Cantidad: ', NEW.cantidad,
                         ', Precio: $', NEW.precio),
       NOW()
    );
END
---------------------------------------------------------------------------------------------------------------------
CREATE DEFINER=`root`@`localhost` TRIGGER `consumibles_AFTER_DELETE` AFTER DELETE ON `consumibles` FOR EACH ROW BEGIN
    INSERT INTO bitacora VALUES (
       DEFAULT, 'Consumibles', USER(), 'DELETE',
       CONCAT_WS(" ", 'El CONSUMIBLE con el ID: ', OLD.id,
                         ', Nombre: ', OLD.nombre,
                         ', Cantidad: ', OLD.cantidad,
                         ', Precio: $', OLD.precio,
                         ' ha sido eliminado.'),
       NOW()
    );
END