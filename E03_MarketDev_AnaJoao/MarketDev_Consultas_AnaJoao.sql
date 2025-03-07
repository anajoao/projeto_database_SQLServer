USE [MarketDev_RS_P1];

GO


-- 21. Listagem dos produtos por cor, categoria e subcategoria 

SELECT
	IIF(p.Color IS NULL, '<...>', p.Color) AS'Color',
	c.CategoryName AS'Category',
	s.SubcategoryName AS'Subcategory',
	p.ProductName AS'Product',
	IIF(p.SizeUnitMeasureCode IS NULL, '', LOWER(p.SizeUnitMeasureCode)) AS'Size unit'
FROM
	[Marketing].[Product] AS p
INNER JOIN
	[Marketing].[Subcategory] AS s
ON
	p.SubcategoryID = s.SubcategoryID
INNER JOIN
	[Marketing].[Category] AS c
ON
	s.CategoryID = c.CategoryID
ORDER BY
	'Color',
	'Category',
	'Subcategory';
GO


-- 22. Listagem do tempo de venda dos produtos 

SELECT
	DATEDIFF(yy, [SellStartDate], [SellEndDate]) AS'Sell years',
	DATEDIFF(mm, [SellStartDate], [SellEndDate]) AS'Sell months',
	DATEDIFF(dd, [SellStartDate], [SellEndDate]) AS'Sell days',
	FORMAT([SellStartDate], 'd', 'pt-PT') AS'Sell start',
	FORMAT([SellEndDate], 'd', 'pt-PT') AS'Sell end',
	[ProductName] AS'Product',
	FORMAT([ListPrice], 'C', 'pt-PT') AS'List price'
FROM
	[Marketing].[Product]
WHERE
	DATEDIFF(dd, [SellStartDate], [SellEndDate]) IS NOT NULL AND
	DATEDIFF(mm, [SellStartDate], [SellEndDate]) IS NOT NULL AND
	[Color] IS NOT NULL
ORDER BY
	'Sell years' DESC,
	'Product';
GO 

-- 23. Estatísticas dos preços dos produtos mais representativos, pelo menos 10, agrupados por cor

SELECT
	COUNT([ProductID]) AS'Total',
	[Color] AS'Color',
	FORMAT(MIN([ListPrice]), 'C', 'pt-PT') AS'Minimum list price',
	FORMAT(MAX([ListPrice]), 'C', 'pt-PT') AS'Maximum list price',
	FORMAT(AVG([ListPrice]), 'C', 'pt-PT') AS'Average list price'

FROM
	[Marketing].[Product]
WHERE
	[Color] IS NOT NULL
GROUP BY
	[Color]
HAVING
	COUNT([ProductID]) >= 10
ORDER BY
	'Total' DESC;
GO

-- 24. Listagem dos vendedores europeus com e-mail automático

DECLARE @at AS nchar (1) = '@';
DECLARE @domain AS nvarchar(25) = 'restart.com';

SELECT
	CONCAT_WS(' ', s.FirstName, UPPER(s.LastName)) AS'Salesperson',
	LOWER(CONCAT(s.FirstName, '.', s.LastName, '_', REPLACE(st.Country, ' ', ''), '.', st.Region, @at, @domain)) AS'E-mail', 
	st.Country AS'Country',
	st.Region AS'Region'
FROM
	[Marketing].[SalesTerritory] AS st
INNER JOIN
	[Marketing].[Salesperson] AS s
ON
	st.SalesTerritoryID = s.SalesTerritoryID
WHERE
	st.Region = 'Europe'
ORDER BY
	'Salesperson';
GO


-- 25. Contagem dos vendedores por país e por região

SELECT
	st.Region AS'Region',
	st.Country AS'Country',
	COUNT([SalespersonID]) AS'Total salesperson'
FROM
	[Marketing].[SalesTerritory] AS st
INNER JOIN
	[Marketing].[Salesperson] AS s
ON
	st.SalesTerritoryID = s.SalesTerritoryID
GROUP BY
	st.Region,
	st.Country
ORDER BY
	'Region';
GO


-- 26. Prospetores que têm de atualizar, por telefone, o email

SELECT
	CONCAT_WS(' ', [FirstName], [MiddleName], [LastName]) AS'Prospecter',
	COALESCE([CellPhoneNumber], [HomePhoneNumber], [WorkPhoneNumber]) AS'Contact number',
	CASE
		WHEN [EmailAddress] IS NULL THEN '<to be updated>' 
		ELSE [EmailAddress]
	END AS'E-mail'
FROM
	[Marketing].[Prospect]
WHERE
	[EmailAddress] IS NULL
ORDER BY
	'Prospecter';
GO


-- 27. Quais os modelos que não têm produtos

SELECT
	m.ProductModel AS'Product model',
	d.Description AS'Product description'
FROM
	[Marketing].[ProductModel] AS m
LEFT OUTER JOIN
	[Marketing].[Product] AS p
ON
	m.ProductModelID = p.ProductID
LEFT OUTER JOIN
	[Marketing].[ProductDescription] AS d
ON
	m.ProductModelID = d.ProductModelID
WHERE
	p.ProductID IS NULL AND
	d.Description IS NULL
GO


-- 28. Listagem multilíngua das bicicletas

SELECT
	m.ProductModel,
	p.ProductName,
	p.ProductNumber,
	l.LanguageName,
	d.Description
FROM
	[Marketing].[ProductModel] AS m
INNER JOIN
	[Marketing].[Product] AS p
ON
	m.ProductModelID = p.ProductModelID
INNER JOIN
	[Marketing].[ProductDescription] AS d
ON
	m.ProductModelID = d.ProductModelID
INNER JOIN
	[Marketing].[Language] AS l
ON
	d.LanguageID = l.LanguageID
WHERE
	m.ProductModel LIKE '%bike%'
ORDER BY
	m.ProductModel,
	l.LanguageName;
GO
	

-- 29. Listagens das línguas e respetivo código ISO



SELECT
	[LanguageName] AS'Language name',
	CASE 
		WHEN [LanguageName] = 'Arabic' THEN CONCAT_WS('-', SUBSTRING([LanguageID], 1, 2), UPPER('ae')) 
		WHEN [LanguageName] = 'Chinese' THEN CONCAT_WS('-', SUBSTRING([LanguageID], 1, 2), UPPER('cn'))
		WHEN [LanguageName] = 'English' THEN CONCAT_WS('-', SUBSTRING([LanguageID], 1, 2), UPPER('us'))
		WHEN [LanguageName] = 'Hebrew' THEN CONCAT_WS('-', SUBSTRING([LanguageID], 1, 2), UPPER('il'))
		ELSE CONCAT_WS('-', SUBSTRING([LanguageID], 1, 2), UPPER(SUBSTRING([LanguageID], 1, 2)))
	END AS'ISO language code'
FROM
	[Marketing].[Language]
WHERE
	[LanguageID] <> ''
ORDER BY
	[LanguageName];
GO


-- 30. Data prevista de entrega dos produtos

--v1: Data do output do exercício

DECLARE @date AS date = '2023-11-01';

SELECT
	[ProductName] AS'Product',
	[DaysToManufacture] AS'Days to manufacture',
	FORMAT(DATEADD(d, [DaysToManufacture], @date), 'd', 'pt-PT') AS'Delivery date'
FROM
	[Marketing].[Product]
WHERE
	[DaysToManufacture] >= 2
ORDER BY
	[DaysToManufacture],
	[ProductName];
GO

--v2 data atual

SELECT
	[ProductName] AS'Product',
	[DaysToManufacture] AS'Days to manufacture',
	FORMAT(DATEADD(d, [DaysToManufacture], GETDATE()), 'd', 'pt-PT') AS'Delivery date'
FROM
	[Marketing].[Product]
WHERE
	[DaysToManufacture] >= 2
ORDER BY
	[DaysToManufacture],
	[ProductName];
GO