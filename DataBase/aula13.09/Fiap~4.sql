SET SERVEROUTPUT ON;

select * from estado;

CREATE PROCEDURE prc_remove_estado1 (
    p_cod_estado ESTADO.COD_ESTADO%TYPE
) AS

BEGIN
    delete from estado where p_cod_estado = COD_ESTADO;
    
    COMMIT;
END;

exec prc_remove_estado1('ES');