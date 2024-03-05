use cadastro;
describe gafanhotos;
describe cursos;

alter table gafanhotos add column cursopreferido int;
describe gafanhotos;

alter table gafanhotos 
add foreign key (cursopreferido) 
references cursos(idcurso);
describe gafanhotos;

select * from gafanhotos;

select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano 
from  gafanhotos join cursos;

select g.nome, g.cursopreferido, c.nome, c.ano 
from gafanhotos as g inner join cursos as c
on c.idcurso = g.cursopreferido 
order by g.nome;

select g.nome, c.nome, c.ano 
from gafanhotos as g inner join cursos as c 
on c.idcurso = g.cursopreferido 
order by g.nome;

