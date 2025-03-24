-- -----------------------------------------------------

-- Table TbPessoa

-- -----------------------------------------------------

CREATE TABLE TbPessoa (
  CdPessoa INT NOT NULL AUTO_INCREMENT,
  NmPessoa VARCHAR(45) NOT NULL ,
  Sexo char(1) NOT NULL ,
  PRIMARY KEY (CdPessoa));

-- -----------------------------------------------------

-- Table TbTipoDespesa

-- -----------------------------------------------------

CREATE TABLE TbTipoDespesa (
  CdTipoDespesa INT NOT NULL AUTO_INCREMENT,
  NmTipoDespesa VARCHAR(45) NOT NULL ,
  PRIMARY KEY (CdTipoDespesa))
;

INSERT INTO TbPessoa VALUES (NULL,'José Alves','M'),
(NULL,'Maria Alves','F'),
(NULL,'Silvia Alves','F'),
(NULL,'Júlio Alves','M'), 
(NULL,'Paulo Henrique Alves','M');

INSERT INTO Tbtipodespesa VALUES 
(NULL,'Supermercado'),
(NULL,'Plano de saúde'),
(NULL,'Pagamento de aluguel'),
(NULL,'Farmácia'),
(NULL,'Salão de Beleza');

CREATE TABLE TbDespesa (

	CdDespesa INTEGER NOT NULL, 
    DtDespesa DATE NOT NULL,
    Valor NUMERIC (7,2) NOT NULL,
    CdPessoa INTEGER NOT NULL,
    CdTipoDespesa INTEGER NOT NULL,
    PRIMARY KEY (CdDespesa),
    FOREIGN KEY (CdPessoa) REFERENCES TbPessoa(CdPessoa),
    FOREIGN KEY (CdTipoDespesa) REFERENCES TbTipoDespesa (CdTipoDespesa));
    
ALTER TABLE TbPessoa ADD DtNasc DATE;

INSERT INTO TbDespesa (CdDespesa, DtDespesa, Valor, CdPessoa, CdTipoDespesa) 
	VALUES (1, '2025/01/09', 300, 1, 1);

INSERT INTO TbDespesa VALUES (2, current_date, 500, 1, 3); 

SELECT * FROM TbDespesa;

UPDATE TbPessoa SET DtNasc = '1980/05/15' WHERE CdPessoa = 1;

SELECT * FROM TbPessoa;

DELETE FROM TbPessoa WHERE CdPessoa = 5;

#Exibir o nome da pessoa, data e valor da despesa entre 1 e 10 de Janeiro de 2025
SELECT NmPessoa, DtDespesa, Valor FROM TbPessoa P, TbDespesa D WHERE P.CdPessoa = D.CdPessoa AND DtDespesa >= '2025/01/01' AND DtDespesa <= '2025/01/10';
SELECT NmPessoa, DtDespesa, Valor FROM TbPessoa P, TbDespesa D WHERE P.CdPessoa = D.CdPessoa AND DtDespesa BETWEEN '2025/01/01' AND '2025/01/10';
SELECT NmPessoa, DtDespesa, Valor FROM TbPessoa P INNER JOIN TbDespesa D ON P.CdPessoa = D.CdPessoa WHERE DtDespesa >= '2025/01/01' AND DtDespesa <= '2025/01/10';

#Exibir o nome da pessoa, a data, o valor e o nome do tipo da despesa
SELECT NmPessoa, DtDespesa, Valor, NmTipoDespesa FROM TbPessoa P, TbDespesa D, TbTipoDespesa T
WHERE P.CdPessoa = D.CdPessoa AND D.CdTipoDespesa = T.CdTipoDespesa;

SELECT NmPessoa, DtDespesa, Valor, NmTipoDespesa FROM TbPessoa P INNER JOIN TbDespesa D ON P.CdPessoa = D.CdPessoa
INNER JOIN TbTipoDespesa T ON D.CdTipoDespesa = T.CdTipoDespesa ORDER BY DtDespesa;

