-- Databricks notebook source
-- Lista de vendedores que estão no estado com mais clientes

SELECT idVendedor, descUF
FROM silver_olist.vendedor 
WHERE descUF = (
  SELECT descUF 
  FROM silver_olist.cliente 
  GROUP BY descUF 
  ORDER BY COUNT(DISTINCT idClienteUnico) DESC
  LIMIT 1
  )

-- COMMAND ----------

-- Lista de vendedores que estão nos estados com mais clientes

SELECT idVendedor, descUF
FROM silver_olist.vendedor 
WHERE descUF IN (
  SELECT descUF 
  FROM silver_olist.cliente 
  GROUP BY descUF 
  ORDER BY COUNT(DISTINCT idClienteUnico) DESC
  LIMIT 2
  )

-- COMMAND ----------

WITH tbEstados AS (
  SELECT descUF 
  FROM silver_olist.cliente 
  GROUP BY descUF 
  ORDER BY COUNT(DISTINCT idClienteUnico) DESC
  LIMIT 2
  ),
  
tb_vendedores AS ()
  
SELECT idVendedor, 
       descUF
       
FROM silver_olist.vendedor 

WHERE descUF IN (SELECT * FROM tbEstados)

-- COMMAND ----------


