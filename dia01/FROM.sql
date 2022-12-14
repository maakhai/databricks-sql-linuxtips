-- Databricks notebook source
SELECT
  *
FROM
  silver_olist.--leia-se selecione tudo da tabela silver_olist.pedido

-- COMMAND ----------

SELECT
  *,
  datediff(dtEstimativaEntrega, dtEntregue) AS qtDiasPromessaEntrega
FROM
  silver_olist.pedido

-- COMMAND ----------


