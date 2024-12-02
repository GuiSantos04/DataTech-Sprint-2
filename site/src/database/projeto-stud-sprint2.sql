CREATE DATABASE stud;

USE stud;

CREATE TABLE endereco (
idEndereco INT PRIMARY KEY auto_increment,
Cep char(8),
Numero char(5),
Cidade varchar(45),
Estado varchar(45)
) auto_increment = 101 ;

select * from endereco;

desc endereco;

CREATE TABLE empresa (
idEmpresa int primary key auto_increment, 
RazaoSocial varchar(45),
NomeFantasia varchar(45),
Representante varchar(45),
CNPJ char(14),
Unidade varchar(45),
TamanhoDC int,
Email varchar(45),
Usuario char(20),
Senha char(12),
fkEndereco int unique, 
constraint fkEndEmp foreign key (fkEndereco) references endereco(idEndereco)
);

desc empresa;

select * from empresa;

CREATE TABLE parametros (
idParametros int primary key auto_increment,
TempMin float(5,2),
TempMax float(5,2),
UmidMin float(5,2),
UmidMax float(5,2)
) auto_increment = 1001;

desc parametros;

CREATE TABLE sensor (
idSensor int primary key auto_increment,
LocInstal varchar(45),
StatusSensor  varchar(12),
constraint chkStts check (StatusSensor in ('Ativo', 'Inativo', 'Manutenção')),
dtInstal date,
dtUltManut  date,
fkEmpresa int,
fkParam int, 
constraint fkSenEmp foreign key (fkEmpresa) references empresa(idEmpresa),
constraint fkParaSen foreign key (fkParam) references parametros(idParametros)
) auto_increment = 1101;

desc sensor;

CREATE TABLE leitura (
idLeitura int primary key auto_increment, 
DataHora datetime default current_timestamp,
temperatura float(5,2),
umidade float (5,2),
fkSensor int,
constraint fksensleit foreign key(fkSensor) references sensor(idSensor)
);

drop table leitura;
desc leitura;

INSERT INTO endereco(Cep, Numero, Cidade, Estado) VALUES
('06455000', '3641' ,'Barueri', 'São Paulo'),
('04551065', '200', 'São Paulo', 'São Paulo'),
('04543907', '1909', 'São Paulo', 'São Paulo');

select *from endereco;

INSERT INTO empresa(RazaoSocial, NomeFantasia, Representante, CNPJ, Usuario, Senha) VALUES
('Nike, inc', 'Nike', 'Guilherme Ferreira', '09876543211234', 'guizin', 'Gui@54321'),
('Equinix', 'Equinix', 'Adilson', '03672254000144', 'adilsin', 'Dils@12345'),
('Amazon AWS', 'Amazon', 'Andy Jessie', '23412247000110', 'amazonprime', '@AWS2024Se');

select *from empresa;

(SELECT max(idEndereco) FROM endereco);

INSERT INTO parametros(TempMin, TempMax, UmidMin, UmidMax) VALUES
(18.00, 22.00, 40.00, 55.00),
(20.00, 25.00, 30.00, 55.00);

select*from parametros;

INSERT INTO sensor(LocINstal, StatusSensor, dtInstal, dtUltManut, fkEmpresa, fkParam) VALUES
('Setor A - Andar 1', 'Ativo', '2021-10-04', '2024-07-21', 2, 1001 ),
('Setor B - Andar 2', 'Ativo', '2022-02-10', '2024-07-21', 2, 1001),
('Setor A', 'Ativo', '2019-06-20', '2024-03-20', 1, 1001 ),
('Setor A', 'Ativo', '2017-04-20', '2024-08-20', 1, 1001),
('Setor B', 'Ativo', '2018-06-10', '2024-01-20', 3, 1002);

select*from sensor;

SELECT idSensor FROM sensor WHERE fkEmpresa = id.Empresa;

SELECT temperatura as temperatura, umidade as umidade, dataHora FROM (SELECT idSensor FROM sensor WHERE fkEmpresa = 1) as empresa JOIN leitura ON fkSensor = idSensor;

INSERT INTO leitura (DataHora, temperatura, umidade, fkSensor) VALUES
(12, 23.00, 43.00, 1103),
(13, 18.00, 52.00, 1103),
(14, 19.00 , 51.00, 1104),
(15, 17.00, 53.00, 1102),
(16, 25.00, 32.00, 1101);

INSERT INTO leitura (DataHora, temperatura, umidade, fkSensor) VALUES
(15, 23.00, 43.00, 1103),
(16, 18.00, 52.00, 1103),
(17, 19.00 , 51.00, 1104);

INSERT INTO leitura (DataHora, temperatura, umidade, fkSensor) VALUES
(18, 23.00, 43.00, 1103),
(19, 18.00, 52.00, 1103),
(20, 19.00 , 51.00, 1104);

INSERT INTO leitura (DataHora, temperatura, umidade, fkSensor) VALUES
(21, 23.00, 43.00, 1103),
(22, 18.00, 52.00, 1103),
(23, 19.00 , 51.00, 1104);

INSERT INTO leitura (DataHora, temperatura, umidade, fkSensor) VALUES
(24, 23.00, 43.00, 1103),
(25, 18.00, 52.00, 1103),
(26, 19.00 , 51.00, 1104);

INSERT INTO leitura (DataHora, temperatura, umidade, fkSensor) VALUES
(27, 23.00, 43.00, 1103);

INSERT INTO leitura (DataHora, temperatura, umidade, fkSensor) VALUES
(28, 23.00, 43.00, 1103);

INSERT INTO leitura (DataHora, temperatura, umidade, fkSensor) VALUES
(29, 23.00, 43.00, 1103);

INSERT INTO leitura (DataHora, temperatura, umidade, fkSensor) VALUES
(27, 28.00, 60.00, 1103);

INSERT INTO leitura (DataHora, temperatura, umidade, fkSensor) VALUES
(30, 23.00, 43.00, 1103);

INSERT INTO leitura (DataHora, temperatura, umidade, fkSensor) VALUES
(31, 23.00, 43.00, 1103),
(32, 23.00, 43.00, 1103),
(33, 23.00, 43.00, 1103),
(34, 23.00, 43.00, 1103),
(35, 23.00, 43.00, 1103),
(36, 23.00, 43.00, 1103);

INSERT INTO leitura (DataHora, temperatura, umidade, fkSensor) VALUES
(37, 19.00, 80.00, 1103);


UPDATE leitura SET DataHora = '2024-12-01 04:00:00'
	WHERE idLeitura = 1;

UPDATE leitura SET DataHora = '2024-12-01 05:00:00'
	WHERE idLeitura = 2;
    
UPDATE leitura SET DataHora = '2024-12-01 06:00:00'
	WHERE idLeitura = 3;

SELECT 
    *
FROM
    leitura;

SELECT s.statusSensor as 'Status', s.dtUltManut as 'Data última manutenção', 
l.temperatura, l.umidade, l.fkSensor as 'idSensor' from leitura as l join sensor as s ON s.idSensor = l.fkSensor;

SELECT 
    e.NomeFantasia AS 'Empresa',
    e.Representante AS 'Responsavél',
    e.Unidade AS 'Unidade',
    s.LocInstal AS 'Local de Instalação',
    s.StatusSensor AS 'Status',
    s.dtUltManut AS 'Ultima Manutenção',
    l.umidade AS 'Umidade Leitura',
    l.temperatura AS 'Temperatura Leitura'
FROM
    empresa AS e
        JOIN
    sensor AS s ON s.fkEmpresa = e.idEmpresa
        JOIN
    leitura AS l ON l.fkSensor = s.idSensor;