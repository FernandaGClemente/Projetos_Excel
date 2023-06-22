/****** Script do comando SelectTopNRows de SSMS  ******/
SELECT TOP (1000) [Date]
      ,[Day]
      ,[Month]
      ,[Year]
      ,[Customer_Age]
      ,[Age_Group]
      ,[Customer_Gender]
      ,[Country]
      ,[State]
      ,[Product_Category]
      ,[Sub_Category]
      ,[Product]
      ,[Order_Quantity]
      ,[Unit_Cost]
      ,[Unit_Price]
      ,[Profit]
      ,[Cost]
      ,[Revenue]
  FROM [Projeto_SQL_CycleBike].[dbo].[Original]

SELECT [Product_Category], [Country], [Year], SUM([Order_Quantity]) AS vendas
FROM [Projeto_SQL_CycleBike].[dbo].[Original]
GROUP BY [Product_Category], [Country], [Year]
ORDER BY [Country], [Product_Category], vendas DESC;

SELECT [Sub_Category], COUNT(*) AS total
FROM [Projeto_SQL_CycleBike].[dbo].[Original]
GROUP BY [Sub_Category]
ORDER BY total DESC

SELECT [Month], [Year], [Sub_Category], SUM([Order_Quantity]) AS vendas
FROM [Projeto_SQL_CycleBike].[dbo].[Original]
GROUP BY [Month], [Year], [Sub_Category]
ORDER BY vendas DESC;

SELECT [Country], [State], [Customer_Gender], AVG([Customer_Age]) AS idade_media 
FROM [Projeto_SQL_CycleBike].[dbo].[Original]
GROUP BY [Country], [State], [Customer_Gender] 
ORDER BY [Country], [State], [Customer_Gender];

SELECT [Product], SUM([Order_Quantity]) AS vendas, SUM([Order_Quantity]) - 100000 AS necessidade_reposicao 
FROM [Projeto_SQL_CycleBike].[dbo].[Original]
GROUP BY [Product] ORDER BY necessidade_reposicao DESC;

SELECT produto, SUM(lucro) AS lucro_total, AVG(lucro) AS lucro_medio, AVG(preco_por_unidade) AS preco_medio
FROM tabela_vendas
GROUP BY produto ORDER BY lucro_total DESC;

SELECT produto, ((SUM(lucro) / SUM(receita)) * 100) AS margem_lucro_percentual FROM tabela_vendas
GROUP BY produto ORDER BY margem_lucro_percentual DESC;

SELECT pedido, produto, quantidade_pedido, custo_por_unidade, preco_por_unidade, (preco_por_unidade - custo_por_unidade) AS lucro FROM tabela_pedidos ORDER BY pedido;

SELECT produto, AVG(classificacao) AS classificacao_media FROM tabela_feedback
GROUP BY produto ORDER BY classificacao_media DESC;

SELECT mes, ano, categoria_produto, SUM(quantidade_pedido) AS vendas FROM tabela_vendas
WHERE pais = 'Europa' AND ano = 2023 
GROUP BY mes, ano, categoria_produto ORDER BY ano, mes, categoria_produto;

SELECT produto, COUNT(*) AS concorrentes FROM tabela_concorrencia
GROUP BY produto ORDER BY concorrentes DESC;
