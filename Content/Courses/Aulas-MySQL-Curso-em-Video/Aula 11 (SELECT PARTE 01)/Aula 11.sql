select * from cursos order by nome;

select * from cursos order by nome desc;

select * from cursos order by nome asc;

select nome, carga, ano from cursos order by nome;

select ano, carga, nome from cursos order by ano, nome;

select * from cursos where ano = '2016' order by nome;

select nome, carga from cursos where ano = '2016' order by nome;

select nome, descricao from cursos where ano <= '2015' order by nome;
select nome, descricao, ano from cursos where ano <= '2015' order by nome;

select nome, ano from cursos where ano between 2014 and 2016 order by ano desc, nome asc;

select nome, ano from cursos where ano in (2014, 2016) order by ano desc, nome asc;