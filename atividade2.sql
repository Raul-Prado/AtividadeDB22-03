create database db_pizzaria_legal;

use db_pizzaria_legal;

create table tb_categorias(
	idcategorias bigint auto_increment,
    nome varchar(255) not null,
	descricao varchar(255) not null,
    primary key(idcategorias)
);

select * from tb_categorias;

insert into tb_categorias(nome, descricao)
values
("Salgado", "Pizza contém ingredientes salgados"),
("Doce", "Pizza contém ingredientes doces");

create table tb_pizzas(
	id bigint auto_increment,
    sabor varchar(255) not null,
    descricao varchar(255) not null,
    fk_produtos_categorias bigint not null,
    preco decimal(6,2) not null,
    primary key(id),
    foreign key(fk_produtos_categorias) references tb_categorias (idcategorias)
);

select * from tb_pizzas;
drop table  tb_pizzas;

insert into tb_pizzas(sabor, descricao, fk_produtos_categorias, preco)
values
("Mussarela", "Qqueijo, Azeitona, Oregano, Tomate", 1, 39.90),
("Calabresa", "Calabresa, Cebola, Azeitona", 1, 30.00),
("Portuguesa", "Presunto, Ovo, Milho, Queijo", 1, 55.25),
("Pernil", "Pernil, Bacon, Queijo, Tomate, Azeitona", 1, 59.95),
("Chocolate", "Chocolate ao leite", 2, 45.00),
("Romeu e Julieta", "Queijo Branco, Doce de Goiaba", 2, 49.90),
("Chocolate Branco", "Chocolate ao leite", 2, 50.00),
("Chocolate com Morango", "Chocolate ao leite, Morango", 2, 45.00);

#todas ass pizzas maior que o valor de 45
select * from tb_pizzas where preco > 45.00;

#todas ass pizzas entre os valorde 50e100
select * from tb_pizzas where preco > 50 and preco < 100;

#buscando todasas pizzas que possuam a letra M
select * from tb_pizzas where sabor like "%M%";

#unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias
select sabor, preco, tb_categorias.nome from tb_pizzas 
inner join tb_categorias
on tb_pizzas.fk_produtos_categorias=tb_categorias.idcategorias;

#unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, onde traga apenas ass pizzas que pertençam a uma categoria específica (Exemplo: Todas ass pizzas que são doce).
select sabor, tb_categorias.nome from tb_pizzas 
inner join tb_categorias
on tb_pizzas.fk_produtos_categorias=tb_categorias.idcategorias
where nome="Doce";
