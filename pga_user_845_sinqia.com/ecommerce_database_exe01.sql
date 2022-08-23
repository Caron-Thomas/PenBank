-- LISTAR TODO OS MEIOS DE PAGAMENTOS:
SELECT * FROM meio_pagamento;
-- LISTAR TODOS OS NOMES E CPFS DE CLIENTES CADASTRADOS:
SELECT nome, cpf FROM cliente;
-- LISTAR O NOME DAS LOJAS CADASTRADAS
SELECT nome FROM loja;
-- LISTA OS CLIENTES QUE POSSUAM A LETRA 'A' NO NOME
SELECT * FROM cliente
	WHERE nome LIKE '%a%';
SELECT * FROM cliente
	WHERE nome LIKE 'A%';
SELECT * FROM cliente
	WHERE nome LIKE '%a';
-- LISTAR PEDIDOS FEITOS NESTE MÊS
SELECT * FROM pedido 
	WHERE previsao_entrega BETWEEN '2022-08-01' AND '2022-08-31';
-- LISTAR PODUTO MAIOR PREÇO
SELECT MAX(preco) FROM produto;
-- LISTAR PRODUTO MENOR PREÇO
SELECT MIN(preco) FROM produto;
-- LISTAR MÉDIA DOS PREÇO
SELECT AVG(preco) FROM produto;
-- LISTAR COM NOME POR MAIOR PREÇO
SELECT id, descricao, preco FROM produto ORDER BY preco DESC LIMIT 5; --DESC DESCENDETE E ASC ASCENDENTE

-- LISTAR NOME E CPF DO CLIENTE E LOGRADOURO COM NUMERO 
SELECT cliente.nome, cliente.cpf, endereco.logradouro, endereco.numero
		FROM cliente LEFT JOIN endereco ON cliente.id_endereco = endereco.id;
-- LISTAR COMO ACIMA MAS APENAS DO USUÁRIO
SELECT cliente.nome, cliente.cpf, endereco.logradouro, endereco.numero
	FROM cliente LEFT JOIN endereco ON cliente.id_endereco = endereco.id
	WHERE cliente.nome like 'Thomas%';

SELECT cliente.nome, cliente.cpf, endereco.logradouro, endereco.numero
	FROM cliente LEFT JOIN endereco ON cliente.id_endereco = endereco.id
	WHERE cliente.nome like '%Gustavo%';
-- LISTAR OS CLIENTES QUE NÃO TENHAM PEDIDO
SELECT cliente.nome, cliente.cpf 
	FROM cliente FULL JOIN pedido ON cliente.id = pedido.id_cliente
	WHERE pedido.numero IS null;
-- LISTAR TODOS OS CLIENTES QUE TENHAM PEDIDO
SELECT cliente.nome, cliente.cpf, pedido.numero 
	FROM cliente INNER JOIN pedido ON cliente.id = pedido.id_cliente;
-- LISTAR TODOS OS NOMES DOS CLIENTES QUE TENHAM PEDIDO SEM DUPLICAÇÃO
SELECT DISTINCT cliente.nome, cliente.cpf 
	FROM cliente INNER JOIN pedido ON cliente.id = pedido.id_cliente;
	
-- LISTAR ENDEREÇO E NOME DE PESSOA CASO TENHAM
INSERT INTO endereco (logradouro, numero, id_cidade) VALUES ('Avenida Brasil', '20201', 3);
SELECT cliente.nome, endereco.logradouro, endereco.numero
	FROM cliente RIGHT JOIN endereco ON cliente.id_endereco = endereco.id; 
	
-- PEDIDO PELO NUMERO E CADA PRODUTO QUE TEM NOS PEDIDOS.
SELECT pedido.numero, produto.descricao, pedido_produto.quantidade, pedido_produto.preco
	FROM pedido 
		INNER JOIN pedido_produto ON pedido.numero = pedido_produto.numero_pedido 
	    INNER JOIN produto ON pedido_produto.id_produto = produto.id; -- VERSÃO MAIS OTIMIZADA

SELECT pedido.numero, produto.descricao, pedido_produto.quantidade, pedido_produto.preco
	FROM pedido, pedido_produto, produto
	WHERE pedido.numero = pedido_produto.numero_pedido 
		AND pedido_produto.id_produto = produto.id;

-- LISTAR O VALOR TOTAL DE CADA PEDIDO
SELECT numero_pedido, sum(quantidade * preco)
	FROM pedido_produto P1
		GROUP BY numero_pedido
		ORDER BY numero_pedido;
		
-- LISTAR PEDIDO(NUMERO) E A QUANTIDADE DE PRODUTOS
SELECT numero_pedido, produto.descricao, COUNT(id_produto)
	FROM pedido_produto p1
	INNER JOIN produto ON p1.id_produto = produto.id
	GROUP BY numero_pedido, produto.descricao
	ORDER BY numero_pedido;
-- LISTAR PEDIDO NUMERO E A QUNATIDADE DE ITENS NO PEDIDO
SELECT numero_pedido, SUM(quantidade)
	FROM pedido_produto p1
	GROUP BY numero_pedido
	ORDER BY numero_pedido;

-- LISTAR QUANTAS VEZES CADA PRODUTO APARECE EM CADA PEDIDO
SELECT id_produto, produto.descricao, COUNT(id_produto) AS quantidade
	FROM pedido_produto
	INNER JOIN produto ON pedido_produto.id_produto = produto.id
	GROUP BY id_produto, produto.descricao
	ORDER BY quantidade DESC;
	
-- LISTAR QUANTIDADE DE PRODUTOS DISPONIVEL EM CADA ESTOQUE
SELECT l.nome, en.logradouro, en.numero, p.descricao, ep.quantidade FROM loja l
	LEFT JOIN estoque es ON l.id = es.id_loja
	INNER JOIN endereco en ON en.id = es.id_endereco
	INNER JOIN estoque_produto ep ON ep.id_estoque = es.id
	INNER JOIN produto p ON p.id = ep.id_produto
	ORDER BY l.nome, en.logradouro, p.descricao

-- LISTAR CLIENTES COM PEDIDO E CLIENTES SEM PEDIDO
SELECT cliente.nome, cliente.cpf, COUNT(pedido.numero) AS qtd
FROM cliente
LEFT JOIN pedido ON cliente.id = pedido.id_cliente 
GROUP BY cliente.nome, cliente.cpf
ORDER BY qtd

-- A loja deseja saber quantos itens foram adicionados a cada pedido
-- Listar cliente(nome, cpf), pedido(numero) e quantidade de itens
SELECT cliente.nome, cliente.cpf, pedido.numero, SUM(pedido_produto.quantidade) as qtde_item FROM cliente
LEFT JOIN pedido ON pedido.id_cliente = cliente.id
INNER JOIN pedido_produto ON pedido.numero = pedido_produto.numero_pedido
GROUP BY cliente.nome, cliente.cpf, pedido.numero
ORDER BY cliente.nome, pedido.numero;

-- A loja deseja saber quantos itens foram adicionados a cada pedido
-- Listar cliente(nome, cpf), pedido(numero) e quantidade de itens
SELECT 
	cliente.nome, cliente.cpf, pedido.numero, 
	SUM(pedido_produto.quantidade) as qtde_item 
FROM cliente 
LEFT JOIN pedido ON cliente.id = pedido.id_cliente
LEFT JOIN pedido_produto ON pedido.numero = pedido_produto.numero_pedido
GROUP BY cliente.nome, cliente.cpf, pedido.numero
ORDER BY cliente.nome, pedido.numero;

-- A loja deseja saber quanto cada cliente gastou em pedidos
-- Listar cliente(nome, cpf), valor total gasto em pedidos
-- Lista apenas os clientes que gastaram em ao menos um pedido
SELECT 
	cliente.nome, cliente.cpf,
	SUM(pedido_produto.quantidade * pedido_produto.preco) as total_pedido
FROM cliente 
INNER JOIN pedido ON cliente.id = pedido.id_cliente
INNER JOIN pedido_produto ON pedido.numero = pedido_produto.numero_pedido
GROUP BY cliente.nome, cliente.cpf
ORDER BY cliente.nome;

--Lista apenas os clientes independente de ter gasto ou não
SELECT 
	cliente.nome, cliente.cpf,
	SUM(pedido_produto.quantidade * pedido_produto.preco) as total_pedido
FROM cliente 
LEFT JOIN pedido ON cliente.id = pedido.id_cliente
LEFT JOIN pedido_produto ON pedido.numero = pedido_produto.numero_pedido
GROUP BY cliente.nome, cliente.cpf
ORDER BY cliente.nome;

-- A loja deseja saber quais os clientes que fizeram ao menos um pedido em 2022
-- Listar cliente(nome, cpf) que fizeram pedido em 2022
SELECT 
	cliente.nome, cliente.cpf, COUNT(pedido_produto.numero_pedido) as total_de_pedido
FROM cliente 
INNER JOIN pedido ON cliente.id = pedido.id_cliente
INNER JOIN pedido_produto ON pedido.numero = pedido_produto.numero_pedido
WHERE previsao_entrega BETWEEN '2022-01-01' AND '2023-01-01'
GROUP BY cliente.nome, cliente.cpf
ORDER BY cliente.nome;

-- Listar cliente(nome, cpf) que não fizeram pedido em 2022

SELECT DISTINCT nome, cpf FROM cliente
WHERE cliente.id NOT IN (
	SELECT id_cliente FROM pedido WHERE previsao_entrega
	BETWEEN '2022-01-01 00:00:00' AND '2022-01-01- 23:59:59'
);

select distinct cliente.nome, cliente.cpf, pedido.previsao_entrega from cliente
LEFT join pedido on pedido.id_cliente = cliente.id
where pedido.previsao_entrega not between '2022-08-20' and '2022-12-31' 
or pedido.previsao_entrega isnull;

-- Listar clientes residentes em 'São paulo' e que compraram mais de 100 reais

SELECT 
	cliente.nome, cliente.cpf,
	SUM(pedido_produto.quantidade * pedido_produto.preco) as total_pedido
FROM cliente 
INNER JOIN pedido ON cliente.id = pedido.id_cliente
INNER JOIN pedido_produto ON pedido.numero = pedido_produto.numero_pedido
INNER JOIN endereco ON cliente.id_endereco = endereco.id
INNER JOIN cidade ON endereco.id_cidade = cidade.id
WHERE cidade.descricao = 'São Paulo'
GROUP BY cliente.nome, cliente.cpf
HAVING SUM(pedido_produto.quantidade * pedido_produto.preco) > 100 -- Ele roda o SELECT antes do having, porem depois do WHERE
ORDER BY cliente.nome;

-- A loja deseja saber quais os clientes, residentes de Curitiba, que compraram mais de 100 mil 
-- reais e pagaram no cartão de crédito durante o ano de 2022
-- Listar clientes(nome, cpf), valor_gasto
SELECT cliente.nome, cliente.cpf, 
		SUM(pedido_produto.quantidade * pedido_produto.preco) AS total_pedido
		FROM cliente
			INNER JOIN pedido ON cliente.id = pedido.id_cliente
			INNER JOIN pedido_produto ON pedido_produto.numero_pedido = pedido.numero
			INNER JOIN meio_pagamento ON meio_pagamento.id = pedido.id_meio_pagamento
			INNER JOIN endereco ON cliente.id_endereco = endereco.id
			INNER JOIN cidade ON endereco.id_cidade = cidade.id
		WHERE cidade.descricao = 'Curitiba'	
			AND meio_pagamento.descricao = 'Pix' --Cartão de crédito	
			AND pedido.previsao_entrega BETWEEN '2022-01-01 00:00:00' AND '2022-12-31 23:59:59'
	GROUP BY cliente.nome, cliente.cpf
	HAVING SUM(pedido_produto.quantidade * pedido_produto.preco) > 50000
	ORDER BY total_pedido, cliente.nome;

select * from meio_pagamento;

-- Criar uma view para exibir o cliente(nome, cpf) e os pedidos feitos(numero, valor_total)
CREATE OR REPLACE VIEW clientes_pedidos AS	
SELECT
	cliente.nome AS Nome,
	cliente.cpf AS CPF,
	pedido.numero AS Numero_do_Pedido,
	SUM (pedido_produto.quantidade * pedido_produto.preco) AS Valor
FROM cliente
	INNER JOIN pedido ON cliente.id = pedido.id_cliente
	INNER JOIN pedido_produto ON pedido.numero = pedido_produto.numero_pedido
GROUP BY cliente.nome, cliente.cpf, pedido.numero
ORDER BY Nome;

SELECT * FROM clientes_pedidos;

-- Criar uma view para exibir loja(nome), estoque(endereco), produto(descricao) e a quantidade de itens
SELECT loja.nome, 
	estoque_endereco.logradouro AS Rua,
	estoque_endereco.numero,
	estoque_produto.quantidade
FROM loja
INNER JOIN estoque ON loja.id = estoque.id_loja
INNER JOIN endereco estoque_endereco ON estoque.id_endereco = estoque_endereco.id



-- Criar uma view para exibir os 10 clientes(nome, cpf) que mais gastaram

-- Listar clientes que fizeram pedido em 2022 e pagaram com cartão de crédito
-- Criar uma view para exibir o cliente(nome, cpf) e os pedidos feitos(numero, valor_total)
-- Criar uma view para exibir loja(nome), estoque(endereco), produto(descricao) e a quantidade de itens
-- Criar uma view para exibir os 10 clientes(nome, cpf) que mais gastaram
CREATE OR REPLACE VIEW clientes_top_gastos AS	
SELECT
	cliente.nome AS Nome,
	cliente.cpf AS CPF,
	pedido.numero AS Numero_do_Pedido,
	SUM (pedido_produto.quantidade * pedido_produto.preco) AS Valor
FROM cliente
	INNER JOIN pedido ON cliente.id = pedido.id_cliente
	INNER JOIN pedido_produto ON pedido.numero = pedido_produto.numero_pedido
GROUP BY cliente.nome, cliente.cpf, pedido.numero
ORDER BY valor desc
LIMIT 10;

SELECT * FROM clientes_top_gastos OFFSET 0 LIMIT 5;
SELECT * FROM clientes_top_gastos OFFSET 5 LIMIT 5;


	



