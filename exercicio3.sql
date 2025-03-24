CREATE TABLE TbCidade 
(CdCidade INTEGER NOT NULL AUTO_INCREMENT,
NmCidade VARCHAR (50) NOT NULL,
PRIMARY KEY (CdCidade)
);

CREATE TABLE TbProprietario (
CdProp INTEGER NOT NULL AUTO_INCREMENT,
NmProp VARCHAR (100) NOT NULL,
CdCidade INTEGER NOT NULL,
PRIMARY KEY (CdProp),
FOREIGN KEY (CdCidade) REFERENCES TbCidade(CdCidade)
);

CREATE TABLE TbModelo (
CdModelo INTEGER NOT NULL AUTO_INCREMENT,
NmModelo VARCHAR (50),
VLIPVA DOUBLE,
PRIMARY KEY (CdModelo)
);

CREATE TABLE TbVeiculo (
CdVeiculo INTEGER NOT NULL AUTO_INCREMENT,
Placa VARCHAR (50) NOT NULL,
CdModelo INTEGER NOT NULL,
CdProp INTEGER NOT NULL,
PRIMARY KEY (CdVeiculo),
FOREIGN KEY (CdModelo) REFERENCES TbModelo(CdModelo),
FOREIGN KEY (CdProp) REFERENCES TbProprietario(CdProp)
);

CREATE TABLE TbTipoInfracao (
CdTipo INTEGER NOT NULL AUTO_INCREMENT,
Descricao VARCHAR (100) NOT NULL,
VlAtual DOUBLE,
Gravidade Char(1),
PRIMARY KEY (CdTipo)
);

CREATE TABLE TbMulta (
CdMulta INTEGER NOT NULL AUTO_INCREMENT,
CdVeiculo INTEGER NOT NULL,
CdTipo INTEGER NOT NULL,
CdCidadeMulta INTEGER NOT NULL,
VlMulta DOUBLE,
DtMulta DATE,
PRIMARY KEY (CdMulta),
FOREIGN KEY (CdVeiculo) REFERENCES TbVeiculo(CdVeiculo),
FOREIGN KEY (CdTipo) REFERENCES TbTipoInfracao(CdTipo),
FOREIGN KEY (CdCidadeMulta) REFERENCES TbCidade(CdCidade)
);

INSERT INTO TbCidade (CdCidade, NmCidade) VALUES (NULL, 'Ipatinga');
INSERT INTO TbCidade (CdCidade, NmCidade) VALUES (NULL, 'Cel. Fabriciano'), (NULL, 'Timóteo');
insert into TbCidade VALUES (NULL, 'São José  do Goiabal');
insert into TbCidade VALUES (NULL, 'Dionísio');

INSERT INTO TbProprietario (CdProp, NmProp, CdCidade) VALUES (NULL, 'Edvan', 2);
INSERT INTO TbProprietario (CdProp, NmProp, CdCidade) VALUES (NULL, 'Bernardo', 3);
INSERT INTO TbProprietario (CdProp, NmProp, CdCidade) VALUES (NULL, 'Mário',2),(NULL, 'Sávio',4);

INSERT INTO TbModelo (CdModelo, NmModelo, VLIPVA) VALUES (NULL, 'GOL', 650), (NULL, 'Fusca', 120), (NULL, 'Renault', 550), (NULL, 'Corolla', 1100), (NULL, 'Uno Mille', 470);

INSERT INTO TbVeiculo VALUES 
(NULL, 'GSA1020', 1, 1),
(NULL, 'DFR5409', 2, 2),
(NULL, 'PER9843', 1, 4),
(NULL, 'TRE6723', 3, 3),
(NULL, 'PJH0921', 4, 2),
(NULL, 'BNG8764', 5, 1);

INSERT into TbTipoInfracao VALUES
(NULL, 'Estacionamento em local proibido', 100, 'L'),
(NULL, 'Excesso de velocidade', 500, 'G'),
(NULL, 'Avanço de sinal vermelho', 800, 'G'),
(NULL, 'Dirigindo sem cinto de seguran a', 120, 'M');

INSERT into TbMulta VALUES
(NULL, 1, 1, 1, 90, '2019/12/27'),
(NULL, 2, 2, 3, 400, '2023/12/28'),
(NULL, 2, 3, 3, 600, '2023/12/28'),
(NULL, 4, 4, 2, 110, '2024/01/01'),
(NULL, 4, 1, 1, 100, '2024/01/15');

ALTER TABLE TbProprietario ADD DtNasc DATE;

ALTER TABLE TbVeiculo ADD Cor VARCHAR(20);

INSERT INTO TbProprietario (CdProp, Nmprop, CdCidade, DtNasc) VALUES (5, 'Vitor', 3, '1998/11/26');

INSERT INTO TbVeiculo (CdVeiculo, Placa, CdModelo, CdProp) VALUES ( 7, 'VRN6483', 4, 5);

UPDATE TbVeiculo SET Cor = 'Preto' WHERE CdProp = 5;

INSERT INTO TbMulta (CdMulta, CdVeiculo, CdTipo, CdCidadeMulta, VlMulta, DtMulta) VALUES (6, 7, 2, 1, 500, current_date); 

SELECT * FROM TbMulta;

DELETE FROM TbMulta WHERE CdMulta = 6;

SELECT V.Placa, P.NmProp FROM TbVeiculo V JOIN TbProprietario P ON V.CdProp = P.CdProp ORDER BY V.Placa;

SELECT  V.Placa, M.NmModelo FROM TbMulta Mu JOIN TbVeiculo V ON Mu.CdVeiculo = V.CdVeiculo JOIN TbModelo M ON V.CdModelo = M.CdModelo WHERE Mu.DtMulta BETWEEN '2024-01-01' AND '2024-01-31';

SELECT DISTINCT V.Placa FROM TbMulta Mu JOIN TbVeiculo V ON Mu.CdVeiculo = V.CdVeiculo JOIN TbTipoInfracao Ti ON Mu.CdTipo = Ti.CdTipo WHERE Ti.Gravidade = 'G';

SELECT V.Placa, M.NmModelo, P.NmProp, C.NmCidade FROM TbVeiculo V JOIN TbModelo M ON V.CdModelo = M.CdModelo JOIN TbProprietario P ON V.CdProp = P.CdProp JOIN TbCidade C ON P.CdCidade = C.CdCidade ORDER BY V.Placa;

SELECT MIN(Ti.VlAtual) AS MenorValor FROM TbTipoInfracao Ti WHERE Ti.Gravidade = 'G';

SELECT AVG(Ti.VlAtual) AS MediaValor FROM TbTipoInfracao Ti WHERE Ti.Gravidade = 'G';

SELECT COUNT(*) AS QtdVeiculos FROM TbVeiculo V JOIN TbProprietario P ON V.CdProp = P.CdProp WHERE P.NmProp = 'Edvan';

Select COUNT(*) as qtd FROM TbProprietario P, TbVeiculo V WHERE V.cdProp = P.cdProp AND NmProp = 'Edvan';

SELECT COUNT(*) AS QtdProprietarios FROM TbProprietario P JOIN TbCidade C ON P.CdCidade = C.CdCidade WHERE C.NmCidade = 'Cel. Fabriciano';

SELECT COUNT(*) AS QtdInfracoes FROM TbMulta Mu JOIN TbVeiculo V ON Mu.CdVeiculo = V.CdVeiculo WHERE V.Placa = 'DFR5409';

SELECT MAX(Mu.VlMulta) AS MaiorMulta FROM TbMulta Mu JOIN TbVeiculo V ON Mu.CdVeiculo = V.CdVeiculo JOIN TbProprietario P ON V.CdProp = P.CdProp WHERE P.NmProp = 'Bernardo';

SELECT SUM(Mu.VlMulta) AS TotalMultas FROM TbMulta Mu JOIN TbTipoInfracao Ti ON Mu.CdTipo = Ti.CdTipo JOIN TbCidade C ON Mu.CdCidadeMulta = C.CdCidade WHERE Ti.Gravidade = 'G' AND C.NmCidade = 'Timóteo';

#Exibir o nome do proprietário e sua respectiva quantidade de multas (Questão 14)

SELECT NmProp, COUNT(*) as qtd FROM TbProprietario P, TbVeiculo V WHERE V.cdProp = P.cdProp GROUP BY P.CdProp ORDER BY NmProp;

#Exibir o nome da cidade e a respectiva quantidade de proprietarios (Questão 15)

SELECT  NmCidade, COUNT(*) as qtd FROM TbCidade C, TbProprietario P WHERE C.CdCidade = P.CdCidade GROUP BY C.CdCidade ORDER BY NmCidade;

# Questão 18

SELECT SUM(VlMulta) as Total FROM TbCidade C, TbMulta M, TbTipoInfracao T WHERE CdCidade = CdCidadeMulta AND M.CdTipo = T.CdTipo AND NmCidade = 'Timóteo';

#Exibir o nome da cidade e seu total em multas

SELECT NmCidade, SUM(VlMulta) as Total FROM TbCidade C, TbMulta M, TbTipoInfracao T WHERE CdCidade = CdCidadeMulta AND M.CdTipo = T.CdTipo GROUP BY C.CdCidade;

