-- apagando banco de dados se existir
drop database dbpadaria;
-- criando banco de dados 
create database dbpadaria;
-- acessar o banco de dados
use dbpadaria;
--criando as tabelas no banco de dados
create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100),
email varchar(100),
telCel char(10),
primary key(codForn));


create table tbClientes(
codCli int not null auto_increment,
nome varchar(100) not null,
cpf char (14) not null unique,
email varchar (100) unique,
primary key(codCli));

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100),
email varchar(100),
telCel char(10),
dataNasc datetime,
salario decimal(9,2) default 0 check(salario >= 0),
sexo char(1) default "F" check(sexo in("F","M")),
primary key(codFunc));


create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(12) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc)references tbFuncionarios(codFunc)
);



create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
quantidade int,
preco decimal(9,2),
dataVal datetime,
lote char(10) unique,
codForn int not null,
primary key(codProd),
foreign key(codForn)references tbFornecedores(codForn));



create table tbvendas(
codVend int not null auto_increment,
dataVend date,
horaVend time,
quantidade decimal(9,2) default 0 check(quantidade >= 0),
valor decimal (9,2) default 0 check(valor >= 0),
codProd int not null,
codUsu int not null,
codCli int not null,
primary key (codVend),
foreign key (codProd)references tbProdutos(codProd),
foreign key (codUsu)references tbUsuarios(codUsu),
foreign key (codCli)references tbClientes(codCli));


-- visualizando as tabelas
show tables;
-- visualizando a estrutura das tabelas
desc tbGenero;
desc tbUsuarios;
desc tbFornecedores;
desc tbFuncionarios;
desc tbClientes;
desc tbvendas;


-- 	inserindo registros nas tabelas
insert into tbClientes(nome,cpf,email) 
	values('Manuel Ribeiro', '222.333.444.-55' ,'manuel@gmail.com');
insert into tbClientes(nome,cpf,email) 
	values('Manuela Ribeiro', '333.444.555.-66' ,'manuela@gmail.com');

/*insert into tbClientes(nome,cpf,email) 
	values('Manuelle Ribeiro', '444.555.666.-77');
insert into tbClientes(nome,cpf,email) 
	values('Manu Ribeiro', '555.666.777-88');*/

insert into tbFornecedores(nome,email,telcel) values('Verduras SA', 'sac@verduras.com.br', '94002-8922');
insert into tbFornecedores(nome,email,telcel) values('Armarinho Fernandes', 'amarinho@ferandes.com.br', '94002-8955');



insert into tbFuncionarios(nome,email,telcel,dataNasc,salario,sexo)values('Affonsinho paixão', 'paixao.aff@gmail.com', '98888-7777', '1975-03-01',7.00,'M');
insert into tbFuncionarios(nome,email,telcel,dataNasc,salario,sexo)values('Affonsinha paixão', 'paixao.affonsa@gmail.com', '95555-6666', '1977-05-12',500.00,'F');


insert into tbUsuarios(nome,senha,codFunc)values('paixao.aff@gamil.com','12345',1);
insert into tbUsuarios(nome,senha,codFunc)values('paixao.affonsa@gamil.com','54321',2);


insert into tbProdutos(descricao, quantidade,preco,dataVal,lote,codForn)values('Abacaxi',50,4.35,'2025-04-06','VSA100000',1);
insert into tbProdutos(descricao, quantidade,preco,dataVal,lote,codForn)values('Caneta azul',75,1.50,'2028-04-06','AMF100000',2);
insert into tbProdutos(descricao, quantidade,preco,dataVal,lote,codForn)values('Maça',50,2.50,'2025-05-06','VSA200000',1);
insert into tbProdutos(descricao, quantidade,preco,dataVal,lote,codForn)values('Caderno',25,15.99,'2030-04-06','AMF200000',2);
insert into tbProdutos(descricao, quantidade,preco,dataVal,lote,codForn)values('Laranja',50,1.35,'2025-07-06','VSA300000',1);
insert into tbProdutos(descricao, quantidade,preco,dataVal,lote,codForn)values('Estojo',30,15.00,'2030-04-06','AMF300000',2);

insert into tbvendas(dataVend,horaVend,quantidade,valor,codProd,codUsu,codCli)values('2025-02-28','19:30:25',10,13.50,5,1,2);
insert into tbvendas(dataVend,horaVend,quantidade,valor,codProd,codUsu,codCli)values('2025-02-28','19:30:25',2,3.00,2,2,2);
insert into tbvendas(dataVend,horaVend,quantidade,valor,codProd,codUsu,codCli)values('2025-02-28','19:30:25',10,159.90,4,1,1);
insert into tbvendas(dataVend,horaVend,quantidade,valor,codProd,codUsu,codCli)values('2025-02-28','19:30:25',5,21.75,1,2,1);


-- vizualizando os registros nas tabelas
select * from tbClientes;
select * from tbFornecedores;
select * from tbFuncionarios;
select * from tbProdutos;
select * from tbUsuarios;
select * from tbvendas;