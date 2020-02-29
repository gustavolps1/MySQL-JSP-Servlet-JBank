USE jbank;

CREATE TABLE Clientes (
ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(128) NOT NULL,
Email VARCHAR(256) NOT NULL UNIQUE,
CPF CHAR(11) NOT NULL UNIQUE,
Senha VARCHAR(18) NOT NULL
);

CREATE TABLE Bancos (
ID_Banco INT PRIMARY KEY AUTO_INCREMENT,
Nome_Banco VARCHAR(128) NOT NULL UNIQUE
);

CREATE TABLE Contas (
Num_Conta INT PRIMARY KEY AUTO_INCREMENT,
ID_Cliente INT NOT NULL,
ID_Banco INT NOT NULL,
Saldo DECIMAL(13,2) DEFAULT 0,
FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
FOREIGN KEY (ID_Banco) REFERENCES Bancos(ID_Banco)
);
 
INSERT INTO Bancos (Nome_Banco) VALUES ('Bradesco');
INSERT INTO Bancos (Nome_Banco) VALUES ('Caixa');

INSERT INTO Clientes (Nome, CPF, Senha, Email) VALUES ('Rodrigo Pinto', '79396373044', 'rodrigo123', 'rodrigo.pinto@gmail.com');
INSERT INTO Clientes (Nome, CPF, Senha, Email) VALUES ('Fernando Santana', '32555475044', 'fernando123', 'fernando.santana@gmail.com');
INSERT INTO Clientes (Nome, CPF, Senha, Email) VALUES ('Adriano Alves', '62185418009', 'adriano123', 'adriano.alves@gmail.com');
INSERT INTO Clientes (Nome, CPF, Senha, Email) VALUES ('Adriana Sampaio', '10907926894', 'adriana123');
INSERT INTO Clientes (Nome, CPF, Senha, Email) VALUES ('Alexandre Adriano', '5459322979', 'alexandre123');
INSERT INTO Clientes (Nome, CPF, Senha, Email) VALUES ('Ana Claudia', '11533741883', 'ana123');

UPDATE Clientes SET Email = 'rodrigo.pinto@gmail.com' WHERE CPF = '79396373044' and ID_Cliente = 1;
UPDATE Clientes SET Email = 'fernando.santana@gmail.com' WHERE CPF = '32555475044' and ID_Cliente = 2;
UPDATE Clientes SET Email = 'adriano.alves@gmail.com' WHERE CPF = '62185418009' and ID_Cliente = 3;
UPDATE Clientes SET Email = 'adriana.sampaio@gmail.com' WHERE CPF = '10907926894' and ID_Cliente = 4;
UPDATE Clientes SET Email = 'alexandre.adriano@gmail.com' WHERE CPF = '5459322979' and ID_Cliente = 5;
UPDATE Clientes SET Email = 'ana.claudia@gmail.com' WHERE CPF = '11533741883' and ID_Cliente = 6;

ALTER TABLE Clientes RENAME COLUMN Nome_Cliente TO Nome;

INSERT INTO Contas(ID_Cliente, ID_Banco) VALUES (1, 1);
INSERT INTO Contas(ID_Cliente, ID_Banco) VALUES (2, 1);
INSERT INTO Contas(ID_Cliente, ID_Banco) VALUES (3, 1);
INSERT INTO Contas(ID_Cliente, ID_Banco) VALUES (4, 2);
INSERT INTO Contas(ID_Cliente, ID_Banco) VALUES (5, 2);
INSERT INTO Contas(ID_Cliente, ID_Banco) VALUES (6, 2);

ALTER TABLE Clientes DROP COLUMN Email;
ALTER TABLE Clientes ADD Email varchar(256) NOT NULL DEFAULT '';