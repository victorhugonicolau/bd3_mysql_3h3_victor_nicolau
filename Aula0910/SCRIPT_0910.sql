SELECT * FROM departamento;
SELECT * FROM empregado;
SELECT * FROM dependente;

/*Query com chaves estrangeiras*/
SELECT 
    E.NOME AS EMPREGADO,
    D.NOME AS DEPENDENTE
FROM
	EMPREGADO E,
    DEPENDENTE D
WHERE
	E.COD_EMP = D.COD_EMP;
    
/*Query com subquerys*/
SELECT 
	d.*,
    e.nome AS empregado,
	(FORMAT((datediff(now(), e.dt_nascimento) / 365), 0)) AS idade,
	(FORMAT((datediff(now(), e.dt_admissao) / 365), 0)) AS tempo_empresa
FROM 
	dependente d,
    empregado e
WHERE
	d.cod_emp IN (
    SELECT cod_emp FROM empregado WHERE (FORMAT((datediff(now(), e.dt_admissao) / 365), 0)<22) 
    )
AND 
e.cod_emp = d.cod_emp;

/*View com uso de MySQL*/
select cod_depto, nome from departamento where nome like'des%';
select cod_emp, nome from empregado where cod_depto = 3;

create view vw_bonus_desenvolvimento
as
select
	d.*,
	(FORMAT((datediff(now(), e.dt_nascimento) / 365), 0)) as idade_dep, 
	e.nome as empregado,
	(FORMAT((datediff(now(), e.dt_admissao) / 365), 0)) as tempo_empresa,
	(e.salario * 0.15) as bonus_dependente,
	"Desenvolvimento" as departamento
from
	empregado e,
	dependente d
where
	d.cod_emp in(
		select cod_emp, nome from empregado where cod_depto = 3
	)
and
	e.cod_emp = d.cod_emp;

select * from vw_bonus_desenvolvimento;