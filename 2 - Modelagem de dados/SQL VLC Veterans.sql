CREATE SCHEMA ZELADORIA_PUBLICA;

USE ZELADORIA_PUBLICA;

CREATE TABLE Cidadao 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,  
 Nome VARCHAR(100),  
 Apoio INT,  
 telefone VARCHAR(15)  
); 

CREATE TABLE Solicitacao 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,  
 Descricao LONGTEXT,  
 Status VARCHAR(20),  
 Apoio INT,  
 Endereco VARCHAR(255),  
 Bairro VARCHAR(30),  
 idCidadao INT,
 idCategoria INT,
 idGestor INT
); 

CREATE TABLE ContribuicaoVoluntaria 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,  
 Descricao Longtext,  
 Titulo VARCHAR(50),  
 Apoio INT,  
 Bairro VARCHAR(20),  
 Endereco VARCHAR(255),  
 Status VARCHAR(20),  
 idGestor INT,  
 idCategoria INT 
); 

CREATE TABLE Gestor 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,  
 Nome VARCHAR(100)  
); 

CREATE TABLE Categoria 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,  
 nome VARCHAR(30)  
); 

CREATE TABLE Voluntario 
( 
 id INT PRIMARY KEY AUTO_INCREMENT, 
 Descricao VARCHAR(200),
 idCidadao INT,  
 idContribuicaoVoluntaria INT  
); 

ALTER TABLE Solicitacao ADD FOREIGN KEY(idCidadao) REFERENCES Cidadao (id);
ALTER TABLE Solicitacao ADD FOREIGN KEY(idGestor) REFERENCES Gestor (id);
ALTER TABLE Solicitacao ADD FOREIGN KEY(idCategoria) REFERENCES Categoria (id);
ALTER TABLE ContribuicaoVoluntaria ADD FOREIGN KEY(idGestor) REFERENCES Gestor (id);
ALTER TABLE ContribuicaoVoluntaria ADD FOREIGN KEY(idCategoria) REFERENCES Categoria (id);
ALTER TABLE Voluntario ADD FOREIGN KEY(idCidadao) REFERENCES Cidadao (id);
ALTER TABLE Voluntario ADD FOREIGN KEY(idContribuicaoVoluntaria) REFERENCES ContribuicaoVoluntaria (id);