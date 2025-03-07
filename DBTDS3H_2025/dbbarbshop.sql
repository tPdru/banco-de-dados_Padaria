drop database dbbarbshop;

create database dbbarbshop;

create table tbServico(
codServ int not null auto_increment,
nomeServ varchar(20),
valor decimal(3,2)default 0 check(valor >= 0),
descricao varchar(50),
tempo time not null,
primary key(codServ)
);

create table tbAgenda(
codAge int not null auto_increment,
nomeCli varchar(30) not null,
hora time,
data date,
codServ int not null,
primary key(codAge),
foreign key(codServ)references tbServico(codServ));

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

insert into tbServico(nomeServ,valor,descricao,tempo) values('Calvão de cria',50.00,'aaaaaaaaaaaa','00:30:00');
insert into tbServico(nomeServ,valor,descricao,tempo) values('Moicano do menino Ney',50.00,'aaaaaaaaaaaa','00:30:00');
insert into tbServico(nomeServ,valor,descricao,tempo) values('',50.00,'aaaaaaaaaaaa','00:30:00');