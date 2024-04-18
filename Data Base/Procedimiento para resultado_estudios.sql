CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Resultados_estudios`()
BEGIN
    DECLARE v_estudio_id INT;
    DECLARE v_cita_id INT;
    DECLARE v_resultado VARCHAR(500);
    DECLARE v_id_persona INT;
	

    -- Seleccionar aleatoriamente un estudio_id
    SELECT id INTO v_estudio_id FROM Estudios ORDER BY RAND() LIMIT 1;
    
    -- Seleccionar aleatoriamente un cita_id
    SELECT id INTO v_cita_id FROM Citas ORDER BY RAND() LIMIT 1;
    
    -- Seleccionar aleatoriamente un persona_id
    SELECT persona_id INTO v_id_persona FROM pacientes ORDER BY RAND() LIMIT 1;

    -- Lista de resultados posibles de radiología
    SET v_resultado = ELT(FLOOR(1 + (RAND() * 8)), 
        'Radiografía de tórax sin hallazgos agudos, corazón y mediastino dentro de límites normales.',
        'TC de cráneo sin evidencia de hemorragia, masa, o desplazamiento de estructuras medias.',
        'Resonancia magnética lumbar muestra desgaste discal moderado en L4-L5 sin compromiso nervioso.',
        'Radiografía de tórax muestra signos de neumonía bacteriana.',
        'Ecografía abdominal revela colelitiasis sin signos de colecistitis.',
        'Mamografía bilateral normal. No se observan masas o calcificaciones sospechosas.',
        'Ecografía obstétrica muestra feto en posición cefálica a las 32 semanas de gestación.',
        'Tomografía computarizada de abdomen y pelvis muestra adenopatías mesentéricas.');

    -- Insertar el resultado en la tabla
    INSERT INTO Resultados_Estudios (estudio_id, cita_id, Resultado, id_persona)
    VALUES (v_estudio_id, v_cita_id, v_resultado,v_id_persona);
END