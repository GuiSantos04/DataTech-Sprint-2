CREATE DATABASE STUD;
USE STUD;


CREATE TABLE Cadastro_empresa (
    idEmpresa INT AUTO_INCREMENT PRIMARY KEY,
    Empresa VARCHAR (255) NOT NULL,
    CNPJ VARCHAR (18) NOT NULL,
    endereco VARCHAR (255),
    data_cadastro DATETIME NOT NULL,
    Usuario VARCHAR (255) NOT NULL,
    Senha VARCHAR(30) NOT NULL
)auto_increment = 100;




CREATE TABLE Cadastro_responsavel (
    idResponsavel INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR (255) NOT NULL,
    CPF VARCHAR (15) NOT NULL,
    RG VARCHAR (255) NOT NULL,
    Email VARCHAR (255) NOT NULL,
    Endereco VARCHAR (255) NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Empresa VARCHAR (255) NOT NULL,
    Senha VARCHAR(30) NOT NULL
)auto_increment = 1000;




CREATE TABLE Sensores (
    id_sensor INT AUTO_INCREMENT PRIMARY KEY,
    id_empresa INT NOT NULL,
    Modelo VARCHAR(100) NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    Local_instalacao VARCHAR(255) NOT NULL,
    Status_sensor VARCHAR(20) NOT NULL,
                        CONSTRAINT chk_status
                              CHECK (status_sensor IN('ativo', 'inativo', 'manutenção')),
    data_instalacao DATETIME NOT NULL
);



CREATE TABLE Leituras_sensores (
    id_leitura INT AUTO_INCREMENT PRIMARY KEY,
    id_sensor INT NOT NULL,
    temperatura FLOAT(5, 2) NOT NULL,
    umidade FLOAT(5, 2) NOT NULL,
    data_leitura DATETIME NOT NULL
)auto_increment = 10;

INSERT INTO Cadastro_empresa (Empresa, CNPJ, endereco, data_cadastro, Usuario, Senha) 
VALUES
('Equinix', '03.672.254/0001-44', 'Alameda Araguaia, 3641 - Tamboré, Barueri - SP, CEP 06455-000', '2024-06-13 08:30:00', 'Adaire Fox-Martin', 'EQu1n1x$2024!'),
('Amazon Web Services (AWS)', '23.412.247/0001-10', 'Edifício JK, Av. Chedid Jafet, 200 - Vila Olímpia, São Paulo - SP, CEP 04551-065', '2023-01-28 09:00:00', 'Andy Jassy', '@AWS2024_Secure'),
('Google Cloud', '25.012.398/0001-07', 'Avenida Pres Juscelino Kubitschek, 1909, Cond Sp Corp Towers T Sulandar 14 e 15 Conj 141 e 151, Vila Nova Conceição, São Paulo - SP', '2024-03-10 10:15:00', 'Sundar Pichai', 'G00gL3_C1oud!'),
('Microsoft Azure', '04.712.500/0001-07', 'Av. Presidente Juscelino Kubitscheck, 1.909, Torre Sul, 16º andar, CEP 04551-065, São Paulo, SP', '2024-08-21 11:45:00', 'Satya Nadella', 'M1cr0s0ft#2024'),
('IBM Cloud', '33.372.251/0001-56', 'R. Tutóia, 1157 - Vila Mariana, São Paulo - SP, CEP 04007-900', '2023-10-17 14:00:00', 'Arvind Krishna', 'IBm@2024#Secure'),
('Alibaba Cloud', '41.761.484/0001-79', 'Rua do Paraíso, 595 – 11º andar São Paulo – CEP 04103-001', '2024-05-15 09:00:35', 'Eddie Yongming Wu', '@Alibaba2024!Secure'),
('Ascenty', '13.743.550/0001-42', 'Av. Roberto Pinto Sobrinho, 350 - Vila Osasco, São Paulo - SP, CEP 06268-120', '2024-07-20 10:30:50', 'Chris Torto', 'Asc3nty_#S3cur3');


INSERT INTO Cadastro_responsavel (Nome, CPF, RG, Email, Endereco, Telefone, Empresa, Senha) 
VALUES
('Adaire Fox-Martin', '123.456.789-00', '12.345.678-X', 'adaire.fox-martin@equinix.com', 'Alameda Gabriel Monteiro da Silva, 123 - Jardim Paulistano, São Paulo - SP, CEP 01441-000', '(11) 98765-4321', 'Equinix', 'F0xM@rtin2024!'),
('Andy Jassy', '234.567.890-11', '23.456.789-Y', 'andy.jassy@aws.com', 'Rua dos Jardins, 456 - Jardim Europa, São Paulo - SP, CEP 01453-000', '(11) 99876-5432', 'Amazon Web Services (AWS)', 'AndJ@ssy2024#'),
('Sundar Pichai', '345.678.901-22', '34.567.890-Z', 'sundar.pichai@google.com', 'Avenida Faria Lima, 2348 - Itaim Bibi, São Paulo - SP, CEP 04538-133', '(11) 97654-3210', 'Google Cloud', 'P1chai@2024$'),
('Satya Nadella', '456.789.012-33', '45.678.901-A', 'satya.nadella@microsoft.com', 'Rua Cardoso Pimentel, 98 - Vila Nova Conceição, São Paulo - SP, CEP 04542-001', '(11) 96543-2109', 'Microsoft Azure', 'S@tyaNadella2024!'),
('Arvind Krishna', '567.890.123-44', '56.789.012-B', 'arvind.krishna@ibm.com', 'Rua dos Três Irmãos, 321 - Vila Olímpia, São Paulo - SP, CEP 04551-005', '(11) 95432-1098', 'IBM Cloud', 'Krishna@2024#IBM'),
('Eddie Yongming Wu', '678.901.234-55', '67.890.123-C', 'eddie.wu@alibaba.com', 'Av. Engenheiro Luís Carlos Berrini, 131 - Brooklin, São Paulo - SP, CEP 04571-000', '(11) 94321-0987', 'Alibaba Cloud', 'Eddie@2024!Alibaba'),
('Chris Torto', '789.012.345-66', '78.901.234-D', 'chris.torto@ascenty.com', 'Avenida São Gabriel, 555 - Vila Olímpia, São Paulo - SP, CEP 04538-002', '(11) 93210-9876', 'Ascenty', 'Torto@2024#Ascenty');



INSERT INTO Sensores (id_empresa, Modelo, Tipo, Local_instalacao, Status_sensor, data_instalacao) 
VALUES
(1, 'DHT11', 'Umidade e Temperatura', 'Datacenter Equinix', 'ativo', '2024-06-20 09:00:00'),
(2, 'DHT11', 'Umidade e Temperatura', 'Datacenter AWS', 'ativo', '2023-03-20 09:00:00'),
(3, 'DHT11', 'Umidade e Temperatura', 'Datacentmer Google Cloud', 'ativo', '2024-03-20 09:00:00'),
(4, 'DHT11', 'Umidade e Temperatura', 'Datacenter Microsoft', 'ativo', '2024-09-07 09:00:00'),
(5, 'DHT11', 'Umidade e Temperatura', 'Datacenter Ascenty', 'ativo', '2023-10-20 09:00:00'),
(6, 'DHT11', 'Umidade e Temperatura', 'Datacenter Equinix', 'ativo', '2024-07-01 09:00:00'),
(7, 'DHT11', 'Umidade e Temperatura', 'Datacenter AWS', 'ativo', '2024-07-01 09:00:00'),
(8, 'DHT11', 'Umidade e Temperatura', 'Datacenter Google Cloud', 'ativo', '2024-07-01 09:00:00');




INSERT INTO Leituras_sensores (id_sensor, temperatura, umidade, data_leitura) 
VALUES
(1, 22.5, 60.2, '2024-09-10 10:00:00'),
(1, 22.7, 60.4, '2024-09-10 10:00:02'),
(1, 22.6, 60.3, '2024-09-10 10:00:04'),
(1, 22.8, 60.5, '2024-09-10 10:00:06'),
(2, 23.0, 58.9, '2024-09-10 10:00:00'),
(2, 23.2, 59.1, '2024-09-10 10:00:02'),
(2, 23.1, 59.0, '2024-09-10 10:00:04'),
(2, 23.3, 59.2, '2024-09-10 10:00:06'),
(3, 21.0, 62.5, '2024-09-10 10:00:00'),
(3, 21.1, 62.7, '2024-09-10 10:00:02'),
(3, 21.2, 62.8, '2024-09-10 10:00:04'),
(3, 21.0, 62.6, '2024-09-10 10:00:06'),
(4, 24.5, 55.0, '2024-09-10 10:00:00'),
(4, 24.6, 55.1, '2024-09-10 10:00:02'),
(4, 24.7, 55.2, '2024-09-10 10:00:04'),
(4, 24.8, 55.3, '2024-09-10 10:00:06'),
(5, 20.5, 65.0, '2024-09-10 10:00:00'),
(5, 20.6, 65.1, '2024-09-10 10:00:02'),
(5, 20.7, 65.2, '2024-09-10 10:00:04'),
(5, 20.8, 65.3, '2024-09-10 10:00:06');

  select * from Cadastro_empresa where endereco = 'Av. Presidente Juscelino Kubitscheck, 1.909, Torre Sul, 16º andar, CEP 04551-065, São Paulo, SP';
   select * from Cadastro_empresa where senha like '%_%';
   
   select * from Cadastro_responsavel where Empresa = 'Google Cloud';
   select * from Cadastro_responsavel where Nome like '%H%';
   
   select * from  Sensores where Local_instalacao = 'Datacenter AWS';
   select * from  Sensores where Local_instalacao like '%X%';
   
   select * from  Leituras_sensores where id_sensor = 3;
   select * from  Leituras_sensores where temperatura like '%6%' ;
 
 