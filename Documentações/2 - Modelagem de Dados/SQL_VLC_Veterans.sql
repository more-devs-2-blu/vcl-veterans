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
 Resposta VARCHAR(255),
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
ALTER TABLE Acao ADD FOREIGN KEY(idCriador) REFERENCES Cidadao (id);
ALTER TABLE Acao ADD FOREIGN KEY(idCategoria) REFERENCES Categoria (id);
ALTER TABLE Voluntario ADD FOREIGN KEY(idCidadao) REFERENCES Cidadao (id);
ALTER TABLE Voluntario ADD FOREIGN KEY(idAcao) REFERENCES Acao (id);

INSERT INTO CIDADAO (nome, pontos) VALUES ('João', 4);
INSERT INTO CIDADAO (nome, pontos) VALUES ('José', 3);
INSERT INTO CIDADAO (nome, pontos) VALUES ('Hugo', 9);
INSERT INTO CIDADAO (nome, pontos) VALUES ('Luiza', 1);
INSERT INTO CIDADAO (nome, pontos) VALUES ('Joana', 5);

INSERT INTO CATEGORIA (nome) VALUES ('Lixo');
INSERT INTO CATEGORIA (nome) VALUES ('Iluminação');
INSERT INTO CATEGORIA (nome) VALUES ('Pavimentos');
INSERT INTO CATEGORIA (nome) VALUES ('Sinalização');
INSERT INTO CATEGORIA (nome) VALUES ('Vegetação');
INSERT INTO CATEGORIA (nome) VALUES ('Outros');

INSERT INTO ACAO (descricao, apoio, endereco, status, resposta, idcriador, idcategoria) 
	VALUES ('Jardinar canteiro lateral as 10h do dia 22/05/2023', 0, 'Rua XV de Novembro, 43', 'Aberto', 'Parabéns pela iniciativa!',2, 5);
INSERT INTO ACAO (descricao, apoio, endereco, status, resposta, idcriador, idcategoria) 
	VALUES ('Plantar flores na praça central as 14h do dia 04/06/2023', 19, 'Rua Sao Paulo, 11', 'Autorizado', '', 5, 5);  
INSERT INTO ACAO (descricao, apoio, endereco, status, resposta, idcriador, idcategoria) 
	VALUES ('Pintar a Placa do ponto de onibus as 09h do dia 27/03/2023 ', 0, 'Rua Bom Jesus, 8', 'Negado', 'Não autorizado', 3, 4);  
INSERT INTO ACAO (descricao, apoio, endereco, status, resposta, idcriador, idcategoria) 
	VALUES ('Organizar festa de aniversário da rua as 17h do dia 18/03/2023', 22, 'Rua Humberto de Campos, 11', 'Autorizado', 'Boa festa!', 1, 6);
INSERT INTO ACAO (descricao, apoio, endereco, status, resposta, idcriador, idcategoria) 
	VALUES ('Pintar o poste de amarelo as 14h do dia 15/03/2023', 3, 'Rua das Palmeiras, 83', 'Negado', 'Não autorizado pela prefeitura', 4, 6);
INSERT INTO ACAO (descricao, apoio, endereco, status, resposta, idcriador, idcategoria) 
	VALUES ('Limpar a calçada da rua as 13h do dia 19/06/2023', 3, 'Rua das Palmeiras, 83', 'Autorizado', 'Parabéns pela iniciativa!', 4, 1);     

INSERT INTO MELHORIA (descricao, status, apoio, endereco, resposta, idCidadao, idcategoria) 
	VALUES ('Mendigos sujando a rua', 'Aberto', 4, 'Rua XV de Novembro, 83', '', 1, 1);
INSERT INTO MELHORIA (descricao, status, apoio, endereco, resposta, idCidadao, idcategoria) 
	VALUES ('Buraco na rua', 'Andamento', 13, 'BR 470, 55', '', 2, 3);
INSERT INTO MELHORIA (descricao, status, apoio, endereco, resposta, idCidadao, idcategoria) 
	VALUES ('Poste Com a Luz queimada', 'Concluído', 0, 'Rua Bahia, 83', 'Trocamos a luz no dia 15/04/2023', 4, 4);    
INSERT INTO MELHORIA (descricao, status, apoio, endereco, resposta, idCidadao, idcategoria) 
	VALUES ('Barata na embaixo da cama', 'Concluído', 0, 'Rua Alameda Rio Branco, 145', 'MELHORIA NÃO RELACIONADA A ZELADORIA PÚBLICA', 5, 1);
INSERT INTO MELHORIA (descricao, status, apoio, endereco, resposta, idCidadao, idcategoria) 
	VALUES ('Mato muito alto na calçada', 'Concluído', 0, 'Rua Frederico Toscano Barreto, 83', '', 4, 5);    
    
INSERT INTO VOLUNTARIO (idcidadao, idacao) VALUES (1, 4);    
INSERT INTO VOLUNTARIO (idcidadao, idacao) VALUES (2, 5);
INSERT INTO VOLUNTARIO (idcidadao, idacao) VALUES (2, 4);
INSERT INTO VOLUNTARIO (idcidadao, idacao) VALUES (4, 1);
INSERT INTO VOLUNTARIO (idcidadao, idacao) VALUES (1, 5);