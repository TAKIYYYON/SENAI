drop database farma_db;
create database farma_db;
use farma_db;
create table produtos(
idproduto int primary key auto_increment,
nome varchar(99),
marca varchar(250),
nlote varchar(99),
validade varchar(99),
categoria varchar(99),
categoriaaplicacao varchar(99),
formaapresentacao varchar(99),
dosagem varchar(99),
volume varchar(99),
preço decimal(10,2)
);
create table funcionario(
idfuncionario int primary key auto_increment,
nome varchar(99),
email varchar(99),
senha varchar(99)
);
create table estoque(
idprodutoestoque int primary key auto_increment,
funcionario_id int,
produto_id int,
quantidadeatual int,
quantidademaxima int,
quantidademinima int,
horaentrada datetime,
horasaida datetime,
foreign key (produto_id) references produtos(idproduto),
foreign key (funcionario_id) references funcionario(idfuncionario)
);
insert into produtos(nome,marca,nlote,validade,categoria,categoriaaplicacao,formaapresentacao,dosagem,volume,preco) values ("diazepam","generico","0099428","20/12/2024","medicamentos","venda livre","comprimidos","1 comprimido por dia","N/D","R$0,50/unidade");
insert into estoque (produto_id, quantidadeatual, quantidademaxima, quantidademinima, horaentrada, horasaida) VALUES (1, 10, 100, 5, '2025-02-20 18:38:00', '2025-02-20 20:18:00');
SELECT 
    produtos.nome,
    produtos.marca,
    produtos.nlote,
    produtos.validade,
    produtos.categoria,
    produtos.categoriaaplicacao,
    produtos.formaapresentacao,
    produtos.dosagem,
    produtos.volume,
    produtos.preco,
    estoque.quantidademaxima,
    estoque.quantidadeatual,
    estoque.quantidademinima,
    estoque.horasaida,
    estoque.horaentrada
FROM estoque
JOIN produtos ON estoque.produto_id = idproduto;