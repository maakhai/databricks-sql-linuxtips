-- Databricks notebook source
SELECT
  descUF,
  COUNT(idVendedor) AS qtVendedores
  
FROM silver_olist.vendedor

WHERE descUF IN ('SP','RJ','MG','ES')
  
GROUP BY descUF

HAVING COUNT(idVendedor) >= 100

ORDER BY qtVendedores DESC

-- COMMAND ----------


