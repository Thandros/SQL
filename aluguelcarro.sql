CREATE TABLE TbCliente (
	codCliente INTEGER NOT NULL,
    nome VARCHAR(100) NOT NULL,
    CPF CHAR(11) NOT NULL,
    dataNascimento DATE, 
    PRIMARY KEY (codCliente));

CREATE TABLE TbCarro (
	codCarro INTEGER NOT NULL,
    placa CHAR(8),
    descricao VARCHAR(50) NOT NULL,
    quilometragem INTEGER NOT NULL,
    PRIMARY KEY (codCarro));
    
CREATE TABLE TbAluguel (
	codCliente INTEGER NOT NULL,
    codCarro INTEGER NOT NULL,
	dataRetirada DATE NOT NULL,
    dataDevolucao DATE,
    valorPago NUMERIC(7,2),
    distancia NUMERIC(7,2),
    PRIMARY KEY (codCliente, codCarro, dataRetirada),
    FOREIGN KEY (CodCliente) REFERENCES TbCliente(CodCliente),
    FOREIGN KEY (codCarro) REFERENCES TbCarro(codCarro));
    
INSERT INTO TbCliente (codCliente, nome, CPF, dataNascimento)
	VALUES 	(1, 'Ana Clara', '11111111111', '1980-01-09'),
			(2, 'Jose Felipe', '22222222222', '1990-01-10'),
			(3, 'Maria Alice', '33333333333', '1985-03-01'),
			(4, 'Pedro Paulo', '44444444444', '1989-10-02');

INSERT INTO TbCarro (codCarro, placa, descricao, quilometragem)
	VALUES 	(1, 'GOW 1231', 'Kwid-Renault' , '59884'),
			(2, 'ABC 8932', 'Strada-Fiat' , '21321'),
			(3, 'XYZ 7432', 'Corolla-Toyota' , '10000');
            
INSERT INTO TbAluguel (codCliente, codCarro, dataRetirada, dataDevolucao, valorPago, distancia)
	Values 	(1, 2, '2024-10-10', '2024-10-15', 500, 1300),
			(2, 3, '2024-10-11', '2024-10-13', 200, 300),
			(4, 2, '2024-11-01', '2024-11-02', 150, 600),
			(3, 1, '2024-11-01', '2024-11-02', 150, 300),
			(1, 3, '2024-11-20', NULL, NULL, NULL),
			(2, 1, '2024-11-25', NULL, NULL, NULL);

UPDATE TbCliente SET nome = 'Gabigol' WHERE codCliente = 4;

DELETE FROM TbCliente WHERE codCliente = 4;
	
	