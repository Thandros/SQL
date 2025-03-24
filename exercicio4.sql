CREATE TABLE TbCidade 
(CdCidade INTEGER NOT NULL AUTO_INCREMENT,
NmCidade VARCHAR (50) NOT NULL,
PRIMARY KEY (CdCidade)
);

CREATE TABLE TbCurso 
(CdCurso INTEGER NOT NULL AUTO_INCREMENT,
NmCurso VARCHAR (50) NOT NULL,
PRIMARY KEY (CdCurso)
);

CREATE TABLE TbProfessor(
CdProfessor INTEGER NOT NULL AUTO_INCREMENT,
NmProfessor VARCHAR (100) NOT NULL,
Sexo CHAR,
CdCidadeReside INTEGER NOT NULL,
CdCidadeNasc INTEGER NOT NULL,
CdCurso INTEGER NOT NULL,
PRIMARY KEY (CdProfessor),
FOREIGN KEY (CdCidadeReside) REFERENCES TbCidade(CdCidade),
FOREIGN KEY (CdCidadeNasc) REFERENCES TbCidade(CdCidade),
FOREIGN KEY (CdCurso) REFERENCES TbCurso(CdCurso)
) ;

CREATE TABLE TbDisciplina (
CdDisciplina INTEGER NOT NULL AUTO_INCREMENT,
NmDisciplina VARCHAR (100) NOT NULL,
CargaHoraria INTEGER,
CdProfessor INTEGER NOT NULL,
CdCurso INTEGER NOT NULL,
PRIMARY KEY (CdDisciplina),
FOREIGN KEY (CdProfessor) REFERENCES TbProfessor(CdProfessor), 
FOREIGN KEY (CdCurso) REFERENCES TbCurso(CdCurso)
) ;

CREATE TABLE TbAluno(
CdAluno INTEGER NOT NULL AUTO_INCREMENT,
NmAluno VARCHAR (100) NOT NULL,
Sexo CHAR,
CdCidade INTEGER NOT NULL,
CdCurso INTEGER NOT NULL,
PRIMARY KEY (CdAluno),
FOREIGN KEY (CdCidade) REFERENCES TbCidade(CdCidade),
FOREIGN KEY (CdCurso) REFERENCES TbCurso(CdCurso)
) ;

CREATE TABLE TbNota (
CdAluno INTEGER NOT NULL,
CdDisciplina INTEGER NOT NULL,
Nota NUMERIC (10,2),
PRIMARY KEY (CdAluno, CdDisciplina),
FOREIGN KEY (CdAluno) REFERENCES TbAluno(CdAluno),
FOREIGN KEY (CdDisciplina) REFERENCES TbDisciplina(CdDisciplina)
) ;

INSERT INTO TbCidade (CdCidade, NmCidade) VALUES (NULL, 'Ipatinga');
INSERT INTO TbCidade (CdCidade, NmCidade) VALUES (NULL, 'Cel. Fabriciano'), (NULL, 'Timóteo');
INSERT INTO TbCidade VALUES (NULL, 'Santana do Paraíso');
INSERT INTO TbCidade VALUES (NULL, 'Viçosa');

INSERT INTO TbCurso (CdCurso, NmCurso) VALUES (NULL, 'Engenharia de Computação'), (NULL, 'Arquitetura'), (NULL, 'Engenharia de Metalúrgica'), (NULL, 'Engenharia Química');

INSERT INTO TbProfessor VALUES (NULL, 'João Batista', 'M', 3, 1, 1), (NULL, 'Marcelo', 'M', 3, 5, 1), (NULL, 'Guilherme', 'M', 3, 1, 1), (NULL, 'Claudio', 'M', 1, 2, 1), (NULL, 'Alisson', 'M', 3, 3, 2), (NULL, 'Evandro', 'M', 3, 1, 2), (NULL, 'Valmir', 'M', 1, 2, 3);

INSERT INTO TbDisciplina VALUES (NULL, 'Banco de Dados', 40, 2, 1), (NULL, 'Empreendedorismo', 40, 1, 1), (NULL, 'Linguagem de Programação', 100, 4, 1), (NULL, 'Engenharia de Software', 60, 2, 1), (NULL, 'Eletricidade e Eletrônica', 80, 3, 1), (NULL, 'Infra-estrutura Urbana', 80, 5, 2), (NULL, 'Saneamento Básico', 60, 6, 2), (NULL, 'Controle de qualidade', 80, 7, 3);

INSERT INTO TbAluno VALUES (NULL, 'José', 'M', 2, 1), (NULL, 'Maria', 'F', 1, 1), (NULL, 'Ricardo', 'M', 1, 1), (NULL, 'Pedro', 'M', 2, 2), (NULL, 'Carlos', 'M', 1, 2), (NULL, 'Teresa', 'F', 3, 3);

INSERT INTO TbNota VALUES (1, 1, 50), (1, 2, 75), (1, 3, 80), (1, 4, 55), (2, 1, 90), (2, 2, 95), (2, 3, 82), (2, 4, 88), (3, 1, 40), (3, 2, 35), (3, 3, 70), (3, 4, 70);

INSERT INTO TbNota (CdAluno, CdDisciplina, Nota)
VALUES (4, 6, 55), (4, 7, 80), (5, 6, 76), (5, 7, 90), (6, 8, 85);

# Questão 1

SELECT NmProfessor,COUNT(*) as qtd FROM TbDisciplina D, TbProfessor P WHERE D.CdProfessor = P.CdProfessor AND NmProfessor = 'Marcelo';

# Questão 2

SELECT NmAluno, MAX(Nota) as Maior FROM TbNota N, TbAluno A WHERE N.CdAluno = A.CdAluno AND NmAluno = 'José';

# Questão 3

SELECT NmCurso, COUNT(*) as qtd FROM TbCurso C, TbAluno A WHERE C.CdCurso = A.CdCurso AND NmCurso = 'Arquitetura';

# Questão 4

SELECT NmCurso, COUNT(*) as qtd FROM TbCurso C, TbAluno A, TbCidade Ci WHERE C.CdCurso = A.CdCurso AND Ci.CdCidade = A.CdCidade AND NmCurso = 'Engenharia de Computação' AND NmCidade = 'Ipatinga';

# Questão 5

SELECT NmProfessor, AVG(Nota) as Media FROM TbNota N, TbDisciplina D, TbProfessor P WHERE N.CdDisciplina = D.CdDisciplina AND D.CdProfessor = P.CdProfessor AND NmProfessor = 'Marcelo'; 

# Questão 6

SELECT NmProfessor, COUNT(*) as qtd FROM TbDisciplina D, TbProfessor P WHERE D.CdProfessor = P.CdProfessor GROUP BY NmProfessor;

# Questão 7

SELECT NmDisciplina, MAX(Nota) as Maior FROM TbDisciplina D, TbNota N WHERE D.CdDisciplina = N.CdDisciplina GROUP BY NmDisciplina;

# Questão 8

SELECT NmCurso, SUM(CargaHoraria) as Maior FROM TbDisciplina D, TbCurso C WHERE D.CdCurso = C.CdCurso GROUP BY NmCurso;

# Questão 9

SELECT Sexo, COUNT(*) as qtd FROM TbAluno GROUP BY Sexo;

# Questão 10

SELECT NmCurso, AVG(Nota) as Media FROM TbNota N, TbDisciplina D, TbCurso C WHERE N.CdDisciplina = D.CdDisciplina AND D.CdCurso = C.Cdcurso GROUP BY NmCurso;

# Questão 11

SELECT NmProfessor, MAX(Nota) as Maior FROM TbNota N, TbDisciplina D, TbProfessor P WHERE N.CdDisciplina = D.CdDisciplina AND D.CdProfessor = P.CdProfessor GROUP BY NmProfessor;

# Exibir a quantidade de disciplinas de cada professor. Mostrar somente professor com mais de uma disciplina

SELECT NmProfessor, COUNT(*) as qtd FROM TbDisciplina D, TbProfessor P WHERE D.CdProfessor = P.CdProfessor GROUP BY P.CdProfessor HAVING qtd > 1 ORDER BY NmProfessor;

# Exibir nome e média das notas de cada curso. Mostrar somente cursos com média maior que oitenta.

SELECT NmCurso, AVG(Nota) as Media FROM TbNota N, TbDisciplina D, TbCurso C WHERE N.CdDisciplina = D.CdDisciplina AND D.CdCurso = C.Cdcurso GROUP BY C.CdCurso HAVING Media > 80;

# Exibir nome dos professor que possuem alguma disciplina

SELECT distinct NmProfessor FROM TbProfessor P, TbDisciplina D WHERE D.CdProfessor = P.CdProfessor ORDER BY NmProfessor;

# Exibir os dados do professor João Batista

SELECT * FROM TbProfessor WHERE NmProfessor like '%a%';