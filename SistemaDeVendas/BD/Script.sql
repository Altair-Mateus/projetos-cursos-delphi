CREATE TABLE cliente
(
	id_cliente integer NOT NULL,
	razao_social varchar(100),
	fantasia varchar(100),
	cpf_cnpj varchar(20),
	tipo_fj varchar(1),
	nome varchar(100),
	email varchar(255),
	site varchar(255),
	endereco varchar(255),
	complemento varchar(40),
	numero varchar(20),
	bairro varchar(50),
	ie varchar(30),
	im varchar(30),
	DT_EXCLUIDO DATE,
	PRIMARY KEY (id_cliente)

);


CREATE TABLE cidade 
(
	id_cidade integer NOT NULL,
	nome varchar(60),
	PRIMARY KEY (id_cidade)

);

CREATE TABLE estado 
(
	id_estado integer NOT NULL,
	nome varchar(60),
	sigla varchar(2),
	PRIMARY KEY (id_estado)

);