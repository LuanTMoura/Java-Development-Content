select carga from cursos group by carga order by carga desc;

select distinct carga from cursos order by carga desc;

select distinct totaulas from cursos order by totaulas;
select totaulas from cursos group by totaulas order by totaulas;

select totaulas, count(*) from cursos group by totaulas order by totaulas;

select carga, count(nome) from cursos group by carga having count(nome)>3;

select ano, count(*) from cursos group by ano order by count(*) desc;

select ano, count(*) from cursos group by ano having count(ano) >= 5 order by count(*) desc;

select ano, count(*) from cursos where totaulas > 30 group by ano having ano > 2013 order by count(*) desc;