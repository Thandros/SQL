CREATE TABLE TbCidade (
	CdCidade INTEGER NOT NULL AUTO_INCREMENT,
    NmCidade VARCHAR(50) NOT NULL,
    PRIMARY KEY (CdCidade));

	INSERT INTO TbCidade (CdCidade, NmCidade) 
	VALUES	(NULL, 'Timóteo'),
			(NULL, 'Coronel Fabriciano'),
			(NULL, 'Ipatinga');
    
CREATE TABLE TbAluno (
	CdAluno INTEGER NOT NULL AUTO_INCREMENT,
    NmAluno VARCHAR(100) NOT NULL,
    Sexo CHAR NOT NULL,
    CdCidade INTEGER NOT NULL,
    PRIMARY KEY (CdAluno),
    FOREIGN KEY (CdCidade) REFERENCES TbCidade (CdCidade));
    
    INSERT INTO TbAluno (CdAluno, NmAluno, Sexo, CdCidade)
    VALUES 	(1, 'José da Silva', 'M', 1),
			(2, 'Maria Clara', 'F', 1),
            (3, 'João Paulo', 'M', 3),
            (4, 'Helena', 'F', 2);
    
CREATE TABLE TbProfessor (
	CdProfessor INTEGER NOT NULL AUTO_INCREMENT,
    NmProfessor VARCHAR(100) NOT NULL,
    Sexo CHAR NOT NULL,
    CdCidade INTEGER NOT NULL,
    PRIMARY KEY (CdProfessor),
    FOREIGN KEY (CdCidade) REFERENCES TbCidade (CdCidade));
    
    INSERT INTO TbProfessor (CdProfessor, NmProfessor, Sexo, CdCidade)
    VALUES 	(1, 'Marcelo', 'M', 1),
			(2, 'Odilon', 'M', 2),
            (3, 'Lucas', 'M', 1),
            (4, 'Márcia', 'F', 1);

CREATE TABLE TbDisciplina (
	CdDisciplina INTEGER NOT NULL AUTO_INCREMENT,
    NmDisciplina VARCHAR(100) NOT NULL,
    CargaHoraria INTEGER NOT NULL,
    CdProfessor INTEGER NOT NULL,
    PRIMARY KEY (CdDisciplina),
    FOREIGN KEY (CdProfessor) REFERENCES TbProfessor (CdProfessor));
    
    INSERT INTO TbDisciplina (CdDisciplina, NmDisciplina, CargaHoraria, CdProfessor)
    VALUES 	(1, 'Banco de Dados', 60, 2),
			(2, 'Laboratório de Banco de Dados', 30, 1),
            (3, 'Fundamentos de Programação I', 30, 3),
            (4, 'Modelagem de Sistemas', 40, 4),
            (5, 'Programação Web', 60, 2);
    
CREATE TABLE TbNota (
	CdAluno INTEGER NOT NULL,
    CdDisciplina INTEGER NOT NULL,
    Nota NUMERIC (10,2),
    PRIMARY KEY(CdAluno, CdDisciplina),
    FOREIGN KEY (CdAluno) REFERENCES TbAluno (CdAluno), FOREIGN KEY (CdDisciplina) REFERENCES TbDisciplina (CdDisciplina));
    
    INSERT INTO TbNota (CdAluno, CdDisciplina, Nota)
    VALUES 	(1, 1, 70),
			(1, 2, 75),
            (1, 3, 80),
            (1, 4, 55),
            (2, 1, 90),
            (2, 2, 95),
            (2, 3, 88),
            (3, 1, 60),
            (3, 2, 65),
            (3, 3, 50),
            (3, 4, 78);
    
UPDATE TbAluno SET NmAluno = 'João Paulo Soares' WHERE CdAluno = 3;

DELETE FROM TbAluno WHERE cdAluno = 4;

ALTER TABLE TbAluno ADD DtNasc DATE;

UPDATE TbAluno SET DtNasc = '2000/01/10' WHERE CdAluno = 1;

SELECT CdDisciplina, NmDisciplina FROM TbDisciplina wHERE CargaHoraria > 40;

SELECT NmAluno FROM TbAluno WHERE sexo = 'F';

SELECT NmProfessor, NmCidade FROM TbProfessor, TbCidade WHERE TbProfessor.CdCidade = TbCidade.CdCidade ORDER BY NmProfessor;

SELECT NmDisciplina, NmProfessor FROM TbDisciplina, TbProfessor WHERE TbDisciplina.CdProfessor = TbProfessor.CdProfessor ORDER BY NmDisciplina;

SELECT NmAluno, Nota FROM TbAluno, TbNota WHERE TbAluno.CdAluno = TbNota.CdAluno AND CdDisciplina = 1 ORDER BY NmAluno;

SELECT NmDisciplina, Nota FROM TbDisciplina, TbNota WHERE TbDisciplina.CdDisciplina = TbNota.CdDisciplina AND CdAluno = 2 ORDER BY NmDisciplina;
    
    
    