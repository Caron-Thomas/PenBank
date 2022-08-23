--DDL (DATA DEFINITION LANGUAGE)
CREATE TABLE cidade(
	id SERIAL NOT NULL,
	descricacao VARCHAR(255) NOT NULL,
	PRIMARY KEY(id)
);
CREATE TABLE endereco(
	id SERIAL NOT NULL,
	logradouro VARCHAR(255) NOT NULL,
	numero INTEGER,
	complemento VARCHAR(25),
	bairro VARCHAR(55),	
	PRIMARY KEY(id)
);
ALTER TABLE  endereco
	ADD id_cidade INTEGER;
	
ALTER TABLE endereco
	ADD CONSTRAINT fk_cidade
	FOREIGN KEY(id_cidade) REFERENCES cidade(id);

CREATE TABLE cliente(
	id SERIAL NOT NULL,
	nome VARCHAR(255) NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	id_endereco INTEGER NOT NULL,
	PRIMARY KEY(id)
);

ALTER TABLE cliente
	ADD CONSTRAINT fk_endereco
	FOREIGN KEY(id_endereco) REFERENCES endereco(id);
	
CREATE TABLE tipo_conta(
	id SERIAL NOT NULL, 
	tipo VARCHAR(30) NOT NULL,
	descricao VARCHAR(255),
	PRIMARY KEY(id)
);

CREATE TABLE agencia(
	id SERIAL NOT NULL,
	numero SMALLINT NOT NULL CHECK(numero BETWEEN 0 AND 9999),
	nome VARCHAR(255) NOT NULL,
	id_endereco INTEGER NOT NULL,
	PRIMARY KEY(id)
);
ALTER TABLE agencia
	ADD CONSTRAINT fk_endereco
	FOREIGN KEY(id_endereco) REFERENCES endereco(id);

CREATE TABLE contato(
	id SERIAL NOT NULL,
	tipo VARCHAR(55) NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	id_gerente INTEGER NOT NULL,
	id_cliente INTEGER NOT NULL,
	PRIMARY KEY(id)
);
ALTER TABLE contato
	ADD CONSTRAINT fk_gerente_de_conta
	FOREIGN KEY(id_gerente) REFERENCES gerente_de_conta(id);
ALTER TABLE contato
	ADD CONSTRAINT fk_cliente
	FOREIGN KEY(id_cliente) REFERENCES cliente(id);

CREATE TABLE gerente_de_conta(
	id SERIAL NOT NULL,
	nome VARCHAR(255),
	id_agencia INTEGER NOT NULL,
	PRIMARY KEY(id)
);
ALTER TABLE gerente_de_conta
	ADD CONSTRAINT fk_agencia
	FOREIGN KEY(id_agencia) REFERENCES agencia(id);


CREATE TABLE servicos(
	id SERIAL NOT NULL,
	nome VARCHAR(255) NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE financeiro(
	id SERIAL NOT NULL,
	nome VARCHAR(255) NOT NULL,
	descricao VARCHAR(255),
	PRIMARY KEY(id)
);

CREATE TABLE operacoes(
	id_servico INTEGER NOT NULL,
	id_financeiro INTEGER NOT NULL,
	data_hora TIMESTAMP NOT NULL,
	valor NUMERIC(12,6) NOT NULL,
	tipo VARCHAR(7) NOT NULL,
	id_conta INTEGER NOT NULL,
	PRIMARY KEY(id_servico , id_financeiro)
);

ALTER TABLE operacoes
	ADD CONSTRAINT fk_servico
	FOREIGN KEY (id_servico) REFERENCES servicos(id);
ALTER TABLE operacoes
	ADD CONSTRAINT fk_financeiro
	FOREIGN KEY (id_financeiro) REFERENCES financeiro(id);

CREATE TABLE conta(
	id SERIAL NOT NULL,
	numero INTEGER NOT NULL CHECK(numero > 0),
	digito INTEGER NOT NULL CHECK(digito BETWEEN 0 AND 9),
	id_cliente INTEGER NOT NULL,
	id_tipo_conta INTEGER NOT NULL,
	id_gerente_de_conta INTEGER NOT NULL,
	PRIMARY KEY(id)
);

ALTER TABLE operacoes
	ADD CONSTRAINT fk_conta
	FOREIGN KEY(id_conta) REFERENCES conta(id);
ALTER TABLE conta
	ADD CONSTRAINT fk_cliente
	FOREIGN KEY (id_cliente) REFERENCES cliente(id);

ALTER TABLE conta
	ADD CONSTRAINT fk_tipo_conta
	FOREIGN KEY (id_tipo_conta) REFERENCES tipo_conta(id);
ALTER TABLE conta
	ADD CONSTRAINT FK_gerente_de_conta
	FOREIGN KEY (id_gerente_de_conta) REFERENCES gerente_de_conta(id);

--ALTER TABLE operacoes
--	ADD COLUMN   (em edição para anexar histórico das transações de mesmo banco)
	
	
	
	
	
	
	
	
	
