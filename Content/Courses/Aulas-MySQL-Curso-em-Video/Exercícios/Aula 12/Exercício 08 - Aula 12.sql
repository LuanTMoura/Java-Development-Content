select min(peso)
from gafanhotos
where sexo = 'F' 
and nacionalidade != 'Brasil'
and nascimento between '1990-01-01' and '2000-12-31';

