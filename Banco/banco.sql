SET SQL_SAFE_UPDATES = 0;
create database escolaMusica;
USE escolaMusica;

CREATE TABLE Orquestra (
    idOrquestra INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Cidade VARCHAR(50),
    País VARCHAR(50),
    Data_criacao DATE
);

CREATE TABLE Musico (
    idMusico INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Nacionalidade VARCHAR(50),
    Data_Nascimento DATE,
    idOrquestra INT,
    FOREIGN KEY (idOrquestra) REFERENCES Orquestra(idOrquestra)
);

CREATE TABLE Instrumento (
    idInstrumento INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Sinfonia (
    idSinfonia INT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Compositor VARCHAR(45),
    Data_criacao DATE,
    idOrquestra INT,
    idMusico INT,
    FOREIGN KEY (idOrquestra) REFERENCES Orquestra(idOrquestra),
    FOREIGN KEY (idMusico) REFERENCES Musico(idMusico)
);

CREATE TABLE FuncaoMusico (
    idFuncaoMusico INT PRIMARY KEY,
    Nome VARCHAR(50),
    Data_apresentacao DATE,
    idMusico INT,
    idInstrumento INT,
    idSinfonia INT,
    FOREIGN KEY (idMusico) REFERENCES Musico(idMusico),
    FOREIGN KEY (idInstrumento) REFERENCES Instrumento(idInstrumento),
    FOREIGN KEY (idSinfonia) REFERENCES Sinfonia(idSinfonia)
);

INSERT INTO Orquestra (idOrquestra, Nome, Cidade, País, Data_criacao) VALUES
(1, 'Orquestra Sinfônica Jovem', 'São Paulo', 'Brasil', '1995-04-12'),
(2, 'Orquestra Filarmônica de Minas Gerais', 'Belo Horizonte', 'Brasil', '2008-03-01'),
(3, 'Orquestra Sinfônica Brasileira', 'Rio de Janeiro', 'Brasil', '1940-07-11'),
(4, 'Orquestra de Câmara de Curitiba', 'Curitiba', 'Brasil', '1985-06-10'),
(5, 'Orquestra Metropolitana de Lisboa', 'Lisboa', 'Portugal', '1992-02-15'),
(6, 'Orquestra Filarmônica de Berlim', 'Berlim', 'Alemanha', '1882-05-01'),
(7, 'Orquestra Nacional de França', 'Paris', 'França', '1934-06-15'),
(8, 'Orquestra Filarmônica de Nova York', 'Nova York', 'EUA', '1842-12-07'),
(9, 'Orquestra Sinfônica de Londres', 'Londres', 'Inglaterra', '1904-06-09'),
(10, 'Orquestra de Paris', 'Paris', 'França', '1967-11-11');

INSERT INTO Musico (idMusico, Nome, Nacionalidade, Data_Nascimento, idOrquestra) VALUES
(1, 'Ana Souza', 'Brasileira', '1990-01-15', 1),
(2, 'Carlos Mendes', 'Brasileiro', '1985-07-22', 1),
(3, 'Laura Martins', 'Brasileira', '1992-03-11', 2),
(4, 'Miguel Costa', 'Brasileiro', '1987-10-05', 2),
(5, 'Sofia Dias', 'Portuguesa', '1995-12-30', 5),
(6, 'Lucas Pereira', 'Brasileiro', '1989-06-18', 3),
(7, 'Helena Müller', 'Alemã', '1984-02-20', 6),
(8, 'Thomas Dubois', 'Francês', '1988-11-14', 7),
(9, 'James Taylor', 'Americano', '1991-08-27', 8),
(10, 'Emma Wilson', 'Inglesa', '1993-04-09', 9);

INSERT INTO Instrumento (idInstrumento, Nome) VALUES
(1, 'Violino'),
(2, 'Violoncelo'),
(3, 'Flauta'),
(4, 'Clarinete'),
(5, 'Trompete'),
(6, 'Trombone'),
(7, 'Oboé'),
(8, 'Fagote'),
(9, 'Tímpano'),
(10, 'Piano');

INSERT INTO Sinfonia (idSinfonia, Nome, Compositor, Data_criacao, idOrquestra, idMusico) VALUES
(1, 'Sinfonia nº 5', 'Beethoven', '1808-12-22', 6, 7),
(2, 'Sinfonia nº 9', 'Beethoven', '1824-05-07', 6, 7),
(3, 'Sinfonia nº 40', 'Mozart', '1788-07-25', 9, 10),
(4, 'Sinfonia Fantástica', 'Berlioz', '1830-12-05', 7, 8),
(5, 'Sinfonia do Novo Mundo', 'Dvorák', '1893-12-15', 8, 9),
(6, 'Sinfonia Alpina', 'Richard Strauss', '1915-10-28', 6, 7),
(7, 'Sinfonia Pastoral', 'Beethoven', '1808-12-22', 1, 1),
(8, 'Sinfonia em Ré Menor', 'Franck', '1889-02-17', 5, 5),
(9, 'Sinfonia nº 3', 'Brahms', '1883-12-02', 6, 7),
(10, 'Sinfonia Leningrado', 'Shostakovich', '1941-12-27', 7, 8);

INSERT INTO FuncaoMusico (idFuncaoMusico, Nome, Data_apresentacao, idMusico, idInstrumento, idSinfonia) VALUES
(1, 'Violinista', '2023-05-10', 1, 1, 1),
(2, 'Flautista', '2023-06-12', 2, 3, 2),
(3, 'Violoncelista', '2023-05-15', 3, 2, 3),
(4, 'Trompetista', '2023-07-01', 4, 5, 5),
(5, 'Pianista', '2023-06-20', 5, 10, 8),
(6, 'Clarinetista', '2023-05-30', 6, 4, 6),
(7, 'Maestro', '2023-04-25', 7, 1, 9),
(8, 'Oboísta', '2023-05-22', 8, 7, 4),
(9, 'Percussionista', '2023-06-10', 9, 9, 5),
(10, 'Trombonista', '2023-07-15', 10, 6, 3);

-- SQL: ALTER TABLES

alter table funcaomusico
	add column cacheEvento varchar (20);
    
alter table funcaomusico
	add column nomeInstrumento varchar (20);
    
alter table funcaomusico
	add column tempoEvento varchar (20);

alter table funcaomusico
	add column funcionario varchar (20);

alter table funcaomusico
	add column telefone varchar (20);

alter table funcaomusico
	add column email varchar (20);

alter table funcaomusico
	add column salario varchar (20);
    
alter table funcaomusico
	add column acessoVip varchar (20);

alter table instrumento
	add column marca varchar (20);
    
alter table instrumento
	add column valor varchar (20);
    
alter table instrumento
	add column dataEvento varchar (20);
    
alter table instrumento
	add column aluguel varchar (20);
    
alter table musico
	add column cacheEvento varchar (20);
    
alter table musico
	add column dataEvento varchar (20);

-- SQL: UPDATES
UPDATE funcaomusico
	SET idSinfonia = 2
	WHERE idFuncaoMusico = 3;

UPDATE funcaomusico
	SET idMusico = idMusico + 1
	WHERE idFuncaoMusico = 1;

UPDATE funcaomusico
	SET idSinfonia = idSinfonia + 2
	WHERE idFuncaoMusico = 10;

UPDATE funcaomusico
	SET idMusico = 2
	WHERE idFuncaoMusico = 7;
    
    
 -- SQL: SELECT + ORDER BY + INNER JOY

SELECT * FROM funcaomusico;

SELECT idFuncaoMusico, nome, Data_apresentacao, idMusico, idSinfonia	
		from funcaomusico; 
        
SELECT idFuncaoMusico "Instrumentista", nome as "Funcionario", Data_apresentacao "Evento", 
idMusico "Registro", idSinfonia "Sinfonia"
		from funcaomusico; 
     
SELECT idFuncaoMusico "Instrumentista", nome as "Funcionario", Data_apresentacao "Evento", 
idMusico "Registro", idSinfonia "Sinfonia"
		from funcaomusico
			order by nome desc; 
     
SELECT fm.idFuncaoMusico AS "Instrumentista", m.Nome AS "Funcionario", 
       DATE_FORMAT(fm.Data_apresentacao, '%d/%m/%Y') AS "Evento", 
       m.idMusico AS "Registro", fm.idSinfonia AS "Sinfonia"
	FROM funcaomusico fm
		INNER JOIN musico m ON fm.idMusico = m.idMusico
			ORDER BY m.Nome;
        
        
        
    
SELECT * FROM instrumento;

SELECT idInstrumento, nome
		from instrumento; 
        
SELECT idInstrumento "Instrumento", nome "Musico"
		from instrumento; 
	 
     
SELECT idInstrumento "Instrumento", nome as "Musico"
		from instrumento 
			order by nome;
     
SELECT i.idInstrumento AS "Instrumento", i.Nome AS "Musico"
	FROM instrumento i
		INNER JOIN funcaomusico f ON i.idInstrumento = f.idInstrumento
			ORDER BY i.Nome;
 
 
 SELECT * FROM musico; 

SELECT idMusico, Nome, Nacionalidade, Data_Nascimento, idOrquestra
		from musico;  
        
SELECT idMusico "Registro", Nome "Nome", Nacionalidade, 
Data_Nascimento "Data de Nascimento", idOrquestra "Identificação"
		from musico; 

SELECT idMusico "Registro", Nome "Nome", Nacionalidade, 
Data_Nascimento "Data de Nascimento", idOrquestra "Identificação"
		from musico
			order by nome;
            
SELECT m.idMusico AS "Registro", m.Nome, m.Nacionalidade,
       m.Data_Nascimento AS "Data de Nascimento", m.idOrquestra AS "Identificação"
	FROM musico m
		INNER JOIN funcaomusico f ON m.idMusico = f.idMusico
			ORDER BY m.Nome;

CREATE VIEW vw_musicos_por_orquestra AS
SELECT o.Nome AS Orquestra, m.Nome AS Musico, m.Nacionalidade, m.Data_Nascimento
FROM Musico m
JOIN Orquestra o ON m.idOrquestra = o.idOrquestra;

CREATE VIEW vw_funcoes_em_sinfonias AS
SELECT f.Nome AS Funcao, m.Nome AS Musico, s.Nome AS Sinfonia, f.Data_apresentacao
FROM FuncaoMusico f
JOIN Musico m ON f.idMusico = m.idMusico
JOIN Sinfonia s ON f.idSinfonia = s.idSinfonia;

CREATE VIEW vw_instrumentos_musicos AS
SELECT m.Nome AS Musico, i.Nome AS Instrumento, i.Marca, i.Valor
FROM FuncaoMusico f
JOIN Musico m ON f.idMusico = m.idMusico
JOIN Instrumento i ON f.idInstrumento = i.idInstrumento;

CREATE VIEW vw_sinfonias_com_detalhes AS
SELECT s.Nome AS Sinfonia, s.Compositor, s.Data_criacao, o.Nome AS Orquestra
FROM Sinfonia s
JOIN Orquestra o ON s.idOrquestra = o.idOrquestra;

CREATE VIEW vw_eventos_cronologicos AS
SELECT f.Nome AS Funcao, m.Nome AS Musico, f.Data_apresentacao, s.Nome AS Sinfonia
FROM FuncaoMusico f
JOIN Musico m ON f.idMusico = m.idMusico
JOIN Sinfonia s ON f.idSinfonia = s.idSinfonia
ORDER BY f.Data_apresentacao;

CREATE VIEW vw_orquestras_com_qtd_musicos AS
SELECT o.Nome AS Orquestra, COUNT(m.idMusico) AS Total_Musicos
FROM Orquestra o
LEFT JOIN Musico m ON o.idOrquestra = m.idOrquestra
GROUP BY o.idOrquestra;

CREATE VIEW vw_detalhes_instrumentos AS
SELECT Nome AS Instrumento, Marca, Valor, dataEvento, Aluguel
FROM Instrumento;

CREATE VIEW vw_musico_sinfonias AS
SELECT m.Nome AS Musico, s.Nome AS Sinfonia, s.Compositor
FROM FuncaoMusico f
JOIN Musico m ON f.idMusico = m.idMusico
JOIN Sinfonia s ON f.idSinfonia = s.idSinfonia;

CREATE VIEW vw_historico_musico AS
SELECT m.Nome AS Musico, f.Nome AS Funcao, i.Nome AS Instrumento, s.Nome AS Sinfonia, f.Data_apresentacao
FROM FuncaoMusico f
JOIN Musico m ON f.idMusico = m.idMusico
JOIN Instrumento i ON f.idInstrumento = i.idInstrumento
JOIN Sinfonia s ON f.idSinfonia = s.idSinfonia;

CREATE VIEW vw_apresentacoes_completas AS
SELECT f.idFuncaoMusico, f.Nome AS Funcao, f.Data_apresentacao, m.Nome AS Musico, 
       i.Nome AS Instrumento, s.Nome AS Sinfonia, o.Nome AS Orquestra
FROM FuncaoMusico f
JOIN Musico m ON f.idMusico = m.idMusico
JOIN Instrumento i ON f.idInstrumento = i.idInstrumento
JOIN Sinfonia s ON f.idSinfonia = s.idSinfonia
JOIN Orquestra o ON s.idOrquestra = o.idOrquestra;



 SELECT * FROM orquestra; 

SELECT idOrquestra, Nome, Cidade, País, Data_criacao
		from orquestra;  
        
SELECT idOrquestra "identificação", Nome, Cidade, País, Data_criacao "Criação"
		from orquestra;  

SELECT idOrquestra "identificação", Nome, Cidade, País, Data_criacao "Criação"
		from orquestra 
			order by nome;
            
SELECT o.idOrquestra AS "Identificação", o.Nome, o.Cidade, o.País, 
       DATE_FORMAT(o.Data_criacao, '%d/%m/%Y') AS "Evento"
		FROM orquestra o
			ORDER BY o.Nome;
            
            
            -- SQL: DELETE 
DELETE FROM funcaomusico WHERE idSinfonia = 2;
DELETE FROM funcaomusico WHERE idSinfonia = 6;
DELETE FROM funcaomusico WHERE idMusico = 1;
DELETE FROM funcaomusico WHERE idMusico = 10;
DELETE FROM funcaomusico WHERE idInstrumento = 10;
DELETE FROM funcaomusico WHERE idInstrumento = 3;
DELETE FROM funcaomusico WHERE idInstrumento = 6;
DELETE FROM funcaomusico WHERE Data_apresentacao = '2023-07-15' AND idFuncaoMusico IS NOT NULL;


alter table funcaomusico
DROP COLUMN funcionario;
    
alter table funcaomusico
DROP COLUMN telefone;

alter table funcaomusico
DROP COLUMN email;

alter table funcaomusico
DROP COLUMN salario;
 
 alter table funcaomusico
DROP COLUMN acessoVip;

            -- SQL: DROP TABLES

drop table funcaomusico;

drop table instrumento;

drop table sinfonia;

drop table musico;

drop table orquestra;

-- SQL: VIEWS DOS PRINCIPAIS RELATORIOS