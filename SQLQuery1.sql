use Exames 
------------------------------
select * from cursos
select * from disciplinas
--------------------------------
select curso from cursos
--------------------------
use vendas 
select * from saleslt.product
-----------------------------
select name, color, size from saleslt.product
-------------------------------
select * from saleslt.customer
--------------------------------
select distinct companyname from saleslt.customer
-----------------------------------
use Exames 
select idcurso from cursosdisciplinas
select distinct idcurso from cursosdisciplinas
select distinct disciplina from disciplinas
-------------------------------------------
select distinct idcurso from cursosdisciplinas
 where idcurso=2
 -----------------------------
 use vendas 
 select * from saleslt.salesorderheader
 where customerid=61
 ------------------------------------------
 use Exames 
  select * from salas
  select * from ExamesSalas where IDsalas=22
  ------------------------------------
 use vendas 
 select * from saleslt.salesorderheader where totaldue>50000
  select * from saleslt.salesorderheader where totaldue<50000
  ------------------------------------------------------
 select * from saleslt.product where standardcost >= 1550
 select * from saleslt.product where standardcost <= 1550
 ------------------------------------------------
  use Exames 
  select * from Exames where data >='2005-07-01' and data <='2005-07-31'
  ----
    select * from epocasExame 
	 select * from Exames where idepoca !=1
------------------------------
    select * from cursosdisciplinas where idcurso= 2and tipo='1ºsem'
	---------
 use vendas 
 select * from saleslt.product where color='blue' and size='M'
 -----------------------------
 select * from saleslt.productcategory 
  select * from saleslt.product where  productcategoryid=16 or productcategoryid=18
  ------------------------------------------
    use Exames 
	select * from Exames where idepoca!=3
	----------------------------------------
	select * from cursosdisciplinas where idcurso=3 or idcurso=4 or idcurso=3
	select * from cursosdisciplinas where (idcurso between 2 and 4)
	---------------
	 use vendas 
	 select * from saleslt.productcategory where parentproductcategoryID in (1,2)
	 -----------
use Exames 
select * from docentes where nome like'M%'
-------------
select * from cursosdisciplinas where idcurso=(
select idcurso from cursos where curso ='engenharia informática')
-----------------------------
use vendas 
select * from saleslt.product where productcategoryid=
(select productcategoryid from saleslt.productcategory where name = 'brakes')
-----------------------------------------------------------
use prodados
select e1.employeeid, e1.lastname, e1.firstname, e1.reportsto,
(select e2.lastname+' '+e2.firstname from employees as e2  e2.employeeid= e1.reportsto)'boss'
 from employees as e1
 -------------
 use vendas 
 select p1.name, p1.parentproductcategoryid,
 (select p2.name from saleslt.Productcategory as p2 where p2.parentproductcategoryid = p1.parentproductcategoryid)
  from saleslt.Productcategory as p1
  ------------------
  use Exames 
  select * from Cursos, cursosdisciplinas where Cursos.idCurso=9
  and cursos.idCurso=cursosdisciplinas.idCurso
  and cursosdisciplinas.idddisciplinas=

  -------------------------------------------------
   use vendas 
   select saleslt.productmodel.productmodelid, saleslt.productmodel.nome, productnuber  from saleslt.productmodel, saleslt.product
   where saleslt.productmodel.productmodelid=7 
   and saleslt.productmodel.productmodelid=saleslt.product.productmodelid
   -------------------------------d
   select * from saleslt.productcategory pc, saleslt.product p
   where pc.productcategoryid=p.productcategoryid
   and pc.productcategoryid=36

   -----------------------------------
    select customerid, subtotal,subtotal*0.05'des' from saleslt.salesorderheader
	----------------------
	
    select soh.customerid,c.firstname, subtotal,subtotal*0.05'des' 
	from saleslt.salesorderheader soh, saleslt.customer c
	where soh.customerid=c.customerid
	----------------------------
select name, listprice,listprice*0.0234 'v' from saleslt.product
where productmodelid=22
-----------------------------------------
select name, listprice,listprice*0.846'euros' from saleslt.product
---------------------
use Exames 
select* from docentes
order by nome desc
-------------
   use vendas 
select max(listprice)'max' from saleslt.product
select max(listprice)'max' from saleslt.product
select avg(listprice)'avg' from saleslt.product
select count(productID)'cont' from saleslt.product
--------------------------------------43
Select count(*) from SalesLT.SalesOrderHeader 
Where TotalDue <= (Select AVG(TotalDue) 
From SalesLT.SalesOrderHeader)
---------------------44
select max(orderqty)'max' from saleslt.salesorderdetail
select min(orderqty)'max' from saleslt.salesorderdetail
select avg(orderqty)'avg' from saleslt.salesorderdetail
Select count(*) from SalesLT.salesorderdetail
Select count(*) from SalesLT.salesorderdetail
where orderqty<(select avg(orderqty)from saleslt.salesorderdetail)
----------45
Select * from SalesLT.SalesOrderHeader 
Where TotalDue=(Select Max(TotalDue) 
From SalesLT.SalesOrderHeader)
--------------------46
 use vendas 
Select max(orderqty) from SalesLT.SalesOrderdetail
Select min(orderqty) from SalesLT.SalesOrderdetail
Select avg(orderqty) from SalesLT.SalesOrderdetail
Select count(*) from SalesLT.salesorderdetail
where orderqty<(select avg(orderqty)from saleslt.salesorderdetail)

Select * from SalesLT.SalesOrderHeader 
Where TotalDue=(Select Max(TotalDue) 
From SalesLT.SalesOrderHeader)

Select * from SalesLT.customer Where customerid=(Select customerid from SalesLT.SalesOrderHeader 
Where TotalDue=(Select Max(TotalDue) 
From SalesLT.SalesOrderHeader))
-------47
Select getdate() 'data/hora'
-----48---49-----50
Select getdate() ,day(getdate())'dia',month(getdate())'mes',year(getdate())'ano'
-----------
use Exames 
Select data,day((data))'dia',month((data))'mes',year((data))'ano' from exames
---
Select getdate(), datepart(dw,getdate()),datepart(dy,getdate()),datepart(wk,getdate()),datepart(qq,getdate())
set language portuguese
Select getdate(),datename(mm,getdate()),datename(dw,getdate())
--------
Select datename(dw,data)as b,datepart(wk,data) as a, data from exames
order by a,b
---------53
select datediff (day,'12-12-2008','12-12-2009')
select datediff (month,'12-12-2008','12-12-2009')
select datediff (ww,'12-12-2008','12-12-2009')
---------------54
use vendas
select datediff(day,orderdate,shipdate)as numerodias from saleslt.salesdorder
-------
use prodados
select datediff(day,orderdate,shippeddate) from orders
select max(datediff(day,orderdate,shippeddate)) from orders
select min(datediff(day,orderdate,shippeddate)) from orders
select avg(datediff(day,orderdate,shippeddate)) from orders
--------------55
use Exames 
select datediff(day,min(data),max(data)) from exames where idepoca=1

-------------56
select data,isdate(data), idepoca, isdate (idepoca)from exames
------------58
use vendas
select salesordernumber,
len(salesordernumber)'len',
left (salesordernumber,2)'left',
right (salesordernumber,2)'right',
substring(salesordernumber,3,2)'sub',
reverse(salesordernumber)'reve',
lower(salesordernumber)'lower',
replace(salesordernumber,'s','x')'replace',
replicate(salesordernumber,2)'replicate',
stuff(salesordernumber,3,3,'hhh')'stuff',
patindex('%1%',salesordernumber)'patindex'
 from saleslt.salesorderheader
 ----------------59
 select emailaddress, patindex('%@%',emailaddress)-1'patindex' from saleslt.customer
 select emailaddress,len(left (emailaddress,patindex('%@%',emailaddress)-1)),
 patindex('%@%',emailaddress)-1 from saleslt.customer
 ---------60

 select'   texto',len('  texto')
  select ltrim('   texto'),len(ltrim('   texto'))

---------------------------------

use exames
select área, count(*) from docentes
Group by área
---
select cd.idcurso, curso,count(*)from cursosdisciplinas cd,cursos c
where cd.idcurso=c.idcurso
Group by cd.idcurso, curso
-------------------63
use vendas
select p.productmodelid, pm.name, count(*) 
from saleslt.product p,saleslt.productmodel pm
where p.productmodelid=pm.productmodelid
Group by p.productmodelid,pm.name
-------------64
select p.productcatgoryid, pc.name, count(*) 
from saleslt.pruduct p,saleslt.productcategory pc where p.productcatgoryid=pc.productcategory
Group by p.productcategoryid, pc.name
---------65
select p1.parentproductcategoryid,
(select p2.name from saleslt.productcategory as p2
where p1.parentproductcategoryid=p2.productcategoryid), count(*)
 from saleslt.productcategory as p1
Group by p1.parentproductcategoryid
-----------------
select city,count(*) from saleslt.address
Group by city
order by count(*) desc
--
select city,count(*) from saleslt.address
Group by city
having count (*)>10
order by count(*) desc
----------------

select productcategoryid ,count(*) from saleslt.product
Group by productcategoryid
having count (*)>10
------------68
select productid,name,size=case size 
					        when 's' then 'pequeno'
						    when 'm' then 'pequeno'
						    when 'l' then 'pequeno'
						    else size
					       end
 from saleslt.product
 ------------------69
 select productid, name,'nivel'=case
                                 when  listprice=0 then 'n0'
								 when  listprice<50 then 'n1'
								 when  listprice>=50 and listprice<250 then 'n2'
								 when  listprice>=250 and listprice<1000 then 'n3'
								 else 'n4'
								 end
  from saleslt.product
  order by nivel
  ------------------74.
  select pc.productcategoryid,pc.name, p.productid, p.name
  from saleslt.productcategory pc 
  join saleslt.product p
  on pc.productcategoryid =p.productcategoryid

    select pc.productcategoryid,pc.name, p.productid, p.name
  from saleslt.productcategory pc 
  left join saleslt.product p
  on pc.productcategoryid =p.productcategoryid

      select pc.productcategoryid,pc.name, p.productid, p.name
  from saleslt.productcategory pc 
  right join saleslt.product p
  on pc.productcategoryid =p.productcategoryid
  --------------------------75

  select c.customerid, firstname,salessorderid from saleslt.customer c
  join saleslt.salesorderheader soh
  on c.customerid =soh.customerid
  -----79
  use vendas
  select * from saleslt.product
  where color='Blue'
  union
    select * from saleslt.product
  where color='Silver'

  ------------80

  use exames

  select * from examessalas es
  join exames e on es.idexame = e.idexame
  where idsala=17 and idepoca=1
  intersect
    select * from examessalas es
  join exames e on es.idexame = e.idexame
  where hora='13:30'

  
  select * from examessalas es
  join exames e on es.idexame = e.idexame
  where idsala=17 and idepoca=1
  except
    select * from examessalas es
  join exames e on es.idexame = e.idexame
  where hora='13:30'