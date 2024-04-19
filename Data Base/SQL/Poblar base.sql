CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblar`(v_password VARCHAR(20))
BEGIN
IF v_password = "xYz$123" THEN
    -- Insertar personal médico 70 general
	CALL sp_insertar_personal_medico(70, null);
    -- Se insertan 60 empleados del tipo Médico

    CALL sp_insertar_personal_medico(60, 'Médico');
    
    -- Se insertan 80 empleados del tipo Enfermero
    CALL sp_insertar_personal_medico(80, 'Enfermero');
    
    -- Se insertan 25 empleados del tipo Administrativo
    CALL sp_insertar_personal_medico(25, 'Administrativo');
    
    -- Se insertan 15 empleados del tipo Apoyo
    CALL sp_insertar_personal_medico(15, 'Apoyo');
    
    -- Se insertan 10 empleados del tipo Directivo
    CALL sp_insertar_personal_medico(10, 'Directivo');
    
    -- Se insertan 30 empleados del tipo Residente
    CALL sp_insertar_personal_medico(30, 'Residente');
    
    -- Se insertan 10 empleados del tipo Interno
    CALL sp_insertar_personal_medico(10, 'Interno');

    -- Insertar pacientes -----------------------
    -- 1500 general
        CALL sp_insertar_pacientes(1500,NULL, NULL);

    -- Se insertan 300 pacientes mujeres de cualquier edad
    CALL sp_insertar_pacientes(300, 'F', NULL);
    
    -- Se insertan 150 pacientes hombres de cualquier edad
    CALL sp_insertar_pacientes(150, 'M', NULL);
    
    -- Se insertan 15 pacientes neonatales de cualquier género
    CALL sp_insertar_pacientes(15, NULL, 'Neonatal');
    
    -- Se insertan 250 pacientes pediátricos de cualquier género
    CALL sp_insertar_pacientes(250, NULL, 'Pediátrico');
    
    -- Se insertan 450 pacientes adultos de cualquier género
    CALL sp_insertar_pacientes(450, NULL, 'Adulto');
    
    -- Se insertan 40 pacientes geriátricos femeninos
    CALL sp_insertar_pacientes(40, 'F', 'Geriátrico');
    
    -- Se insertan 10 pacientes geriátricos masculinos
    CALL sp_insertar_pacientes(10, 'M', 'Geriátrico');
    
    
    -- Modulo de radiologia
    CALL sp_insertar_estudios_radiologicos(10);
    
    call sp_agendar_cita_radiologia(50);
    
    CALL LlenarResultadosEstudios();
    
    ELSE
    		SELECT ("La contraseña es incorrecta.") AS ErrorMessage;

    END IF;
END