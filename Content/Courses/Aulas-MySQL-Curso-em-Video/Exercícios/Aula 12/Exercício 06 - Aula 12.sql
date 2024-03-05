select max(altura)
from gafanhotos
where nacionalidade = 'Brasil' and sexo = 'M'
order by altura desc;