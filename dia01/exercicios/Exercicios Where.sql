-- Databricks notebook source
-- 01 Lista de pedidos com mais de um item
SELECT
  idPedido
FROM
  silver_olist.item_pedido
group by
  idPedido
having(count (idPedido) > 1)

-- COMMAND ----------

-- 02 Lista de pedidos que o frete é mais caro que o item
select
  *
from
  silver_olist.item_pedido
where
  vlFrete > vlPreco

-- COMMAND ----------

-- 03 Lista de pedidos que ainda não foram enviados
select
  *
from
  silver_olist.pedido
where
  descSituacao IN (
    'approved',
    'invoiced',
    'created',
    'processing'
  )

-- COMMAND ----------

-- 04 Lista de pedidos que foram entregues com atraso
select
  *
from
  silver_olist.pedido
where
  dtEstimativaEntrega < dtEntregue

-- COMMAND ----------

-- 05 Lista de pedidos que foram entregues com 2 dias de antecedência.
select
  *,
  datediff(dtEntregue, dtEstimativaEntrega)
from
  silver_olist.pedido
where
  datediff(dtEntregue, dtEstimativaEntrega) = 2

-- COMMAND ----------

-- 06 Lista de pedidos feitos em dezembro de 2017 e entregues com atraso
select
  *
from
  silver_olist.pedido
where
  (
    year(dtPedido) = '2017'
    and month(dtPedido) = '12'
  )
  and dtEntregue > dtEstimativaEntrega;

-- COMMAND ----------

-- 07 Lista de pedidos com avaliação maior ou igual que 4
select
  *
from
  silver_olist.avaliacao_pedido
where
  vlNota >= 4

-- COMMAND ----------

-- 08 Lista de pedidos com 2 ou mais parcelas menores que R$20,00
select
  *,
  (vlPagamento / nrPacelas) as vlParcela
from
  silver_olist.pagamento_pedido
where
where
  nrPacelas > 1
  AND (vlPagamento / nrPacelas) < 20

-- COMMAND ----------

-- DBTITLE 1,Exercicios Case
-- 01 selecione todos os pedidos e marque se houve atraso ou não
select
  *,
  case
    when dtEntregue > dtEstimativaEntrega then 'atraso'
    else 'no prazo'
    end as Status
    from
      silver_olist.pedido

-- COMMAND ----------

--02 selecione os pedidos e defina os grupos em uma nova coluna
select
  *,
  case
    when vlPreco * 0.10 > vlFrete then '10%'
    when vlPreco * 0.10 <= vlFrete
    and vlPreco * 0.25 > vlFrete then '10% a 25%'
    when vlPreco * 0.25 <= vlFrete
    and vlPreco * 0.50 > vlFrete then '25% a 50%'
    else '50%'
  end as percentualFrete
from
  silver_olist.item_pedido

-- COMMAND ----------


