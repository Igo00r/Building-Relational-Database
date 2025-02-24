CREATE TABLE USUARIO(
        id int PRIMARY KEY,
        user_name varchar(60),
        password varchar(30)
);
 
--Usando a primary key após a criacao dos dados da tabela
/*CREATE TABLE USUARIO(
    id int,
    username varchar(30),
    password varchar (30),
    CONSTRAINT PK_USUARIO PRIMARY KEY(id)
 
)
 
*/
 
CREATE TABLE PRODUTO(
    id int PRIMARY KEY,
    nome varchar2(60) NOT NULL,
    preco number(5,2) NOT NULL,
    quantidade int
 
);

CREATE TABLE VEICULO (
    id int PRIMARY KEY,
    placa varchar2(7) NOT NULL UNIQUE,
    modelo varchar2(60) NOT NULL,
    ano int NOT NULL
);

-- CRIANDO TABELAS com FOREIGN KEY

--1 USUARIO TEM N PEIDOS
--1 PRODUTO ESTA EM N PEDIDOS, MAS PEDIDO TEM APENAS 1 PRODUTO
--EXEMPLOS PARA ESSE CENÁRIO: 1 VEICULO, 1 CASA

CREATE TABLE PEDIDO(
  id int PRIMARY KEY,
  data_pedido date ,
  id_usuario int REFERENCES USUARIO(id),
  id_produto int,
  quantidade int,
  valor_total number(5,2),
  CONSTRAINT FK_PRODUTO
    FOREIGN KEY (id_produto)
        REFERENCES PRODUTO(id)
);

CREATE TABLE PEDIDO_VIRTUAL (
id int PRIMARY KEY,
date_pedido date,
id_usuario int,
FOREIGN KEY (id_usuario) REFERENCES USUARIO(id),
valor_total number (5,2)
);

--1 PEDIDO TEM N PRODUTOS
--1 PRODUTO TEM N PEDIDO
--PERMITINDO O RELACIONAMENTO M:N
CREATE TABLE PEDIDO_PRODUTO(
    id_pedido int REFERENCES PEDIDO_VIRTUAL (id),
    id_produto int REFERENCES PRODUTO (id),
    quantidade int,
    subtotal numeric(5,2)
);