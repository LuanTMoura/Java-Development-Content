select nacionalidade, sexo, nome
from gafanhotos
where nacionalidade = 'Brasil' and sexo = 'F'
having nome like 'J%'
order by nome;