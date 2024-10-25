SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE prc_insere_cliente (n_cod_cliente CLIENTE.COD_CLIENTE%TYPE, n_nome CLIENTE.NOM_CLIENTE%TYPE,
n_des_razao_social CLIENTE.DES_RAZAO_SOCIAL%TYPE, n_tip_pessoa CLIENTE.TIP_PESSOA%TYPE, n_num_cpf_cnpj CLIENTE.NUM_CPF_CNPJ%TYPE,
n_data_cadastro CLIENTE.DAT_CADASTRO%TYPE, n_data_cancelamento CLIENTE.DAT_CANCELAMENTO%TYPE, n_sta_ativo CLIENTE.STA_ATIVO%TYPE) AS

BEGIN
    IF LENGTH(n_nome) <= 3 OR REGEXP_LIKE(n_nome, '\d') THEN
        RAISE_APPLICATION_ERROR(-20001, 'O nome do cliente deve ter mais de 3 caracteres e não pode conter números.');
    END IF;

    INSERT INTO CLIENTE (
        COD_CLIENTE,
        NOM_CLIENTE,
        DES_RAZAO_SOCIAL,
        TIP_PESSOA,
        NUM_CPF_CNPJ,
        DAT_CADASTRO,
        DAT_CANCELAMENTO,
        STA_ATIVO
    ) VALUES (
        n_cod_cliente,
        n_nome,
        n_des_razao_social,
        n_tip_pessoa,
        n_num_cpf_cnpj,
        n_dat_cadastro,
        n_dat_cancelamento,
        n_sta_ativo
    );

    DBMS_OUTPUT.PUT_LINE('CLIENTE inserido com sucesso: ' || n_nome);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir CLIENTE: ' || SQLERRM);
        RAISE;
END;


exec prc_insere_cliente(4,'Monitor',1234567890555,'S','06-OCT-22','12-OCT-22');


select * from CLIENTE;