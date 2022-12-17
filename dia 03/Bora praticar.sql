-- Databricks notebook source
-- 01 Qual categoria tem mais produtos vendidos
SELECT T2.descCategoria,
  COUNT(*) AS qntItens
  
FROM silver_olist.item_pedido AS T1
  
LEFT JOIN silver_olist.produto AS T2 
  ON T1.idProduto = T2.idProduto
  
GROUP BY T2.descCategoria
  
ORDER BY count(*) DESC
  

-- COMMAND ----------

-- 02 Qual categoria tem os produtos mais caros em média

SELECT 
       T2.descCategoria,
       AVG(T1.vlPreco)
  
FROM silver_olist.item_pedido AS T1

LEFT JOIN silver_olist.produto AS T2 
  ON T1.idProduto = T2.idProduto
  
  GROUP BY T2.descCategoria
  ORDER BY AVG(T1.vlPreco) DESC
  

-- COMMAND ----------

-- 03 Os clientes de qual estado pagam mais frete

SELECT 
       T3.descUF,
       ROUND(AVG(T1.vlFrete),2)

FROM silver_olist.item_pedido AS T1

LEFT JOIN silver_olist.pedido AS T2
  ON T1.idPedido = T2.idPedido
  
LEFT JOIN silver_olist.cliente AS T3
  ON T2.idCliente = T3.idCliente
  
GROUP BY T3.descUF

HAVING AVG(T1.vlFrete) > 40

ORDER BY AVG(T1.vlFrete) DESC
  

-- COMMAND ----------


