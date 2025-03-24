CREATE TABLE TbCidade (
CdCidade INTEGER NOT NULL AUTO_INCREMENT,
NmCidade VARCHAR (100),
PRIMARY KEY (CdCidade)
)ENGINE = InnoDB;

CREATE TABLE TbCliente (
CdCliente INTEGER NOT NULL AUTO_INCREMENT,
NmCliente VARCHAR (100) NOT NULL,
CdCidade INTEGER NOT NULL,
PRIMARY KEY (CdCliente),
FOREIGN KEY (CdCidade) REFERENCES TbCidade(CdCidade)
) ENGINE = InnoDB;

CREATE TABLE TbCategoria (
CdCategoria INTEGER NOT NULL AUTO_INCREMENT,
NmCategoria VARCHAR (100) NOT NULL,
PRIMARY KEY (CdCategoria)
) ENGINE = InnoDB;

CREATE TABLE TbProduto (
CdProduto INTEGER NOT NULL AUTO_INCREMENT,
NmProduto VARCHAR (100) NOT NULL,
Marca VARCHAR (50) NOT NULL,
CdCategoria INTEGER NOT NULL,
PRIMARY KEY (CdProduto),
FOREIGN KEY (CdCategoria) REFERENCES TbCategoria(CdCategoria)
) ENGINE = InnoDB;

CREATE TABLE TbVenda (
CdVenda INTEGER NOT NULL AUTO_INCREMENT,
CdCliente INTEGER NOT NULL, 
DataVenda DATE NOT NULL, 
PrecoTotal NUMERIC (10,2) NOT NULL,
PRIMARY KEY (CdVenda),
FOREIGN KEY (CdCliente) REFERENCES TbCliente (CdCliente)
) ENGINE = InnoDB;

CREATE TABLE TbProdutoVenda (
CdVenda INTEGER NOT NULL,
CdProduto INTEGER NOT NULL, 
Qtd INTEGER, 
PrecoUnitario NUMERIC (10,2) NOT NULL,
PRIMARY KEY (CdVenda, CdProduto),
FOREIGN KEY (CdVenda) REFERENCES TbVenda (CdVenda),
FOREIGN KEY (CdProduto) REFERENCES TbProduto (CdProduto)
) ENGINE = InnoDB;

CREATE TABLE TbParcelaPagamento (
  CdParcelaPagamento INTEGER NOT NULL AUTO_INCREMENT,
  ValorParcela NUMERIC(10,2) NULL,
  DtVencimento DATE NULL,
  Situacao CHAR NULL,
  CdVenda INTEGER NOT NULL,
  PRIMARY KEY(CdParcelaPagamento),
  FOREIGN KEY (CdVenda) REFERENCES TbVenda (CdVenda)
) ENGINE = InnoDB;

CREATE TABLE TbServico (
CdServico INTEGER NOT NULL AUTO_INCREMENT,
NmServico VARCHAR (100) NOT NULL,
PRIMARY KEY (CdServico)
) ENGINE = InnoDB;

INSERT INTO TbCidade VALUES 
(NULL, 'Ipatinga'),
(NULL, 'Cel Fabriciano'),
(NULL, 'Timóteo');

INSERT INTO TbCliente VALUES 
(NULL, 'Carlos Batista', 1),
(NULL, 'Ana Maria Braga', 2),
(NULL, 'Bruno Cesar', 3),
(NULL, 'João Pereira', 2),
(NULL, 'Elisangela da Silva', 1);

INSERT INTO TbCategoria VALUES
(NULL, 'Alimentos'),
(NULL, 'Limpeza'),
(NULL, 'Higiene Pessoal');

INSERT INTO TbProduto VALUES
(NULL, 'Biscoito', 'Nestle', 1),
(NULL, 'Arroz', 'Tio João', 1),
(NULL, 'Leite', 'Itambé', 1),
(NULL, 'Detergente', 'Limpol', 2),
(NULL, 'Sabão em Pó', 'Omo', 2),
(NULL, 'Creme Dental', 'Colgate', 3),
(NULL, 'Sabonete', 'Lux', 3);

INSERT INTO `tbvenda` (`CdVenda`, `CdCliente`, `DataVenda`, `PrecoTotal`) VALUES
(NULL, 5, '2015-01-27', 30),
(NULL, 3, '2015-01-28', 3.50),
(NULL, 1, '2015-01-28', 14.0),
(NULL, 1, '2015-01-31', 9.0),
(NULL, 1, '2015-02-01', 2.5),
(NULL, 2, '2015-02-01', 17.0),
(NULL, 2, '2015-02-03', 11.0);

INSERT INTO TbProdutoVenda (CdVenda, CdProduto, Qtd, PrecoUnitario) VALUES
(1, 2, 2, 10.5),
(1, 7, 3, 3.0),
(2, 1, 1, 3.5),
(3, 1, 1, 3.5),
(3, 2, 1, 10.5),
(4, 3, 2, 2.0),
(4, 4, 2, 2.5), 
(5, 4, 1, 2.5), 
(6, 1, 1, 4.0),
(6, 2, 1, 11.0),
(6, 3, 1, 2.0),
(7, 2, 1, 11.0);

INSERT INTO TbServico VALUES
(NULL, 'Entrega domicílio'),
(NULL, 'Consultoria comercial');

INSERT INTO tbparcelapagamento values 
(NULL, 10, '2015-01-27', 'P', 1), 
(NULL, 10, '2015-02-27', 'P', 1), 
(NULL, 10, '2015-03-27', 'P', 1), 
(NULL, 3.50, '2015-01-28', 'P', 2) , 
(NULL, 7.0, '2015-01-28', 'P', 3), 
(NULL, 7.0, '2015-02-28', 'N', 3),
(NULL, 9.0, '2015-01-31', 'N', 4), 
(NULL, 2.5, '2015-02-01', 'P', 5), 
(NULL, 8.5, '2015-02-01', 'N', 6), 
(NULL, 8.5, '2015-03-01', 'N', 6), 
(NULL, 17.0, '2015-02-03', 'P', 7);

# Questão 2

SELECT P.NmProduto, C.NmCategoria FROM TbProduto P, TbCategoria C WHERE P.CdCategoria = C.CdCategoria AND P.NmProduto LIKE 'Sab%' ORDER BY P.NmProduto;

# Questão 3

SELECT DISTINCT V.CdVenda, V.DataVenda, C.NmCliente FROM TbVenda V, TbCliente C, TbParcelaPagamento PP WHERE V.CdCliente = C.CdCliente AND V.CdVenda = PP.CdVenda AND PP.Situacao = 'N';

# Questão 4

SELECT DISTINCT P.CdProduto, P.NmProduto FROM TbProduto P, TbProdutoVenda PV, TbVenda V, TbCliente C WHERE P.CdProduto = PV.CdProduto AND PV.CdVenda = V.CdVenda AND V.CdCliente = C.CdCliente AND C.NmCliente = 'Carlos Batista' ORDER BY P.NmProduto;

# Questão 5

SELECT C.NmCategoria, COUNT(P.CdProduto) AS Quantidade FROM TbProduto P, TbCategoria C WHERE P.CdCategoria = C.CdCategoria GROUP BY C.NmCategoria HAVING COUNT(P.CdProduto) >= 3;

# Questão 6

SELECT P.NmProduto, SUM(PV.Qtd * PV.PrecoUnitario) AS TotalVendido FROM TbProduto P, TbProdutoVenda PV WHERE P.CdProduto = PV.CdProduto GROUP BY P.NmProduto HAVING SUM(PV.Qtd * PV.PrecoUnitario) > 10;

INSERT INTO TbCidade VALUES (4, 'Santana do Paraíso');

# UNION

SELECT NmProduto as Nome, Marca, 'Produto' as Tipo FROM Tbproduto
UNION 
SELECT NmServico as Nome, '' as Marca, 'Serviço' as Tipo FROM TbServico ORDER BY Nome;

# LEFT JOIN

SELECT NmCidade, NmCliente FROM TbCidade Ci LEFT JOIN TbCliente Cl ON Ci.CdCidade = Cl.CdCidade ORDER BY NmCidade;