create database bebidas
use bebidas

create table fornecedor(
id_fornecedor int identity (1,1),
nome nvarchar(20) not null,
telefone char (9) not null,
email nvarchar (30) not null,
--pk
constraint pk_id_fornecedor primary key (id_fornecedor)
)
--
--drop table fornecedor
--------
create table produto(
id_produto int identity (1,1),
nome nvarchar (15) not null,
quatidade_s nvarchar (2) not null,
preço smallmoney not null,
--
--pk
constraint pk_produto primary key (id_produto)

)

create table fornece(
id_fornecedor int,
id_produto int,
quantidade nvarchar(2),
--pk
constraint pk_fornece primary key (id_fornecedor,id_produto),
--fk-fornecedor
constraint fk_fornecedor foreign key (id_fornecedor)
references fornecedor (id_fornecedor),
--fk-produto
constraint fk_produto foreign key (id_produto)
references produto (id_produto)
)
--
create table fatura (
id_fatura int identity(1,1),
nif nchar,
preço smallmoney not null,
troco smallmoney not null,
constraint pk_fatura primary key (id_fatura)

)
--
create table conpra (
id_produto int,
id_fatura int,
quantidade nchar(9),
--pk
constraint pk_conpra primary key (id_produto,id_fatura),
--fk
constraint fk_produto1 foreign key(id_produto) 
references produto (id_produto),
--
constraint fk_fatura foreign key (id_fatura)
references fatura (id_fatura)
)


