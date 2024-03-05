select nacionalidade, nome, peso
from gafanhotos
where sexo = 'M' and peso < '100.0'
having nome like '%Silva%' and nacionalidade not like 'Brasil'
order by nome;