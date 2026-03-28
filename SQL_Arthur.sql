CREATE DATABASE banco_streaming;

USE banco_streaming;

CREATE TABLE usuarios (
usuario_id     INT PRIMARY KEY,
nome           VARCHAR(100),
email          VARCHAR(100),
pais           VARCHAR(100),
plano          INT,
data_cadastro  DATE
);

CREATE TABLE filmes(
filme_id        INT PRIMARY KEY,
titulo          VARCHAR(100),
genero          VARCHAR(100),
ano_lancamento  DATE,
duracao_min     INT,
classificacao   INT,
nota_imdb       DECIMAL(10,2)
);

CREATE TABLE avaliacoes(
avaliacao_id       INT PRIMARY KEY,
usuario_id         INT,
filme_id           INT,
nota               DECIMAL(3,2),
data_avaliacao     DATE,
assistiu_completo  VARCHAR(100),
FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
FOREIGN KEY (filme_id) REFERENCES filmes(filme_id ));

SET GLOBAL local_infile = 1;

LOAD DATA INFILE "C:/Users/arthur.smartins/Desktop/usuarios.csv"
INTO TABLE usuarios
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(usuario_id, nome, email, pais,
plano, data_cadastro);

LOAD DATA INFILE "C:/Users/arthur.smartins/Desktop/avaliacoes.csv"
INTO TABLE avaliacoes
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(avaliacao_id,usuario_id, filme_id, nota,
data_avaliacao, assistiu_completo);

LOAD DATA INFILE "C:/Users/arthur.smartins/Desktop/filmes.csv"
INTO TABLE filmes
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(filme_id, titulo, genero, ano_lancamento, 
duracao_min, classificacao, nota_imdb);

select * from filmes;

select * from avaliacoes;

select * from usuarios;

SELECT usuarios.nome, filmes.titulo, avaliacoes.nota 
FROM avaliacoes
JOIN usuarios ON usuarios.usuario_id = avaliacoes.usuario_id
JOIN filmes ON filmes.filme_id = avaliacoes.filme_id;

SELECT filmes.titulo, filmes.nota_imdb, usuarios.nome
FROM filmes
INNER JOIN usuarios ON usuario_id = filmes.filme_id;

SELECT filmes.titulo, ROUND(AVG(avaliacoes.nota),2) as Nota_Média
FROM filmes
JOIN avaliacoes ON filmes.filme_id = avaliacoes.filme_id
GROUP BY filmes.titulo;





