SET SERVEROUTPUT ON;

select * from estado;

CREATE PROCEDURE prc_insert_estado1 (
    p_cod_estado ESTADO.COD_ESTADO%TYPE, p_nom_estado ESTADO.NOM_ESTADO%TYPE,p_cod_pais ESTADO.COD_PAIS%TYPE
) AS

BEGIN
    INSERT INTO estado VALUES (
        p_cod_estado,
        p_nom_estado,
        p_cod_pais
    );
    
    COMMIT;
END;

select * from estado order by 1;