

-- 1. Liste usuários com aniversário de hoje cujo número de vendas 
--    realizadas em janeiro de 2020 seja superior a 1.500.

SELECT 
     c.id_customer
    ,c.nome
    ,c.sobrenome
FROM Customer c
    INNER JOIN ORDERS o   ON c.id_customer = o.id_customer

WHERE c.nascimento = GETDATE()
  AND YEAR(o.data_pedido)  = 2020
  AND MONTH(o.data_pedido) = 1
GROUP BY c.id_customer, c.nome, c.sobrenome
HAVING SUM(o.total) > 1500;


/*
2. Para cada mês de 2020, são solicitados os 5 principais usuários que mais 
venderam ($) na categoria Celulares. São obrigatórios o mês e ano da análise, 
nome e sobrenome do vendedor, quantidade de vendas realizadas, quantidade de 
produtos vendidos e valor total transacionado.
*/