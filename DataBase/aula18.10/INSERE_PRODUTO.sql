SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE prc_insere_produto (n_cod_produto PRODUTO.COD_PRODUTO%TYPE, n_nome PRODUTO.NOM_PRODUTO%TYPE,
n_cod_barra PRODUTO.COD_BARRA%TYPE, n_sta_ativo PRODUTO.STA_ATIVO%TYPE, n_data_cadastro PRODUTO.DAT_CADASTRO%TYPE,
n_data_cancelamento PRODUTO.DAT_CANCELAMENTO%TYPE) AS

BEGIN
    IF LENGTH(n_nome) <= 3 OR REGEXP_LIKE(n_nome, '\d') THEN
        RAISE_APPLICATION_ERROR(-20001, 'O nome do produto deve ter mais de 3 caracteres e não pode conter números.');
    END IF;

    INSERT INTO PRODUTO (
        COD_PRODUTO,
        NOM_PRODUTO,
        COD_BARRA,
        STA_ATIVO,
        DAT_CADASTRO,
        DAT_CANCELAMENTO
    ) VALUES (
        n_cod_produto,
        n_nome,
        n_cod_barra,
        n_sta_ativo,
        n_data_cadastro,
        n_data_cancelamento
    );

    DBMS_OUTPUT.PUT_LINE('Produto inserido com sucesso: ' || n_nome);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir produto: ' || SQLERRM);
        RAISE;
END;


exec prc_insere_produto(4,'Monitor',1234567890555,'S','06-OCT-22','12-OCT-22');


select * from PRODUTO;