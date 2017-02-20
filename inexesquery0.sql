







select TOP 1 t.price FithPrice
from (select distinct top 5 price from Goods order by price desc) t
order by t.price

go 

select distinct price from Goods order by price desc