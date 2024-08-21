select * from departamento where nome like "%a%";
select count(cod_depto) as depasrtamento from departamento;
select 
e.nome as empregado,
d.nome as Departamento
from 
empregado e,
departamento d
where 
d.cod_depto=e.cod_depto;

select e.nome as "Empregados nomes", 
format((datediff(now(),dt_admissao) / 365),0) as "Tempo de empresa", 
format((datediff(now(),dt_nascimento)/ 365),0) as "Idade do funcionario",
d.nome as departamento
from 
empregado e, 
departamento d 
where
d.cod_depto=e.cod_depto;

SELECT
    nome AS Empregado,
    FORMAT((DATEDIFF(NOW(), dt_nascimento) / 365), 0) AS idade,
    FORMAT((DATEDIFF(NOW(), dt_admissao) / 365), 0) AS tempo_empresa,
    DATE_FORMAT(DATE_SUB(dt_admissao, INTERVAL 1 MONTH), CONCAT(YEAR(CURDATE()), "/%m/%d")) AS ferias
FROM
    empregado;
