drop database dbbarbshop;

create database dbbarbshop;

use dbbarbshop;

create table tbServico(
codServ int not null auto_increment,
nomeServ varchar(20),
valor decimal(5,2)default 0 check(valor >= 0),
descricao varchar(50),
tempo time not null,
primary key(codServ));

create table tbCliente(
codCli int not null auto_increment,
nome varchar(30),
primary key(codCli));


create table tbAgenda(
codAge int not null auto_increment,
nomeCli varchar(30) not null,
hora time,
data date,
codServ int not null,
codCli int not null,
primary key(codAge),
foreign key(codServ)references tbServico(codServ),
foreign key(codCli)references tbCliente(codCli));


create table tbExtrato(
codExtr int not null auto_increment,
codServ int not null,
codAge int not null,
primary key(codExtr),
foreign key(codServ)references tbServico(codServ),
foreign key(codAge)references tbAgenda(codAge));


show tables;

desc tbServico;
desc tbAgenda;
desc tbExtrato;

insert into tbServico(nomeServ,valor,descricao,tempo) values('Calvão de cria',999.02,'aaaaaaaaaaaa','00:30:00');
insert into tbServico(nomeServ,valor,descricao,tempo) values('Moicano do menino Ney',15.00,'aaaaaaaaaaaa','00:30:00');
insert into tbServico(nomeServ,valor,descricao,tempo) values('Decoloração de barba',47.00,'aaaaaaaaaaaa','00:30:00');

insert into tbCliente(nome) values('Afonsinho');
insert into tbCliente(nome) values('Kleberval');

insert into tbAgenda(nomeCli,hora,data,codServ,codCli) values('Afonsinho', '19:30:07', '2025-03-20',1, 1);
insert into tbAgenda(nomeCli,hora,data,codServ,codCli) values('Afonsinho', '19:30:07', '2025-03-20',3, 1);
insert into tbAgenda(nomeCli,hora,data,codServ,codCli) values('Kleberval', '20:30:01', '2025-03-20',2, 2);

insert into tbExtrato(codServ,codAge) values(1,1);
insert into tbExtrato(codServ,codAge) values(3,2);
insert into tbExtrato(codServ,codAge) values(2,3);

select * from tbServico;
select * from tbCliente;
select * from tbAgenda;
select * from tbExtrato;
