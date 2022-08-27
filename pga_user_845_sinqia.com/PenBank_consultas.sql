-- 1 - O banco deseja saber todas as contas do tipo 'Conta Corrente' existente na base de dados.
--Listar conta(id, número, digito) e tipo(descricao).
SELECT conta.id, conta.numero, conta.digito, tipo_conta.tipo 
FROM conta
	INNER JOIN tipo_conta ON tipo_conta.id = conta.id_tipo_conta
	WHERE tipo_conta.id != 5 AND tipo_conta.id != 6
	ORDER BY conta.id,  conta.numero, conta.digito, tipo_conta.descricao;

--2 - O banco deseja saber quais de seus clientes que residem na cidade de São Paulo.
--Listar cliente(nome, cpf), conta(agência, número e dígito).
-- NENHUM MORA EM SP, ENTÃO CHAMEI OS DE PONTA GROSSA
SELECT DISTINCT
	cliente.nome AS cliente_nome, 
	cliente.cpf AS cliente_CPF , 
	agencia.nome AS agencia_Nome, 
	agencia.numero AS agencia_Numero, 
	gerente_de_conta.nome AS gerente_Da_Conta_Nome
FROM cliente
	INNER JOIN conta ON conta.id_cliente = cliente.id
	INNER JOIN gerente_de_conta ON gerente_de_conta.id = conta.id_gerente_de_conta
	INNER JOIN agencia ON agencia.id = gerente_de_conta.id_agencia
	INNER JOIN endereco ON endereco.id = cliente.id_endereco
	INNER JOIN cidade ON cidade.id = endereco.id_cidade
	WHERE cidade.descricacao = 'Ponta Grossa'
	ORDER BY cliente.nome;
	
--3 - O banco deseja saber todas as operações que ocorreram no ano de 2022.
--Listar conta(agência, número e digito), operação(tipo, data, valor).
-- ONDE ESCRITO TRANSFERÊNCIA - LER TRANSF. RECEBIDA (SEMPRE CRÉDITO)
SELECT 
	agencia.nome AS agencia_Nome, 
	agencia.numero AS agencia_Numero, 
	conta.numero AS conta_numero,
	conta.digito As conta_digito,
	operacoes.tipo AS tipo_operacao,
	servicos.nome AS transacao,
	operacoes.data_hora,
	operacoes.valor
FROM operacoes
	INNER JOIN conta ON conta.id = operacoes.id_conta
	INNER JOIN servicos ON servicos.id = operacoes.id_servico
	INNER JOIN gerente_de_conta ON gerente_de_conta.id = conta.id_gerente_de_conta
	INNER JOIN agencia ON gerente_de_conta.id_agencia = agencia.id
WHERE operacoes.data_hora BETWEEN '2022-01-01 00:00:01' AND '2022-12-31 23:59:59'
ORDER BY operacoes.data_hora DESC;

--4 - O banco deseja saber quais as contas que não transacionaram (não houve operações) no ano de 2022.
--Listar cliente(nome, cpf), conta(agência, número, dígito).
SELECT DISTINCT
	cliente.nome AS cliente_nome, 
	cliente.cpf AS cliente_CPF , 
	agencia.nome AS agencia_Nome, 
	agencia.numero AS agencia_Numero, 
	gerente_de_conta.nome AS gerente_Da_Conta_Nome
FROM cliente
	INNER JOIN conta ON conta.id_cliente = cliente.id
	INNER JOIN gerente_de_conta ON gerente_de_conta.id = conta.id_gerente_de_conta
	INNER JOIN agencia ON agencia.id = gerente_de_conta.id_agencia
	INNER JOIN endereco ON endereco.id = cliente.id_endereco
	INNER JOIN cidade ON cidade.id = endereco.id_cidade
	LEFT JOIN operacoes ON operacoes.id_conta = conta.id
		WHERE operacoes.id NOT IN (
			SELECT operacoes.id FROM operacoes WHERE operacoes.data_hora
			BETWEEN '2022-01-01 00:00:00' AND '2022-01-01- 23:59:59')
	ORDER BY cliente.nome;

--Crie as seguintes views
-- O banco deseja saber qual o saldo atual das contas.
CREATE OR REPLACE VIEW saldo AS 
SELECT DISTINCT
	cliente.nome AS cliente_nome, 
	cliente.cpf AS cliente_CPF , 
	agencia.nome AS agencia_Nome, 
	agencia.numero AS agencia_Numero, 
	conta.numero AS conta_numero,
	conta.digito AS conta_digito,
	gerente_de_conta.nome AS gerente_Da_Conta_Nome,
	SUM(operacoes.valor) AS saldo
FROM cliente
	INNER JOIN conta ON conta.id_cliente = cliente.id
	INNER JOIN gerente_de_conta ON gerente_de_conta.id = conta.id_gerente_de_conta
	INNER JOIN agencia ON agencia.id = gerente_de_conta.id_agencia
	LEFT JOIN operacoes ON operacoes.id_conta = conta.id
	GROUP BY cliente_nome, cliente_CPF , agencia_Nome, agencia_Numero, conta_numero,
	conta_digito, gerente_Da_Conta_Nome
ORDER BY saldo;

SELECT * FROM saldo;

-- histórico de transações das contas
CREATE OR REPLACE VIEW historico_operacoes AS
SELECT DISTINCT
	cliente.nome AS cliente_nome, 
	cliente.cpf AS cliente_CPF , 
	agencia.numero AS agencia_Numero, 
	conta.numero AS conta_numero,
	conta.digito As conta_digito,
	operacoes.tipo AS tipo_operacao,
	servicos.nome AS transacao,
	operacoes.data_hora,
	operacoes.valor,
	operacoes.id_origem AS origem_operacao
FROM operacoes
	INNER JOIN conta ON conta.id = operacoes.id_conta
	INNER JOIN servicos ON servicos.id = operacoes.id_servico
	INNER JOIN gerente_de_conta ON gerente_de_conta.id = conta.id_gerente_de_conta
	INNER JOIN agencia ON gerente_de_conta.id_agencia = agencia.id
	INNER JOIN cliente ON cliente.id = conta.id_cliente
ORDER BY operacoes.data_hora DESC;

SELECT * FROM historico_operacoes;



select * from CIDADE;
select * from servicos;