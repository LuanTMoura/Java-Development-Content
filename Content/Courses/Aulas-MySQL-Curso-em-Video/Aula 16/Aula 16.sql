use cadastro;

create table gafanhoto_assiste_curso (
	id int not null auto_increment,
	data date,
    idgafanhoto int,
    idcurso int,
    primary key (id),
    foreign key (idgafanhoto) references gafanhotos(id),
    foreign key (idcurso) references cursos (idcurso)
) default charset = utf8;

insert into gafanhoto_assiste_curso values (default, '2014-03-01', '1', '2');

select * from gafanhoto_assiste_curso;

select * from gafanhotos as g inner join gafanhoto_assiste_curso as a 
on g.id = a.idgfanhoto;

select g.nome, c.nome from 
gafanhotos as g inner join gafanhoto_assiste_curso as a 
on g.id = a.idgafanhoto 

inner join cursos as c 
on c.idcurso = a.idcurso

order by g.nome;