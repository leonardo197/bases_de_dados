use prodados
declare @a int,@a1 nvarchar(25)
select @a'a'
----
declare @id nvarchar(10), @nomeclinte nvarchar(50)
set @id='blaus'
select @nomeclinte=CompanyName from customers where customerid=@id
print @nomeclinte
-------------------------variavel sistema
select @@LANGUAGE
select @@SERVERNAME
select @@SPID
select @@VERSION
------tipo de tabela tenporaria
declare @tab 
table(idproduto int primary key,
nomeproduto nvarchar(50))

insert into @tab values (1,'a')
insert into @tab values (2,'b')
select * from @tab
-------tipo de tabela 
create table #tab (idproduto int primary key,
nomeproduto nvarchar(50))
insert into @tab values (1,'a')
insert into @tab values (2,'b')
select * from @tab
-------------------tipo print
declare @a int
set @a =96
--
--print @a
print 'o resoltado e: '+cast(@a as nvarchar(10))
print 'o resoltado e: '+convert(nvarchar(10),(@a))
---
declare @dt as date
set @dt =GETDATE()
print'date de hoje - '+ cast(@dt as nvarchar(10))
----ex9
Declare @A Int, @B Int
Set @A = 1 Set @B = 10
  While  @A<=@B  
  Begin   
    Print 'A --> ' + Convert(Varchar(2),@A);
    Set @A = @A+1  
  End 
  -----ex12
declare @total int
select @total =count(*)from products
print @total 

declare @total int
select @total =count(*)from Orders
 if @total>500
   print'boa'
 else
   print 'menos de 500'
-----ex13
print 'inicio de comt'
Declare @dti datetime, @c int
 Set @dti=GETDATE()
 print 'data de hoje - '+cast(@dti as nvarchar(12))
 set @c=0

  While  @c<9 
  Begin   
    Print Convert(Varchar(10),@c) +' - '
	 + Convert(Varchar(10),@c) +' '+ Convert(Varchar(12),@dti)+' '+
	 datename(weekday,@dti)

	    Set  @c=  @c+1  
		set @dti=@dti+@c
  End 
  -------ex14
create Table #RelatorioDiario (
ID int Identity(1,1) Primary Key,
Data SmallDateTime,
Tota bigint ) 
select * from #RelatorioDiario

declare @dti datetime, @dtf datetime
set @dti ='1-1-2018'
set @dtf =@dti+365
 While @dti<@dtf
  begin
   insert into #RelatorioDiario(Data)
    values(@dti)
	set @dti=@dti+1
   end
   drop Table #RelatorioDiario
----------------------------------------
create Table #RelatorioDiario1997 (
ID int Identity(1,1) Primary Key,
Data SmallDateTime,
Tota bigint ) 
select * from #RelatorioDiario1997

declare @dti datetime, @dtf datetime
set @dti ='1-1-1997'
set @dtf =@dti+365
 While @dti<@dtf
  begin
   insert into #RelatorioDiario1997(Data)
    values(@dti)
	set @dti=@dti+1
   end
   update #RelatorioDiario1997 set Tota=
   (
select sum (od.unitprice*od.quantity)from Orders o 
join OrderDetails od on o.OrderID=od.orderid
where o.OrderDate=#RelatorioDiario1997.Data
  )
  -----ex18
  use ProDados
select * from Employees

create proc pr_nome as
select TitleOfCourtesy+' '+FirstName+' '+LastName'LastName'  
from Employees
-------------

create proc pr_nome1 @id int as
select TitleOfCourtesy+' '+FirstName+' '+LastName'LastName'  
from Employees
where EmployeeID=@id

exec pr_nome1 5

---------------------
alter proc pr_lisClientes @Country nvarchar(20) 
with encryption as 
select *from Customers
where Country=@Country

exec pr_lisClientes 'france'
----------listar prodotos com 2 variaveis
alter proc pr_lisProdutos @s int=1 ,@c int=null 
with encryption as 
if @c is null
 select * from Products
 where SupplierID=@s

else
 select * from Products
 where SupplierID=@s and CategoryID=@c

exec pr_lisProdutos @s=1,@c=2

------------------------
create proc pr_teste_out @valor1 int ,@valor2 int output as
print @valor1
print @valor2
set @valor2=@valor1*@valor2

declare @a int
set @a =98
exec pr_teste_out 34,@valor2=@a output
print @a
----------------------------

alter proc pr_obterPU @productID nvarchar (10) output as
set @productID=(select UnitPrice from Products 
where ProductID=@productID)


declare @a nvarchar(10)
set @a ='1'
exec pr_obterPU @productID=@a output
print @a
---------------ex29 pg 100
use prodados
select *from Products


alter proc pr_backupdados as
declare @Productstemp table(
	[ProductID] [int]   PRIMARY KEY ,
	[ProductName] [nvarchar](40) NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL ,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NOT NULL)
     --select *from @Productstemp
	insert into @Productstemp select *from Products
	select *from @Productstemp

	declare @Orderstemp table(
	[OrderID] [int] PRIMARY KEY,
	[CustomerID] [nchar](5) NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[ShipVia] [int] NULL,
	[Freight] [money] NULL ,
	[ShipName] [nvarchar](40) NULL,
	[ShipAddress] [nvarchar](60) NULL,
	[ShipCity] [nvarchar](15) NULL,
	[ShipRegion] [nvarchar](15) NULL,
	[ShipPostalCode] [nvarchar](10) NULL,
	[ShipCountry] [nvarchar](15) NULL)
	insert into @Orderstemp select *from Orders
	select *from @Orderstemp


	exec pr_backupdados

----------------------ex30

alter proc conprarProdutos @p1 int ,@p2 int  as
if exists (select *from Products where ProductID=@p1)
print 'produto p1 : '+ convert(nchar(5),@p1)+'existe'
else
print 'produto p1 : '+ convert(nchar(5),@p1)+'nao existe'
if exists (select *from Products where ProductID=@p2)
print 'produto p2 : '+ convert(nchar(5),@p2)+'existe'
else
print 'produto p2 : '+ convert(nchar(5),@p1)+'nao existe'
print'---------------------'
select ProductName, sum (Quantity)'qv' ,sum (Quantity*od.UnitPrice)'total de venda'
from Products p
join OrderDetails od on p.ProductID=od.ProductID
where p.ProductID=@p1 or p.ProductID=@p2
group by ProductName

	 exec conprarProdutos 8,9

-------------ex31

alter proc pr_top @id int ,@top int as
declare @p1 nvarchar (40)
declare @t1 decimal(6,2)
if exists (select ProductName from Products where ProductID=@id)
begin
 set @p1  =(select ProductName from Products where ProductID=@id)
 print 'produto - '+ convert(nchar(40),@p1)
 set @t1 =(select sum(Quantity) from OrderDetails where ProductID =@id)
 print 'produto - '+ convert(nchar(40),@t1)
 print'------------------------------------------------------------------'
 select top(@top) c.CompanyName,c.Country,sum(od.Quantity), sum(od.Quantity)/@t1 '%' 
from OrderDetails OD
 join Orders o on o.OrderID =od.OrderID
 join Customers c on c.CustomerID=o.CustomerID
 where ProductID=@id
 group by c.CompanyName,c.CompanyName,c.Country,Quantity 
 order by '%'
end
else 
 print 'erro'


exec pr_top 2 ,3