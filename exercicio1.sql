CREATE TABLE TbCliente (
	cdCliente INTEGER NOT NULL,
    nmCliente VARCHAR(100) NOT NULL,
    dtNascimento DATE, 
    PRIMARY KEY (cdCliente));

CREATE TABLE TbAnimal (
	cdAnimal INTEGER NOT NULL,
    nmAnimal VARCHAR(50) NOT NULL,
    dtNasc DATE,
    cdCliente INTEGER NOT NULL,
    cdTipoAnimal INTEGER NOT NULL,
    PRIMARY KEY (cdAnimal),
    FOREIGN KEY (cdCliente) REFERENCES TbCliente (cdCliente));
    
CREATE TABLE TbTipoAnimal (
	cdTipoAnimal INTEGER NOT NULL,
    nmTipoAnimal VARCHAR(100),
    PRIMARY KEY (cdTipoAnimal));

CREATE TABLE TbAtendimento (
	cdAtendimento INTEGER NOT NULL,
    dtAtendimento DATE,
    descricao VARCHAR(200),
    cdAnimal INTEGER NOT NULL,
    PRIMARY KEY (cdAtendimento),
    FOREIGN KEY (cdAnimal) REFERENCES tbAnimal (cdAnimal));

INSERT INTO TbCliente (cdCliente, nmCliente, dtNascimento)
	VALUES 	(1, 'Roberto Carlos', '1941-04-19'),
			(2, 'Michael Jackson', '1958-08-29'),
            (3, 'Adele', '1988-05-05');

INSERT INTO TbTipoAnimal (cdTipoAnimal, nmTipoAnimal)
	VALUES 	(1, 'Cachorro'),
			(2, 'Gato'),
            (3, 'Peixe');
            
INSERT INTO TbAnimal (cdAnimal, nmAnimal, dtNasc, cdCliente, cdTipoAnimal)
	VALUES 	(1, 'Erasmo', '2010-01-01', 1,2),
			(2, 'Billie', '2009-05-10', 2,1),
            (3, 'Jean', '2011-10-01', 2,1),
            (4, 'Hello', '2020-04-30', 3,1);

INSERT INTO TbAtendimento (cdAtendimento, dtAtendimento, descricao, cdAnimal)
	VALUES 	(1, '2020-02-20', 'Ferimento na pata', 3),
			(2, '2020-03-10', 'Banho', 2),
            (3, '2020-04-12', 'Vacinação',1),
            (4, '2021-10-03', 'Vacinação',2);
            
ALTER TABLE TbCliente ADD endereco VARCHAR(200);

INSERT INTO TbCliente (cdCliente, nmCliente, dtNascimento)
	VALUES 	(4, 'Ester Magalhães', '1999-04-19'),
			(5, 'Vitor Nascimento', '1998-11-26');

ALTER TABLE TbCliente DROP dtNascimento;

INSERT INTO TbTipoAnimal (cdTipoAnimal, nmTipoAnimal)
	VALUES 	(4, 'Tigre'),
			(5, 'Leão');

INSERT INTO TbAnimal (cdAnimal, nmAnimal, dtNasc, cdCliente, cdTipoAnimal)
	VALUES 	(5, 'Tai Lung', '2010-01-01', 4,4),
			(6, 'Scar', '2009-05-10', 5,5);

INSERT INTO TbAtendimento (cdAtendimento, dtAtendimento, descricao, cdAnimal)
	VALUES 	(5, '2024-11-20', 'Queimadura', 5),
			(6, '2024-07-10', 'Fratura', 6);


UPDATE TbAnimal SET nmAnimal = 'Erasmo Carlos' WHERE cdAnimal = 1;

UPDATE TbAtendimento SET descricao = 'Vacinação contra viroses' WHERE cdAtendimento = '4';	

DELETE FROM TbTipoAnimal WHERE cdTipoAnimal = 3;	

DELETE FROM TbAnimal WHERE cdAnimal = 4;

DELETE FROM TbAnimal WHERE cdAnimal = 2;

DELETE FROM TbAtendimento WHERE cdAnimal = 2;

DELETE FROM TbAnimal WHERE cdAnimal = 2;


            
    
