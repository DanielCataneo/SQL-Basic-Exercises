CREATE DATABASE EXVIOTTI
GO  

USE EXVIOTTI
GO

CREATE TABLE CLIENTE(
    ID_CLIENTE INT PRIMARY KEY,
    NOME VARCHAR(30),
    CPF VARCHAR(11),
    TELEFONE VARCHAR(20),
    EMAIL VARCHAR(40),
    ENDERECO VARCHAR(30)
)
GO

CREATE TABLE VEICULO(
    ID_VEICULO INT PRIMARY KEY,
    ID_CLIENTE INT,
    PLACA VARCHAR(15),
    MODELO VARCHAR(20),
    ANO VARCHAR(4),
    COR VARCHAR(20)
)
GO

CREATE TABLE FUNCIONARIO(
    ID_FUNCIONARIO INT PRIMARY KEY,
    NOME VARCHAR(30),
    CPF VARCHAR(11),
    TELEFONE VARCHAR(20),
    CARGO VARCHAR(30),
    SALARIO MONEY
)
GO

CREATE TABLE SERVICO(
    ID_SERVICO INT PRIMARY KEY,
    DESCRICAO VARCHAR(40),
    PRECO MONEY,
    DURACAO_ESTIMADA VARCHAR(30),
    TIPO_SERVICO VARCHAR(40),
    DATA DATE
)
GO

CREATE TABLE PECA(
    ID_PECA INT PRIMARY KEY,
    NOME VARCHAR(30),
    CODIGO VARCHAR(20),
    FABRICANTE VARCHAR(30),
    PRECO MONEY,
    QUANTIDADE_ESTOQUE INT 
)
GO

CREATE TABLE SERVICOS_REALIZADOS(
    ID_SERVICO_REALIZADO INT PRIMARY KEY,
    ID_SERVICO INT ,
    ID_VEICULO INT,
    ID_FUNCIONARIO INT,
    DATA_REALIZACAO DATE,
    OBSERVACOES VARCHAR(100)
)
GO

CREATE TABLE PECAS_UTILIZADAS(
    ID_PECA_UTILIZADA INT PRIMARY KEY,
    ID_PECA INT,
    ID_SERVICO_REALIZADO INT,
    QUANTIDADE INT,
    CUSTO_TOTAL MONEY
)
GO

-- CONSTRAINTS 
ALTER TABLE VEICULO
ADD CONSTRAINT FK_VEICULO_CLIENTE
FOREIGN KEY (ID_CLIENTE) 
REFERENCES CLIENTE(ID_CLIENTE) 
GO

ALTER TABLE SERVICOS_REALIZADOS
ADD CONSTRAINT FK_SERVICOS_REALIZADOS_SERVICO
FOREIGN KEY (ID_SERVICO)
REFERENCES SERVICO(ID_SERVICO)
GO

ALTER TABLE SERVICOS_REALIZADOS
ADD CONSTRAINT FK_SERVICOS_REALIZADOS_VEICULO
FOREIGN KEY (ID_VEICULO)
REFERENCES VEICULO(ID_VEICULO)
GO

ALTER TABLE SERVICOS_REALIZADOS
ADD CONSTRAINT FK_SERVICOS_REALIZADOS_FUNCIONARIO
FOREIGN KEY (ID_FUNCIONARIO)
REFERENCES FUNCIONARIO(ID_FUNCIONARIO)
GO

ALTER TABLE PECAS_UTILIZADAS
ADD CONSTRAINT FK_PECAS_UTILIZADAS_PECA
FOREIGN KEY (ID_PECA)
REFERENCES PECA(ID_PECA)
GO

ALTER TABLE PECAS_UTILIZADAS
ADD CONSTRAINT FK_PECAS_UTILIZADAS_SERVICO_REALIZADO
FOREIGN KEY (ID_SERVICO_REALIZADO)
REFERENCES SERVICOS_REALIZADOS(ID_SERVICO_REALIZADO)
GO

------------------------------------------------------------------- 

-- Inserindo registros na tabela Cliente
INSERT INTO Cliente (ID_Cliente, Nome, CPF, Telefone, Email, Endereco) VALUES
(1, 'João Silva', '12345678901', '1111111111', 'joao.silva@gmail.com', 'Rua A, 123'),
(2, 'Maria Oliveira', '23456789012', '2222222222', 'maria.oliveira@gmail.com', 'Rua B, 456'),
(3, 'Carlos Pereira', '34567890123', '3333333333', 'carlos.pereira@gmail.com', 'Rua C, 789'),
(4, 'Ana Costa', '45678901234', '4444444444', 'ana.costa@gmail.com', 'Rua D, 101'),
(5, 'Paulo Souza', '56789012345', '5555555555', 'paulo.souza@gmail.com', 'Rua E, 202'),
(6, 'Juliana Santos', '67890123456', '6666666666', 'juliana.santos@gmail.com', 'Rua F, 303'),
(7, 'Roberto Lima', '78901234567', '7777777777', 'roberto.lima@gmail.com', 'Rua G, 404'),
(8, 'Fernanda Rocha', '89012345678', '8888888888', 'fernanda.rocha@gmail.com', 'Rua H, 505'),
(9, 'Lucas Mendes', '90123456789', '9999999999', 'lucas.mendes@gmail.com', 'Rua I, 606'),
(10, 'Patr�cia Almeida', '01234567890', '1010101010', 'patricia.almeida@gmail.com', 'Rua J, 707');
go

-- Inserindo registros na tabela Ve�culo
INSERT INTO Veiculo (ID_Veiculo, ID_Cliente, Placa, Modelo, Ano, Cor) VALUES
(1, 1, 'ABC1234', 'Fiat Uno', 2010, 'Preto'),
(2, 2, 'DEF5678', 'Chevrolet Celta', 2012, 'Prata'),
(3, 3, 'GHI9012', 'Ford Ka', 2014, 'Branco'),
(4, 4, 'JKL3456', 'Honda Civic', 2016, 'Azul'),
(5, 5, 'MNO7890', 'Toyota Corolla', 2018, 'Vermelho'),
(6, 6, 'PQR2345', 'Volkswagen Gol', 2013, 'Cinza'),
(7, 7, 'STU6789', 'Hyundai HB20', 2019, 'Branco'),
(8, 8, 'VWX0123', 'Renault Sandero', 2015, 'Preto'),
(9, 9, 'YZA4567', 'Fiat Palio', 2011, 'Prata'),
(10, 10, 'BCD8901', 'Jeep Renegade', 2020, 'Vermelho');
go

-- Inserindo registros na tabela Funcion�rio
INSERT INTO Funcionario (ID_Funcionario, Nome, CPF, Telefone, Cargo, Salario) VALUES
(1, 'Ricardo Martins', '11223344556', '1111112222', 'Mecânico', 3000.00),
(2, 'Camila Souza', '22334455667', '2222223333', 'Recepcionista', 1500.00),
(3, 'José Almeida', '33445566778', '3333334444', 'Mecânico', 3200.00),
(4, 'Mariana Lima', '44556677889', '4444445555', 'Assistente Administrativo', 2000.00),
(5, 'Bruno Ferreira', '55667788990', '5555556666', 'Mecânico', 3500.00),
(6, 'Renata Rocha', '66778899011', '6666667777', 'Supervisora', 4000.00),
(7, 'Carlos Santos', '77889900112', '7777778888', 'Mecânico', 2800.00),
(8, 'Beatriz Moreira', '88990011223', '8888889999', 'Recepcionista', 1500.00),
(9, 'Thiago Silva', '99001122334', '9999990000', 'Estagário', 1000.00),
(10, 'Laura Melo', '00112233445', '1010102020', 'Mecânica', 3200.00);
go

-- Inserindo registros na tabela Servi�o
INSERT INTO Servico (ID_Servico, Descricao, Preco, Duracao_Estimada, Tipo_Servico, Data) VALUES
(1, 'Troca de Óleo', 150.00, '00:30:00', 'Preventivo', '2023-01-05'),
(2, 'Alinhamento e Balanceamento', 200.00, '01:00:00', 'Preventivo', '2023-01-10'),
(3, 'Revisão de Freios', 300.00, '02:00:00', 'Corretivo', '2023-01-15'),
(4, 'Revisão Geral', 500.00, '04:00:00', 'Preventivo', '2023-02-01'),
(5, 'Substituição de Velas', 100.00, '00:30:00', 'Preventivo', '2023-02-05'),
(6, 'Troca de Bateria', 250.00, '01:00:00', 'Corretivo', '2023-02-10'),
(7, 'Reparo no Sistema de Injeção', 600.00, '03:00:00', 'Corretivo', '2023-02-15'),
(8, 'Substituição de Amortecedores', 400.00, '02:30:00', 'Preventivo', '2023-03-01'),
(9, 'Troca de Correia Dentada', 350.00, '01:30:00', 'Preventivo', '2023-03-10'),
(10, 'Reparo no Ar Condicionado', 450.00, '03:00:00', 'Corretivo', '2023-03-15');
go

-- Inserindo registros na tabela Pe�a
INSERT INTO Peca (ID_Peca, Nome, Codigo, Fabricante, Preco, Quantidade_Estoque) VALUES
(1, 'Óleo de Motor', 'OL123', 'Shell', 50.00, 100),
(2, 'Filtro de Óleo', 'FO456', 'Fram', 30.00, 200),
(3, 'Pastilha de Freio', 'PF789', 'Bosch', 120.00, 150),
(4, 'Bateria', 'BAT101', 'Heliar', 250.00, 50),
(5, 'Vela de Ignicão', 'VI102', 'NGK', 20.00, 300),
(6, 'Amortecedor', 'AM103', 'Cofap', 200.00, 80),
(7, 'Correia Dentada', 'CD104', 'Gates', 100.00, 60),
(8, 'Filtro de Ar', 'FA105', 'Mann', 40.00, 120),
(9, 'Filtro de Combustível', 'FC106', 'Wega', 25.00, 140),
(10, 'Compressor de Ar Condicionado', 'AC107', 'Denso', 350.00, 30);
go

-- Inserindo registros na tabela Servi�os_Realizados
INSERT INTO Servicos_Realizados (ID_Servico_Realizado, ID_Servico, ID_Veiculo, ID_Funcionario, Data_Realizacao, Observacoes) VALUES
(1, 1, 1, 1, '2023-01-06', 'Troca de Óleo realizada com sucesso'),
(2, 2, 2, 2, '2023-01-11', 'Alinhamento e balanceamento realizado'),
(3, 3, 3, 3, '2023-01-16', 'Revisão de freios com substituição das pastilhas'),
(4, 4, 4, 4, '2023-02-02', 'Revisão geral'),
(5, 5, 5, 5, '2023-02-06', 'Substituição de velas de ignição'),
(6, 6, 6, 6, '2023-02-11', 'Troca de bateria realizada'),
(7, 7, 7, 7, '2023-02-16', 'Reparo no sistema de injeção'),
(8, 8, 8, 8, '2023-03-02', 'Substituição de amortecedores'),
(9, 9, 9, 9, '2023-03-11', 'Troca de correia dentada realizada'),
(10, 10, 10, 10, '2023-04-10', 'Verificação do sistema de ar condicionada')
go

-- Inserindo registros na tabela Pe�as_Utilizadas
INSERT INTO Pecas_Utilizadas (ID_Peca_Utilizada, ID_Peca, ID_Servico_Realizado, Quantidade, Custo_Total) VALUES
(1, 1, 1, 1, 50.00),   -- �leo de Motor para Troca de �leo
(2, 2, 1, 1, 30.00),   -- Filtro de �leo para Troca de �leo
(3, 3, 3, 1, 120.00),  -- Pastilha de Freio para Revis�o de Freios
(4, 4, 6, 1, 250.00),  -- Bateria para Troca de Bateria
(5, 5, 5, 4, 80.00),   -- 4 Velas de Igni��o para Substitui��o de Velas
(6, 6, 8, 2, 400.00),  -- 2 Amortecedores para Substitui��o de Amortecedores
(7, 7, 9, 1, 100.00),  -- Correia Dentada para Troca de Correia Dentada
(8, 8, 4, 1, 40.00),   -- Filtro de Ar para Revis�o Geral
(9, 9, 4, 1, 25.00),   -- Filtro de Combust�vel para Revis�o Geral
(10, 10, 10, 1, 350.00);  -- Compressor de Ar Condicionado para Reparo no Ar Condicionado
go

---------------------------------------------------------------------------------------

/*
1. Insira um novo cliente com os seguintes dados: Nome: "Eduardo Nascimento", CPF: "45678912301", Telefone: "1010103030", Email: "eduardo.nascimento@gmail.com", Endereço: "Rua K, 808".
2. Adicione um novo veículo ao banco de dados com os seguintes dados: ID_Cliente: 1, Placa: "EFG2345", Modelo: "Honda Fit", Ano: 2021, Cor: "Cinza".
3. Insira um novo registro na tabela **Serviços_Realizados** para registrar a realização de um serviço com os seguintes dados: ID_Serviço: 3, ID_Veículo: 2, ID_Funcionário: 5, Data_Realização: '2024-01-15', Observações: "Substituição das pastilhas de freio".
*/

-- 1

INSERT INTO CLIENTE VALUES(11,'Eduardo Nascimento', '45678912301','1010103030', 'eduardo.nascimento@gmail.com','Rua K, 808')
GO

-- 2

INSERT INTO VEICULO VALUES(11,1,'EFG2345','Honda Fit','2021','Cinza')
GO

-- 3

INSERT INTO SERVICOS_REALIZADOS VALUES(11,3,2,5,'2024-01-15','Substituição das pastilhas de freio')
GO

/*
1. Atualize o telefone do cliente com **ID_Cliente** igual a 3 para "3333444455".
2. Modifique o **Preço** do serviço de **ID_Serviço** igual a 4 para R$ 550,00.
*/

-- 1
UPDATE CLIENTE
SET TELEFONE = '3333444455'
WHERE ID_CLIENTE = 3
GO

-- 2
UPDATE SERVICO 
SET PRECO = 550.00
WHERE ID_SERVICO = 4
GO


/*
1. Selecione todos os veículos do ano de fabricação 2015.
2. Liste todos os funcionários que possuem o cargo de "Mecânico".
3. Encontre todos os serviços realizados na data '2023-03-11'.
*/


-- 1
SELECT * FROM VEICULO
WHERE ANO = 2015
GO

-- 2
SELECT * FROM FUNCIONARIO
WHERE CARGO = 'Mecânico'
GO

-- 3 
SELECT * FROM SERVICO
WHERE DATA = '2023-03-11'
GO

/*
1. Selecione todos os clientes cujos nomes começam com a letra "J".
2. Liste todos os veículos cuja **Cor** seja "Preto" ou "Cinza".
3. Encontre todos os serviços cujo **Tipo_Serviço** esteja entre os valores "Preventivo" e "Corretivo".
*/

-- 1
SELECT * FROM CLIENTE
WHERE NOME LIKE 'J%'
GO

-- 2
SELECT * FROM VEICULO
WHERE COR IN ('PRETO','CINZA')
GO

-- 3
SELECT * FROM SERVICO
WHERE TIPO_SERVICO IN ('PREVENTIVO','CORRETIVO')
GO

/*
1. Calcule a quantidade total de peças em estoque na tabela **Peça**.
2. Encontre o preço mais alto de um serviço oferecido na tabela **Serviço**.
3. Conte quantos veículos foram registrados no sistema.
*/

-- 1 
SELECT SUM(QUANTIDADE_ESTOQUE) AS 'QUANTIDADE TOTAL DE PEÇAS EM ESTOQUE '
FROM PECA
GO


-- 2
SELECT MAX(PRECO) AS 'MAIOR PREÇO'
FROM SERVICO
GO

-- 3
SELECT COUNT(*) AS 'QUANTIDADE TOTAL DE VEICULOS'
FROM VEICULO
GO

/*
1. Agrupe os serviços realizados por **ID_Funcionário** e mostre a quantidade de serviços realizados por cada funcionário.
2. Agrupe os veículos por **Cor** e mostre a quantidade de veículos de cada cor.
3. Liste a quantidade total de peças utilizadas em cada serviço, agrupadas por **ID_Serviço_Realizado**.
4. Agrupe os clientes pelo primeiro dígito do CPF e conte quantos clientes têm CPF começando com cada dígito.
*/

-- 1
SELECT ID_FUNCIONARIO, COUNT(ID_FUNCIONARIO) AS 'SERVIÇOS REALIZADOS POR CADA FUNCIONÁRIO'
FROM SERVICOS_REALIZADOS
GROUP BY ID_FUNCIONARIO
GO

-- 2
SELECT COR , COUNT(COR)
FROM VEICULO
GROUP BY COR
GO

-- 3
SELECT ID_SERVICO_REALIZADO , COUNT(QUANTIDADE) AS 'QUANTIDADE DE PEÇAS POR SERVIÇO'
FROM PECAS_UTILIZADAS
GROUP BY ID_SERVICO_REALIZADO
GO

-- 4
SELECT
    LEFT(CPF, 1) AS Primeiro_Digito_CPF,
    COUNT(*) AS Quantidade_Clientes
FROM
    CLIENTE
GROUP BY
    LEFT(CPF, 1)
GO
/*
1. Mostre o ID e a quantidade de serviços realizados por cada funcionário, mas exiba apenas aqueles que realizaram mais de 2 serviços.
2. Encontre todas as cores de veículos que possuem mais de 2 veículos registrados.
*/

-- 1
SELECT ID_FUNCIONARIO , COUNT(*) AS 'SERVIÇOS REALIZADOS POR CADA FUNCIONÁRIO'
FROM SERVICOS_REALIZADOS
GROUP BY ID_FUNCIONARIO
HAVING COUNT(*) > 2
GO

-- 2 
SELECT COR , COUNT(*) AS 'QUANTIDADE DE CARROS POR COR'
FROM VEICULO
GROUP BY COR
HAVING COUNT(*) > 1
GO





