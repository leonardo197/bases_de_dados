create database ERP_Consultas
use ERP_Consultas
drop table UTENTES
-------------UTENTES---------CRIATE
create table UTENTES
(NIC integer ,
NUmeroUtenteSaude integer NOT NULL unique,
Nomes nchar(20) NOT NULL,
Apelidos nchar(20) NOT NULL,
constraint pk_UTENTES primary key (NIC)
)

-------------Medicos---------CRIATE
create table MedicosFamilia
(NumeroMedico nchar(3) ,
MomeCompleto nchar(40),
NIC int,
Nacinalidade nchar(20),
constraint pk_MedicosFamilia primary key (NumeroMedico)
)


drop table MedicosFamilia
drop table AgendaConsultas
-------------AgendaConsultas---------CRIATE
create table AgendaConsultas
(NumeroConsulta int identity (1,1),
NumeroConsultaAnterior int,
DataHoraConsulta datetime NOT NULL,
NumeroUtenteSaude int ,
Numeromedico nchar(3),
Status nchar(10)  NOT NULL default 'agendada',
constraint ck_Status check(Status in ('agendada','anulada','realirada')),
constraint pk_NumeroConsultas primary key (NumeroConsulta),
-----AgendaConsultas
constraint fk_AgendaConsultas foreign key (NumeroConsultaAnterior)
references AgendaConsultas (NumeroConsulta),
----MedicosFamilia
constraint fk_MedicosFamilia foreign key (NumeroMedico)
references MedicosFamilia (NumeroMedico)on update cascade,
----UTENTES
constraint fk_UTENTES foreign key (NumeroUtenteSaude)
references UTENTES (NumeroUtenteSaude)
)
------medicamentos
alter table medicamentos add idmedicamento 
int identity(1,1) not null
--
alter table medicamentos add constraint pk_medicamentos primary key  (idmedicamento)
--
create table consultasmedicamentos
(NumeroConsulta int,
idmedicamento int,
Problema  nvarchar(255),

constraint pk_consultasmedicamentos
 primary key (NumeroConsulta,idmedicamento),
-----AgendaConsultas
constraint fk_Consultas foreign key (NumeroConsulta)
references AgendaConsultas (NumeroConsulta),
---
constraint fk_Medicamentos foreign key (idMedicamento)
references Medicamentos (idMedicamento)
)

-------insert
insert into UTENTES  values ('12345678','24364718','Jose Silva','lopes')
insert into UTENTES  values ('87654321','24364787','Maria Joao','Costa')

insert into MedicosFamilia  values ('M01','Joao Sebara Pereira',25371829,'Portugal')
insert into MedicosFamilia  values ('M02','Francisco Manuel Santo',98654317,'Portugal')

insert into AgendaConsultas (DataHoraConsulta,NumeroUtenteSaude,Numeromedico,Status) values ('2011-01-27 10',24364718,'M01','Realizada')

