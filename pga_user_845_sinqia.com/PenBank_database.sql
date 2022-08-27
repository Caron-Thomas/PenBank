--DML (DATA MANIPULATION LANGUAGE)
BEGIN TRANSACTION;
INSERT INTO cidade (descricacao) 
	VALUES ('Curitiba'),('Ponta Grossa'), ('Pinhais');
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO endereco (logradouro, numero, complemento, bairro, id_cidade)
	VALUES 
	('Rua Skid-Steer', 1996, null, 'Avaveo', 1),
	('Rua Crawler', 2006, null, 'Aibox', 1),
	('Rua Dump Truck', 1995, 'Sala 32', 'Twiyo', 1),
	('Rua Trencher', 2006, null, 'Wordify', 2),
	('Rua Excavator', 2011, '4º andar', 'Plambee', 2),
	('Rua Backhoe', 2004, 'Cj 603', 'Pixonyx', 1),
	('Rua Dragline', 2011, null, 'Browsedrive', 3),
	('Rua Trencher', 2002, null, 'Brainsphere', 1);
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO tipo_conta(tipo, descricao)
	VALUES 
	('Pessoa Jurídica Ouro','Empresas acima de 10mi a.a.'), 
	('Pessoa Jurídica Bronze','Empresas até 10mi a.a'),
	 ('Pessoa Física Sabugo','Conta de entrada, sem pacote de benefícios'), 
	 ('Pessoa Física Premium','Conta avançada, com pacote de benefícios'), 
	 ('Conta Salário','Sem custo e sem graça'), 
	 ('Conta Poupança','Conta com rendimento integrado');
COMMIT TRANSACTION;

SELECT * FROM tipo_conta;

BEGIN TRANSACTION;
INSERT INTO servicos (nome, descricao, tarifa)
	VALUES
	('Saque', 'Retirada de dinheiro', null),
	('Depósito', 'Inserção de dinehiro', null),
	('Transferência', 'Recebimento de mesmo banco ou outro banco', null),
	('Pagamentos código barras', 'Liquidação dos boletos', null),
	('Doc', 'Transferência para outro banco em até 24 horas', 10.00),
	('Ted', 'Transferência para outro banco mesmo dia', 12.5),
	('Tev', 'Transferência para mesmo banco mesmo dia', 3.50);
	-- pix será em uma próxima etapa
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO financeiro (nome, descricao)
	VALUES
	('Previdência', 'Plano de previdência privado'),
	('Conta correte', 'Conta principal'),
	('Poupança', 'Investimento dos investimentos #sqn'),
	('Fundos genéricos', 'Fundão genérico para dar opções de exercício');
COMMIT TRANSACTION;

SELECT * FROM endereco;

BEGIN TRANSACTION;
insert into agencia (numero, nome, id_endereco) values ('9', '12 Hour Cough Relief', 7);
insert into agencia (numero, nome, id_endereco) values ('52', 'Carvedilol', 1);
insert into agencia (numero, nome, id_endereco) values ('0', 'Gabapentin', 3);
insert into agencia (numero, nome, id_endereco) values ('7', 'SAFEWAY CARE', 1);
insert into agencia (numero, nome, id_endereco) values ('088', 'Nesina', 1);
insert into agencia (numero, nome, id_endereco) values ('2797', 'BOTRYTIS CINEREA', 8);
insert into agencia (numero, nome, id_endereco) values ('7', 'Mint', 3);
insert into agencia (numero, nome, id_endereco) values ('092', 'SUMATRIPTAN', 6);
COMMIT TRANSACTION;

SELECT * FROM agencia; 

BEGIN TRANSACTION;
insert into cliente (nome, cpf, id_endereco) values ('Katharyn Bassam', 89074063446, 2);
insert into cliente (nome, cpf, id_endereco) values ('Artair McElmurray', 53157152095, 7);
insert into cliente (nome, cpf, id_endereco) values ('Gallard Jodlkowski', 80412752644, 6);
insert into cliente (nome, cpf, id_endereco) values ('Raoul Raincin', 41106253671, 8);
insert into cliente (nome, cpf, id_endereco) values ('Odelinda Connock', 56892711019, 1);
insert into cliente (nome, cpf, id_endereco) values ('Zonda Richardson', 27159614465, 2);
insert into cliente (nome, cpf, id_endereco) values ('Melessa Faulks', 26410673194, 6);
insert into cliente (nome, cpf, id_endereco) values ('Jeremias Gowar', 69151729945, 2);
insert into cliente (nome, cpf, id_endereco) values ('Benedikt Coldbathe', 66915817056, 8);
insert into cliente (nome, cpf, id_endereco) values ('Janith Tonry', 72423906224, 5);
insert into cliente (nome, cpf, id_endereco) values ('Dani Junifer', 85050405758, 4);
insert into cliente (nome, cpf, id_endereco) values ('Abdul Bailey', 44776740192, 5);
insert into cliente (nome, cpf, id_endereco) values ('Ira Offer', 80359995374, 5);
insert into cliente (nome, cpf, id_endereco) values ('Boycie Eakin', 91320731584, 4);
insert into cliente (nome, cpf, id_endereco) values ('Field Dunkersley', 79699114648, 1);
insert into cliente (nome, cpf, id_endereco) values ('Welby Caso', 99681731739, 1);
insert into cliente (nome, cpf, id_endereco) values ('Caroljean Maling', 99547713208, 7);
insert into cliente (nome, cpf, id_endereco) values ('Homer Whiffen', 42306805248, 3);
insert into cliente (nome, cpf, id_endereco) values ('Levy Sworne', 83027270340, 7);
insert into cliente (nome, cpf, id_endereco) values ('Laughton Holbie', 85018022311, 5);
insert into cliente (nome, cpf, id_endereco) values ('Konstance Downing', 58409311771, 3);
insert into cliente (nome, cpf, id_endereco) values ('Denny Coppard', 46840285134, 1);
insert into cliente (nome, cpf, id_endereco) values ('Bernetta Dalgliesh', 56904171218, 5);
insert into cliente (nome, cpf, id_endereco) values ('Saleem Beyer', 95980111462, 5);
insert into cliente (nome, cpf, id_endereco) values ('Chiquita Semrad', 45827824377, 6);
insert into cliente (nome, cpf, id_endereco) values ('Adan Favelle', 15157529979, 5);
insert into cliente (nome, cpf, id_endereco) values ('Tiphani Beckenham', 41313015011, 1);
insert into cliente (nome, cpf, id_endereco) values ('Ferdie Ashelford', 55919879660, 4);
insert into cliente (nome, cpf, id_endereco) values ('Clarey Marguerite', 12525892946, 4);
insert into cliente (nome, cpf, id_endereco) values ('Tedman Chesson', 22077535725, 3);
insert into cliente (nome, cpf, id_endereco) values ('Cate Volleth', 43715141754, 4);
insert into cliente (nome, cpf, id_endereco) values ('Ardella Harbron', 23062597838, 6);
insert into cliente (nome, cpf, id_endereco) values ('Aubrey Gherardesci', 51367057461, 1);
insert into cliente (nome, cpf, id_endereco) values ('Lorianne Dugald', 24025498673, 8);
insert into cliente (nome, cpf, id_endereco) values ('Sarena Spall', 37329776923, 3);
insert into cliente (nome, cpf, id_endereco) values ('Jeri Bransden', 62365232906, 3);
insert into cliente (nome, cpf, id_endereco) values ('Abie Puckey', 20102678260, 6);
insert into cliente (nome, cpf, id_endereco) values ('Cybil Rubenov', 58147488717, 6);
insert into cliente (nome, cpf, id_endereco) values ('Dex Franz', 65252170539, 2);
insert into cliente (nome, cpf, id_endereco) values ('Deni Fronsek', 37321221907, 3);
insert into cliente (nome, cpf, id_endereco) values ('Milo Kleinhausen', 13931458868, 2);
insert into cliente (nome, cpf, id_endereco) values ('Fonsie McAdam', 47216936251, 8);
insert into cliente (nome, cpf, id_endereco) values ('Fannie Chander', 60867658939, 5);
insert into cliente (nome, cpf, id_endereco) values ('Lyda Morrallee', 80097295434, 8);
insert into cliente (nome, cpf, id_endereco) values ('Janaye Courage', 60979634000, 6);
insert into cliente (nome, cpf, id_endereco) values ('Clevie Polgreen', 32501200191, 6);
insert into cliente (nome, cpf, id_endereco) values ('Englebert Sneaker', 66454920549, 2);
insert into cliente (nome, cpf, id_endereco) values ('Cristian Tschirasche', 28433059500, 8);
insert into cliente (nome, cpf, id_endereco) values ('Trenna McCluskey', 83678558317, 2);
insert into cliente (nome, cpf, id_endereco) values ('Erda Olle', 82551842310, 7);
insert into cliente (nome, cpf, id_endereco) values ('Morgana Stollard', 32956511439, 6);
insert into cliente (nome, cpf, id_endereco) values ('Skip Brumfield', 55258398248, 1);
insert into cliente (nome, cpf, id_endereco) values ('Agosto Verma', 97714963748, 1);
insert into cliente (nome, cpf, id_endereco) values ('Gaby Tolmie', 51010647513, 4);
insert into cliente (nome, cpf, id_endereco) values ('Ellsworth Ingrey', 47110836645, 2);
insert into cliente (nome, cpf, id_endereco) values ('Lorianne Donat', 15259612732, 1);
insert into cliente (nome, cpf, id_endereco) values ('Vladimir Lantaff', 61363669435, 2);
insert into cliente (nome, cpf, id_endereco) values ('Cathrine O''Hear', 82653820482, 3);
insert into cliente (nome, cpf, id_endereco) values ('Gracie Scothorn', 97811601541, 5);
insert into cliente (nome, cpf, id_endereco) values ('Connie Van Halen', 62921024495, 1);
COMMIT TRANSACTION;

-- TESTE DE CORREÇÃO DE ENDEREÇO (PERGUNTAR FUNÇÃO WHILE?)
SELECT * FROM cliente;
SELECT * FROM cidade;
UPDATE cliente SET id_endereco = 2
WHERE cliente.id = 1;

BEGIN TRANSACTION;
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Londonderry', 1993, null, 'Köln', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Nova', 2010, null, 'Al Qadarif', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Autumn Leaf', 2001, 'Park', 'Liuhou', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Mcbride', 2003, null, 'Pyatigorsk', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Lakeland', 1990, 'Junction', 'Kokkinóchoma', 1);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Lakeland', 2012, null, 'Delok', 1);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Dixon', 1995, null, 'Belyye Stolby', 1);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Dahle', 2012, null, 'Stockholm', 1);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Bayside', 2005, 'Way', 'Padangulaktanding', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Charing Cross', 2012, null, 'Krasnyy Yar', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Golden Leaf', 2009, null, 'Łagów', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Miller', 1985, 'Crossing', 'Santa Maria da Feira', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Ramsey', 2012, 'Alley', 'Vitim', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Loftsgordon', 2002, null, 'Ārt Khwājah', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Debs', 2011, null, 'Choya', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Eggendart', 1991, 'Plaza', 'Tiraspol', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Clyde Gallagher', 1997, null, 'Kaya', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Fairfield', 2010, 'Drive', 'Frydrychowice', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Stang', 2001, null, 'Fengjia', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Summer Ridge', 2008, 'Avenue', 'Kożuchów', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Summit', 2000, 'Lane', 'Huangpu', 1);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Main', 1999, null, 'Nassau', 1);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Northridge', 1983, null, 'Laifang', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Wayridge', 2007, 'Court', 'Moriya', 1);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Forster', 1992, null, 'Stratford', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Anniversary', 2004, null, 'Al Mazra‘ah ash Sharqīyah', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Kingsford', 2013, null, 'Lecherías', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Lakewood Gardens', 2006, null, 'Ourozinho', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Bay', 2007, null, 'Stockholm', 1);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Merry', 2011, null, 'Árta', 1);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Cambridge', 2010, null, 'Shuangxing', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Nelson', 1999, null, 'Kramat', 1);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Crest Line', 2000, 'Lane', 'Suban', 1);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Springs', 2009, null, 'Zhoutou', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Sugar', 1993, null, 'Umeå', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Declaration', 1998, null, 'Jiangkou', 1);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Haas', 2002, null, 'Felgueiras', 1);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Tennessee', 2006, null, 'Rosario de Lerma', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Aberg', 2002, null, 'Jaqué', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Caliangt', 2008, null, 'Oele', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('8th', 2011, null, 'Pueblo Nuevo Viñas', 1);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Sloan', 2012, null, 'Beloostrov', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Moulton', 2009, 'Alley', 'Pahonjean', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Continental', 2004, null, 'San Agustin', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Schurz', 2013, null, 'Whitehorse', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Dorton', 2004, null, 'Jatisari', 1);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Huxley', 2005, null, 'Grindavík', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Elmside', 2012, 'Hill', 'Mỏ Cày', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Ilene', 2001, null, 'Farinheiras', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Meadow Ridge', 2008, null, 'Dalianhe', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Washington', 2001, null, 'Klemunan', 1);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Buena Vista', 2008, null, 'Sindong', 1);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Elka', 2005, null, 'Qal‘at al Andalus', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Village', 1994, null, 'Bouças', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Sherman', 1995, 'Plaza', 'Viçosa', 1);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Kropf', 2009, null, 'Banjar Geriana Kangin', 3);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Springview', 2002, 'Point', 'Gaogongdao', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Cordelia', 2003, null, 'Guacarí', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Westridge', 2011, 'Pass', 'Alcoy', 2);
insert into endereco (logradouro, numero, complemento, bairro, id_cidade) values ('Warrior', 2012, null, 'Leninskoye', 1);
COMMIT TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO gerente_de_conta(nome, id_agencia)
	VALUES
	('William Cesar Santos', 1),
	('Vinicius Cornieri', 2),
	('Pablo Rodrigo', 3),
	('Anderson Piotto Leite', 4),
	('Matheus Sousa', 5),
	('Wenceslau Neto', 6),
	('Cristiano Neves Milrem', 7),
	('Lets Code Ada', 8);
COMMIT TRANSACTION;
	
SELECT * FROM gerente_de_conta;

BEGIN TRANSACTION;
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'fake@email.com', 2, 9);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'fake@email.com', 2, 10);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'fake@email.com', 2, 11);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'fake@email.com', 2, 12);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'fake@email.com', 2, 13);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'fake@email.com', 2, 14);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'fake@email.com', 2, 15);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'fake@email.com', 2, 16);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('fone', '242 555-999', 2, 9);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('fone', '242 555-999', 2, 10);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('fone', '242 555-999', 2, 11);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('fone', '242 555-999', 2, 12);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('fone', '242 555-999', 2, 13);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('fone', '242 555-999', 2, 14);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('fone', '242 555-999', 2, 15);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('fone', '242 555-999', 2, 16);
COMMIT TRANSACTION;

BEGIN TRANSACTION;
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 7, 17);
COMMIT TRANSACTION;
BEGIN TRANSACTION;	
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 8, 18);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 3, 19);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 6, 20);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 3, 21);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 7, 22);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 8, 23);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 4, 24);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 8, 25);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 5, 26);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 6, 27);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 7, 28);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 8, 29);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 3, 30);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 4, 31);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 5, 32);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 4, 33);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 6, 34);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 7, 35);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 7, 36);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 7, 37);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 7, 38);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 3, 39);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 5, 40);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 8, 41);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 4, 42);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 6, 43);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 4, 44);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 6, 45);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 4, 46);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 8, 47);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 3, 48);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 8, 49);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 3, 50);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 7, 51);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 6, 52);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 5, 53);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 7, 54);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 7, 55);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 3, 56);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 5, 57);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 7, 58);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 3, 59);
insert into contato (tipo, descricao, id_gerente, id_cliente) values ('email', 'superfake@teste.coml', 6, 60);	
COMMIT TRANSACTION;
	
SELECT * FROM gerente_de_conta;

BEGIN TRANSACTION;
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3020, 8, 26, 6, 4);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (1050, 9, 35, 2, 1);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (4434, 8, 1, 3, 3);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (5990, 4, 19, 1, 1);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (528, 6, 22, 6, 5);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (1414, 5, 39, 6, 7);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (4806, 4, 51, 6, 5);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (4606, 7, 39, 1, 1);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (5607, 8, 27, 5, 8);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (2170, 6, 48, 4, 5);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (5978, 4, 18, 5, 6);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (2414, 5, 32, 6, 7);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (242, 7, 20, 3, 8);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (761, 5, 36, 2, 6);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3249, 4, 12, 5, 8);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (2013, 4, 43, 6, 1);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (1371, 8, 55, 3, 3);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (4640, 9, 32, 4, 6);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (4761, 7, 41, 6, 6);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (1231, 2, 51, 2, 2);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (600, 3, 44, 4, 3);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (1124, 2, 39, 6, 3);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (5260, 1, 36, 5, 4);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (2776, 3, 24, 4, 7);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3211, 2, 37, 3, 4);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (377, 3, 9, 3, 8);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (915, 7, 8, 2, 7);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (4384, 9, 1, 5, 5);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (1079, 2, 53, 4, 1);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (4401, 7, 22, 5, 2);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3658, 7, 48, 5, 6);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (2065, 8, 30, 5, 5);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (4889, 3, 52, 5, 5);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (351, 7, 14, 5, 1);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3638, 6, 9, 1, 8);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (1135, 8, 10, 2, 8);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (206, 5, 36, 1, 7);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (4725, 6, 8, 3, 1);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (5957, 4, 41, 2, 4);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (5593, 3, 47, 1, 5);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3989, 3, 29, 2, 2);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (717, 3, 21, 3, 3);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (4533, 8, 26, 1, 8);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3429, 4, 25, 6, 7);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (421, 6, 17, 6, 4);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (559, 8, 20, 2, 8);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (1175, 9, 39, 4, 4);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3131, 4, 28, 2, 1);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (2444, 3, 6, 3, 5);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (4564, 2, 39, 3, 2);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (5936, 7, 24, 3, 2);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (1809, 7, 26, 6, 5);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (950, 1, 29, 2, 8);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (1182, 6, 21, 2, 7);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (764, 5, 10, 6, 5);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3659, 5, 39, 6, 5);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (717, 4, 17, 2, 6);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3335, 6, 45, 3, 8);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3435, 9, 8, 2, 1);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (5300, 6, 33, 4, 8);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (1069, 7, 46, 2, 6);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (5467, 1, 41, 4, 2);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (2323, 4, 26, 2, 4);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (5783, 5, 28, 2, 3);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (1260, 2, 7, 3, 7);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (1921, 4, 8, 6, 6);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (5081, 4, 9, 1, 6);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3819, 2, 51, 6, 4);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (4843, 7, 31, 3, 6);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (1194, 4, 34, 4, 8);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (2569, 3, 49, 4, 1);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3272, 5, 30, 4, 7);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (5504, 2, 33, 5, 7);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (2650, 8, 28, 2, 2);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (2283, 8, 24, 3, 6);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (5355, 1, 53, 5, 2);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (1621, 3, 44, 1, 8);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (2162, 4, 52, 6, 6);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3701, 6, 11, 4, 6);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (4357, 3, 50, 6, 6);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (2338, 4, 16, 3, 6);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3190, 6, 33, 3, 3);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3955, 8, 11, 3, 1);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (2685, 8, 5, 3, 4);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3988, 1, 12, 4, 2);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3590, 9, 8, 4, 6);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (2370, 2, 21, 3, 8);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (280, 3, 39, 6, 6);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (5249, 5, 55, 4, 8);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3073, 2, 26, 1, 5);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (2416, 2, 29, 4, 5);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (4355, 8, 38, 6, 3);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3435, 7, 29, 1, 2);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (4719, 3, 50, 1, 6);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3613, 8, 37, 3, 8);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (5140, 9, 35, 5, 4);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (3553, 6, 2, 1, 5);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (1744, 6, 16, 2, 3);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (365, 7, 34, 2, 8);
insert into conta (numero, digito, id_cliente, id_tipo_conta, id_gerente_de_conta) values (1415, 3, 10, 1, 8);

COMMIT TRANSACTION;

SELECT * FROM conta;	

-- CADASTRAR OPERAÇÕES
BEGIN TRANSACTION;
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 4, '2021-07-19 05:23:45', 904.03, 'Credito', 27,270, 239);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 3, '2020-11-05 13:14:05', 75.63, 'Credito', 69,271, 240);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 2, '2021-08-24 22:04:27', 447.63, 'Credito', 29,272, 241);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 3, '2021-11-21 22:46:59', 553.52, 'Credito', 32,273, 242);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 2, '2021-02-28 23:02:43', 684.73, 'Credito', 40,274, 243);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 4, '2022-02-21 05:31:34', 604.65, 'Credito', 31,275, 244);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 3, '2021-02-08 15:26:00', 363.95, 'Credito', 64,276, 245);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 3, '2021-09-26 12:02:40', 580.29, 'Credito', 37,277, 246);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 2, '2021-11-30 15:25:54', 138.18, 'Credito', 73,278, 247);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 2, '2021-06-15 21:46:59', 475.96, 'Credito', 66,279, 248);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 3, '2022-05-11 13:53:10', 343.17, 'Credito', 81,280, 249);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 1, '2021-02-09 20:19:12', 136.76, 'Credito', 90,281, 250);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 1, '2022-02-02 02:51:30', 534.52, 'Credito', 11,282, 251);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 3, '2021-09-01 19:26:26', 383.46, 'Credito', 23,283, 252);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 2, '2020-08-17 15:00:22', 887.68, 'Credito', 34,284, 253);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 3, '2022-02-06 00:07:08', 763.39, 'Credito', 41,285, 254);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 2, '2021-06-23 02:04:30', 598.67, 'Credito', 61,286, 255);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 1, '2020-12-16 01:00:45', 934.89, 'Credito', 55,287, 256);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 4, '2020-11-18 09:32:14', 854.86, 'Credito', 61,289, 257);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 3, '2022-02-16 09:33:13', 21.61, 'Credito', 15,290 ,258);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 2, '2021-12-26 09:26:52', 577.66, 'Credito', 38,291, 259);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 3, '2022-03-27 23:28:30', 378.98, 'Credito', 85,292, 260);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 2, '2020-12-04 18:08:24', 599.23, 'Credito', 18,293, 261);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 1, '2020-10-12 06:28:53', 46.7, 'Credito', 6, 294,262);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 2, '2022-04-04 05:28:10', 124.72, 'Credito', 10,295, 263);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 4, '2021-04-29 00:44:55', 535.62, 'Credito', 32,296, 264);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 1, '2020-10-14 13:16:16', 584.12, 'Credito', 56,297, 265);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 1, '2020-10-22 19:45:07', 850.6, 'Credito', 70,298 ,266);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 4, '2021-12-22 06:22:53', 569.52, 'Credito', 8,299, 267);
insert into operacoes (id_servico, id_financeiro, data_hora, valor, tipo, id_conta, id, id_origem) values (3, 3, '2022-03-03 05:34:59', 122.66, 'Credito', 68,300 ,268);
COMMIT TRANSACTION;

SELECT * FROM operacoes;
--TRUNCATE TABLE operacoes;


