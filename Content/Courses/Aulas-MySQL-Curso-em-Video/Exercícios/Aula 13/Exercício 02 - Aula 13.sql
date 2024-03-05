select sexo, count(*)
from gafanhotos
where nascimento > '2005-01-01'
group by sexo;

