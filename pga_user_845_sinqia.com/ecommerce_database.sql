CREATE DATABASE ecommerce;

CREATE TABLE cidade(
	id SERIAL NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE endereco(
	id SERIAL NOT NULL,
	logradouro VARCHAR(255) NOT NULL,
	numero VARCHAR(15),
	complemento VARCHAR(255),
	id_cidade INTEGER NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE meio_pagamento(
	id SERIAL NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE loja(
	id SERIAL NOT NULL,
	url VARCHAR(255),
	nome VARCHAR(80),
	PRIMARY KEY (id)
);

CREATE TABLE estoque(
	id SERIAL NOT NULL,
	id_endereco INTEGER NOT NULL,
	id_loja INTEGER NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE produto(
	id SERIAL NOT NULL,
	codigo_barra INTEGER NOT NULL,
	descricao VARCHAR(255),
	foto bytea[],
	id_fornecedor INTEGER NOT NULL,
	preco NUMERIC(12,6),
	PRIMARY KEY (id)
);

CREATE TABLE estoque_produto(
	id_estoque INTEGER NOT NULL,
	id_produto INTEGER NOT NULL,
	quantidade INTEGER NOT NULL,
	PRIMARY KEY (id_estoque, id_produto)
);

CREATE TABLE cliente(
	id SERIAL NOT NULL,
	nome VARCHAR(80) NOT NULL,
	cpf CHARACTER(11),
	id_endereco INTEGER NOT NULL,
	data_nascimento DATE,
	PRIMARY KEY (id)
);

CREATE TABLE pedido(
	numero SERIAL NOT NULL,
	previsao_entrega TIMESTAMP NOT NULL,
	id_cliente INTEGER NOT NULL,
	id_loja INTEGER NOT NULL,
	id_meio_pagamento INTEGER NOT NULL,
	PRIMARY KEY (numero)
);

CREATE TABLE pedido_produto(
	numero_pedido INTEGER NOT NULL,
	id_produto INTEGER NOT NULL,
	quantidade INTEGER NOT NULL,
	preco NUMERIC(12,6),
	PRIMARY KEY(numero_pedido, id_produto)
);

CREATE TABLE fornecedor(
	id SERIAL NOT NULL,
	nome VARCHAR(255) NOT NULL,
	cnpj CHARACTER(14),
	PRIMARY KEY(id)
);

CREATE TABLE fornecedor_contato(
	id SERIAL NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	valor VARCHAR(255) NOT NULL,
	id_fornecedor INTEGER NOT NULL,
	PRIMARY KEY(id)
);
	
ALTER TABLE endereco
	ADD CONSTRAINT fk_cidade
	FOREIGN KEY (id_cidade) REFERENCES cidade(id);
	
ALTER TABLE cliente
	ADD CONSTRAINT fk_endereco
	FOREIGN KEY (id_endereco) REFERENCES endereco(id);

ALTER TABLE cliente
	ADD CONSTRAINT uc_cpf UNIQUE (cpf);
	
ALTER TABLE pedido
	ADD CONSTRAINT fk_cliente
	FOREIGN KEY (id_cliente) REFERENCES cliente(id);
	
ALTER TABLE pedido
	ADD CONSTRAINT fk_loja
	FOREIGN KEY (id_loja) REFERENCES loja(id);

ALTER TABLE pedido
	ADD CONSTRAINT fk_meio_pagamento
	FOREIGN KEY (id_meio_pagamento) REFERENCES meio_pagamento(id);
	
ALTER TABLE pedido_produto
	ADD CONSTRAINT fk_pedido 
	FOREIGN KEY(numero_pedido) REFERENCES pedido(numero);
	
ALTER TABLE pedido_produto
	ADD CONSTRAINT fk_produto 
	FOREIGN KEY(id_produto) REFERENCES produto(id);

ALTER TABLE estoque
	ADD CONSTRAINT fk_endereco
	FOREIGN KEY (id_endereco) REFERENCES endereco(id);

ALTER TABLE estoque
	ADD CONSTRAINT fk_loja
	FOREIGN KEY (id_loja) REFERENCES loja(id);
	
ALTER TABLE estoque_produto
	ADD CONSTRAINT fk_estoque
	FOREIGN KEY (id_estoque) REFERENCES estoque(id);
	
ALTER TABLE estoque_produto
	ADD CONSTRAINT fk_produto
	FOREIGN KEY (id_produto) REFERENCES produto(id);
	
ALTER TABLE produto
	ADD CONSTRAINT fk_fornecedor
	FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id);

ALTER TABLE fornecedor_contato
	ADD CONSTRAINT fk_fornecedor 
	FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id);

ALTER TABLE pedido
	ADD criado_em TIMESTAMP;

-------------------------DML----------------------
BEGIN TRANSACTION;
INSERT INTO cidade (descricao) VALUES ('Eldorado do Sul');
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Industrial Belgraf', '400', null, 1);
INSERT INTO fornecedor (nome, cnpj) VALUES ('Dell Inc', '72381189000110');
INSERT INTO fornecedor_contato (descricao, valor, id_fornecedor) VALUES 
('web page', 'https://www.dell.com.br', 1),
('telefone', '0800 970 2017', 1),
('email', 'sac@dell.com.br', 1);
INSERT INTO produto (codigo_barra, descricao, id_fornecedor, preco) VALUES 
(1010, 'Inspirion', 1, 2798.00),
(1020, 'Vostro', 1, 2897.00),
(1030, 'G series', 1, 4851.00),
(1040, 'Latitude', 1, 6425.00),
(1050, 'Alienware', 1, 15700.00),
(1060, 'XPS', 1, 10599.00);
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO cidade (descricao) VALUES ('Manaus');
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Matrinxã', '687', 'Edifício 3 - Parte 1', 2);
INSERT INTO fornecedor (nome, cnpj) VALUES ('Avell Notebooks', '19117785000105');
INSERT INTO fornecedor_contato (descricao, valor, id_fornecedor) VALUES 
('web page', 'https://avell.com.br/', 2),
('telefone', '(47) 3801-6000', 2),
('email', 'vendas@avell.com.br', 2);
INSERT INTO produto (codigo_barra, descricao, id_fornecedor, preco) VALUES 
(2010, 'Avell B.On Lite', 2, 4299.30),
(2020, 'Avell A55 HYB', 2, 5999.40),
(2030, 'Avell A70 HYB', 2, 6999.30),
(2040, 'Avell Storm Two 1', 2, 11999.70),
(2050, 'Avell C65 HYB', 2, 21799.80);
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO cidade (descricao) VALUES ('São Paulo');
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Leopoldo Couto de Magalhães Jr', '700', '00, 7º andar', 3);
INSERT INTO fornecedor (nome, cnpj) VALUES ('Apple', '00623904000335');
INSERT INTO fornecedor_contato (descricao, valor, id_fornecedor) VALUES 
('web page', 'https://www.apple.com/', 3),
('telefone', '0800-761-0867', 3),
('email', 'sac@apple.com', 3);
INSERT INTO produto (codigo_barra, descricao, id_fornecedor, preco) VALUES 
(3010, 'MacBook Air', 3, 11599.00),
(3020, 'MacBook Pro', 3, 15299.00),
(3010, 'MacMini', 3, 7999.00);
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO meio_pagamento(descricao) VALUES
('Cartão de crédito'),
('Dinheiro'),
('Pix');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO cidade (descricao) VALUES ('Curitiba');
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Kenwood', '97176', null, 4);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Alexandre Zamora Zerbini Denigres', '00000000000', 4, '1973-04-17');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Esch', '5365', null, 4);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Andressa Raffler', '00000000001', 5, '1958-10-08');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Vahlen', '90655', null, 4);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Cinthia Yoshie Udakiri', '00000000002', 6, '1951-04-03');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Hollow Ridge', '1', 'Alley', 3);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Daniel Dos Anjos', '00000000003', 7, '2019-01-28');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO cidade (descricao) VALUES ('Porto Alegre');
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Dennis', '7644', null, 5);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Éder Ariã Basso Corrêa Filho', '00000000004', 8, '2015-04-06');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Center', '8', null, 5);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Erika Rosany de Almeida Lima', '00000000005', 9, '2008-10-09');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Sauthoff', '7', null, 5);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Felipe cesar de melo', '00000000006', 10, '1999-12-24');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO cidade (descricao) VALUES ('Rio de Janeiro');
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Karstens', '02898', null, 6);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Gabriel Arabi da Costa', '00000000007', 11, '1975-05-25');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Mandrake', '3', 'Avenue', 6);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Gabriela Siqueira do Vale Coelho', '00000000008', 12, '1960-04-13');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('High Crossing', '89416', 'Drive', 6);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Gustavo Lima Olmos Ferraz', '00000000009', 13, '1998-06-13');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Mallard', '9', null, 6);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Gustavo Oliveira da Silva', '00000000010', 14, '1946-04-20');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO cidade (descricao) VALUES ('Fortaleza');
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Canary', '971', 'Park', 7);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Gustavo Silva Santos', '00000000011', 15, '1966-03-23');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Express', '632', 'Lane', 7);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Isabella Rodrigues de Souza Barra', '00000000012', 16, '2010-02-08');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Rigney', '05716', null, 7);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Jhonatas Antonelli', '00000000013', 17, '1981-08-11');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Buell', '1727', null, 7);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('João Filippe Rossi Rodrigues', '00000000014', 18, '1950-01-27');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Garrison', '513', 'Trail', 7);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('João Pedro De Faria Oliveira', '00000000015', 19, '1954-07-07');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Hagan', '2873', 'Center', 7);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Joel Pedro Bellatto', '00000000016', 20, '2009-10-25');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO cidade (descricao) VALUES ('Salvador');
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Almo', '42', null, 5);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Kaique da Silva Santos', '00000000017', 21, '2000-05-24');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Rowland', '55', 'Alley', 5);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Larissa da Cruz Chiquito Ortega', '00000000018', 22, '2008-05-11');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Burrows', '7', 'Way', 5);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Louise Akemi Kuana', '00000000019', 23, '1998-02-16');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Ruskin', '53', null, 6);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Lucas Minici Dumont Prado', '00000000020', 24, '2003-02-10');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Eggendart', '0620', 'Avenue', 6);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Mariana Rosa de Oliveira', '00000000021', 25, '2007-11-20');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Brown', '29', 'Road', 6);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Marthina Oliveira de Castro', '00000000022', 26, '2002-06-23');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO cidade (descricao) VALUES ('Arraial D`Ajuda');
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Waywood', '854', 'Circle', 7);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Nicolau Freire Romanos', '00000000023', 27, '1966-04-29');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Reinke', '0033', 'Crossing', 7);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Rafael José Poletto Furlan', '00000000024', 28, '1962-08-13');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Forest', '06826', 'Court', 7);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Raphael Fagundes Moura', '00000000025', 29, '1988-03-09');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Eggendart', '88601', 'Junction', 7);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Suelen Mirota da Silva', '00000000026', 30, '2007-12-03');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO cidade (descricao) VALUES ('Natal');
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Hooker', '26', null, 8);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Thaysa Alexandrino Miranda', '00000000027', 31, '1996-12-21');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Columbus', '674', 'Point', 8);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Thomas Caron de Castro Deus', '00000000028', 32, '1975-04-10');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Arizona', '100', null, 8);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Vítor Lima Delgado', '00000000029', 33, '1940-08-26');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO cidade (descricao) VALUES ('Cascavel');
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Prates', '1286', null, 9);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('William César dos Santos', '00000000030', 34, '1989-06-02');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO cidade (descricao) VALUES ('Maringá');
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Dryden', '3794', null, 10);
INSERT INTO cliente (nome, cpf, id_endereco, data_nascimento) VALUES ('Vinicius', '00000000031', 35, '1985-10-01');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO loja (nome, url) VALUES ('Magalu', 'https://www.magazineluiza.com.br/');
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Hovde', '874', 'Point', 8);
INSERT INTO estoque (id_loja, id_endereco) VALUES (1, 36);
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Lyons', '9173', 'Alley', 3);
INSERT INTO estoque (id_loja, id_endereco) VALUES (1, 37);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (2, 3, 18);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (1, 10, 84);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (2, 10, 36);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (2, 9, 76);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (1, 3, 16);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (2, 8, 89);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (1, 2, 8);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (2, 7, 40);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (2, 13, 32);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (1, 1, 25);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (2, 2, 19);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (2, 14, 16);
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO loja (nome, url) VALUES ('Americanas', 'https://www.americanas.com.br/');
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Homewood', '08', 'Center', 10);
INSERT INTO estoque (id_loja, id_endereco) VALUES (2, 38);
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Mallard', '75', 'Park', 3);
INSERT INTO estoque (id_loja, id_endereco) VALUES (1, 39);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (3, 2, 92);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (4, 13, 60);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (4, 11, 33);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (3, 13, 3);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (4, 9, 8);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (3, 6, 9);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (3, 12, 33);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (4, 3, 51);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (3, 8, 45);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (4, 7, 94);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (3, 11, 63);
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO loja (nome, url) VALUES ('Submarino', 'https://www.submarino.com.br/');
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Atwood', '2601', 'Way', 1);
INSERT INTO estoque (id_loja, id_endereco) VALUES (3, 40);
INSERT INTO endereco (logradouro, numero, complemento, id_cidade) VALUES ('Warner', '8', 'Avenue', 4);
INSERT INTO estoque (id_loja, id_endereco) VALUES (3, 41);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (6, 14, 44);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (6, 10, 60);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (5, 6, 50);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (6, 7, 21);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (5, 7, 59);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (5, 10, 85);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (5, 2, 28);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (6, 6, 31);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (6, 12, 99);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (6, 3, 52);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (5, 8, 2);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (6, 4, 63);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (6, 2, 58);
INSERT INTO estoque_produto (id_estoque, id_produto, quantidade) VALUES (5, 13, 49);
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-19 17:07:58', 10, 1, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (1, 12, 4, (SELECT preco FROM produto WHERE id = 12));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (1, 1, 5, (SELECT preco FROM produto WHERE id = 1));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (1, 6, 3, (SELECT preco FROM produto WHERE id = 6));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (1, 14, 1, (SELECT preco FROM produto WHERE id = 14));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-30 19:53:18', 25, 1, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (2, 13, 3, (SELECT preco FROM produto WHERE id = 13));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (2, 3, 5, (SELECT preco FROM produto WHERE id = 3));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-30 20:36:06', 13, 1, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (3, 11, 7, (SELECT preco FROM produto WHERE id = 11));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (3, 5, 7, (SELECT preco FROM produto WHERE id = 5));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-12 08:51:15', 5, 1, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (4, 3, 4, (SELECT preco FROM produto WHERE id = 3));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (4, 13, 2, (SELECT preco FROM produto WHERE id = 13));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-03 03:07:31', 12, 1, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (5, 1, 6, (SELECT preco FROM produto WHERE id = 1));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (5, 8, 9, (SELECT preco FROM produto WHERE id = 8));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (5, 12, 4, (SELECT preco FROM produto WHERE id = 12));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-24 19:37:29', 22, 2, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (6, 8, 7, (SELECT preco FROM produto WHERE id = 8));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (6, 6, 9, (SELECT preco FROM produto WHERE id = 6));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-14 06:35:16', 9, 1, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (7, 7, 5, (SELECT preco FROM produto WHERE id = 7));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (7, 14, 1, (SELECT preco FROM produto WHERE id = 14));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-22 01:16:39', 11, 2, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (8, 5, 9, (SELECT preco FROM produto WHERE id = 5));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-27 23:03:48', 18, 2, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (9, 10, 6, (SELECT preco FROM produto WHERE id = 10));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (9, 6, 5, (SELECT preco FROM produto WHERE id = 6));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-17 06:40:49', 30, 3, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (10, 2, 7, (SELECT preco FROM produto WHERE id = 2));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (10, 11, 4, (SELECT preco FROM produto WHERE id = 11));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-17 03:42:53', 9, 1, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (11, 8, 1, (SELECT preco FROM produto WHERE id = 8));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (11, 10, 9, (SELECT preco FROM produto WHERE id = 10));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (11, 12, 2, (SELECT preco FROM produto WHERE id = 12));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (11, 2, 3, (SELECT preco FROM produto WHERE id = 2));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-18 01:09:47', 9, 1, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (12, 2, 10, (SELECT preco FROM produto WHERE id = 2));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-20 10:44:41', 15, 2, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (13, 8, 9, (SELECT preco FROM produto WHERE id = 8));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (13, 4, 4, (SELECT preco FROM produto WHERE id = 4));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-09 04:24:02', 9, 3, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (14, 5, 1, (SELECT preco FROM produto WHERE id = 5));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (14, 14, 8, (SELECT preco FROM produto WHERE id = 14));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (14, 11, 8, (SELECT preco FROM produto WHERE id = 11));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (14, 4, 5, (SELECT preco FROM produto WHERE id = 4));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-29 14:56:29', 12, 1, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (15, 3, 6, (SELECT preco FROM produto WHERE id = 3));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (15, 12, 6, (SELECT preco FROM produto WHERE id = 12));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-20 09:04:18', 13, 3, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (16, 6, 5, (SELECT preco FROM produto WHERE id = 6));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-03 18:05:29', 6, 3, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (17, 8, 4, (SELECT preco FROM produto WHERE id = 8));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-23 20:44:48', 3, 1, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (18, 10, 6, (SELECT preco FROM produto WHERE id = 10));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (18, 1, 6, (SELECT preco FROM produto WHERE id = 1));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-11 06:45:12', 24, 2, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (19, 7, 9, (SELECT preco FROM produto WHERE id = 7));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (19, 3, 9, (SELECT preco FROM produto WHERE id = 3));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (19, 2, 3, (SELECT preco FROM produto WHERE id = 2));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-16 09:06:06', 16, 3, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (20, 1, 1, (SELECT preco FROM produto WHERE id = 1));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-24 09:44:00', 27, 3, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (21, 11, 1, (SELECT preco FROM produto WHERE id = 11));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (21, 6, 5, (SELECT preco FROM produto WHERE id = 6));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-20 20:56:44', 28, 2, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (22, 10, 4, (SELECT preco FROM produto WHERE id = 10));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (22, 12, 4, (SELECT preco FROM produto WHERE id = 12));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (22, 8, 6, (SELECT preco FROM produto WHERE id = 8));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (22, 5, 2, (SELECT preco FROM produto WHERE id = 5));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-04 20:24:18', 5, 1, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (23, 5, 8, (SELECT preco FROM produto WHERE id = 5));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-04 18:29:04', 21, 3, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (24, 13, 3, (SELECT preco FROM produto WHERE id = 13));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-18 15:50:33', 17, 1, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (25, 12, 10, (SELECT preco FROM produto WHERE id = 12));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (25, 5, 9, (SELECT preco FROM produto WHERE id = 5));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (25, 2, 5, (SELECT preco FROM produto WHERE id = 2));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-04 19:43:28', 28, 1, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (26, 3, 5, (SELECT preco FROM produto WHERE id = 3));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (26, 4, 4, (SELECT preco FROM produto WHERE id = 4));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-26 16:36:27', 3, 2, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (27, 14, 10, (SELECT preco FROM produto WHERE id = 14));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-23 03:51:14', 19, 3, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (28, 13, 9, (SELECT preco FROM produto WHERE id = 13));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (28, 12, 6, (SELECT preco FROM produto WHERE id = 12));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (28, 1, 9, (SELECT preco FROM produto WHERE id = 1));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (28, 7, 5, (SELECT preco FROM produto WHERE id = 7));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-10 11:36:52', 12, 1, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (29, 8, 6, (SELECT preco FROM produto WHERE id = 8));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (29, 12, 9, (SELECT preco FROM produto WHERE id = 12));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (29, 3, 2, (SELECT preco FROM produto WHERE id = 3));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-23 02:22:02', 23, 3, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (30, 10, 6, (SELECT preco FROM produto WHERE id = 10));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (30, 12, 6, (SELECT preco FROM produto WHERE id = 12));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-15 06:50:33', 6, 1, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (31, 5, 6, (SELECT preco FROM produto WHERE id = 5));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-15 02:13:16', 8, 2, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (32, 2, 2, (SELECT preco FROM produto WHERE id = 2));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (32, 9, 3, (SELECT preco FROM produto WHERE id = 9));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (32, 1, 2, (SELECT preco FROM produto WHERE id = 1));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-10 20:59:46', 22, 2, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (33, 8, 8, (SELECT preco FROM produto WHERE id = 8));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (33, 1, 9, (SELECT preco FROM produto WHERE id = 1));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (33, 3, 6, (SELECT preco FROM produto WHERE id = 3));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-24 10:07:07', 25, 2, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (34, 8, 2, (SELECT preco FROM produto WHERE id = 8));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (34, 2, 2, (SELECT preco FROM produto WHERE id = 2));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-03 08:43:22', 6, 2, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (35, 6, 4, (SELECT preco FROM produto WHERE id = 6));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (35, 4, 6, (SELECT preco FROM produto WHERE id = 4));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-22 09:45:09', 6, 1, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (36, 14, 7, (SELECT preco FROM produto WHERE id = 14));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-13 08:39:02', 4, 3, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (37, 11, 7, (SELECT preco FROM produto WHERE id = 11));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (37, 14, 7, (SELECT preco FROM produto WHERE id = 14));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-27 07:29:50', 1, 1, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (38, 9, 6, (SELECT preco FROM produto WHERE id = 9));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-18 01:26:44', 2, 1, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (39, 11, 6, (SELECT preco FROM produto WHERE id = 11));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (39, 13, 10, (SELECT preco FROM produto WHERE id = 13));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-23 19:54:41', 4, 2, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (40, 12, 5, (SELECT preco FROM produto WHERE id = 12));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-15 11:30:35', 5, 1, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (41, 3, 3, (SELECT preco FROM produto WHERE id = 3));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (41, 8, 10, (SELECT preco FROM produto WHERE id = 8));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (41, 2, 9, (SELECT preco FROM produto WHERE id = 2));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-12 06:48:37', 3, 2, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (42, 2, 8, (SELECT preco FROM produto WHERE id = 2));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (42, 11, 8, (SELECT preco FROM produto WHERE id = 11));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-18 06:57:29', 26, 3, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (43, 11, 4, (SELECT preco FROM produto WHERE id = 11));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (43, 9, 1, (SELECT preco FROM produto WHERE id = 9));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (43, 7, 5, (SELECT preco FROM produto WHERE id = 7));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-25 09:22:15', 13, 1, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (44, 9, 4, (SELECT preco FROM produto WHERE id = 9));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (44, 8, 8, (SELECT preco FROM produto WHERE id = 8));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-07 13:51:34', 24, 1, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (45, 6, 8, (SELECT preco FROM produto WHERE id = 6));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (45, 10, 7, (SELECT preco FROM produto WHERE id = 10));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (45, 13, 1, (SELECT preco FROM produto WHERE id = 13));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (45, 2, 3, (SELECT preco FROM produto WHERE id = 2));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-09 10:32:30', 32, 2, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (46, 1, 10, (SELECT preco FROM produto WHERE id = 1));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (46, 13, 3, (SELECT preco FROM produto WHERE id = 13));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (46, 9, 1, (SELECT preco FROM produto WHERE id = 9));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (46, 10, 2, (SELECT preco FROM produto WHERE id = 10));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (46, 3, 7, (SELECT preco FROM produto WHERE id = 3));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (46, 7, 1, (SELECT preco FROM produto WHERE id = 7));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-25 05:44:39', 24, 3, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (47, 11, 6, (SELECT preco FROM produto WHERE id = 11));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (47, 13, 5, (SELECT preco FROM produto WHERE id = 13));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (47, 6, 10, (SELECT preco FROM produto WHERE id = 6));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-04 19:44:16', 17, 1, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (48, 14, 8, (SELECT preco FROM produto WHERE id = 14));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (48, 3, 1, (SELECT preco FROM produto WHERE id = 3));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (48, 8, 1, (SELECT preco FROM produto WHERE id = 8));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (48, 13, 9, (SELECT preco FROM produto WHERE id = 13));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-10 22:21:24', 4, 3, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (49, 6, 5, (SELECT preco FROM produto WHERE id = 6));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-29 09:42:30', 15, 1, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (50, 12, 5, (SELECT preco FROM produto WHERE id = 12));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (50, 5, 4, (SELECT preco FROM produto WHERE id = 5));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (50, 3, 5, (SELECT preco FROM produto WHERE id = 3));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-12 02:32:11', 19, 3, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (51, 8, 9, (SELECT preco FROM produto WHERE id = 8));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (51, 4, 8, (SELECT preco FROM produto WHERE id = 4));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-19 20:45:17', 9, 3, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (52, 3, 3, (SELECT preco FROM produto WHERE id = 3));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (52, 4, 1, (SELECT preco FROM produto WHERE id = 4));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (52, 1, 7, (SELECT preco FROM produto WHERE id = 1));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (52, 13, 10, (SELECT preco FROM produto WHERE id = 13));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-05 18:35:27', 28, 3, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (53, 10, 1, (SELECT preco FROM produto WHERE id = 10));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (53, 5, 6, (SELECT preco FROM produto WHERE id = 5));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (53, 13, 10, (SELECT preco FROM produto WHERE id = 13));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-24 08:38:42', 20, 1, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (54, 12, 4, (SELECT preco FROM produto WHERE id = 12));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (54, 4, 7, (SELECT preco FROM produto WHERE id = 4));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-07 07:18:00', 25, 1, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (55, 9, 3, (SELECT preco FROM produto WHERE id = 9));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-17 20:38:55', 13, 2, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (56, 6, 6, (SELECT preco FROM produto WHERE id = 6));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (56, 12, 3, (SELECT preco FROM produto WHERE id = 12));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (56, 7, 5, (SELECT preco FROM produto WHERE id = 7));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (56, 13, 6, (SELECT preco FROM produto WHERE id = 13));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-23 01:59:34', 25, 1, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (57, 4, 5, (SELECT preco FROM produto WHERE id = 4));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-20 21:11:05', 19, 1, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (58, 6, 7, (SELECT preco FROM produto WHERE id = 6));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-29 07:32:33', 15, 2, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (59, 5, 6, (SELECT preco FROM produto WHERE id = 5));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (59, 12, 4, (SELECT preco FROM produto WHERE id = 12));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-29 14:07:12', 12, 1, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (60, 6, 6, (SELECT preco FROM produto WHERE id = 6));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (60, 11, 6, (SELECT preco FROM produto WHERE id = 11));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (60, 5, 4, (SELECT preco FROM produto WHERE id = 5));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-31 00:07:56', 19, 1, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (61, 12, 5, (SELECT preco FROM produto WHERE id = 12));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (61, 1, 3, (SELECT preco FROM produto WHERE id = 1));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-24 12:38:50', 26, 3, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (62, 7, 3, (SELECT preco FROM produto WHERE id = 7));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (62, 8, 10, (SELECT preco FROM produto WHERE id = 8));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (62, 14, 5, (SELECT preco FROM produto WHERE id = 14));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-16 01:15:09', 23, 1, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (63, 9, 3, (SELECT preco FROM produto WHERE id = 9));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (63, 2, 5, (SELECT preco FROM produto WHERE id = 2));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-27 20:38:39', 32, 1, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (64, 4, 7, (SELECT preco FROM produto WHERE id = 4));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (64, 3, 5, (SELECT preco FROM produto WHERE id = 3));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (64, 11, 10, (SELECT preco FROM produto WHERE id = 11));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (64, 5, 8, (SELECT preco FROM produto WHERE id = 5));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-13 10:27:38', 7, 2, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (65, 6, 2, (SELECT preco FROM produto WHERE id = 6));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (65, 5, 1, (SELECT preco FROM produto WHERE id = 5));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-18 06:07:22', 30, 3, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (66, 8, 4, (SELECT preco FROM produto WHERE id = 8));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-24 11:19:45', 6, 2, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (67, 5, 9, (SELECT preco FROM produto WHERE id = 5));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (67, 13, 4, (SELECT preco FROM produto WHERE id = 13));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (67, 7, 6, (SELECT preco FROM produto WHERE id = 7));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (67, 6, 10, (SELECT preco FROM produto WHERE id = 6));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-15 02:25:28', 7, 3, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (68, 6, 9, (SELECT preco FROM produto WHERE id = 6));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (68, 14, 6, (SELECT preco FROM produto WHERE id = 14));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (68, 8, 4, (SELECT preco FROM produto WHERE id = 8));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-23 05:50:48', 17, 1, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (69, 5, 2, (SELECT preco FROM produto WHERE id = 5));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (69, 10, 6, (SELECT preco FROM produto WHERE id = 10));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-30 18:56:02', 2, 2, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (70, 5, 9, (SELECT preco FROM produto WHERE id = 5));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (70, 9, 10, (SELECT preco FROM produto WHERE id = 9));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-16 17:18:19', 13, 3, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (71, 4, 7, (SELECT preco FROM produto WHERE id = 4));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (71, 2, 1, (SELECT preco FROM produto WHERE id = 2));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (71, 5, 5, (SELECT preco FROM produto WHERE id = 5));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (71, 13, 9, (SELECT preco FROM produto WHERE id = 13));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (71, 14, 1, (SELECT preco FROM produto WHERE id = 14));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-07 05:20:56', 21, 3, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (72, 11, 1, (SELECT preco FROM produto WHERE id = 11));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (72, 4, 3, (SELECT preco FROM produto WHERE id = 4));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (72, 2, 1, (SELECT preco FROM produto WHERE id = 2));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-08 23:37:41', 18, 2, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (73, 9, 4, (SELECT preco FROM produto WHERE id = 9));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (73, 8, 4, (SELECT preco FROM produto WHERE id = 8));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (73, 7, 7, (SELECT preco FROM produto WHERE id = 7));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-07 21:18:20', 10, 3, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (74, 5, 9, (SELECT preco FROM produto WHERE id = 5));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (74, 10, 4, (SELECT preco FROM produto WHERE id = 10));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-26 15:23:23', 22, 3, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (75, 11, 7, (SELECT preco FROM produto WHERE id = 11));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (75, 5, 9, (SELECT preco FROM produto WHERE id = 5));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (75, 9, 5, (SELECT preco FROM produto WHERE id = 9));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-29 18:36:28', 32, 3, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (76, 12, 10, (SELECT preco FROM produto WHERE id = 12));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (76, 8, 2, (SELECT preco FROM produto WHERE id = 8));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (76, 13, 9, (SELECT preco FROM produto WHERE id = 13));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-09-03 11:38:47', 13, 3, 1);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (77, 13, 5, (SELECT preco FROM produto WHERE id = 13));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (77, 2, 3, (SELECT preco FROM produto WHERE id = 2));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-29 01:17:24', 25, 2, 3);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (78, 6, 1, (SELECT preco FROM produto WHERE id = 6));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (78, 1, 3, (SELECT preco FROM produto WHERE id = 1));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (78, 10, 8, (SELECT preco FROM produto WHERE id = 10));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-27 05:36:19', 23, 1, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (79, 3, 10, (SELECT preco FROM produto WHERE id = 3));
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO pedido (previsao_entrega, id_cliente, id_loja, id_meio_pagamento) VALUES ('2022-08-16 15:54:51', 17, 3, 2);
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (80, 7, 8, (SELECT preco FROM produto WHERE id = 7));
INSERT INTO pedido_produto (numero_pedido, id_produto, quantidade, preco) VALUES (80, 8, 2, (SELECT preco FROM produto WHERE id = 8));
COMMIT TRANSACTION;
