use vendas
---q1-a
select salesperson, count(customerid) as 'Nclientes' from saleslt.customer
group by salesperson
order by'Nclientes' desc
---q1-b
select spc.parentproductcategoryid,'Clothing',sp.color,count(productID)as 'nºprodutos' from saleslt.productcategory spc
join saleslt.product sp on   sp.productcategoryid= spc.productcategoryid 
where parentproductcategoryid = 
(select productcategoryid from saleslt.productcategory where name='Clothing')
group by color,spc.parentproductcategoryid,sp.color
---q1-c
select count(*)as 'numero de clientes',
(select count(*)from saleslt.customer sc
join saleslt.salesorderheader ss on ss.customerid=sc.customerid) as 'clientes c\encomendas',
(count(*)-(select count(*)from saleslt.customer sc
join saleslt.salesorderheader ss on ss.customerid=sc.customerid))as 'clientes s\encomendas',
from saleslt.customer sc
---q2-
create database db_teste1201718
use db_teste1201718

--
create table funcionarios
(nfuncionarios integer identity (1000,1),
primeirosnomes nchar(20)NOT NULL,
ultimosnomes nchar(20) NOT NULL,
categoriaprofissional nchar(25) NOT NULL,
NIF nchar(9) NOT NULL unique,
vencimentobase smallmoney,
constraint pk_funcionarios primary key (nfuncionarios),
constraint ch_NIF check (nif LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
constraint ck_vb check (vencimentobase>557)
)
--drop table funcionarios
---------------------------
insert into funcionarios  values ('jona','pires','estagiario','152789415','1500')
insert into funcionarios  values ('pedro','almeida','tecnico superior','211748852','2560')
insert into funcionarios  values ('maria','santos','tecnico superior','215462357','3200')
-------------------

create table vencimentos
(nfuncionarios integer,
ano nchar(4)NOT NULL,
mes nchar(2) NOT NULL,
vencimentobase smallmoney ,
subsidioalimentaçao smallmoney,
irs smallmoney,
adse smallmoney,
vencimentoliquido as ((vencimentobase)-(irs)-(adse))+(subsidioalimentaçao),
constraint pk_vencimentos primary key (nfuncionarios,ano,mes),
constraint fk_funcionarios foreign key (nfuncionarios)
references funcionarios (nfuncionarios),
)
---------
insert into vencimentos (nfuncionarios,ano,mes) values ('1000','2017','01')
insert into vencimentos (nfuncionarios,ano,mes) values ('1000','2017','02')
insert into vencimentos (nfuncionarios,ano,mes) values ('1001','2017','01')
insert into vencimentos (nfuncionarios,ano,mes) values ('1001','2017','02')
insert into vencimentos (nfuncionarios,ano,mes) values ('1002','2017','01')
insert into vencimentos (nfuncionarios,ano,mes) values ('1002','2017','02')
------------------------
------q3

select * from vencimentos
select* from funcionarios
--a
update vencimentos set vencimentobase= (select vencimentobase from funcionarios f where f.nfuncionarios=vencimentos.nfuncionarios )
--b
update vencimentos set subsidioalimentaçao=65 where mes=1
update vencimentos set subsidioalimentaçao=77 where mes=2
--c
update vencimentos set irs =(vencimentobase)*0.35
--d
update vencimentos set adse =(vencimentobase)*0.05
---q4
--a
alter table funcionarios add estado nvarchar (20)
--b
alter table funcionarios alter column categoriaprofissional nchar(40) NOT NULL
--c
alter table vencimentos add IDvencimento integer identity (1000,1)
alter table vencimentos drop pk_vencimentos
alter table vencimentos add constraint pk_vencimentos primary key (IDvencimento)
---q5
create table assiduidade(
nfuncionarios integer,
ano nchar(6)NOT NULL,
diasTrabalho nchar(2) NOT NULL,
constraint pk_assiduidade primary key (nfuncionarios,ano,diasTrabalho),
constraint fk_funcionarios_assiduidade foreign key (nfuncionarios)
references funcionarios (nfuncionarios),
--drop table assiduidade
)
select * from assiduidade
insert into assiduidade (nfuncionarios,ano,diasTrabalho) values ('1000','201701','21')
insert into assiduidade (nfuncionarios,ano,diasTrabalho) values ('1001','201701','25')
insert into assiduidade (nfuncionarios,ano,diasTrabalho) values ('1002','201701','20')
insert into assiduidade (nfuncionarios,ano,diasTrabalho) values ('1000','201702','20')
insert into assiduidade (nfuncionarios,ano,diasTrabalho) values ('1001','201702','20')
insert into assiduidade (nfuncionarios,ano,diasTrabalho) values ('1002','201702','19')





