select nacionalidade, count(nacionalidade)
from gafanhotos
where nacionalidade != 'Brasil'
group by nacionalidade
having count(*) > 3;

