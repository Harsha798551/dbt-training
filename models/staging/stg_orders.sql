select 
--from raw orders 
o.orderid, o.orderdate,o.shipdate, o.shipmode, o.ordercostprice, o.ordersellingprice,
o.ordersellingprice - o.ordercostprice  as orderprofit,
-- from raw customer
c.customername, c.segment, c.country,c.customerid,
-- from raw_products
p.category, p.productname, p.subcategory, p.productid
from {{ ref('raw_orders') }} as o
left join 
{{ ref('raw_customers') }} as c
on o.customerid = c.customerid 
left join 
{{ ref('raw_products') }} as p
on o.productid=p.productid
