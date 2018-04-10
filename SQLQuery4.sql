create database db_ControloQuotas
use db_ControloQuotas

create table TipoQuotas
(IDTipoQuota integer ,
TipoQuota nvarchar(10)NOT NULL,
quotaMensal smallmoney NOT NULL,
constraint pk_IDTipoQuota primary key (IDTipoQuota)
)

create table Socios
(NumeroSocio integer identity (1000,1) ,
IndicadorPor int ,
NomeCompleto nvarchar(30) NOT NULL,
DataInscriçao datetime default (getdate()) ,
IDTipoQuota int NOT NULL,
sexo char(1) NOT NULL,
constraint pk_NumeroSocio primary key (NumeroSocio),
constraint ck_sexo check(sexo in ('M','F')),
---ck
constraint fk_Socios foreign key (IndicadorPor)
references Socios (NumeroSocio),
constraint fk_TipoQuotas foreign key (IDTipoQuota)
references TipoQuotas (IDTipoQuota) on update cascade
)


create table PagamentosQuotas
(NumeroSocio integer  ,
DataPagamentos datetime default (getdate()),
AnoQuota char(4) ,
MesQuota char(2),
meensalidade smallmoney ,
IVA decimal(4,2) ,
Totallpagar as (meensalidade)+(meensalidade*iva),
constraint pk_PagamentosQuotas primary key (NumeroSocio,AnoQuota,MesQuota),
constraint fk_PagamentosQuotas foreign key (NumeroSocio)
references Socios (NumeroSocio),
constraint ch_AnoQuota check (AnoQuota LIKE '2[0-9][0-9][0-9]'),
constraint ch_MesQuota check (MesQuota LIKE '[0-1][0-9]'),
)
drop table TipoQuotas 
drop table Socios 
drop table PagamentosQuotas

------.
insert into TipoQuotas  values ('1','juvenil','50')
insert into TipoQuotas  values ('2','adulto','70')
insert into TipoQuotas  values ('3','senior','50')
-----
insert into Socios (NomeCompleto,DataInscriçao,IDTipoQuota,sexo)  values ('joao paulo','2010-01-01',1,'M')
insert into Socios (NomeCompleto,DataInscriçao,IDTipoQuota,sexo)  values ('maria joao ','2010-01-01',2,'M')
insert into Socios (NomeCompleto,DataInscriçao,IDTipoQuota,sexo)  values ('pedro jose','2010-01-01',3,'M')
------
insert into PagamentosQuotas (NumeroSocio,DataPagamentos,AnoQuota,MesQuota) values (1000,'2010-01-19','2010','01')
insert into PagamentosQuotas (NumeroSocio,DataPagamentos,AnoQuota,MesQuota) values (1000,'2010-01-19','2010','02')
insert into PagamentosQuotas (NumeroSocio,DataPagamentos,AnoQuota,MesQuota) values (1001,'2010-01-19','2010','01')
insert into PagamentosQuotas (NumeroSocio,DataPagamentos,AnoQuota,MesQuota) values (1001,'2010-01-19','2010','02')
insert into PagamentosQuotas (NumeroSocio,DataPagamentos,AnoQuota,MesQuota) values (1002,'2010-01-19','2010','01')
---------------
update socios set IndicadorPor = 1001 where NumeroSocio =1000 
update socios set IndicadorPor = 1001 where NumeroSocio =1001
-
update TipoQuotas set quotaMensal = 40 where TipoQuota ='senior'
--
update TipoQuotas set IDTipoQuota = 13 where IDTipoQuota =3

alter table socios add estado nvarchar (10) default 'activa',
constraint ck_estado check (estado in ('activa','desativa'))

update PagamentosQuotas set IVA =0.21