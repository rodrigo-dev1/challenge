

-- 1. Liste usuários com aniversário de hoje cujo número de vendas 
--    realizadas em janeiro de 2020 seja superior a 1.500.

SELECT 
     c.id_customer
    ,c.nome
    ,c.sobrenome
    ,SUM(o.total) Total_vendido


FROM Customer c
    INNER JOIN ORDERS o   ON c.id_customer = o.id_customer

WHERE tipo_usuario = 'seller'
  AND DAY(c.nascimento) = DAY(GETDATE())
  AND MONTH(c.nascimento) = MONTH(GETDATE())
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

WITH VendasDoMes AS (
  SELECT
    RANK() OVER (PARTITION BY FORMAT(o.data_pedido, 'yyyy-MM') ORDER BY SUM(oi.preco_unitario * oi.quantidade) DESC) AS rank_,
    FORMAT(o.data_pedido, 'yyyy-MM') ano_mes,
    c.id_customer,
    c.nome,
    c.sobrenome,
    COUNT(oi.id_order) quantidade_vendas,
    SUM(oi.quantidade) quantidade_total_produtos,
    SUM(oi.preco_unitario * oi.quantidade) AS valor_total_transacionado
  
  FROM  orders o
    INNER JOIN customer c   ON o.id_vendedor = c.id_customer
    INNER JOIN orderitem oi ON o.id_order    = oi.id_order
    INNER JOIN item i       ON oi.id_item    = i.id_item
    INNER JOIN category cat ON i.id_category = cat.id_category
  WHERE
    cat.nome = 'Celulares'
    AND YEAR(o.data_pedido) = 2020
  GROUP BY
    FORMAT(o.data_pedido, 'yyyy-MM'), c.id_customer, c.nome, c.sobrenome
)
SELECT
  id_customer,
  nome,
  sobrenome,
  quantidade_vendas,
  quantidade_total_produtos,
  valor_total_transacionado,
  ano_mes

FROM
  VendasDoMes
where rank_ <= 5 -- filtro para os "5" principais que mais venderam
ORDER BY
  ano_mes, valor_total_transacionado DESC
  


/*
3. É solicitada uma nova tabela a ser preenchida com o preço e status dos Itens no final do dia.
   Lembre-se de que deve ser reprocessável. Vale ressaltar que na tabela Item teremos apenas o 
   último  status informado pelo PK definido. (Pode ser resolvido através de StoredProcedure)
*/


-- * CONFIRGURAR FERRAMENTA DE AGENDAMENTO PARA RODAR A PROCEDURE NO FINAL DO DIA
GO
CREATE PROCEDURE AtualizarItemStatus
AS
BEGIN
    INSERT INTO STATUSITEM_DAILY (id_item, preco, status, data_atualizacao)
    SELECT id_item, preco, status, GETDATE()
    FROM ITEM;
END;
GO