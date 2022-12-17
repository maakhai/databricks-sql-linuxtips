-- Databricks notebook source
SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) as qtClienteEstado
FROM
  silver_olist.cliente
GROUP BY descUF
ORDER BY 2
  

-- COMMAND ----------


