CREATE TABLE TbCidade (
	CdCidade INTEGER NOT NULL AUTO_INCREMENT,
    NmCidade VARCHAR(50) NOT NULL,
    PRIMARY KEY (CdCidade));
    
INSERT INTO TbCidade (CdCidade, NmCidade) VALUES (NULL, 'Timóteo');
INSERT INTO TbCidade VALUES (NULL, 'Coronel Fabriciano');
INSERT INTO TbCidade (NmCidade) VALUES ('Ipatinga');

CREATE TABLE TbCurso (
	CdCurso INTEGER NOT NULL AUTO_INCREMENT,
    NmCurso VARCHAR(50) NOT NULL,
    PRIMARY KEY (cdCurso));

INSERT INTO TbCurso (NmCurso) 
VALUES 	('Engenharia de Computação'), 
		('Engenharia Metalúrgica'), 
        ('Arquitetura');

CREATE TABLE TbAluno (
	CdAluno INTEGER NOT NULL AUTO_INCREMENT,
    NmAluno VARCHAR(50) NOT NULL,
    DtNasc DATE,
    Sexo CHAR(1) NOT NULL,
    CdCidade INTEGER NOT NULL,
    CdCurso INTEGER NOT NULL,
    PRIMARY KEY (CdAluno),
    FOREIGN KEY (CdCidade) REFERENCES TbCidade(CdCidade),
    FOREIGN KEY (CdCurso) REFERENCES TbCurso(CdCurso));

INSERT INTO TbAluno (NmAluno, DtNasc, Sexo, CdCidade, CdCurso) 
VALUES 	('José', '2001/10/15', 'M', 3, 1);

INSERT INTO TbAluno (NmAluno, Sexo, CdCidade, CdCurso) 
VALUES 	('Maria', 'F', 1, 3);

INSERT INTO TbAluno (NmAluno, Sexo, CdCidade, CdCurso) 
VALUES 	('Paulo', 'M', 2, 2);

#Listar nome e data de nascimento dos alunos do sexo masculino

SELECT NmAluno, DtNasc FROM TbAluno WHERE Sexo = 'M';

#Exibir todos os dados dos alunos do curso 1

SELECT * FROM TbAluno WHERE CdCurso = 1;

INSERT INTO TbAluno (NmAluno, Sexo, CdCidade, CdCurso) 
VALUES 	('Roberta', 'F', 1, 1);

#Listar as alunas do sexo feminino e do curso 1

Select * FROM TbAluno Where Sexo = 'F' AND CdCurso = 1;

#Exibir nome do aluno, sexo e da sua respectiva cidade dos alunos do sexo masculino

SELECT NmAluno, Sexo, NmCidade FROM TbAluno, TbCidade WHERE TbAluno.CdCidade = TbCidade.CdCidade AND Sexo = 'M';

SELECT NmAluno, Sexo, NmCidade FROM TbAluno INNER JOIN TbCidade ON TbAluno.CdCidade = TbCidade.CdCidade WHERE Sexo = 'M';

#Exibir o nome do aluno e seu respectivo curso

SELECT NmAluno, NmCurso FROM TbAluno, TbCurso WHERE TbAluno.CdCurso = TbCurso.CdCurso ORDER BY NmCurso;

SELECT NmAluno, NmCurso FROM TbAluno INNER JOIN TbCurso ON TbAluno.CdCurso = TbCurso.CdCurso;

SELECT NmAluno, NmCurso FROM TbAluno A, TbCurso C WHERE A.CdCurso = C.CdCurso ORDER BY NmCurso DESC;
