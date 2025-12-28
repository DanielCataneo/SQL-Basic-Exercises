-- ex 2 Insert

--1
insert into Cliente(ID_Cliente , Nome , CPF, Telefone, Email, Endereco) values
 (11, 'Eduardo Nascimento' , '45678912301' , '1010103030' , 'eduardo.nascimento@gmail.com' , 'Rua K808')
	
--2
insert into Veiculo(ID_Veiculo, ID_Cliente , Placa, Modelo , Ano , Cor) values
 (11 , 1 , 'EFG2345' , 'Honda Fit', '2021' , 'Cinza')

--3
insert into Servicos_Realizados(ID_Servico_Realizado , ID_Servico , ID_Veiculo ,ID_Funcionario, Data_Realizacao, Observacoes) values
 (11 , 3 , 2, 5 , '2024-01-05' , 'Substitui��o das pastilhas de freio')


-- ex 3 Update

--1
update Cliente
	set Telefone = '333344445'
	where ID_Cliente = 3

--2
update Servico
	set Preco = 550.00
	where ID_Servico = 4

-- ex 4 Select where

--1
select * from Veiculo
where Ano = '2015'

--2
select * from Funcionario
where Cargo = 'Mec�nico'

--3
select * from Servicos_Realizados
where Data_Realizacao = '2023-03-11'

-- ex 5 select , where, in , like 

--1
select * from Cliente
where Nome like 'j%'

--2
select * from Veiculo
where Cor = 'Cinza' or Cor = 'Preto'

--3
select * from Servico
where Tipo_Servico between 'Corretivo' and 'Preventivo'

-- ex 6 select , sum 

--1
select sum(Quantidade_Estoque) Total
from Peca

--2
select MAX(Preco) Servico_mais_caro
from Servico

--3
select COUNT(*) Quantidade_de_Veiculos
from Veiculo

-- ex 7 group by 

--1
select sr.ID_Funcionario, f.Nome , count(sr.ID_Servico) as Qtd
from Servicos_Realizados sr
inner join Funcionario f on f.ID_Funcionario = sr.ID_Funcionario
GROUP BY sr.ID_Funcionario

--2
select Veiculo.Cor, count(*) 'Quantidade_Veiculos'	
from Veiculo
group by Cor

--3
SELECT ID_Servico_Realizado, sum(Quantidade) as 'Quantidade de Peças'
from Pecas_Utilizadas
GROUP BY ID_Servico_Realizado

--4
SELECT left(CPF, 1) as 'Primeiro Digito', COUNT(*) as 'Qtd'
from Cliente
GROUP BY left(CPF, 1)

-- ex8 Select com having

--1
SELECT ID_Funcionario, COUNT(*) QTD
FROM Servicos_Realizados
GROUP BY ID_Funcionario
having COUNT(*) > 2

--2
SELECT Cor, COUNT(*) QTD
FROM Veiculo
GROUP By Cor
having count(*) > 2