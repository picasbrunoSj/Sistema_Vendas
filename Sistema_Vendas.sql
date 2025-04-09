create database sistema_vendas;
use sistema_vendas;

create table cliente (
    id int primary key auto_increment,
    nome varchar(45) not null,
    bi char(12) unique,
    data_nascimento date,
    telefone char(13),
    endereco varchar(100)
);

create table venda (
    id int primary key auto_increment,
    valor decimal(10,2) not null,
    data_venda datetime not null,
    desconto decimal(10,2) default 0,
    id_cliente int,
    foreign key (id_cliente) references cliente(id)
);

create table fornecedor (
    id int primary key auto_increment,
    nome varchar(45) not null,
    endereco varchar(45),
    telefone char(13)
);

create table produto (
    id int primary key auto_increment,
    nome varchar(45) not null,
    valor decimal(10,2) not null,
    estado varchar(45) default 'disponivel',
    id_fornecedor int,
    foreign key (id_fornecedor) references fornecedor(id)
);

create table venda_produto (
    id_venda int,
    id_produto int,
    quantidade int not null default 1,
    valor_unitario decimal(10,2) not null,
    primary key (id_venda, id_produto),
    foreign key (id_venda) references venda(id),
    foreign key (id_produto) references produto(id)
);
