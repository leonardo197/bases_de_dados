create database mydb
use mydb

create table clientes
(pnome nchar(50),
unome nchar(50),
endereço nchar(50),
cidade nchar (50),
pais nchar(25),
dnascimento datetime)

select * from clientes 

exec sp_help clientes

insert into clientes values ('ana','ana','rua a','port','por','5-5-2001')
-----
 drop table clientes

 create table clientes
(pnome nchar(50),
unome nchar(50),
endereço nchar(50)default 'desconhesido',
cidade nchar (50) default'lisboa' ,
pais nchar(25)default'portugal',
dnascimento datetime)

insert into clientes(pnome,unome) values ('maria','ana')

 drop table clientes
 --------------------------------------------------------
 create table clientes
(IDCliente integer check (IDCliente>100),
pnome nchar(50),
unome nchar(50),
endereço nchar(50)default 'desconhesido',
codigopostal nchar(8) check (codigopostal like '[1-9][0-9][0-9][0-9][-][0-9][0-9][0-9]'),
cidade nchar (50) default'lisboa' ,
pais nchar(25)default'portugal',
dnascimento datetime check (year (dnascimento)>1950and(year (dnascimento)> year(getdate()))),
sexo nchar (1) not null check(sexo in('M','F')),
constraint pk_cliente primary key (IDCliente)
)
--------------------------------------------------
insert into clientes values (1001,'ana','silva','rua a','1530-305','portalegre','portugal','5-5-1999','F')
insert into clientes(idcliente,pnome,unome, sexo) values (1017,'maria','ana','F')
select * from clientes 

--------------------------------------
 drop table Vendas
CREATE TABLE Vendas
(IDVenda integer ,
DataVenda DateTime Default Getdate(),
DataEntrega DateTime,IDCliente integer,
MétodoPagamento nchar(20),
Status nchar(10) CHECK (Status IN ('Concluída','Retida')),
CONSTRAINT DataEntrega CHECK (DataEntrega >= DataVenda),
CONSTRAINT IDVenda Primary KEY (IDVenda),
CONSTRAINT ck_mp CHECK (MétodoPagamento IN ('Numerário','Cheque','VISA')),
FOREIGN KEY (IDCliente) REFERENCES Clientes (IDCliente)
) 
 -----------------------------------------------

