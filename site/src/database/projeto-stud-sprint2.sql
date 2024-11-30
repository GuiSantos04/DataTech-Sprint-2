CREATE DATABASE stud;

USE stud;

CREATE TABLE endereco (
idEndereco INT PRIMARY KEY auto_increment,
Cep char(8),
Numero char(5),
Cidade varchar(45),
Estado varchar(45)
) auto_increment = 101 ;

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
fkDC int,
fkParam int, 
constraint fkSenDC foreign key (fkDC) references datacenter(idDC),
constraint fkParaSen foreign key (fkParam) references parametros(idParametros)
) auto_increment = 1101;

desc sensor;

CREATE TABLE leitura (
idLeitura int primary key auto_increment, 
DataHora datetime,
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


INSERT INTO endereco(Cep, Numero, Cidade, Estado) VALUES
('08765789', '9087' ,'Campo Grande', 'Mato Grosso Do Sul');

select *from endereco;

INSERT INTO empresa(RazaoSocial, NomeFantasia, Representante, CNPJ, Usuario, Senha) VALUES
('Nike, inc', 'Nike', 'Guilherme Ferreira', '09876543211234', 'guizin', 'Gui@54321'),
('Equinix', 'Equinix', 'Adilson', '03672254000144', 'adilsin', 'Dils@12345'),
('Amazon AWS', 'Amazon', 'Andy Jessie', '23412247000110', 'amazonprime', '@AWS2024Se');

select *from empresa;

INSERT INTO datacenter(Unidade, TamanhoDC, fkEndereco, fkEmpresa) VALUES
('Nike-Barueri', 1050, 101, 1),
('Equinix-Paulista', 800, 102, 2),
('AWS-MS', 2500, 104, 3),
('AWS-SP', 2100, 103, 3);

select*from datacenter;

INSERT INTO parametros(TempMin, TempMax, UmidMin, UmidMax) VALUES
(18.00, 22.00, 40.00, 55.00),
(20.00, 25.00, 30.00, 55.00);

select*from parametros;

INSERT INTO sensor(LocINstal, StatusSensor, dtInstal, dtUltManut, fkDC, fkParam) VALUES
('Setor A - Andar 1', 'Ativo', '2021-10-04', '2024-07-21', 502, 1001 ),
('Setor B - Andar 2', 'Ativo', '2022-02-10', '2024-07-21', 502, 1001),
('Setor A', 'Ativo', '2019-06-20', '2024-03-20', 501, 1001 ),
('Setor A', 'Ativo', '2017-04-20', '2024-08-20', 504, 1001),
('Setor B', 'Ativo', '2018-06-10', '2024-01-20', 503, 1002);

select*from sensor;

INSERT INTO leitura (temperatura, umidade, fkSensor) VALUES
(23.00, 43.00, 1103),
(18.00, 52.00, 1103),
(19.00 , 51.00, 1104),
(17.00, 53.00, 1102),
(25.00, 32.00, 1101);

SELECT 
    *
FROM
    leitura;

SELECT s.statusSensor as 'Status', s.dtUltManut as 'Data última manutenção', 
l.temperatura, l.umidade, l.fkSensor as 'idSensor' from leitura as l join sensor as s ON s.idSensor = l.fkSensor;

SELECT 
    e.NomeFantasia AS 'Empresa',
    e.Representante AS 'Responsavél',
    dc.Unidade AS 'Unidade',
    s.LocInstal AS 'Local de Instalação',
    s.StatusSensor AS 'Status',
    s.dtUltManut AS 'Ultima Manutenção',
    l.umidade AS 'Umidade Leitura',
    l.temperatura AS 'Temperatura Leitura'
FROM
    empresa AS e
        JOIN
    datacenter AS dc ON dc.fkEmpresa = e.idEmpresa
        JOIN
    sensor AS s ON s.fkDC = dc.idDC
        JOIN
    leitura AS l ON l.fkSensor = s.idSensor;