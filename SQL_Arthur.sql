CREATE DATABASE bancosenac;

USE bancosenac;

CREATE TABLE vendas (
data           DATE,
produto        VARCHAR(100),
categoria      VARCHAR(100),
valor_unitario DECIMAL(10,2),
quantidade     INT,
cliente        VARCHAR(100),
cidade         VARCHAR(100),
estado         VARCHAR(2)
);

SET GLOBAL local_infile = 1;

LOAD DATA INFILE "C:/Users/arthur.smartins/Desktop/vendas.csv"
INTO TABLE vendas
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, produto, categoria, valor_unitario,
quantidade, cliente, cidade, estado);



SELECT * FROM vendas;

SELECT * FROM vendas
WHERE categoria = "Informática";

SELECT * FROM vendas
WHERE estado = "RJ";

SELECT produto, categoria, valor_unitario AS Valor_unitario
FROM vendas
GROUP BY produto
HAVING valor_unitario > 500
ORDER BY valor_unitario
DESC;

SELECT cliente, valor_unitario FROM vendas
WHERE cliente = "Ana Souza";

SELECT produto, estado, categoria, valor_unitario AS valor_unitario
FROM vendas
WHERE categoria = "Vestuário" AND estado = "PR";

SELECT produto, categoria, estado, valor_unitario AS valor_unitario
FROM vendas
WHERE estado = "SP";

SELECT *, SUM(valor_unitario * quantidade) AS Valor_Vendido
FROM vendas
GROUP BY produto;

SELECT cliente, produto, quantidade, valor_unitario FROM vendas
WHERE quantidade > "1";




