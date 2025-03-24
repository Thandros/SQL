SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `TbMarca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbMarca` (
  `CdMarca` INT(11) NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `História` LONGTEXT NOT NULL,
  PRIMARY KEY (`CdMarca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TbModelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbModelo` (
  `CdModelo` INT(11) NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Cor` VARCHAR(45) NOT NULL,
  `CdMarca` INT(11) NOT NULL,
  PRIMARY KEY (`CdModelo`),
  CONSTRAINT `fk_TbModelo_TbMarca1`
    FOREIGN KEY (`CdMarca`)
    REFERENCES `TbMarca` (`CdMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TbGenero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbGenero` (
  `CdGenero` INT(11) NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Caracteristicas` LONGTEXT NOT NULL,
  PRIMARY KEY (`CdGenero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TbGuitarra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbGuitarra` (
  `CdGuitarra` INT(11) NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Preço` DECIMAL(10,3) NOT NULL,
  `Estoque` INT NOT NULL,
  `CdMarca` INT(11) NOT NULL,
  `CdModelo` INT(11) NOT NULL,
  `CdGenero` INT(11) NOT NULL,
  PRIMARY KEY (`CdGuitarra`),
  CONSTRAINT `fk_TbGuitarra_TbMarca1`
    FOREIGN KEY (`CdMarca`)
    REFERENCES `TbMarca` (`CdMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TbGuitarra_TbModelo1`
    FOREIGN KEY (`CdModelo`)
    REFERENCES `TbModelo` (`CdModelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TbGuitarra_TbGenero1`
    FOREIGN KEY (`CdGenero`)
    REFERENCES `TbGenero` (`CdGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TbCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbCliente` (
  `CdCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`CdCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TbVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbVenda` (
  `CdVenda` INT(11) NOT NULL AUTO_INCREMENT,
  `DtVenda` DATE NOT NULL,
  `Quantidade` INT NOT NULL,
  `PreçoTotal` DECIMAL(10,3) NOT NULL,
  `FormaPagamento` VARCHAR(45) NOT NULL,
  `CdGuitarra` INT(11) NOT NULL,
  `CdCliente` INT(11) NOT NULL,
  PRIMARY KEY (`CdVenda`),
  CONSTRAINT `fk_TbVenda_TbGuitarra1`
    FOREIGN KEY (`CdGuitarra`)
    REFERENCES `TbGuitarra` (`CdGuitarra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TbVenda_TbCliente1`
    FOREIGN KEY (`CdCliente`)
    REFERENCES `TbCliente` (`CdCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `TbFornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbFornecedor` (
  `CdFornecedor` INT(11) NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Contato` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`CdFornecedor`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `TbEstoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbEstoque` (
  `CdEstoque` INT(11) NOT NULL AUTO_INCREMENT,
  `DtEntrada` DATE NOT NULL,
  `Quantidade` INT NOT NULL,
  `CdGuitarra` INT(11) NOT NULL,
  `CdFornecedor` INT(11) NOT NULL,
  PRIMARY KEY (`CdEstoque`),
  CONSTRAINT `fk_TbEstoque_TbGuitarra`
    FOREIGN KEY (`CdGuitarra`)
    REFERENCES `TbGuitarra` (`CdGuitarra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TbEstoque_TbFornecedor1`
    FOREIGN KEY (`CdFornecedor`)
    REFERENCES `TbFornecedor` (`CdFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TbFuncionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TbFuncionario` (
  `CdFuncionario` INT(11) NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Cargo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CdFuncionario`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO TbMarca (Nome, História) VALUES ('Jackson', ' Fundada nos anos 1980 por Grover Jackson, ficou popular entre guitarristas de metal, especialmente do thrash, devido a seus designs agressivos e som poderoso');
INSERT INTO TbMarca (Nome, História) VALUES ('ESP', 'Criada no Japão em 1975, a ESP se tornou famosa entre músicos de heavy metal e hard rock por suas guitarras personalizadas e agressivas.');
INSERT INTO TbMarca (Nome, História) VALUES ('Fender', 'Criada por Leo Fender em 1946, a Fender revolucionou a música com a Telecaster (1950) e a Stratocaster (1954), sendo amplamente adotada por guitarristas de diversos estilos.');
INSERT INTO TbMarca (Nome, História) VALUES ('Gibson', 'Fundada em 1902 por Orville Gibson, a Gibson é uma das marcas mais icônicas da história da guitarra elétrica. Em 1952, lançaram a Les Paul, um dos modelos mais famosos do mundo.');
INSERT INTO TbMarca (Nome, História) VALUES ('Ibanez', 'Marca japonesa fundada nos anos 1900, se destacou nos anos 1980 ao criar guitarras rápidas e versáteis para o rock e o metal. Popular entre guitarristas técnicos.');
INSERT INTO TbMarca (Nome, História) VALUES ('PRS', 'Fundada em 1985 por Paul Reed Smith, a PRS se tornou conhecida pela qualidade artesanal, acabamento impecável e timbre equilibrado.');
INSERT INTO TbMarca (Nome, História) VALUES ('Gretsch', 'Fundada em 1883 nos EUA, a Gretsch é famosa por suas guitarras semiacústicas utilizadas no rockabilly, jazz e blues.');
INSERT INTO TbMarca (Nome, História) VALUES ('Rickenbacker', 'Criada em 1931, a Rickenbacker foi pioneira na fabricação de guitarras elétricas e se tornou um símbolo do rock dos anos 1960.');

INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (1, 'Soloist', 'Preta');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (1, 'King V', 'Vermelha');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (1, 'Rhoads', 'Branca');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (1, 'Kelly', 'Cinza');
	
SELECT Nome as Modelos FROM TbModelo WHERE CdMarca = 1;

INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (2, 'Eclipse', 'Preta');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (2, 'M-Series', 'Vermelha');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (2, 'Viper', 'Branca');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (2, 'Horizon', 'Cinza');

SELECT Nome as Modelos FROM TbModelo WHERE CdMarca = 2;

INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (3, 'Stratocaster', 'Preta');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (3, 'Telecaster', 'Verde');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (3, 'Jaguar', 'Rosa');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (3, 'Jazzmaster', 'Amarela');

SELECT Nome as Modelos FROM TbModelo WHERE CdMarca = 3;

INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (4, 'Les Paul', 'Preta');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (4, 'SG', 'Vermelha');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (4, 'Flying V', 'Branca');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (4, 'Explorer', 'Cinza');

SELECT Nome as Modelos FROM TbModelo WHERE CdMarca = 4;

INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (5, 'RG', 'Verde');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (5, 'JEM (Steve Vai)', 'Prata');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (5, 'Santana Signature', 'Rosa');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (5, 'SE Signature', 'Laranja');

SELECT Nome as Modelos FROM TbModelo WHERE CdMarca = 5;

INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (6, 'Custom 24', 'Rosa');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (6, 'McCarty', 'Dourado');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (6, 'Santana Signature', 'Azul');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (6, 'Explorer', 'Roxo');

SELECT Nome as Modelos FROM TbModelo WHERE CdMarca = 6;

INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (7, 'White Falcon', 'Rosa');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (7, 'Duo Jet', 'Laranja');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (7, 'Country Gentleman', 'Azul');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (7, 'Nashville', 'Verde');

SELECT Nome as Modelos FROM TbModelo WHERE CdMarca = 7;

INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (8, '330', 'Preta');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (8, '360', 'Vermelha');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (8, '325', 'Branca');
INSERT INTO TbModelo (CdMarca, Nome, Cor) VALUES (8, '350', 'Cinza');

SELECT Nome as Modelos FROM TbModelo WHERE CdMarca = 8;

INSERT INTO TbGenero (Nome, Caracteristicas) VALUES ('Rock','Ritmos fortes, guitarras distorcidas, letras com temas de rebeldia, liberdade e amor.');
INSERT INTO TbGenero (Nome, Caracteristicas) VALUES ('Pop','Melodias cativantes, letras sobre amor, relacionamentos e temas cotidianos, arranjos melódicos e produção impecável.');
INSERT INTO TbGenero (Nome, Caracteristicas) VALUES ('Indie','Estilo independente, experimental, letras introspectivas, sonoridade crua e autêntica.');
INSERT INTO TbGenero (Nome, Caracteristicas) VALUES ('Rockabilly','Ritmos acelerados, guitarras com som "twang", letras sobre temas simples e divertidos.');
INSERT INTO TbGenero (Nome, Caracteristicas) VALUES ('Blues','Música com melodias melancólicas, letras sobre temas de sofrimento, amor e vida.');
INSERT INTO TbGenero (Nome, Caracteristicas) VALUES ('Jazz','Estilo improvisacional, melodias complexas, harmonias sofisticadas, ritmo sincopado.');
INSERT INTO TbGenero (Nome, Caracteristicas) VALUES ('Country','Música com melodias simples e harmonias folk, letras sobre temas rurais, amor e vida.');
INSERT INTO TbGenero (Nome, Caracteristicas) VALUES ('Metal','Ritmos pesados, guitarras distorcidas, letras com temas de fantasia, horror e rebeldia.');
INSERT INTO TbGenero (Nome, Caracteristicas) VALUES ('Thrash','Estilo agressivo e veloz, guitarras com riffs complexos, letras sobre temas sociais e políticos.');
INSERT INTO TbGenero (Nome, Caracteristicas) VALUES ('Death Metal','Estilo extremo, guitarras com riffs brutais, vocais guturais, letras sobre temas obscuros e mórbidos.');
INSERT INTO TbGenero (Nome, Caracteristicas) VALUES ('Heavy Metal','Estilo poderoso, guitarras com riffs épicos, letras sobre temas de fantasia, mitologia e rebeldia.');
INSERT INTO TbGenero (Nome, Caracteristicas) VALUES ('Hard Rock','Estilo energético, guitarras distorcidas, letras sobre temas de amor, liberdade e rebeldia.');
INSERT INTO TbGenero (Nome, Caracteristicas) VALUES ('Prog Rock','Estilo complexo, com longas composições, melodias elaboradas, improvisações instrumentais e letras com temas filosóficos e literários.');
INSERT INTO TbGenero (Nome, Caracteristicas) VALUES ('Rock Progressivo','Estilo experimental, com composições longas, melodias complexas, improvisações instrumentais e letras com temas sociais, políticos e filosóficos.');
INSERT INTO TbGenero (Nome, Caracteristicas) VALUES ('Fusion','Estilo que mistura elementos do jazz com outros gêneros, como rock, funk e soul.');


# JACKSON

INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('American Series SL2MG', 20.000, 5, 1, 1, 11);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('X Series', 7.000, 5, 1, 2, 9);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('MJ Series RR24MG', 16.000, 5, 1, 3, 11);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('USA Select KE2', 35.000, 5, 1, 4, 12);

# ESP

INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('E-II', 15.000, 7, 2, 5, 12);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('MH-1000', 10.000, 10, 2, 6, 11);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('LTD Viper', 5.500, 15, 2, 7, 12);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('CTM FR', 17.000, 12, 2, 8, 11);

# Fender

INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('Stratocaster', 30.000, 2, 3, 9, 2);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('Telecaster', 22.000, 3, 3, 10, 1);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('Jaguar', 85.000, 1, 3, 11, 3);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('Jazzmaster', 20.000, 5, 3, 12, 1);

# Gibson

INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('Les Paul', 45.000, 5, 4, 13, 5);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('SG Standard', 25.000, 9, 4, 14, 1);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('Flying V', 100.000, 1, 4, 15, 11);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('Explorer', 50.000, 1, 4, 16, 11);

# Ibanez

INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('RG8870', 19.400, 6, 5, 17, 9);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('JEM77', 27.700, 2, 5, 18, 14);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('Santana Signature', 60.000, 1, 5, 19, 5);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('GB10SE BS', 8.000, 8, 5, 20, 12);

# PRS

INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('SE CUSTOM24', 25.400, 5, 6, 21, 1);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('SE MCCARTY 594', 33.000, 2, 6, 22, 6);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('SE SANTANA', 27.000, 4, 6, 23, 5);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('SE EXPLORER', 12.000, 7, 6, 24, 2);

# Gretsch

INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('G6136TG', 19.600, 11, 7, 25, 4);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('G6128T-59', 20.200, 9, 7, 26, 3);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('G6122T', 62.400, 1, 7, 27, 7);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('G6120TG', 16.700, 7, 7, 28, 7);

# Rickenbacker

INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('330/12', 18.000, 4, 8, 29, 1);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('360CW', 23.900, 2, 8, 30, 3);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('326C64', 28.170, 5, 8, 31, 5);
INSERT INTO TbGuitarra (Nome, Preço, Estoque, CdMarca, CdModelo, CdGenero) VALUES ('350V63', 15.000, 7, 8, 32, 3);

INSERT INTO TbCliente (CdCliente, Nome, Email, Telefone) VALUES 
  (1,'João da Silva', 'joao.silva@email.com', '(11) 99999-9999'),
  (2,'Maria Fernandes', 'maria.fernandes@email.com', '(21) 98888-8888'),
  (3,'Pedro Oliveira', 'pedro.oliveira@email.com', '(41) 97777-7777'),
  (4,'Ana Santos', 'ana.santos@email.com', '(19) 96666-6666'),
  (5,'Carlos Rodrigues', 'carlos.rodrigues@email.com', '(31) 95555-5555');
  
INSERT INTO TbVenda (DtVenda, Quantidade, PreçoTotal, FormaPagamento, CdGuitarra, CdCliente) VALUES
	('2021/11/22', 1, 22.000, 'Crédito', 11,1),
    ('2022/01/12', 1, 7.000, 'Dédito', 2,2),
    ('2024/07/03', 1, 95.000, 'Dinheiro', 15,3),
    ('2025/03/18', 1, 18.500, 'Crédito', 1,4),
    ('2023/12/25', 1, 10.000, 'Débito', 6,5);

INSERT INTO TbFornecedor (CdFornecedor, Nome, Contato, Telefone) VALUES 
  (1, 'Jackson Guitars', 'contato@jacksonguitars.com', '(11) 5555-5555'),
  (2, 'ESP Guitars', 'contato@espguitars.com', '(21) 6666-6666'),
  (3, 'Fender Musical Instruments Corporation', 'contato@fender.com', '(41) 7777-7777'),
  (4, 'Gibson Brands, Inc.', 'contato@gibson.com', '(19) 8888-8888'),
  (5, 'Ibanez Guitars', 'contato@ibanez.com', '(31) 9999-9999'),
  (6, 'Paul Reed Smith Guitars', 'contato@prsguitars.com', '(11) 1111-1111'),
  (7, 'Gretsch Guitars', 'contato@gretschguitars.com', '(21) 2222-2222'),
  (8, 'Rickenbacker International Corporation', 'contato@rickenbacker.com', '(41) 3333-3333');

INSERT INTO TbEstoque (DtEntrada, Quantidade, CdGuitarra, CdFornecedor) VALUES 
('2021/02/07', 5, 1, 1),
('2021/02/07', 5, 2, 1),
('2021/02/07', 5, 3, 1),
('2021/02/07', 5, 4, 1),

('2021/05/10', 7, 5, 2),
('2021/05/10', 10, 6, 2),
('2021/05/10', 15, 7, 2),
('2021/05/10', 12, 8, 2),

('2021/03/25', 2, 9, 3),
('2021/03/25', 3, 10, 3),
('2021/03/25', 1, 11, 3),
('2021/03/25', 5, 12, 3),

('2021/07/30', 5, 13, 4),
('2021/07/30', 9, 14, 4),
('2021/07/30', 1, 15, 4),
('2021/07/30', 1, 16, 4),

('2021/08/03', 6, 17, 5),
('2021/08/03', 2, 18, 5),
('2021/08/03', 1, 19, 5),
('2021/08/03', 8, 20, 5),

('2021/09/15', 5, 21, 6),
('2021/09/15', 2, 22, 6),
('2021/09/15', 4, 23, 6),
('2021/09/15', 7, 24, 6),

('2021/10/25', 11, 25, 7),
('2021/10/25', 9, 26, 7),
('2021/10/25', 1, 27, 7),
('2021/10/25', 7, 28, 7),

('2021/11/01', 4, 29, 8),
('2021/11/01', 2, 30, 8),
('2021/11/01', 5, 31, 8),
('2021/11/01', 7, 32, 8);

INSERT INTO TbFuncionario (Nome, Cargo) VALUES 
('Carlos Silva', 'Gerente de Vendas'),
('Mariana Souza', 'Atendente'),
('Ricardo Mendes', 'Especialista em Guitarras'),
('Ana Oliveira', 'Caixa'),
('Fernando Lima', 'Assistente de Estoque'),
('Juliana Rocha', 'Supervisora de Loja'),
('Paulo Andrade', 'Técnico de Manutenção'),
('Camila Martins', 'Recepcionista');

# a) Fazer 2 SQLs simples (SELECT ... FROM ... WHERE...) que envolva 3 ou mais tabelas. Use ainda o ORDER BY.

# Listar todas as vendas com informações do cliente e da guitarra, ordenando pelo nome do cliente.

SELECT Cl.Nome AS Cliente, Gu.Nome AS Guitarra, Vd.DtVenda, Vd.Quantidade FROM TbVenda Vd JOIN TbCliente Cl ON Vd.CdCliente = Cl.CdCliente JOIN TbGuitarra Gu ON Vd.CdGuitarra = Gu.CdGuitarra ORDER BY Cl.Nome;

# Listar guitarras com sua marca e modelo, ordenando pelo preço decrescente.

SELECT Gu.Nome AS Guitarra, Ma.Nome AS Marca, Mo.Nome AS Modelo, Gu.Preço FROM TbGuitarra Gu JOIN TbMarca Ma ON Gu.CdMarca = Ma.CdMarca JOIN TbModelo Mo ON Gu.CdModelo = Mo.CdModelo ORDER BY Gu.Preço DESC;

# b) Fazer 1 SQL que necessite do DISTINCT.

# Listar todas as marcas diferentes que possuem guitarras cadastradas.

SELECT DISTINCT Ma.Nome FROM TbGuitarra Gu JOIN TbMarca Ma ON Gu.CdMarca = Ma.CdMarca;

# c) Fazer 1 SQL que necessite do operador LIKE.

# Listar todos os clientes cujo nome começa com "A".

SELECT Nome FROM TbCliente WHERE Nome LIKE 'A%';

# d) Faça 1 SQLs que use alguma função agregada (MAX, MIN, COUNT, AVG, SUM) sem GROUP BY (use no mínimo 2 tabelas).

# Obter o valor médio das guitarras vendidas.

SELECT AVG(PreçoTotal) AS PreçoMédio FROM TbVenda Vd JOIN TbGuitarra Gu ON Vd.CdGuitarra = Gu.CdGuitarra;

# e) Faça 1 SQLs que use alguma função agregada (MAX, MIN, COUNT, AVG, SUM) e necessite do GROUP BY (use no mínimo 2 tabelas em cada consulta).

# Contar quantas guitarras foram vendidas por marca.

SELECT Ma.Nome AS Marca, COUNT(Vd.CdGuitarra) AS TotalVendas FROM TbVenda Vd JOIN TbGuitarra Gu ON Vd.CdGuitarra = Gu.CdGuitarra JOIN TbMarca Ma ON Gu.CdMarca = Ma.CdMarca GROUP BY Ma.Nome;

# Calcular a média de preços das guitarras por modelo.

SELECT Mo.Nome AS Modelo, AVG(Gu.Preço) AS MédiaPreço FROM TbGuitarra Gu JOIN TbModelo Mo ON Gu.CdModelo = Mo.CdModelo GROUP BY Mo.Nome;

# f) Faça 1 SQL que necessite do HAVING (use no mínimo 2 tabelas) para sua solução.

# Listar os modelos que possuem uma média de preço superior a R$20.000,00.

SELECT Mo.Nome AS Modelo, AVG(Gu.Preço) AS MédiaPreço FROM TbGuitarra Gu JOIN TbModelo Mo ON Gu.CdModelo = Mo.CdModelo GROUP BY Mo.Nome HAVING AVG(Gu.Preço) > 20.000;

# g) Faça 1 consulta que necessite do LEFT JOIN para sua solução

# Listar todas as guitarras e, se houver, suas respectivas vendas (exibindo guitarras que ainda não foram vendidas).

SELECT Gu.Nome AS Guitarra, Vd.DtVenda, Vd.Quantidade FROM TbGuitarra Gu LEFT JOIN TbVenda Vd ON Gu.CdGuitarra = Vd.CdGuitarra;

# h) Faça 1 consulta que necessite do UNION para sua solução.

# Listar todos os clientes e funcionários (pessoas relacionadas ao sistema).

SELECT Nome, 'Cliente' AS Tipo FROM TbCliente UNION SELECT Nome, 'Funcionário' AS Tipo FROM TbFuncionario;
