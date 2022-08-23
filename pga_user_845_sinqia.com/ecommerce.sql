--DDL (DATA DEFINITION LANGUAGE)
--CREATE, ALTER, DROP, GRANT, REVOKE
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

CREATE TABLE cliente(
	id SERIAL NOT NULL,
	nome VARCHAR(80) NOT NULL,
	cpf CHARACTER(11),
	id_endereco INTEGER NOT NULL,
	data_nascimento DATE,
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

CREATE TABLE meio_pagamento(
	id SERIAL NOT NULL,
	descricao VARCHAR(255) NOT NULL,
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

--Aluno(id Pk, nome, email)
CREATE TABLE aluno(
	id SERIAL NOT NULL,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100),
	PRIMARY KEY(id)
);

ALTER TABLE aluno 
	ADD COLUMN id_endereco INTEGER;
	
ALTER TABLE aluno
	ADD CONSTRAINT fk_endereco
	FOREIGN KEY (id_endereco)
	REFERENCES endereco(id);

ALTER TABLE aluno
	ADD CONSTRAINT uc_email 
	UNIQUE (email);

DROP TABLE aluno;

CREATE DATABASE agencia_bancaria;

--DML (DATA MANIPULATION LANGUAGE)
--INSERT, UPDATE, DELETE, SELECT
INSERT INTO cidade (descricao)
VALUES
('Recife'),
('Porto Alegre'),
('Maringá');

INSERT INTO endereco(logradouro, numero, complemento, id_cidade)
VALUES('Brasil', '1010', null, 1);

INSERT INTO cliente(nome, cpf, id_endereco, data_nascimento)
VALUES('Wiliam', '00000000000', 1, '1989-06-02');

-- ACID
-- Atomicidade (transações)
-- Consistência (chaves estrangeiras)
-- Isolamento (sessões)
-- Durabilidade (o próprio banco)

SELECT * FROM fornecedor_contato;
SELECT * FROM fornecedor;

BEGIN TRANSACTION; --inicia a transação

COMMIT TRANSACTION; --confirma a transação
ROLLBACK TRANSACTION; -- desfaz a transação

--SELECT [projecao] FROM [tabela]
SELECT * FROM fornecedor;

--SELECT [projecao] FROM [tabela]
--(filtro) WHERE [expressão booleana]
SELECT * FROM fornecedor;

UPDATE fornecedor SET cnpj = null WHERE id = 7;

SELECT * FROM fornecedor
WHERE cnpj IS NOT null;



