
create database  db_IT2017
go
use db_IT2017
go
-- Criar Tabela lojas

create table Lojas
(NLojas integer identity (1,1),
Nomes nchar(30)NOT NULL,
Iniciais nchar(2)NOT NULL unique,
NIF nchar(9) NOT NULL unique,
Contacto nchar(9) NOT NULL,
Endereco nchar(60) NOT NULL,
CodigoPostal nchar(8)NOT NULL,
Cidade nchar(25) NOT NULL,
Pais nchar(25) NOT NULL,
constraint pk_Lojas primary key (NLojas),
constraint pk_CodigoPostal_Lojas check (CodigoPostal LIKE '[1-9][0-9][0-9][0-9][-][0-9][0-9][0-9]'),
constraint ch_Contacto_Lojas check (Contacto LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
constraint ch_NIF_Lojas check (nif LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
constraint ch_Iniciais_Lojas check (Iniciais NOT LIKE'%^A-Z ]%')
)
-- Criar Tabela Tecnicos
-------------------------------------------------
create table Tecnicos
(NTecnicos integer identity (1000,1),
PrimeirosNomes nchar(30)NOT NULL,
UltimosNomes nchar(30) NOT NULL,
NIF nchar(9) NOT NULL unique,
Endereco nchar(60) NOT NULL,
CodigoPostal nchar(8)NOT NULL,
Cidade nchar(25) NOT NULL,
Pais nchar(25) NOT NULL,
DataNascimento datetime NOT NULL, 
Sexo nchar(1) NOT NULL,
Contacto nchar(9),
DataIngresso datetime default getdate() not null,
constraint ch_PrimeirosNomes_Tecnicos check (PrimeirosNomes NOT LIKE'%^A-Z ]%'),
constraint ch_UltimosNomes_Tecnicos check (UltimosNomes NOT LIKE'%^A-Z ]%'),
constraint ch_Sexo_Tecnicos check (Sexo in ('M', 'F')),
constraint ch_NIF_Tecnicos check (NIF LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
constraint ch_Contacto_Tecnicos check (Contacto LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
constraint ch_DataNascimento_Tecnicos check (year(DataNascimento)> 1950 and year(DataNascimento) < year(getdate()-16)),
constraint CK_DataIngressoTecnicos check (DataIngresso > DataNascimento +16 and DataIngresso <= getdate()),
constraint ch_CodigoPostal_Tecnicos check (CodigoPostal LIKE '[1-9][0-9][0-9][0-9][-][0-9][0-9][0-9]'),

constraint pk_Tecnicos primary key (NTecnicos),
)

-- Criar Tabela Tecnicos_lojas
-------------------------------------------------
create table Tecnicos_lojas(
NTecnicos integer,
NLojas integer,
DataDeInicio datetime default getdate() NOT NULL, 
DataDeFim datetime, 

constraint ch_DataDeInicio check (year(DataDeInicio)> 1950 and year(DataDeInicio) <= year(getdate()) and DataDeInicio<=DataDeFim ),
constraint ch_DataDeFim check (year(DataDeFim)> 1950 and year(DataDeFim) <= year(getdate()) and DataDeInicio<=DataDeFim ),
constraint pk_Tecnicos_lojas primary key (NTecnicos,NLojas,DataDeInicio),
constraint fk_TL_Tecnicos foreign key (NTecnicos)
references Tecnicos (NTecnicos),
constraint fk_TL_Lojas foreign key (NLojas)
references Lojas (NLojas)
)

-- Criar Tabela Clientes
--------------------------------------------------
create table Clientes
(NClientes integer identity (1000,1),
NomeEmpresas nchar(70) ,
PrimeirosNomes nchar(50)NOT NULL ,
UltimosNomes nchar(50)NOT NULL ,
Categoria nchar(15) NOT NULL,
NIF nchar(9) NOT NULL unique,
Endereco nchar(60) NOT NULL,
CodigoPostal nchar(8) NOT NULL ,
Cidade nchar(525) NOT NULL,
Pais nchar(25) NOT NULL,
DataNascimento datetime NOT NULL, 
Sexo nchar(1),
Contacto nchar(9),
constraint ch_PrimeirosNomes_Clientes check (PrimeirosNomes NOT LIKE'%^A-Z ]%'),
constraint ch_UltimosNomes_Clientes check (UltimosNomes NOT LIKE'%^A-Z ]%'),
constraint CK_TipoClienteClientes check (Categoria in ('Pessoal', 'Empresa')),
constraint ch_Sexo check (Sexo in ('M', 'F')),
constraint ch_CodigoPostal_Clientes check (CodigoPostal LIKE '[1-9][0-9][0-9][0-9][-][0-9][0-9][0-9]'),
constraint ch_NIF_Clientes check (NIF LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
constraint ch_DataNascimento check (year(DataNascimento)> 1950 and year(DataNascimento) < year(getdate())),
constraint PK_Clientes primary key (NClientes)
)
-- drop table Produtos
 -- Criar Tabela Tarefas

-------------------------------------------------------
create table Processos
(NProcessos integer identity (1,1),
NLojasInicio int not null,
NTecnicosInicio int not null,
NClientes int not null,
Avaria nchar(60) NOT NULL,
Tipo nchar(10) NOT NULL,
Estado nchar(15) default 'aberto',
DataInicio datetime default getdate() NOT NULL,
DataFin datetime,
---ch
constraint ch_Estado check (Estado in ('aberto', 'encerrado','anulado')),
constraint ch_Tipo check (Tipo in ('manutenção', 'reparação')),
--pk
constraint pk_Tarefas primary key (NProcessos),
---ck
constraint fk_NLojasInicio foreign key (NLojasInicio)
references Lojas (NLojas),
constraint fk_NTecnicosInicio foreign key (NTecnicosInicio)
references Tecnicos (NTecnicos),
constraint fk_NClientes foreign key (NClientes)
references Clientes (NClientes)
)
-- Criar Tabela CategoriasProdutos
 
-----------------------------------------
create table Categorias
(NCategorias int identity (1,1),
Categorias nvarchar(20)not null,
constraint pk_CategoriasProdutos primary key (NCategorias)
)

-- Criar Tabela Pessas
-----------------------------------------
create table Produtos
(NProdutos integer identity (1,1),
NCategorias int NOT NULL,
Nomes nchar(30)NOT NULL,
Descricao nvarchar(60),
Marca nvarchar(25),
PrecoUnitario smallmoney NOT NULL,
constraint pk_Pessas primary key (NProdutos),

constraint fk_DT_NCategorias foreign key (NCategorias)
references CategoriasProdutos (NCategorias),
)

-- Criar Tabela DetalhesProcessos
---------------------------------------
create table DetalhesProcessos
(NProcessos int not null,
NProdutos int not null,
NLojas int not null,
NTecnicos int not null,
DataDeInicio datetime default getdate() NOT NULL,
PrecoUnitario smallmoney not null,
qty int not null,
Descricao nvarchar(60),
IVA decimal(5,2)not null default 0.23 ,
SubTotal as (PrecoUnitario*qty)+(PrecoUnitario*qty)*IVA not null,
constraint pk_TarefasDetalhes primary key (NProcessos,NProdutos),
constraint fk_DT_NProcessos foreign key (NProcessos)
references Processos (NProcessos),
constraint fk_DT_NProdutos foreign key (NProdutos)
references Produtos (NProdutos),
constraint fk_DT_NLojas foreign key (NLojas)
references Lojas (NLojas),
constraint fk_DT_NTecnicos foreign key (NTecnicos)
references Tecnicos (NTecnicos),
constraint ch_DataDeInicio_DetalhesProcessos check (DataDeInicio> 1950 and DataDeInicio <=getdate())
)
-- Criar Tabela Faturas
---------------------------------------
create table Faturas
(NFaturas int identity (1000,1),
NProcessos int not null,
EstadoFatura nvarchar(9) not null,
NumeroFatura nvarchar(20) unique not null,
Data datetime default getdate() not null,
constraint PK_Faturas primary key (NFaturas),
constraint FK_IDProcessoFaturas foreign key (NProcessos) references Processos (NProcessos),
constraint CK_EstadoFaturaFaturas check (EstadoFatura in ('emitida', 'anulada')))
---------------------------Segurança
-- Segurança -- Trigger que não permite a alteraçao do nif dos Tecnicos
go
create trigger tr_TecnicosNIF on Tecnicos after update as
if update (NIF)
	begin
		print 'Este campo não pode ser alterado.'
		rollback tran
		return
	end
	go
create trigger tr_ClientesNIF on Clientes after update as
if update (NIF)
	begin
		print 'Este campo não pode ser alterado.'
		rollback tran
		return
	end
	go
-- Segurança -- Trigger que não permite a remoçao de dados dos Tecnicos
create trigger tr_TecnicosDeleted on Tecnicos after delete as
begin
	print 'Os registos de Tecnicos não podem ser apagados.'
	rollback tran
	return
end
go
-- Segurança -- Trigger que não permite a remoçao de dados dos Clientes
create trigger tr_ClientesDeleted on Clientes after delete as
begin
	print 'Os registos de Cliente não podem ser apagados.'
	rollback tran
	return
end
go
-- Segurança -- Trigger que não permite a remoçao de dados dos Faturas
create trigger tr_FaturasDeleted on Faturas after delete as
begin
	print 'Os registos de Faturas não podem ser apagados.'
	rollback tran
	return
end
go
-- Segurança -- Trigger que não permite a remoçao/alteraçao de dados dos Tecnicos
create trigger tr_Tecnicos_lojasDeleted on Tecnicos_lojas after delete as
begin
	print 'Os registos de Tecnicos_lojas não podem ser apagados.'
	rollback tran
	return
end
go
-- Segurança -- Trigger que não permite a remoçao de dados dos Tecnicos_lojas
create trigger tr_Tecnicos_lojasUpdate on Tecnicos_lojas after  update as
begin
if update(DataDeFim)
 begin
  print ''
 end
 else
 begin
	print 'Os registos de Tecnicos_lojas não podem ser mudificados.'
	rollback tran
	return
 end
end
go
-- Segurança -- Trigger que não permite a remoçao de dados dos Tecnicos_lojas
create trigger tr_Tecnicos_Tecnicos_lojas_Update on Tecnicos_lojas after  update as
begin
	print 'Os registos de Tecnicos_lojas não podem ser mudificados.'
	rollback tran
	return
end

go
-- Segurança -- Trigger que Remove espaços duplicados dosTécnicos
create trigger TR_TecnicosNomes on Tecnicos instead of insert, update as
declare @NomeEmpresas nvarchar(50), @PrimeirosNomes nvarchar(50), @UltimosNomes nvarchar(50), @Sexo nchar(1), @NIF nchar(9), @Contacto nchar(9)
declare @Endereço nvarchar(50), @CodigoPostal nchar(8), @Cidade nvarchar(50), @Pais nvarchar(50)
declare @DataNascimento date, @DataIngresso date
set @PrimeirosNomes = (select PrimeirosNomes from inserted)
set @UltimosNomes = (select UltimosNomes from inserted)
set @Sexo = (select Sexo from inserted)
set @NIF = (select NIF from inserted)
set @Contacto = (select Contacto from inserted)
set @Endereço = (select Endereco from inserted)
set @CodigoPostal = (select CodigoPostal from inserted)
set @Cidade = (select Cidade from inserted)
set @Pais = (select Pais from inserted)
set @DataNascimento = (select DataNascimento from inserted)
set @DataIngresso = (select DataIngresso from inserted)
begin
	while charindex('  ', @PrimeirosNomes) > 0
		set @PrimeirosNomes = replace(@PrimeirosNomes, '  ', ' ')
	while charindex('  ', @UltimosNomes) > 0
		set @UltimosNomes = replace(@UltimosNomes, '  ', ' ')
	insert into Tecnicos (PrimeirosNomes, UltimosNomes, Sexo, NIF, Contacto, Endereco, CodigoPostal, Cidade, Pais, DataNascimento, DataIngresso) 
	values (@PrimeirosNomes, @UltimosNomes, @Sexo, @NIF, @Contacto, @Endereço, @CodigoPostal, @Cidade, @Pais, @DataNascimento, @DataIngresso)
end

go

-- Segurança -- Trigger que Remove espaços duplicados dos Clientes
create trigger TR_ClientesNomes on Clientes instead of insert, update as
declare @CategoriaCliente nchar(8), @NomeEmpresa nvarchar(50), @PrimeirosNomes nvarchar(50), @UltimosNomes nvarchar(50)
declare @Sexo nchar(1), @NIF nchar(9), @Contacto nchar(9), @Endereço nvarchar(50), @CodigoPostal nchar(8)
declare @Cidade nvarchar(50), @Pais nvarchar(50), @DataNascimento date
set @CategoriaCliente = (select Categoria from inserted)
set @NomeEmpresa = (select NomeEmpresas from inserted)
set @PrimeirosNomes = (select PrimeirosNomes from inserted)
set @UltimosNomes = (select UltimosNomes from inserted)
set @Sexo = (select Sexo from inserted)
set @NIF = (select NIF from inserted)
set @Contacto = (select Contacto from inserted)
set @Endereço = (select Endereco from inserted)
set @CodigoPostal = (select CodigoPostal from inserted)
set @Cidade = (select Cidade from inserted)
set @Pais = (select Pais from inserted)
set @DataNascimento = (select DataNascimento from inserted)
begin
    while charindex('  ', @PrimeirosNomes) > 0 
        set @PrimeirosNomes = replace(@PrimeirosNomes, '  ', ' ')
    while charindex('  ', @UltimosNomes) > 0 
        set @UltimosNomes = replace(@UltimosNomes, '  ', ' ')
	while charindex('  ', @NomeEmpresa) > 0 
		set @NomeEmpresa = replace(@NomeEmpresa, '  ', ' ')
	insert into Clientes (Categoria, NomeEmpresas, PrimeirosNomes, UltimosNomes, Sexo, NIF, Contacto, Endereco, CodigoPostal, Cidade, Pais, DataNascimento) 
	values (@CategoriaCliente, @NomeEmpresa, @PrimeirosNomes, @UltimosNomes, @Sexo, @NIF, @Contacto, @Endereço, @CodigoPostal, @Cidade, @Pais, @DataNascimento)
end


go

-- Segurança -- Trigger que vai buscar  preço
create trigger TR_PreçoDetalhesProcessos on DetalhesProcessos instead of insert as
declare @NProcessos int, @Descricao nvarchar(50), @NLojas int, @NTecnicos int
declare @Data date, @NProdutos int, @PrecoUnitario money, @qty int
set @NProcessos = (select NProcessos from inserted)
set @Descricao= (select Descricao from inserted)
set @NLojas = (select NLojas from inserted)
set @NTecnicos = (select NTecnicos from inserted)
set @Data = (select DataDeInicio from inserted)
set @NProdutos = (select NProdutos from inserted)
set @PrecoUnitario = (select PrecoUnitario from Produtos where NProdutos = @NProdutos)
set @qty = (select qty from inserted)
begin
	insert into DetalhesProcessos (NProcessos, NProdutos, Descricao, NLojas, NTecnicos, DataDeInicio, PrecoUnitario, qty) 
	values (@NProcessos, @NProdutos, @Descricao, @NLojas, @NTecnicos,@Data, @PrecoUnitario, @qty)
end 

go

-- Segurança -- Trigger que incrementa o NumeroFatura na Tabela Faturas com as iniciais da loja
create trigger TR_NumeroFaturaFaturas on Faturas after insert as
declare @NumeroFatura nvarchar(20)
declare @N nvarchar(20) = (select NFaturas from inserted)
set @NumeroFatura = convert(nvarchar(4), @N) + '/'+convert(nvarchar(4), (year(getdate())))+'/'+convert(nvarchar(2),(
select L.Iniciais from Faturas F 
join Processos P on  P.NProcessos=F.NProcessos 
join Lojas L on L.NLojas=p.NLojasInicio 
where f.NFaturas=@N))

update Faturas set NumeroFatura = @NumeroFatura
where NFaturas = @N
go

-- Procedimentos ----------------------------------------------------------------

-- Procedimentos -- Proceimento que Emite Faturas
create proc PR_EmitirFaturas @NProcessos int as
declare @NumeroFatura nvarchar(20), @Total money, @EstadoFatura nvarchar(9),
        @Nomes nchar(20),@NIF nchar(9),@CodigoPostal nchar(8)

if exists (select * from Processos where NProcessos = @NProcessos)
 begin
    if not exists(select * from Faturas where NProcessos = @NProcessos and EstadoFatura='emitida' )
	 begin
	  insert into Faturas (NProcessos, EstadoFatura) values (@NProcessos, 'emitida')
	  update Processos set Estado = 'encerrado' where NProcessos = @NProcessos
	  update Processos set DataFin = GETDATE() where NProcessos = @NProcessos
     end
	set @NumeroFatura = (select NumeroFatura from Faturas where NProcessos = @NProcessos)
	set @EstadoFatura = (select EstadoFatura from Faturas where NProcessos = @NProcessos)
	set @Nomes=convert(nvarchar(60),(
    select L.Nomes from Faturas F 
     join Processos P on  P.NProcessos=F.NProcessos 
     join Lojas L on L.NLojas=p.NLojasInicio 
     where p.NProcessos=@NProcessos))

    set @NIF=convert(nvarchar(9),(
     select L.NIF from Faturas F 
     join Processos P on  P.NProcessos=F.NProcessos 
     join Lojas L on L.NLojas=p.NLojasInicio 
     where p.NProcessos=@NProcessos))

	 set @CodigoPostal=convert(nvarchar(9),(
     select L.CodigoPostal from Faturas F 
     join Processos P on  P.NProcessos=F.NProcessos 
     join Lojas L on L.NLojas=p.NLojasInicio 
     where p.NProcessos=@NProcessos))

	 print '----------------------------------------------------------------------------------------------------'
	set @Total = (select sum(SubTotal)'Total' from DetalhesProcessos where NProcessos = @NProcessos)
	print 'Fatura nº: ' +@NumeroFatura
	select Descricao, NProdutos, PrecoUnitario, qty, IVA, SubTotal from DetalhesProcessos where NProcessos = @NProcessos
	print 'Total: ' +convert(nvarchar(20), @Total) +'€'
	print 'Estado da Fatura: '+@EstadoFatura
	print '----------------------------------------------------------------------------------------------------'
	print 'Loja responsavel: '+@Nomes
	print 'NIF da Loja : '+@NIF
	print 'CodigoPostal da Loja : '+@CodigoPostal
 end	

go
-- Procedimentos -- Procedimento AnularFaturas
create proc PR_AnularFaturas @NumeroFatura nvarchar(20) as
declare @IDProcesso int
set @IDProcesso = (select NProcessos from Faturas where NumeroFatura = @NumeroFatura)
if exists (select NumeroFatura from Faturas where NumeroFatura = @NumeroFatura)
update Faturas set EstadoFatura = 'anulada' where NumeroFatura = @NumeroFatura
update Processos set Estado = 'aberto' where NProcessos = @IDProcesso
go

-- Procedimentos -- Procedimento que mostra todos os Processos para um Cliente
create proc PR_ConsultaCliente @NClientes int as
if exists (select NProcessos from Processos where NClientes = @NClientes)
declare @Total money
begin
set @Total = 
(select sum(DT.SubTotal)'sub_total' from Processos P
join DetalhesProcessos DT on P.NProcessos = DT.NProcessos
where NClientes = @NClientes
)
print 'Processos do Cliente: ' +convert(nvarchar(4),@NClientes)
print '--------------------------------------------------------------------'
select P.NProcessos, P.Estado,L.Nomes, sum(DT.SubTotal)'sub_total' from Processos P
join DetalhesProcessos DT on P.NProcessos = DT.NProcessos
join Lojas L on L.NLojas=P.NLojasInicio
where NClientes = @NClientes
group by P.NProcessos, P.Estado,L.Nomes
order by P.NProcessos
print '---------------------------------------------------------------------'
print 'Total gasto na enpresa: '+@total +'€'
end

