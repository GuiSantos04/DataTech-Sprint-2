CREATE DATABASE STUD;
USE STUD;

CREATE TABLE empresa (
    idEmpresa INT AUTO_INCREMENT PRIMARY KEY,
    razaoSocial VARCHAR (45),
    nomeFantasia VARCHAR(45),
    representante VARCHAR(45),
    cnpj CHAR (18),
    cep CHAR(9),
    cidade VARCHAR(45),
    estado VARCHAR(45),
    numero CHAR(5),
    email VARCHAR(45),
    tamanhoDataCenter INT,
    Usuario CHAR(20),
    Senha VARCHAR(30)
)auto_increment = 100;

CREATE TABLE responsavel (
    idResponsavel INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (45),
    cpf CHAR (15),
    email VARCHAR (45),
    cep CHAR(9),
    cidade VARCHAR(45),
    estado VARCHAR(45),
    numero CHAR(5),
    telefone VARCHAR(14),
	fkEmpresa INT,
		constraint fkRespEmp foreign key(fkEmpresa)
			references empresa(idEmpresa)
)auto_increment = 1000;

CREATE TABLE sensor (
    idSensor INT,
    fkEmpresa INT,
    PRIMARY KEY(idSensor, fkEmpresa),
    locInstal VARCHAR(45),
    statusSensor VARCHAR(10),
		constraint chk_status
			CHECK (statusSensor IN('ativo', 'inativo', 'manutenção')),
    dtInstal DATE,
    dtUltManut DATE,
		constraint fkSenEmp foreign key(fkEmpresa)
			references empresa(idEmpresa)
);

CREATE TABLE leitura (
    idLeitura INT primary key auto_increment,
    dataHora DATETIME,
    temperatura FLOAT(5, 2),
    umidade FLOAT(5, 2),
		constraint fkLeitSens foreign key(fkSensor)
			references sensor(idSensor),
		constraint fkLeitSensEmp foreign key(fkSensEmp)
			references sensor(fkEmpresa)
);

INSERT INTO empresa (razaoSocial, nomeFantasia, representante, cnpj, cep, cidade, estado, numero, email, tamanhoDataCenter, Usuario, Senha) 
VALUES
('Equinix','Equinix', 'Adaire Fox-Martin', '03.672.254/0001-44', '06455-000', 'Barueri', 'São Paulo', '3641', 'adairemartin@equinix.com', 500, 'equinix', 'EQu1n1x$2024!'),
('Amazon AWS', 'Amazon Web Services (AWS)', 'Andy Jassy', '23.412.247/0001-10', '04551-065', 'São Paulo', 'São Paulo', '200', 'andy@aws.com', 2000, 'amazonprime', '@AWS2024_Secure'),
('Google', 'Google Cloud', 'Sundar Pichai', '25.012.398/0001-07', '04543-907',  'São Paulo', 'São Paulo', '1909', 'sundar@gmail.com', 1500, 'google', 'G00gL3_C1oud!');

INSERT INTO responsavel (nome, cpf, email, cep, cidade, estado, numero, telefone, fkEmpresa) 
VALUES
('Adaire Fox-Martin', '123.456.789-00', 'adaire.fox-martin@equinix.com', '01441-000', 'São Paulo', 'São Paulo', '123', '(11)98765-4321', 100),
('Andy Jassy', '234.567.890-11', 'andy.jassy@aws.com', '01453-000', 'São Paulo', 'São Paulo', '456', '(11)99876-5432', 101),
('Sundar Pichai', '345.678.901-22', 'sundar.pichai@google.com', '04538-133', 'São Paulo', 'São Paulo', '2348', '(11)97654-3210', 102);

INSERT INTO sensor (idSensor, fkEmpresa, locInstal, statusSensor, dtInstal, dtUltManut) 
VALUES
(1, 100, 'Datacenter Equinix', 'ativo', '2024-06-20', '2024-08-12'),
(1, 101, 'Datacenter AWS', 'ativo', '2023-03-20', '2024-09-25'),
(1, 102, 'Datacentmer Google Cloud', 'inativo', '2020-03-20', '2024-02-13');

INSERT INTO leitura (idLeitura, fkSensor, fkSensEmp, dataHora, temperatura, umidade) 
VALUES
(1, 1, 100, '2024-09-10 10:00:00', 22.5, 60.2),
(2, 1, 100, '2024-09-10 10:00:02', 22.7, 60.4),
(3, 1, 100, '2024-09-10 10:00:04', 22.6, 60.3),
(4, 1, 100, '2024-09-10 10:00:06', 22.8, 60.5),
(1, 1, 101, '2024-09-10 10:00:00', 23.0, 58.9),
(2, 1, 101, '2024-09-10 10:00:02', 23.2, 59.1),
(3, 1, 101, '2024-09-10 10:00:04', 23.1, 59.0),
(4, 1, 101, '2024-09-10 10:00:06', 23.3, 59.2);

SELECT * FROM leitura;