create database db_farmacia_bem_estar;

use db_farmacia_bem_estar;

create table tb_categorias(
	idcategorias bigint auto_increment,
    nome_categoria varchar(255) not null,
    descricao_categoria varchar(255) not null,
    primary key(idcategorias)
);

select * from tb_categorias;

insert into tb_categorias(nome_categoria, descricao_categoria)
values("Genérico", "São medicamentos que têm as mesmas características e produzem no organismo os mesmos efeitos que um medicamento de marca, mas não têm nome comercial e são vendidos pelo princípio ativo"),
("Manipulado", "Os remédios manipulados são aqueles que são preparados em farmácias de manipulação mediante a apresentação de uma receita");

create table tb_produtos(
	idprodutos bigint auto_increment,
    nome_produto varchar(255) not null,
    marca_produto varchar(255) not null,
    preco_produto decimal(6,2) not null,
    descricao_produto varchar(255) not null,
    fk_produtos_categorias bigint not null,
	primary key(idprodutos),
    foreign key(fk_produtos_categorias) references tb_categorias(idcategorias)
);

select * from tb_produtos;

insert into tb_produtos(nome_produto, marca_produto, preco_produto, descricao_produto, fk_produtos_categorias)
values("Dipirona", "Dipilux", 35.95, "é um anti-inflamatório não esteroidal (AINE) com ação antitérmica", 1),
("Dorflex", "Flexlin", 105.00, "Dorflex é um medicamento que possui ação analgésica e relaxante muscular.", 1),
("Diclofenaco", "Diclo", 50.00, "O diclofenaco é um remédio analgésico, anti-inflamatório e antitérmico", 1),
("Soro fisiologico", "Soroclean", 92.13, "O soro fisiológico é uma solução que contém sal e água", 1),
("Clean Hair", "CleanHair", 65.95, "Para Cabelo", 2),
("Dor Plex", "DorPlex", 70.00, "Dor de ouvido.", 2),
("DicNic", "Dicnov", 80.00, "Fungos e bacterias", 2),
("Acne max", "Acne max", 22.13, "Tratamento de acne", 2);

select * from tb_produtos where preco_produto > 5 and preco_produto < 60;

select * from tb_produtos where nome_produto like "%R";

select nome_produto, marca_produto, tb_categorias.nome_categoria from tb_produtos
inner join tb_categorias
on tb_produtos.fk_produtos_categorias=tb_categorias.idcategorias;

select nome_produto, marca_produto, tb_categorias.nome_categoria from tb_produtos
inner join tb_categorias
on tb_produtos.fk_produtos_categorias=tb_categorias.idcategorias
where nome_categoria="Manipulado";


