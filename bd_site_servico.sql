-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE user (
cod_user int(8) NOT NULL PRIMARY KEY,
password varchar(20),
email varchar(50),
nome varchar(150),
cod_tip_user int(1)
);

CREATE TABLE modalidade (
id_modalidade int(02) NOT NULL PRIMARY KEY,
desc_modalidade varchar(10)
);

CREATE TABLE endereco (
uf varchar(2),
cod_end int(8) NOT NULL PRIMARY KEY,
bairro varchar(15),
cep varchar(9),
cidade varchar(25),
logradouro varchar(120)
);

CREATE TABLE tip_user (
cod_tip_user int(1) NOT NULL PRIMARY KEY,
tip_user varchar(10)
);

CREATE TABLE disponibilidade (
dia_semana date,
id_disp int(10) NOT NULL PRIMARY KEY
);

CREATE TABLE disp_user (
cod_contrato int(2),
id_disp int(10),
FOREIGN KEY(id_disp) REFERENCES disponibilidade (id_disp)
);

CREATE TABLE contrato (
dt_fim date,
data_pagamento date,
dt_inicio date,
horario_trabalho int(2),
cod_contrato int(2) NOT NULL PRIMARY KEY,
cpf varchar(14),
cod_prestador varchar(6),
id_modalidade int(02),
FOREIGN KEY(id_modalidade) REFERENCES modalidade (id_modalidade)
);

CREATE TABLE comum (
cpf varchar(14) NOT NULL PRIMARY KEY,
dt_nascimento date,
rg varchar(9),
genero varchar(1),
ativo_comum int(2),
cod_user int(8),
cod_end int(8),
FOREIGN KEY(cod_user) REFERENCES user (cod_user),
FOREIGN KEY(cod_end) REFERENCES endereco (cod_end)
);

CREATE TABLE servico (
cod_servico int(4) NOT NULL PRIMARY KEY,
descricao varchar(100),
tipo_servico varchar(25),
cod_prestador varchar(6)
);

CREATE TABLE prestador (
ativo_prestador int(02),
avaliacoes varchar(300),
cod_prestador varchar(6) NOT NULL PRIMARY KEY,
cod_user int(8),
valor varchar(10),
FOREIGN KEY(cod_user) REFERENCES user (cod_user)
);

ALTER TABLE user ADD FOREIGN KEY(cod_tip_user) REFERENCES tip_user (cod_tip_user);
ALTER TABLE disp_user ADD FOREIGN KEY(cod_contrato) REFERENCES contrato (cod_contrato);
ALTER TABLE contrato ADD FOREIGN KEY(cpf) REFERENCES comum (cpf);
ALTER TABLE contrato ADD FOREIGN KEY(cod_prestador) REFERENCES prestador (cod_prestador);
ALTER TABLE servico ADD FOREIGN KEY(cod_prestador) REFERENCES prestador (cod_prestador);
