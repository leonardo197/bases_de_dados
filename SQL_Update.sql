-- SQL_Update
use db_IT2017
go
-- Inserir Dados na Tabela 'Lojas'
insert into Lojas (Nomes, Contacto, Endereco, CodigoPostal, Cidade, Pais, NIF,Iniciais)
values ('LCS_PC Faro ', '289848041', 'Rua Vale Formoso 39', '8000-247', 'Fatima', 'Portugal', '946294681','FA')
insert into Lojas (Nomes, Contacto, Endereco, CodigoPostal, Cidade, Pais, NIF,Iniciais)
values ('LCS_PC Faro ', '289848041', 'Rua Vale Formoso 39', '8000-247', 'Lourinhã', 'Portugal', '946444681','LO')
insert into Lojas (Nomes, Contacto, Endereco, CodigoPostal, Cidade, Pais, NIF,Iniciais)
values ('LCS_PC Lisboa ', '212228638', 'Rua Sousa Lopes 65', '1300-109', 'Lisboa', 'Portugal', '946464681','LI')
insert into Lojas (Nomes, Contacto, Endereco, CodigoPostal, Cidade, Pais, NIF,Iniciais)
values ('LCS_PC Torres Vedras ', '216260719', 'Avenida Visconde Valmor 117', '2560-361', 'Torres Vedras', 'Portugal', '978294681','TV')
insert into Lojas (Nomes, Contacto, Endereco, CodigoPostal, Cidade, Pais, NIF,Iniciais)
values ('LCS_PC Porto ', '228692357', 'Rua dos Armazéns 103', '4200-279', 'Porto', 'Portugal', '946294611','PO')
insert into Lojas (Nomes, Contacto, Endereco, CodigoPostal, Cidade, Pais, NIF,Iniciais)
values ('LCS_PC Barcelona ', '289848041', 'Rua Vale Formoso 39', '8000-247', 'Barcelona', 'Espanha', '996294681','BA')


-- Inserir Dados na Tabela 'Tecnicos'
insert into Tecnicos (PrimeirosNomes, UltimosNomes, Sexo, NIF, Contacto, Endereco, CodigoPostal, Cidade, Pais, DataNascimento, DataIngresso)
values ('Vitoria ', 'Melo  Pereira', 'F', '180563728', '248837166', 'Largo da Mota 24', '8000-135', 'Fatima', 'Portugal', '1983-08-25', '2004-12-20')
insert into Tecnicos (PrimeirosNomes, UltimosNomes, Sexo, NIF, Contacto, Endereco, CodigoPostal, Cidade, Pais, DataNascimento, DataIngresso)
values ('Davi Filipe', 'Gomes Fernandes', 'M', '157859654', '919880675', 'Avenida Cidade Hayward 2', '8000-007', 'Fatima', 'Portugal', '1977-01-27', '2004-12-28')
insert into Tecnicos (PrimeirosNomes, UltimosNomes, Sexo, NIF, Contacto, Endereco, CodigoPostal, Cidade, Pais, DataNascimento, DataIngresso)
values ('Eduardo Filipe', 'Santos Silva', 'M', '158859654', '919880695', 'Avenida Cidade Hayward 3', '8000-007', 'Fatima', 'Portugal', '1978-01-27', '2004-12-21')
insert into Tecnicos (PrimeirosNomes, UltimosNomes, Sexo, NIF, Contacto, Endereco, CodigoPostal, Cidade, Pais, DataNascimento, DataIngresso)
values ('Davi Filipe', 'Gomes Fernandes', 'M', '109859654', '219880675', 'Avenida Cidade Hayward 4', '8000-007', 'Fatima', 'Portugal', '1979-01-27', '2004-12-27')

insert into Tecnicos (PrimeirosNomes, UltimosNomes, Sexo, NIF, Contacto, Endereco, CodigoPostal, Cidade, Pais, DataNascimento, DataIngresso)
values ('Filipe Kaua ', 'Rodrigues Martins', 'M', '210452876', '967586321', 'Largo do Conselheiro Queiroz 12', '3810-009', 'Lourinhã', 'Portugal', '1987-07-23', '2005-01-10')
insert into Tecnicos (PrimeirosNomes, UltimosNomes, Sexo, NIF, Contacto, Endereco, CodigoPostal, Cidade, Pais, DataNascimento, DataIngresso)
values ('Maria Rafaela ', 'Rocha Barros', 'F', '118456753', '938563710', 'Rua Engenheiro José Ferreira Pinto Basto 40', '3814-504', 'Lourinhã', 'Portugal', '1977-06-26', '2005-01-17')

insert into Tecnicos (PrimeirosNomes, UltimosNomes, Sexo, NIF, Contacto, Endereco, CodigoPostal, Cidade, Pais, DataNascimento, DataIngresso)
values ('Diogo  Ricardo', 'Bezerra Fernandes', 'M', '180558648', '912688253', 'Rua do Brotero 15', '1300-118', 'Lisboa', 'Portugal', '1986-12-02', '2005-02-01')
insert into Tecnicos (PrimeirosNomes, UltimosNomes, Sexo, NIF, Contacto, Endereco, CodigoPostal, Cidade, Pais, DataNascimento, DataIngresso)
values ('Isabel', 'Ventura', 'F', '105124365', '969174753', 'Travessa Cais de Alfândega Velha 22', '1300-112', 'Lisboa', 'Portugal', '1988-02-02', '2005-02-07')

insert into Tecnicos (PrimeirosNomes, UltimosNomes, Sexo, NIF, Contacto, Endereco, CodigoPostal, Cidade, Pais, DataNascimento, DataIngresso)
values (' André Martins', ' Chaves', 'M', '186322077', '969696444', 'Rua Domingos da Paula Matos Velhos 5', '2560-252', 'Torres Vedras', 'Portugal', '1978-03-16', '2005-03-01')
insert into Tecnicos (PrimeirosNomes, UltimosNomes, Sexo, NIF, Contacto, Endereco, CodigoPostal, Cidade, Pais, DataNascimento, DataIngresso)
values ('André Chaves', 'Martins', 'M', '199945666', '918744526', 'Rua Tenente Valadim Pares 10', '2560-284', 'Torres Vedras', 'Portugal', '1968-09-15', '2005-03-01')

insert into Tecnicos (PrimeirosNomes, UltimosNomes, Sexo, NIF, Contacto, Endereco, CodigoPostal, Cidade, Pais, DataNascimento, DataIngresso)
values ('Diogo Fernando', 'Ladeira', 'M', '299106541', '961285752', 'Rua Manuel Pinto de Azevedo 31', '4149-009', 'Porto', 'Portugal', '1990-04-30', '2005-03-27')
insert into Tecnicos (PrimeirosNomes, UltimosNomes, Sexo, NIF, Contacto, Endereco, CodigoPostal, Cidade, Pais, DataNascimento, DataIngresso)
values ('Diogo', 'Mourato', 'M', '201456174', '911125428', 'Rua das Águas Férreas 10', '4050-002', 'Porto', 'Portugal', '1993-10-13', '2005-03-20')

insert into Tecnicos (PrimeirosNomes, UltimosNomes, Sexo, NIF, Contacto, Endereco, CodigoPostal, Cidade, Pais, DataNascimento, DataIngresso)
values ('Marisa ', 'Baptista', 'F', '200156228', '969863453', 'Rua António Gomes Marinho São Lourenço Selho 52', '4800-132', 'Barcelona', 'Espanha', '1986-05-06', '2005-04-05')
insert into Tecnicos (PrimeirosNomes, UltimosNomes, Sexo, NIF, Contacto, Endereco, CodigoPostal, Cidade, Pais, DataNascimento, DataIngresso)
values ('Guilherme ', 'Lavadrio', 'M', '185654229', '915848889', 'Rua Gualter da Costa Guimarães 165', '4800-129', 'Barcelona', 'Espanha', '1980-10-06', '2005-04-07')


-- Inserir Dados na Tabela 'Tecnicos_lojas'
insert into Tecnicos_lojas (NTecnicos, NLojas, DataDeInicio) values ('1000', '1', '2005-01-01')
insert into Tecnicos_lojas (NTecnicos, NLojas, DataDeInicio) values ('1001', '1', '2005-01-01')
insert into Tecnicos_lojas (NTecnicos, NLojas, DataDeInicio) values ('1002', '1', '2005-01-01')
insert into Tecnicos_lojas (NTecnicos, NLojas, DataDeInicio) values ('1003', '1', '2005-01-01')

insert into Tecnicos_lojas (NTecnicos, NLojas, DataDeInicio) values ('1004', '2', '2005-01-20')
insert into Tecnicos_lojas (NTecnicos, NLojas, DataDeInicio) values ('1005', '2', '2005-01-20')

insert into Tecnicos_lojas (NTecnicos, NLojas, DataDeInicio) values ('1006', '3', '2005-02-10')
insert into Tecnicos_lojas (NTecnicos, NLojas, DataDeInicio) values ('1007', '3', '2005-02-10')

insert into Tecnicos_lojas (NTecnicos, NLojas, DataDeInicio) values ('1008', '4', '2005-03-05')
insert into Tecnicos_lojas (NTecnicos, NLojas, DataDeInicio) values ('1009', '4', '2005-03-05')

insert into Tecnicos_lojas (NTecnicos, NLojas, DataDeInicio) values ('1010', '5', '2005-03-30')
insert into Tecnicos_lojas (NTecnicos, NLojas, DataDeInicio) values ('1011', '5', '2005-03-30')

insert into Tecnicos_lojas (NTecnicos, NLojas, DataDeInicio) values ('1012', '6', '2005-04-15')
insert into Tecnicos_lojas (NTecnicos, NLojas, DataDeInicio) values ('1013', '6', '2005-04-15')




-- Inserir Dados na Tabela 'Clientes'
insert into Clientes (NomeEmpresas,PrimeirosNomes,UltimosNomes, Categoria, NIF,Endereco,CodigoPostal,Cidade,Pais,DataNascimento,Sexo,Contacto)
values('Lcslda','Leo','Santos', 'empresa', '123465789', 'rua do val 8','2530-356', 'Aveiro', 'Portugal',' 1997-01-01', 'M', '123456489')

insert into Clientes (NomeEmpresas,PrimeirosNomes,UltimosNomes, Categoria, NIF,Endereco,CodigoPostal,Cidade,Pais,DataNascimento,Sexo,Contacto)
values('Lrorifruta','Fabio','Santos', 'empresa', '123425689', 'rua do val 9','2530-356', 'Aveiro', 'Portugal',' 1997-01-01', 'M', '127456789')

insert into Clientes (PrimeirosNomes,UltimosNomes, Categoria, NIF,Endereco,CodigoPostal,Cidade,Pais,DataNascimento,Sexo,Contacto)
values('Leonardo','Santos', 'Pessoal', '123456489', 'rua do val 19','2530-356', 'Aveiro', 'Portugal',' 1997-01-01', 'M', '123457789')
--

-- Inserir Dados na Tabela 'CategoriasProdutos'
insert into CategoriasProdutos (Categorias) values ('Serviços')
insert into CategoriasProdutos (Categorias) values ('Processadores')
insert into CategoriasProdutos (Categorias) values ('Placas Gráficas')
insert into CategoriasProdutos (Categorias) values ('Fontes')
insert into CategoriasProdutos (Categorias) values ('Motherboards')
insert into CategoriasProdutos (Categorias) values ('Memórias RAM')
insert into CategoriasProdutos (Categorias) values ('Armazenamento')
insert into CategoriasProdutos (Categorias) values ('Ecrãs')
insert into CategoriasProdutos (Categorias) values ('Baterias')
insert into CategoriasProdutos (Categorias) values ('Canbras ')



-- Inserir Dados na Tabela 'Produtos'
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('1', 'Mão de Obra 1', 'Custo/Hora', 'Norma', '45.00')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('1', 'Mão de Obra 2', 'Custo/Hora', 'Especialisada', '50.00')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('2', 'Core i7-8700K', 'Hexa-Core 3.7GHz c/ Turbo 4.7GHz 17MB', 'Intel', '505.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('2', 'Core i5-8500K', 'Hexa-Core 2.7GHz c/ Turbo 3.8GHz 13MB', 'Intel', '205.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('2', 'Core i3-8300K', 'Hexa-Core 1.7GHz c/ Turbo 3.7GHz 12MB', 'Intel', '105.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('3', 'NVIDIA GeForce GTX 1080 ', 'ROG Strix 8GB Assassins Creed Origins', 'Asus', '799.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('3', 'NVIDIA GeForce GTX 1080 Ti', 'ROG Strix 11GB Assassins Creed Origins', 'Asus', '899.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('3', 'NVIDIA GeForce GTX 1070 Ti', 'ROG Strix 7GB Assassins Creed Origins', 'Asus', '699.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('3', 'NVIDIA GeForce GTX 1070 ', 'ROG Strix 6GB Assassins Creed Origins', 'Asus', '599.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('3', 'NVIDIA GeForce GTX 1060 TI', 'ROG Strix 6GB Assassins Creed Origins', 'Asus', '299.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('3', 'NVIDIA GeForce GTX 1050', 'ROG Strix 6GB Assassins Creed Origins', 'Asus', '199.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('4', 'Cooler Master 1500W', 'Modular 1500W 80plus', 'Cooler Master', '294.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('4', 'Cooler Master 1000W', 'Semi Modular 1000W 80plus', 'Cooler Master', '194.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('4', 'HX1000', 'Full Modular 1000W', 'Corsair', '213.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('5', 'ROG Strix X399-E Gaming', 'Extended-ATX AMD HEDT', 'Asus', '369.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('5', 'Z370M Mortar', 'Micro-ATX  Intel Z370', 'MSI', '129.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('6', 'Trident Z RGB 16GB (2x8GB)', 'DDR4-3200MHz CL14 Preta', 'G.SKILL', '297.50')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('6', 'Vengeance LPX 16GB (4x4GB)', 'DDR4-2400MHz CL14 Preta', 'Corsair', '233.50')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('2', 'Hydro Series H115i PRO', 'Water Cooler RGB', 'Corsair', '130.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('2', 'MasterAir MA610P', 'Cooler CPU RGB', 'Cooler Master', '74.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('7', 'SSD 2.5" Plus', '960GB MLC SATA', 'SanDisk', '289.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('7', 'SSD 2.5" CM871a', '512GB TLC SATA Bulk', 'Samsung', '169.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('8', 'Ecrã Iphone 8', '5.5" Touchscreen', 'Apple', '150.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('8', 'Ecrã Galaxy S8', '5.8" Touchscreen', 'Samsung', '180.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('9', 'Bateria Iphone 8', 'Bateria Iphone 8, 8s 1600MHA', 'Apple', '99.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('9', 'Bateria Galaxy S8 Plus', 'Bateria Galaxy S8+ 2800MHA', 'Samsung', '110.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('9', 'Bateria Iphone 7', 'Bateria Iphone 7, 7s 1200MHA', 'Apple', '89.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('9', 'Bateria Galaxy S7 Plus', 'Bateria Galaxy S7+ 2200MHA', 'Samsung', '90.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('10', 'Canbras Iphone 8', 'Canbras Iphone 8, 8s 8mpx', 'Apple', '120.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('10', 'Canbras Galaxy S8 Plus', 'Canbras Galaxy S8+ 16mpx', 'Samsung', '190.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('10', 'Canbras Iphone 7', 'Canbras Iphone 7, 7s 6mpx', 'Apple', '90.90')
insert into Produtos (NCategorias, Nomes, Descricao, Marca,PrecoUnitario)
values ('10', 'Canbras Galaxy S7 Plus', 'Canbras Galaxy S7+ 12mpx', 'Samsung', '100.90')


-- Inserir Dados na Tabela 'Processos'

insert into Processos (NLojasInicio, NTecnicosInicio, NClientes, Avaria ,Tipo ,Estado, DataInicio, DataFin)
values ('1','1000','1000','Ecrã Partido','reparação','encerrado','2005-01-01','2005-01-02')
insert into Processos (NLojasInicio, NTecnicosInicio, NClientes, Avaria ,Tipo ,Estado, DataInicio, DataFin)
values ('1','1001','1001','Ecrã Partido','reparação','encerrado','2005-01-01','2005-03-02')
insert into Processos (NLojasInicio, NTecnicosInicio, NClientes, Avaria ,Tipo ,Estado, DataInicio, DataFin)
values ('2','1002','1002','Bateria Partido','reparação','encerrado','2005-01-01','2005-02-02')
insert into Processos (NLojasInicio, NTecnicosInicio, NClientes, Avaria ,Tipo ,Estado, DataInicio, DataFin)
values ('3','1000','1000','Bateria Partidas','reparação','encerrado','2005-01-01','2005-07-02')
insert into Processos (NLojasInicio, NTecnicosInicio, NClientes, Avaria ,Tipo ,Estado, DataInicio, DataFin)
values ('4','1001','1001','Canbras Partidas','reparação','aberto','2005-01-01','2005-09-02')
insert into Processos (NLojasInicio, NTecnicosInicio, NClientes, Avaria ,Tipo ,Estado, DataInicio, DataFin)
values ('4','1002','1001','Canbras Partidas','reparação','aberto','2005-01-01','2005-10-02')


-- Inserir Dados na Tabela 'DetalhesProcessos'
insert into DetalhesProcessos (NProcessos, NProdutos, NLojas, NTecnicos, qty,Descricao, DataDeInicio)
values ('1', '23', '1','1000', '1','Substituição Ecrã','2012-02-21')
insert into DetalhesProcessos (NProcessos, NProdutos, NLojas, NTecnicos, qty,Descricao, DataDeInicio)
values ('2', '24', '2','1003', '1','Substituição Ecrã','2012-02-21')
insert into DetalhesProcessos (NProcessos, NProdutos, NLojas, NTecnicos, qty,Descricao, DataDeInicio)
values ('1', '1', '2','1002', '1','Mão de Obra','2012-03-21')
insert into DetalhesProcessos (NProcessos, NProdutos, NLojas, NTecnicos, qty,Descricao, DataDeInicio)
values ('2', '2', '2','1002', '2','Mão de Obra','2012-03-21')
insert into DetalhesProcessos (NProcessos, NProdutos, NLojas, NTecnicos, qty,Descricao, DataDeInicio)
values ('6', '2', '3','1003', '3','Mão de Obra','2012-03-21')
insert into DetalhesProcessos (NProcessos, NProdutos, NLojas, NTecnicos, qty,Descricao, DataDeInicio)
values ('6', '4', '3','1003', '1','Mudaça de canbras','2012-03-21')
   


select *from Faturas
PR_EmitirFaturas 1
PR_EmitirFaturas 6
PR_AnularFaturas '1000/2018/FA'
PR_AnularFaturas '1000/2018/FA'