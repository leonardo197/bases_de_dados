use TSQL2012
--#Q01 
select count(productid)'cont' from Production.Products
--#Q02
 select count(*) from Production.Products where supplierid=12 and discontinued='False'
--#Q03
select supplierid,count(productid) as  'total de produtos' from Production.Products 
Group by supplierid
--#Q04
 select count(*) from Production.Products where supplierid=4
--#Q05 
 select  companyname,fax from Production.Suppliers where fax IS NULL
--#Q06
   select DATEPART(m,so.orderdate)as 'mes',sum((sod.unitprice*sod.qty)-((sod.unitprice*sod.discount)*sod.qty)) 'preço total'   from Sales.Orders so 
  join Sales.OrderDetails sod
  on sod.orderid =so.orderid 
  where  so.orderdate<='2007-12-31' and so.orderdate>='2007-1-1' 
  Group by DATEPART(m,so.orderdate)
  order by DATEPART(m,so.orderdate)
 --#Q07
    select sum((sod.unitprice*sod.qty)-((sod.unitprice*sod.discount)*sod.qty))'total'  from Sales.Orders so 
  join Sales.OrderDetails sod
  on sod.orderid =so.orderid 
where  orderdate<='2008-6-30' and orderdate>='2008-6-1' 
 --#Q08
 select count(*)'total encomendas ' from sales.Orders where  orderdate<='2008-10-31' and orderdate>='2008-1-1' 
 --#Q09
	 select empid, count(orderid)'NumberOrdersByEmployee' 
	from Sales.Orders
	where orderdate >= '2006-1-1' and orderdate <= '2006-12-31'
	group by empid
--#Q10
select empid, firstname, lastname, birthdate, FLOOR(DATEDIFF(Day, birthdate, GETDATE()) / 365.25) 'age' 
from HR.Employees
--#Q11
	select avg(year(GETDATE())-year(birthdate))'AvgAge' 
	from HR.Employees
--#Q12
	select empid, hiredate
	from HR.Employees
	where hiredate = (select min(hiredate) from HR.Employees)
--#Q13
select empid, firstname, lastname, birthdate, FLOOR(DATEDIFF(Day, birthdate, GETDATE()) / 365.25)'age' 
from HR.Employees
where birthdate = (select min(birthdate) from HR.Employees)
--#Q14
select P.productid, P.productname, OD.qty, SO.shipcountry 
from Production.Products P
join Sales.OrderDetails OD on P.productid = OD.productid
join Sales.Orders SO on OD.orderid = SO.orderid
where shipcountry = 'Poland'
order by P.productid
--#Q15
select count(productid)'ProductsFromBerlin' from Production.Products P
join Production.Suppliers S on P.supplierid = S.supplierid
where S.city = 'Berlin'
--#Q16
select TOP 1  sc.companyname,sc.custid,sum((sod.unitprice*sod.qty)-((sod.unitprice*sod.discount)*sod.qty)) as 'preso_total' 
from Sales.Orders so 
join Sales.OrderDetails sod on sod.orderid =so.orderid 
join Sales.Customers sc on so.custid=sc.custid
group by sc.custid, sc.companyname
order by 'preso_total' desc  
  --#Q17
select TOP 5  sc.companyname,sc.custid,sum((sod.unitprice*sod.qty)-((sod.unitprice*sod.discount)*sod.qty)) as 'preso_total' 
from Sales.Orders so 
join Sales.OrderDetails sod on sod.orderid =so.orderid 
join Sales.Customers sc on so.custid=sc.custid
where so.orderdate >= '2007-1-1' and so.orderdate <= '2007-12-31'
group by sc.custid, sc.companyname
order by 'preso_total' desc
  --#Q18
select top 1 sod.productid,pp.productname,sum(sod.qty) as 'qty_total' 
from Sales.Orders so 
join Sales.OrderDetails sod on sod.orderid =so.orderid 
join Production.Products pp on sod.productid=pp.productid
where so.orderdate >= '2007-1-1' and so.orderdate <= '2007-12-31'
group by sod.productid,pp.productname
order by 'qty_total' desc
    --#Q19
 select TOP 1 sc.custid,sc.companyname,count(distinct so.orderid) as'total de encomentas' ,sum((sod.unitprice*sod.qty)-((sod.unitprice*sod.discount)*sod.qty)) as 'preso_total' 
from Sales.Orders so 
join Sales.OrderDetails sod on sod.orderid =so.orderid 
join Sales.Customers sc on so.custid=sc.custid
group by sc.custid, sc.companyname
having count(so.orderid)>1
order by 'preso_total' desc 
  --#Q20
  select top 1 so.shipcity, count(so.shipcity)as 'vendas_por_cidade' from Sales.Orders so 
  group by so.shipcity
  order by 'vendas_por_cidade' desc 
  --#Q21
  select TOP 10  so.shipcity,sum((sod.unitprice*sod.qty)-((sod.unitprice*sod.discount)*sod.qty)) as ' montante_total_de_vendas' 
from Sales.Orders so 
join Sales.OrderDetails sod on sod.orderid =so.orderid 
group by so.shipcity
order by ' montante_total_de_vendas' desc 
  --#Q22
select O.empid, E.firstname, E.lastname,
sum((OD.unitprice*OD.qty)-((OD.unitprice*OD.qty)*(OD.discount))) 'salesbyemployee',
(sum(((OD.unitprice*OD.qty)-((OD.unitprice*OD.qty)*(OD.discount)))*100.0)/
(select sum((unitprice*qty)-((unitprice*qty)*(discount))) 'totalsales' 
from Sales.OrderDetails))'%'
from Sales.Orders O
join Sales.OrderDetails OD on O.orderid = OD.orderid
join HR.Employees E on O.empid = E.empid
group by O.empid, E.firstname, E.lastname
order by O.empid
  --#Q23
select pc.categoryid,pc.categoryname, sum(sod.qty),(sum(sod.qty)*100.0)/(select sum(qty) from Sales.OrderDetails)'%'
from Production.Categories pc
join Production.Products pp on pp.categoryid=pc.categoryid
join Sales.OrderDetails sod on sod.productid=pp.productid 
--join sales.Orders so on so.orderid =sod.orderid 
group by pc.categoryname,pc.categoryid 
--#Q24
select O.shipcountry,
sum((OD.unitprice*OD.qty)-((OD.unitprice*OD.qty)*(OD.discount))) 'total_sales',
(sum((OD.unitprice*OD.qty)-((OD.unitprice*OD.qty)*(OD.discount)))*100.0)/
(select sum((unitprice*qty)-((unitprice*qty)*(discount))) 'total_sales' from Sales.OrderDetails)'%'
from Sales.OrderDetails OD
join Sales.Orders O on OD.orderid = O.orderid
group by O.shipcountry
order by '%' desc
--#Q25
select sc.country  , count(sc.city)as 'total' from Sales.Customers sc
group by sc.country
--#Q26
select top 1 sc.country  , count(sc.city)as 'total' from Sales.Customers sc
group by sc.country
order by 'total' desc
--#Q27
select sum((sod.unitprice*sod.qty)*sod.discount) from Sales.Orders so
join Sales.OrderDetails sod on so.orderid=sod.orderid 
where so.orderdate >= '2007-1-1' and so.orderdate <= '2007-12-31'

--#Q28
select DATEPART(m,so.orderdate) as 'mes', sum((sod.unitprice*sod.qty)*sod.discount) from Sales.Orders so
join Sales.OrderDetails sod on so.orderid=sod.orderid 
where so.orderdate >= '2007-1-1' and so.orderdate <= '2007-12-31'
group by DATEPART(m,so.orderdate)
order by 'mes' 
--#Q29
select right(contactname, len(contactname)-patindex('% %', contactname))'firstname',
Left(contactname, patindex('%, %', contactname)-1)'lastname'
from Sales.Customers
--#Q30
select avg( datediff(day,orderdate,shippeddate))from Sales.Orders 
where shippeddate> 0
--#Q31
select  sc.companyname, count(so.orderid)'orders',
sum((sod.unitprice*sod.qty)-((sod.unitprice*sod.qty)*(sod.discount))) 'totalvalue',
count(sod.productid)'products'
from Sales.Orders so 
join Sales.OrderDetails sod on sod.orderid =so.orderid 
join Sales.Customers sc on so.custid=sc.custid
where sc.custid=22
group by sc.custid, sc.companyname
--o id 22 nao fez compras
select * from Sales.Customers where custid=22
