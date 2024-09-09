use empregados_victornicolau;

/*Select simples*/
select * from empregado;

/*Filtro de Estado Civil*/
select cod_emp from empregado where cicil like 'V';

/*Filtro por atributo da tabela extrangeira com uso de subquery*/
select * from dependente where cod_emp in(
select cod_emp from empregado where civil like 'V'
);

/*Desafio - os dependentes dos funcionários com mais de 5 anos de empresa*/
select * from dependente where cod_emp in(
select cod_emp from empregado where format((DATEDIFF(NOW(), dt_admissao) / 365), 0) > 5
);

/*Desafio - os dependentes dos funcionários com mais de 40 anos de idade*/
select * from dependente where cod_emp in(
select cod_emp from empregado where format((DATEDIFF(NOW(), dt_nascimento) / 365), 0) > 40
);

/*select * from departamento where nome like "%a%";
select count(cod_depto) as departamentos from departamento;
select 
	emp.nome as Empregado, 
    depto.nome as Departamento 
from
	empregado emp,
    departamento depto
where 
	depto.cod_depto=emp.cod_depto;
    
SELECT
    nome AS Empregado,
    FORMAT((DATEDIFF(NOW(), dt_nascimento) / 365), 0) AS idade,
    FORMAT((DATEDIFF(NOW(), dt_admissao) / 365), 0) AS tempo_empresa,
    DATE_FORMAT(DATE_SUB(dt_admissao, INTERVAL 1 MONTH), CONCAT(YEAR(CURDATE()), "/%m/%d")) AS ferias
FROM
    empregado;
*/

/*use empregados_icoma;
/*Select simples
select * from empregado;
/*Filtro de Estado Civil
select cod_emp from empregado where civil like 'V';
/*Filtro por atributo da tabela extrangeira com uso de subquery
select * from dependente where cod_emp in(
	select cod_emp from empregado where civil like 'V'
);
/*Desafio quero os dependentes dos funcionários com mais de 5 anos de empresa.
select * from dependente where cod_emp in(
	select cod_emp from empregado where format((datediff(now(), dt_admissao) / 365), 0) >= 5
);
/*Desafio quero os dependentes dos funcionários com mais de 40 anos de idade.
select * from dependente where cod_emp in(
	select cod_emp from empregado where format((datediff(now(), dt_nascimento) / 365), 0) >= 40
);
*/