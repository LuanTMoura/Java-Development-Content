select altura, count(*) 
from gafanhotos
where peso > '100.0'
group by altura
having altura > (select avg(altura) from gafanhotos);

