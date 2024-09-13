SET SERVEROUTPUT ON;
select * from pais order by 1;

CREATE OR REPLACE PROCEDURE prc_insert_pais (
    p_pais PAIS.NOM_PAIS%TYPE
) AS

BEGIN
    INSERT INTO pais values (
        sq_pais.nextval,
        p_pais
    );
    
    COMMIT;
END;

select sq_pais.currval from dual

select * from pais

drop sequence sq_estado

create sequence sq_estado start with 3