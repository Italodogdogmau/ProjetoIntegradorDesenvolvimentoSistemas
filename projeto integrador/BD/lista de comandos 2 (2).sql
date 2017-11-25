##LISTA DE INSERT'S
insert into estudante_projetos VALUES ('1','1');
insert into estudante_projetos VALUES ('2','1');
insert into estudante_projetos VALUES ('4','2');
insert into estudante_projetos VALUES ('5','2');
insert into estudante_projetos VALUES ('6','3');
insert into estudante_projetos VALUES ('7','3');
insert into estudante_projetos VALUES ('8','4');
insert into estudante_projetos VALUES ('9','4');
insert into estudante_projetos VALUES ('10','5');
insert into estudante_projetos VALUES ('11','5');
insert into estudante_projetos VALUES ('12','5');

insert into estudante_materias (fk_id_estudante,fk_idmateria,notas) VALUES (1,1,7);
insert into estudante_materias VALUES (1,3,9);
insert into estudante_materias VALUES (2,2,8);
insert into estudante_materias VALUES (2,4,9);
insert into estudante_materias VALUES (12,5,7);
insert into estudante_materias VALUES (12,1,6);
insert into estudante_materias VALUES (4,6,6);
insert into estudante_materias VALUES (4,7,5);
insert into estudante_materias VALUES (5,8,4);
insert into estudante_materias VALUES (5,9,4);
insert into estudante_materias VALUES (6,9,6);
insert into estudante_materias VALUES (7,2,2);
insert into estudante_materias VALUES (8,5,2);
insert into estudante_materias VALUES (9,6,7);
insert into estudante_materias VALUES (10,7,7);
insert into estudante_materias VALUES (11,2,6);
select * from estudante_materias;
INSERT INTO estudante_cursos VALUES ('1', '1');
INSERT INTO estudante_cursos Values ('2', '1');
insert into estudante_cursos VALUES ('4', '2');
INSERT INTO estudante_cursos VALUES ('5', '2');
INSERT INTO estudante_cursos VALUES ('6', '2');
INSERT INTO estudante_cursos VALUES ('7', '3');
INSERT INTO estudante_cursos VALUES ('8' , '3');
INSERT INTO estudante_cursos VALUES ('9', '3');
INSERT INTO estudante_cursos VALUES ('10', '1');
INSERT INTO estudante_cursos VALUES ('11', '2');
INSERT INTO estudante_cursos VALUES ('12', '3');
INSERT INTO estudante_cursos VALUES ('19', '2');
INSERT INTO estudante_cursos VALUES ('1', '3');
INSERT INTO cursos VALUES (1,'Sistemas de Inf',80,1),(2,'Ciencia da Comp',80,2),(3,'Engenharia de S',80,3);

INSERT INTO estudante VALUES (1,9987321,'ITALO JOSE',3,33096543,'',20030304),(2,11333876,'Marcos Valenio',5,6,'',19931107),(3,22343214,'Arthur Dias',1,40028922,'arthursub10@gmail.com',24242424),(4,22432112,'nathalia peres',4,12312313,'nath@gmail.com',12312344),(5,43235987,'Lucas Woai',3,33093333,'',20050202),(6,45345333,'Wilton Mota',8,33098888,'',20020304),(7,84232123,'maria cristina',2,12345678,'abcds@hotmail.com',21119998),(8,98387283,'Fernanda Maia ',5,33094534,'',20040302),(9,98776567,'jose roxha',6,12333232,'email@gmail.com',12334245),(10,132321123,'jonh stik',2,12345678,'abcds@hotmail.com',98765441),(11,998888333,'lucas eduardo',4,23344455,'asv@gmail.com',44444442);

INSERT INTO materias VALUES (1,'LPOO',80,5),(2,'HTML5',80,5),(3,'PYTHON',80,1),(4,'MYSQL',60,2),(5,'C++',80,3),(6,'POO',80,2),(7,'TESTE DE SOFTWARE',80,3),(8,'ENGENHARIA DE REQUISITOS',80,1),(9,'HARDWARE',60,4);

INSERT INTO orientador VALUES (1,1234567892,'doutor','Antonio da Silva','anttns@yahoo.com.br',33456789,'Asa Sul'),(2,987896758,'mestre','Vicente Carvalho','viccar@gmail.com',33099999,'Asa Norte'),(3,2147483647,'doutor','Fernanda de Paula','nanda02@hotmail.com',33458765,'Aguas Claras'),(4,2147483647,'doutor','Italo Rocha','italo1466@hotmail.com',985786543,'Asa Norte'),(5,2147483647,'mestre','Joaquim Santana','jojo32@gmail.com',33094567,'Asa Sul');

INSERT INTO projetos VALUES (1,'Cloud',10,2),(2,'Redes',10,3),(3,'Programaçao orientada a objeto',8,1),(4,'Html5',8,4),(5,'Programaçao mobile',8,5);

# COMANDOS DE DELETE

delete from estudante
where idestudante = '1';

delete from ORIENTADOR
where idori = '2';

delete from estudante
where idestudante = '4';

# COMANDOS DE UPDATE

UPDATE estudante SET nome = 'Mariana Barbosa' WHERE idestudante = 4;

UPDATE estudante SET nome = 'Lincoln Mendes' WHERE idestudante = 5;

UPDATE estudante SET nome = 'Silene Maria' WHERE idestudante = 7;

# COMANDO DAS VIEW'S 

CREATE VIEW vw_orientador AS  SELECT idori, nome FROM orientador;

select * from vw_orientador;

CREATE VIEW vw_estudante AS  SELECT cpf, nome, telefone FROM estudante;

select * from vw_estudante;

CREATE VIEW vw_cursos AS  SELECT idcurso, nome_curso, carga FROM cursos;

select * from vw_cursos;

# COMANDO DAS TRIGGERS

DELIMITER $$
USE `modeloteste`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `modeloteste`.`estudante_	AFTER_INSERT` AFTER INSERT ON `estudante` FOR EACH ROW
BEGIN
INSERT INTO Log_estudante
SET acao = 'INSERT',
id_estudante = NEW.id_estudante,
cpf = NEW.cpf,
nome = NEW.nome,
semestre = NEW.semestre,
telefone = NEW.telefone,
email = NEW.email,
matricula = NEW.matricula,
data_modificaçao = NOW();
END$$
DELIMITER ;

DELIMITER $$
USE `modeloteste`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `modeloteste`.`estudante_	AFTER_DELETE` AFTER DELETE ON `estudante` FOR EACH ROW
BEGIN
INSERT INTO Log_estudante
SET acao = 'DELETE',
id_estudante = OLD.id_estudante,
cpf = OLD.cpf,
nome = OLD.nome,
semestre = OLD.semestre,
telefone = OLD.telefone,
email = OLD.email,
matricula = OLD.matricula,
data_modificaçao = NOW();
END$$
DELIMITER ;

DELIMITER $$
USE `modeloteste`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `modeloteste`.`estudante_BEFORE_UPDATE` BEFORE UPDATE ON `estudante` FOR EACH ROW
BEGIN
INSERT INTO Log_estudante
SET acao = 'update',
id_estudante = OLD.id_estudante,
cpf = OLD.cpf,
nome = OLD.nome,
semestre = OLD.semestre,
telefone = OLD.telefone,
email = OLD.email,
matricula = OLD.matricula,
data_modificaçao = NOW();
END$$
DELIMITER ;

# COMANDO DAS STORE PROCEDURES

DELIMITER $$
CREATE PROCEDURE verificar_qntd_orientador(OUT idori INT)
BEGIN
				SELECT count(*) INTO idori FROM orientador;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE verificar_qntd_orientadores(OUT idcurso INT)
BEGIN
				SELECT count(*) INTO idcurso FROM cursos;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE verificar_qntd_estudante(OUT cpf INT)
BEGIN
				SELECT count(*) INTO cpf FROM estudante;
END$$
DELIMITER ;

#  COMANDO DOS SELECT'S

SELECT c.fk_idorient, o.nome
FROM cursos as c
INNER JOIN orientador as o
ON c.fk_idorient=o.idori ORDER BY o.nome;

SELECT c.fk_idorient, o.nome
FROM cursos as c
LEFT JOIN orientador as o
ON c.fk_idorient=o.idori;

SELECT DISTINCT
    es.idestudante,
    es.cpf,
    es.nome,
    es.semestre,
    es.telefone,
    es.email,
    c.nome_curso,
    c.carga
FROM
    estudante AS es
        INNER JOIN
    estudante_cursos AS e ON e.id_aluno = es.idestudante
        INNER JOIN
    cursos AS c ON c.idcurso = e.fk_idcurso
ORDER BY nome_curso;	

SELECT c.fk_idorient, o.nome
FROM cursos as c
RIGHT JOIN orientador as o
ON c.fk_idorient=o.idori;

select * from estudante
where idestudante = '1'
order by idestudante;

select nome, count(*) from estudante
group by nome;

SELECT AVG (semestre) FROM estudante;

select semestre, nome,count(*) from estudante
group by idestudante
having count(semestre) > 0
order by nome;

# -------------------LISTA TRABALHO 2------------------------#

# criaçao da tabela de LOG
CREATE TABLE Log_orientador (
  idori int(11) NOT NULL AUTO_INCREMENT,
  cpf int(11) NOT NULL,
  titulaçao varchar(10) DEFAULT NULL,
  nome varchar(50) DEFAULT NULL,
  email varchar(100) DEFAULT NULL,
  telefone int(11) DEFAULT NULL,
  campus varchar(50) DEFAULT NULL,
  data_modificaçao date DEFAULT NULL,
  acao varchar(10) DEFAULT NULL,
  PRIMARY KEY (idori)
)

# criaçao das TRIGGER'S

DELIMITER $$
USE `modeloteste`$$
CREATE DEFINER = CURRENT_USER TRIGGER `modeloteste`.`orientador_BEFORE_UPDATE` BEFORE UPDATE ON `orientador` FOR EACH ROW
BEGIN
INSERT INTO Log_orientador
SET acao = 'update',
idori = OLD.idori,
cpf= OLD.cpf ,
titulaçao = OLD.titulaçao ,
nome= OLD.nome ,
email= OLD.email ,
telefone= OLD.telefone ,
campus = OLD.campus,
data_modificaçao = NOW();
END$$
DELIMITER ;

DELIMITER $$
USE `modeloteste`$$
CREATE DEFINER = CURRENT_USER TRIGGER `modeloteste`.`orientador_BEFORE_DELETE` BEFORE DELETE ON `orientador` FOR EACH ROW
BEGIN
INSERT INTO Log_orientador
SET acao = 'DELETE',
idori = OLD.idori,
cpf= OLD.cpf ,
titulaçao = OLD.titulaçao ,
nome= OLD.nome ,
email= OLD.email ,
telefone= OLD.telefone ,
campus = OLD.campus,
data_modificaçao = NOW();
END$$
DELIMITER ;


DELIMITER $$
USE `modeloteste`$$
CREATE DEFINER = CURRENT_USER TRIGGER `modeloteste`.`orientador_AFTER_INSERT` AFTER INSERT ON `orientador` FOR EACH ROW
BEGIN
INSERT INTO Log_orientador
SET acao = 'DELETE',
idori = NEW.idori,
cpf= NEW.cpf ,
titulaçao = NEW.titulaçao ,
nome= NEW.nome ,
email= NEW.email ,
telefone= NEW.telefone ,
campus = NEW.campus,
data_modificaçao = NOW();
END$$
DELIMITER ;

# criaçao UPDATE'S

UPDATE orientador SET nome = 'Thales Antonio', email ='thales@gmail.com' WHERE idori = 1;

UPDATE orientador SET nome = 'Patricia Nicole ', email = 'PatyEduc@hotmail.com' WHERE idori = 2;

UPDATE orientador SET nome = 'Wesley Marino', email = 'MarinoUSP@icloud.com' WHERE idori = 3;

# criaçao de INSERT

INSERT INTO estudante VALUES (null,1234568977,'Wilson Marcelo','4','91466278','wilson@yahoo.com','20170202');
INSERT INTO estudante VALUES (null,123321222,'Pamela Marques',5,40028696,'pam@gmail.com',20013204);
INSERT INTO estudante VALUES (null,333123122,'Nathalia Rodrigues',7,32222132,'Nathy@gmail.com',20022304);

# Deletes
delete from estudante
where idestudante = '8';

delete from estudante
where idestudante = '14';

delete from estudante
where idestudante = '17';
select*from estudante;

# Criaçao de View

CREATE VIEW vw_projetos AS  SELECT titulo_projeto, fk_idori FROM projetos;

CREATE VIEW vw_materias AS SELECT nome, fk_idorientador from materias;

CREATE VIEW vw_log_est AS SELECT idestudante, nome, data_modificaçao, acao from log_estudante;

# Criaçao de STORE PROCEDURES

DELIMITER $$
CREATE PROCEDURE media_carga (OUT carga INT)
BEGIN
				SELECT AVG INTO carga FROM materias;
END$$
DELIMITER ;
call media_carga;
DELIMITER $$
CREATE PROCEDURE media_carga_curso(OUT CARGA INT)
BEGIN
				SELECT AVG INTO carga FROM cursos;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE media_carga_projeto(OUT carga_horaria INT)
BEGIN
				SELECT AVG INTO carga_horaria FROM projetos;
END$$
DELIMITER ;

show variables like 'secure_file_priv';

#criaçao de Blob
CREATE TABLE txt_formulário (
idformulario integer not null auto_increment,
tipo VARCHAR (45),
formulario blob,
primary key (idformulario)
);

INSERT INTO txt_formulário (tipo,formulario) values ('JPEG', 'load_file("C:\\wamp64\\tmp\\NWA.jpeg")');	

select formulario INTO OUTFILE 'C:\\wamp64\\tmp\\NWA23.jpg' FROM txt_formulário WHERE idformulario = 5;	
			
SELECT* FROM txt_formulário;

# Criaçao de índice

CREATE INDEX ind_estudante ON estudante (idestudante, cpf, nome);

# (Este índice foi criado por que o número de consultas a essa tabela é bem frequente e com o index posso otimizar o tempo de execuçao).

CREATE INDEX ind_cursos ON cursos (idcurso, nome_curso);

# (Este índice foi criado por que a tabela é usada para alguns Join's e isso pode otimizar o tempo de retorno).

CREATE INDEX ind_orientador ON orientador (idori, nome, cpf, titulaçao);

# (Este índice foi criado por que há um numero elevado de mudanças na tabela como inserçao de novos professores e exclusão dos mesmos).
	

																																																														