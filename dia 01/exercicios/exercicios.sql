-- Databricks notebook source
-- 01 Selecione todos os clientes paulistanos
select
  *
from
  silver_olist.cliente
where
  descCidade = 'sao paulo'

-- COMMAND ----------

-- 02 Selecione todos os clientes paulistas
select
  *
from
  silver_olist.cliente
where
  descUF = 'SP'

-- COMMAND ----------

-- 03 Selecione todos vendedores cariocas e paulistas
select
  *
from
  silver_olist.vendedor
where
  descUF = 'SP'
  or descCidade = 'rio de janeiro'

-- COMMAND ----------

-- 04 Selecione produros de perfuria e bebe com altura maior que 5cm

SELECT * FROM silver_olist.produto WHERE descCategoria IN ('perfumaria', 'bebes') and vlAlturaCm > 5

-- COMMAND ----------


