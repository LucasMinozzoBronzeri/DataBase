BEGIN

prc_insert_pais('Russia');

END;

exec prc_insert_pais('Espanha');
execute prc_insert_pais('Argentina');
call prc_insert_pais('Alemanha');

-- as quatro formas acima, são maneiras diferentes de fazer o insert


select * from pais order by 1;