-- apagando banco de dados
drop database dbVendas;

-- criando banco de dados
create database dbVendas;

use dbVendas;

create table tbEstado(
codEstado int,
sigla varchar(2),
primary key(codEstado)
);

create table tbEstilo(
codEstilo int,
nome varchar(50),
primary key (codEstilo)
);

create table tbUsuario(
codUsu int,
nome varchar(80),
email varchar(50),
senha varchar(20) ,
primary key (codUsu)
);

create table tbGrupo(
codGrupo int,
nome varchar (50),
primary key (codGrupo)
);

create table tbPermissao(
codPerm int,
nome varchar(50),
primary key (codPerm)
);



create table tbCidade(
codCid int,
nome varchar(50),
codEstado int,
primary key (codCid),
foreign key (codEstado) references tbEstado (codEstado)
);




create table tbCliente(
codCid int,
codCli int,
nome varchar(30),
tipoPessoa char(1) not null default "F" check(tipoPessoa in("F","M")),
cpf_cnpj varchar(30),
telefone varchar(20),
email varchar(30),
logradouro varchar(30),
numero varchar(15),
complemento varchar(20),
cep varchar(15),
primary key (codCli),
foreign key (codCid) references tbCidade (codCid)
);



create table tbCerveja(
codCer int,
codEstilo int,
sku varchar(50),
nome varchar(80),
descricao text,
valor decimal(10.2),
teorAlcoolico decimal(10,2),
comissao decimal(10,2),
sabor varchar(50),
origem varchar(50),
quantidadeEstoque int,
foto varchar(100),
contentType varchar (100),
primary key (codCer),
foreign key (codEstilo) references tbEstilo (codEstilo)
);



create table tbVenda(
codVenda int,
codCli int,
codUsu int,
dataCriacao datetime,
valorFrete decimal (10,2),
valorDesconto decimal(10,2),
valorTotal decimal(10,2),
Estatus varchar(30),
observacao varchar(200),
dataHoraEntrega datetime,
primary key (codVenda),
foreign key (codUsu) references tbUsuario (codUsu),
foreign key (codCli) references tbCliente (codCli)
);

create table tbItemVenda(
codItemVenda int,
codCer int,
codVenda int,
quantidade int,
valorUnitario decimal (10,2),
foreign key (codCer) references tbCerveja (codCer),
foreign key (codVenda) references tbVenda (codVenda)
);


create table tbUsuarioGrupo(
codUsu int,
codGrupo int,
foreign key (codUsu) references tbUsuario (codUsu),
foreign key (codGrupo) references tbGrupo (codGrupo)
);

create table tbGrupoPermissao(
codGrupo int,
codPerm int,
foreign key (codGrupo) references tbGrupo (codGrupo),
foreign key (codPerm) references tbPermissao (codPerm)
);

show tables;

desc tbEstado;
desc tbEstilo;
desc tbUsuario;
desc tbCliente;
desc tbGrupo;
desc tbPermissao;
desc tbCidade;
desc tbCerveja;
desc tbVenda;
desc tbItemVenda;
desc tbUsuarioGrupo;
desc tbGrupoPermissao;

insert into tbEstado(codEstado,sigla)
values(10,"SP");
insert into tbEstado(codEstado,sigla)
values(12,"BH");
insert into tbEstado(codEstado,sigla)
values(13,"RJ");

insert into tbEstilo(codEstilo,nome)
values(1,"Skol");
insert into tbEstilo(codEstilo,nome)
values(2,"Itaipava");
insert into tbEstilo(codEstilo,nome)
values(3,"Brahma");


insert into tbUsuario(codUsu,nome,email,senha)
values(01, 'Ana Pereira', 'anateles.09@hotmail.com', '1234');
insert into tbUsuario(codUsu,nome,email,senha)
values (02, 'Ana Pereira', 'ana.p153@hotmail.com', '4321');
insert into tbUsuario(codUsu,nome,email,senha)
values (03, 'Julia Alves', 'ju.alves@hotmail.com', '3475');


insert into tbGrupo (codGrupo, nome) 
values (01, 'Gerenciados');
insert into tbGrupo (codGrupo, nome)
 values (02, 'Atende');

insert into tbPermissao(codPerm,nome)
values(10,'Permissao 1');
insert into tbPermissao(codPerm,nome)
values(11,'Permissao 2');

insert into tbCidade(codCid,nome,codEstado)
values(20,'Sao Paulo',10);
insert into tbCidade(codCid,nome,codEstado)
values(21,'Bahia',12);
insert into tbCidade(codCid,nome,codEstado)
values(22,'Rio De Janeiro',13);

insert into tbCliente(codCid,codCli,nome,tipoPessoa,cpf_cnpj,telefone,email,logradouro,numero,complemento,cep)
values(20,10,"Thais de souza",'F','555.444.243.09','11957266124','souzathais@gmail.com','10','22','casa','09340-615');
insert into tbCliente(codCid,codCli,nome,tipoPessoa,cpf_cnpj,telefone,email,logradouro,numero,complemento,cep)
values(21,11,'Pedro Rocha','M','254.368.040.09','119090902','pedro.r@hotmail.com','15','50','casa 4','04500-670');

insert into tbCerveja(codCer, codEstilo, sku, nome, descricao, valor, teorAlcoolico, comissao, sabor, origem, quantidadeEstoque, contentType) 
values (01, 01, '123456jhgf', 'heineken Silver', 'Heineken Silver é fabricada usando um processo de guarda a uma temperatura de -1ºC, que resulta numa cerveja lager extra refrescante, com um sabor menos amargo e um final mais fresco e subtil que a torna mais fácil de beber.', 4.40, 4.0, 'PSD', 'Amargo no começo e no final fresco', '2023', 117, 'Garrafa de vidro');
insert into tbCerveja(codCer, codEstilo, sku, nome, descricao, valor, teorAlcoolico, comissao, sabor, origem, quantidadeEstoque, contentType)
 values (02, 02, '678901jhgf', 'Skol Beats', 'Skol Beats é a cerveja de quem curte uma batida perfeita.', 6.99, 8.0, 'PSD', 'sabor era mais amargo e residual', '2003', 379, 'Latinha');

insert into tbVenda(codVenda,codCli,codUsu,dataCriacao,valorFrete,valorDesconto,valorTotal,Estatus,observacao,dataHoraEntrega)
values(30,10,01,'23/10/2022',10.00,25.00,290.00,'A caminho','Delicado','24/10/2022');
insert into tbVenda(codVenda,codCli,codUsu,dataCriacao,valorFrete,valorDesconto,valorTotal,Estatus,observacao,dataHoraEntrega)
values(21,11,02,'30/11/2023',30.00,10.00,590.00,'A caminho','Delicado','01/12/2023');

insert into tbItemVenda(codItemVenda,codCer,codVenda,quantidade,valorUnitario)
values (02, 01, 30, 6, 6.99);
insert into tbItemVenda(codItemVenda,codCer,codVenda,quantidade,valorUnitario)
values(03,02,21,10,7.99);

insert into tbUsuarioGrupo (codUsu, codGrupo) 
values (01, 01);
insert into tbUsuarioGrupo (codUsu, codGrupo)
 values (02, 02);


insert into tbGrupoPermissao (codGrupo, codPerm) 
values (01, 10);
insert into tbGrupoPermissao (codGrupo, codPerm) 
values (02, 11);


-- alterando registros nas tabelas
update tbEstado set sigla = 'PI' where codEstado = 10 ;

update tbEstilo set nome = 'Heineken' where codEstilo = 1;

update tbUsuario set nome = 'Ana Teles' where codUsu = 01;

update tbCidade set nome  = 'Teresina' where codCid = 21;

update tbCliente set telefone = '35981524691' where codCli = 11;

update tbCerveja set teorAlcoolico = 5.0 where codCer = 01;

update tbVenda set valorFrete = 30.00 where codVenda = 30;

update tbItemVenda set quantidade = 15 where codItemVenda = 02;

-- utilizando o select distinct para não mostrar item repetido na tabela
select distinct sigla from tbEstado;

select distinct nome from tbEstilo;

select distinct nome from tbUsuario;

select distinct nome from tbGrupo;

select distinct nome from tbPermissao;

select distinct nome from tbCidade;

select distinct telefone from tbCliente;

select distinct teorAlcoolico from tbCerveja;

select distinct valorFrete from tbVenda;

select distinct quantidade from tbItemVenda;

-- Utilizando o delete
delete from tbEstado where sigla = "SP";

delete from tbEstilo where nome = 1;

delete from tbUsuario where email = 01;

delete from tbGrupo where nome = 02;

delete from tbPermissao where nome = 01;

delete from tbCidade where nome =21;

delete from tbCliente where email = 10;

delete from tbCerveja where sku = 01;

delete from tbVenda where valorFrete = 21;

delete from tbItemVenda where quantidade = 01;


select codEstado, sigla from tbEstado where codEstado > 20 and sigla < 13; 
select codEstilo, nome from tbEstilo where codEstilo in (2,3); 
select codUsu,nome,email,senha from tbUsuario where codUsu not in (03);
select codGrupo, nome from tbGrupo where codGrupo not in (02);
select codPerm, nome from tbPermissao where codPerm in (10);
select * from tbCidade where codCid < 22 or codCid > 20;
select * from tbCliente where codCli in (20,21);
select * from tbCerveja where codCer not in (02);
select * from tbVenda where codVenda in (30,21) ;
select * from tbItemVenda where codCer in (01);
select * from tbUsuarioGrupo where codUsu not in (02);
select * from tbGrupoPermissao where codPerm not in (10);
