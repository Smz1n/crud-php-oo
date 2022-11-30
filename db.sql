------------------------------------------
## CRIAR O DB
CREATE DATABASE db_escola;

------------------------------------------
## USAR O DB

USE db_escola;
-----------------------------------------
## CRIAR A TABELA ALUNOS

CREATE TABLE tb_alunos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    status TINYINT NOT NULL,
    genero VARCHAR(20) NOT NULL,
    dataNascimento DATETIME NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL
);
------------------------------------------
## CRIAR A TABELA PROFESSORES

CREATE TABLE tb_professores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    endereco VARCHAR(45) NOT NULL,
    formacao VARCHAR(45) NOT NULL,
    status TINYINT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL
);

---------------------------------------------
## CRIAR A TABELA CATEGORIAS

CREATE TABLE tb_categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);
----------------------------------------------
## CRIAR A TABELA CURSOS

CREATE TABLE tb_cursos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cargaHoraria VARCHAR(50) NOT NULL,
    descricao VARCHAR(100) UNIQUE NOT NULL,
    status TINYINT NOT NULL,
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

--------------------------------------------
## CRIAR A TABELA USER

CREATE TABLE tb_user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    profile VARCHAR(20) NOT NULL
);

--------------------------------------------------
## INSERIR  USUARIOS NA TABELA

INSERT INTO tb_alunos 
(nome, matricula, email, status, genero, dataNascimento, cpf)
VALUES
('Maria', '1234123', 'maria@email.com', true, 'Feminino', '2001-09-12', '12312312312'),
('Chiquim', '4434123', 'chiquim@email.com', true, 'Masculino', '2000-12-31', '44455588812'),
('Joaquim', '5534123', 'joaquim@email.com', true, 'Não informado', '1997-06-27', '09812312390');

SELECT * FROM tb_alunos;

----------------------------------------------------
## INSERIR  PROFESSORES NA TABELA

INSERT INTO tb_professores
(nome, endereco, formacao, status, cpf)
VALUES
('Alessandro','Rua barca semi nova 123', 'HTML, CSS, JS, React', true, '12345612345'),
('Allan','Rua idelfonso albano 222, ap 1403', 'SABE TUDO, BRABISSIMO', true, '99999999999'),
('Gleidson', 'Rua oscar frança 88', 'Formado nas ruas', true, '22222222222');

----------------------------------------------------
## INSERIR  CATEGORIAS NA TABELA

INSERT INTO tb_categorias (nome) 
VALUES 
('Profissionalizante'),
('Tecnico'),
('Graduação');

-------------------------------------------------------
## INSERIR  CURSOS NA TABELA

INSERT INTO tb_cursos
(nome, cargaHoraria, descricao, status, categoria_id)
VALUES
('FullStack','192','Vai ficar profissional',1,1);

SELECT *
FROM tb_cursos
INNER JOIN tb_categorias
ON tb_cursos.categoria_id = tb_categorias.id;

------------------------------------------------------------
## INSERIR USUARIO PARA ENTRAR NA APLICAÇÃO(Obs: quando for entrar utilize admin@admin.com , 123456)

INSERT INTO tb_user
(name, email, profile, password)
VALUES
('Administrador', 'admin@admin.com', 'admin', '$argon2i$v=19$m=65536,t=4,p=1$aTUxOC5udGNOL21KM29tNA$jiqG0IfXRvBAI+xhK6pSrlnTXqvVF8WyBlD4hXn4dEY');