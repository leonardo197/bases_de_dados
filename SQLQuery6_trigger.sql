-- Exemplo de trigger 
USE ProDados 
(Select * From sysobjects 
Where Name = 'Auditoria' and xType ='u') 
Create Table Auditoria  
(IDResgisto Int Identity(0,1) NOT NULL Primary Key,   
Data datetime NOT NULL Default getdate(),   
Utilizador nchar(30) NOT NULL Default suser_sname(),   
EstaçãoTrabalho nchar(30) Default host_name(),   
IDProduto int NOT NULL,   
PreçoUnitárioNovo money NOT NULL,   
PreçoUnitárioAntigo money NOT NULL)

select *from Auditoria

alter trigger tr_auitarpreçoproduto on products
after update as 
if update (unitprice)
begin
set nocount on
 --print'foi alterado um preço!'
 declare @p int, @pu_novo money, @pu_antigo money
 set @p =(select Productid from inserted )
 set @pu_novo =(select UnitPrice from inserted )
 set @pu_antigo =(select UnitPrice from deleted )
 --print @p
 --print @pu_novo
 --print @pu_antigo
 insert into Auditoria (IDProduto,PreçoUnitárioNovo,PreçoUnitárioAntigo)values (@p,@pu_novo,@pu_antigo)
end

select * from Auditoria
update Products set UnitPrice =18 where ProductID=1
update Products set UnitsInStock =390 where ProductID=1

create trigger tr_eventos on products after
insert , update,delete as 
declare @id int
	if (select Productid from inserted)<>''
	and (select Productid from deleted)<>''
	print 'update'
	else
	begin 
	if (select Productid from inserted)<>''
	print 'inserter'
	else
	print 'delete'
	end


	insert into Products (ProductName,SupplierID,CategoryID) values ('pp',10,1)
	update Products set UnitPrice=100 where ProductID=78
	delete from Products  where ProductID=78


CREATE TABLE AuditarTabelas (  IDegisto INT PRIMARY KEY IDENTITY (1,1),
DataReg DATETIME NOT NULL DEFAULT GETDATE(),
Operação VARCHAR(10) NOT NULL,
Registo VARCHAR(50) NOT NULL, 
Tabela VARCHAR(20) NOT NULL )

create trigger tr_eventos_customers on customers after
insert , update,delete as 
declare @id int
if (select customerid from inserted)<>''
	and (select customerid from deleted)<>''
	--print 'update'
	set @id=(select customerid from inserted)
	insert into AuditarTabelas (operaçâo,registo,tabela)
	values ('update ',@id,'customers')
	else
	begin 
	if (select customerid from inserted)<>''
	print 'inserter'
			set @id=(select customerid from inserted)
	insert into AuditarTabelas (operaçâo,registo,tabela)
	values ('insert ',@id,'customers')
	else
	print 'delete'
	end