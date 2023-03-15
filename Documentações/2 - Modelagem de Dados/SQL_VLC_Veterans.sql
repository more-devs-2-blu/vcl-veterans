CREATE SCHEMA ZELADORIA_PUBLICA;

USE ZELADORIA_PUBLICA;

CREATE TABLE Cidadao 
( 
 id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,  
 Nome VARCHAR(100),  
 Pontos INT UNSIGNED
); 

CREATE TABLE Melhoria 
( 
 id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,  
 Descricao LONGTEXT,
 Status VARCHAR(20),  
 Apoio INT DEFAULT 0,  
 Endereco VARCHAR(255), 
 Resposta VARCHAR(255),
 idCidadao INT UNSIGNED NOT NULL,
 idCategoria INT UNSIGNED NOT NULL
); 

CREATE TABLE Acao 
( 
 id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,  
 Descricao Longtext,  
 Apoio INT UNSIGNED,  
 Endereco VARCHAR(255),
 Status VARCHAR(20),
 idCriador INT UNSIGNED NOT NULL,
 idCategoria INT UNSIGNED NOT NULL);

CREATE TABLE Categoria 
( 
 id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,  
 nome VARCHAR(30) 
); 

CREATE TABLE Voluntario 
( 
 id INT PRIMARY KEY AUTO_INCREMENT, 
 idCidadao INT UNSIGNED NOT NULL,  
 idAcao INT UNSIGNED NOT NULL
); 

ALTER TABLE Melhoria ADD FOREIGN KEY(idCidadao) REFERENCES Cidadao (id);
ALTER TABLE Melhoria ADD FOREIGN KEY(idCategoria) REFERENCES Categoria (id);
ALTER TABLE Acao ADD FOREIGN KEY(Criador) REFERENCES Cidadao (id);
ALTER TABLE Acao ADD FOREIGN KEY(idCategoria) REFERENCES Categoria (id);
ALTER TABLE Voluntario ADD FOREIGN KEY(idCidadao) REFERENCES Cidadao (id);
ALTER TABLE Voluntario ADD FOREIGN KEY(idAcao) REFERENCES Acao (id);

INSERT INTO CIDADAO (nome, pontos) VALUES ('Joãozinho', 4);
INSERT INTO CIDADAO (nome, pontos) VALUES ('Zezinho', 3);
INSERT INTO CIDADAO (nome, pontos) VALUES ('Huguinho', 9);
INSERT INTO CIDADAO (nome, pontos) VALUES ('Luizinho', 1);
INSERT INTO CIDADAO (nome, pontos) VALUES ('Joaninha', 5);

INSERT INTO CATEGORIA (nome) VALUES ('Lixo');
INSERT INTO CATEGORIA (nome) VALUES ('Iluminação');
INSERT INTO CATEGORIA (nome) VALUES ('Pavimentos');
INSERT INTO CATEGORIA (nome) VALUES ('Sinalização');
INSERT INTO CATEGORIA (nome) VALUES ('Vegetação');

INSERT INTO ACAO (descricao, apoio, endereco, status, criador, idcategoria) 
	VALUES ('Carpir meu quintal', 0, 'Rua do Bode, 43', 'Aberto', 2, 1);
INSERT INTO ACAO (descricao, apoio, endereco, status, criador, idcategoria) 
	VALUES ('Plantar flores na pracinha', 19, 'Rua da Vaca, 11', 'Autorizado', 5, 3);  
INSERT INTO ACAO (descricao, apoio, endereco, status, criador, idcategoria) 
	VALUES ('Roubar a geladeira do vizinho', 0, 'Rua do Sapo, 8', 'Negado', 3, 5);  
INSERT INTO ACAO (descricao, apoio, endereco, status, criador, idcategoria) 
	VALUES ('Organizar festa de aniversário da rua', 22, 'Rua do Elefante, 11', 'Autorizado', 1, 3);
INSERT INTO ACAO (descricao, apoio, endereco, status, criador, idcategoria) 
	VALUES ('Pintar o poste de roxo', 3, 'Rua da Pitanguinha, 83', 'Negado', 4, 1);    

INSERT INTO MELHORIA (descricao, status, apoio, endereco, resposta, idCidadao, idcategoria) 
	VALUES ('Mendigos sujando a rua', 'Aberto', 4, 'Rua da Pitanguinha, 83', '', 1, 1);
INSERT INTO MELHORIA (descricao, status, apoio, endereco, resposta, idCidadao, idcategoria) 
	VALUES ('Buraco na rua', 'Andamento', 13, 'Rua da Vovozinha, 55', '', 2, 2);
INSERT INTO MELHORIA (descricao, status, apoio, endereco, resposta, idCidadao, idcategoria) 
	VALUES ('Mendigos sujando a rua', 'Concluído', 0, 'Rua da Pitanguinha, 83', 'MELHORIA REPETIDA', 4, 1);    
INSERT INTO MELHORIA (descricao, status, apoio, endereco, resposta, idCidadao, idcategoria) 
	VALUES ('Barata na embaixo da cama', 'Concluído', 0, 'Rua do Macaco, 145', 'MELHORIA NÃO RELACIONADA A ZELADORIA PÚBLICA', 5, 1);
INSERT INTO MELHORIA (descricao, status, apoio, endereco, resposta, idCidadao, idcategoria) 
	VALUES ('Testetestestestes', 'Concluído', 0, 'Rua do Avestruz, 83', 'MELHORIA NÃO RELACIONADA A ZELADORIA PÚBLICA', 4, 1);    
    
INSERT INTO VOLUNTARIO (idcidadao, idacao) VALUES (1, 4);    
INSERT INTO VOLUNTARIO (idcidadao, idacao) VALUES (2, 5);
INSERT INTO VOLUNTARIO (idcidadao, idacao) VALUES (2, 4);
INSERT INTO VOLUNTARIO (idcidadao, idacao) VALUES (4, 1);
INSERT INTO VOLUNTARIO (idcidadao, idacao) VALUES (1, 5);