create database VENDASJOIN;
use VENDASJOIN;

create table CLIENTE(
CODIGO integer unsigned auto_increment not null,
NOME varchar(80) not null,
ENDERECO varchar(15) not null,
CIDADE varchar(15) not null,
EMAIL varchar(100) not null ,
primary key(CODIGO)
)ENGINE=INNODB;

create table USUARIOS(
NUMERO_COD integer unsigned auto_increment not null,
NOME varchar(70) not null,
LOGIN char(15) not null,
SENHA char(6) not null,
primary key(NUMERO_COD)
)ENGINE=INNODB;

create table PRODUTOS (
PRODUTO_COD integer unsigned auto_increment not null,
DESCRICAO varchar(100) not null,
VALOR DOUBLE(9,2) not null,
UNIDADE char(20) not null,
QUANTIDADE integer not null,
primary key(PRODUTO_COD)
)ENGINE=INNODB;

create table VENDAS (
VENDA_COD integer unsigned auto_increment not null,
DATA_ENTREGA date not null,
DATA_VENDA date not null,
VALOR double (9,2) not null,
CLIENTES_CODIGO integer unsigned not null,
USUARIOS_CODIGO integer unsigned not null,
primary key (VENDA_COD),
foreign key(CLIENTES_CODIGO) REFERENCES CLIENTE(CODIGO),
foreign key(USUARIOS_CODIGO) REFERENCES USUARIOS(NUMERO_COD)
)ENGINE=INNODB;

create table ITEN_VENDAS(
ITEN_COD integer unsigned auto_increment not null,
QUANTIDADE integer not null,
VALOR_UNITARIO double (9,2) not null,
VENDAS_NUMERO integer unsigned not null,
PRODUTOS_CODIGO integer unsigned not null,
primary key (ITEN_COD),
foreign key(VENDAS_NUMERO) REFERENCES VENDAS(VENDA_COD),
foreign key(PRODUTOS_CODIGO) REFERENCES PRODUTOS(PRODUTO_COD)
)ENGINE=INNODB;

create table BOLETAS(
BOLETA_COD integer unsigned auto_increment not null,
DESCRICAO varchar(80) not null,
JUROS double(9,2) not null,
MULTA double(9,2) not null,
VALOR double(9,2) not null,
DATA_BOLETA date not null,
DATA_VENCIMENTO date not null,
VENDAS_NUMERO integer unsigned not null,
primary key (BOLETA_COD),
foreign key (VENDAS_NUMERO) REFERENCES VENDAS(VENDA_COD)
)ENGINE=INNODB;

INSERT INTO CLIENTE(CODIGO, NOME, ENDERECO, CIDADE, EMAIL)
VALUES (NULL, 'Gustavo', 'Rua X' , 'BH', 'Gustavo@Gustavo.com');
SELECT * FROM CLIENTE;

INSERT INTO USUARIOS(NUMERO_COD, NOME, LOGIN, SENHA)
VALUES (NULL, 'Gustavo', 'GustavoP', 123456);
SELECT * FROM USUARIOS;

INSERT INTO PRODUTOS(PRODUTO_COD, DESCRICAO, VALOR, UNIDADE, QUANTIDADE)
VALUES (NULL, 'PRODUTO', 40, 50, 40);
SELECT * FROM PRODUTOS;

INSERT INTO VENDAS(VENDA_COD, DATA_ENTREGA, DATA_VENDA, VALOR, CLIENTES_CODIGO, USUARIOS_CODIGO)
VALUES (NULL, 11/30/2020, 11/4/2020, 100, NULL, NULL);
SELECT * FROM VENDAS;

INSERT INTO ITEN_VENDAS(ITEN_COD, QUANTIDADE, VALOR_UNITARIO)
VALUES (NULL, 10, 40);
SELECT * FROM ITEN_VENDAS;

INSERT INTO BOLETAS(BOLETA_COD, DESCRICAO, JUROS, MULTA, VALOR, DATA_BOLETA, DATA_VENCIMENTO)
VALUES (NULL, 'PRODUTO', 2, 20.00, 100, 11/4/2020, 12/4/2020);
SELECT * FROM BOLETAS;