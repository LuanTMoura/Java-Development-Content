select * from cursos where nome like 'P%';

select * from cursos where nome like 'a%';
select * from cursos where nome like '%a';

select * from cursos where nome like '%a%';
select * from cursos where nome not like '%a%';

select * from cursos where nome like 'ph%p';

select * from cursos where nome like 'ph%_';

select * from gafanhotos where nome like '%silva%';

select distinct carga from cursos;
select distinct nacionalidade from gafanhotos;

select count(*) from cursos;
select count(*) from cursos where carga < 30;

select max(totaulas) from cursos;
select max(carga) from cursos;

select min(totaulas) from cursos;
select min(carga) from cursos;

select nome, min(totaulas) from cursos;

select sum(totaulas) from cursos;
select avg(totaulas) from cursos;
