-- preferenciasGerais

SELECT IIF(p.pref_cozinha = 5, 1, 0) AS Cozinha, IIF(p.pref_jantar = 2, 1, 0) AS Jantar, IIF(p.pref_quarto = 3, 1, 0) AS Quarto, 
IIF(p.pref_estar = 1, 1, 0) AS Estar, IIF(p.pref_escritorio = 4, 1, 0) AS Escritorio
FROM dt_preferencias_categorias AS p
WHERE p.email = @email

-- recomendaçãoCozinha
SELECT TOP 1 S.ProductName, S.ImageUrlBig, CONCAT('https://www.madesa.com', S.DetailUrl) AS DetailUrl, FORMAT(S.Price, 'C2', 'pt-BR') AS Price, 
FORMAT(S.ListPrice, 'C2', 'pt-BR') AS ListPrice, IIF(S.ListPrice > S.Price, 1, 0) AS MOSTRA
FROM dt_Product AS P
INNER JOIN dt_Sku AS S
ON S.ProductID = P.ProductID
INNER JOIN dt_preferencias_categorias AS PC ON PC.email = @email
WHERE PC.pref_cozinha = 5 AND
S.IsActive = 1
ORDER BY NEWID()

-- recomendaçõesJantar
SELECT TOP 2 S.ProductName, S.ImageUrlBig, CONCAT('https://www.madesa.com', S.DetailUrl) AS DetailUrl, FORMAT(S.Price, 'C2', 'pt-BR') AS Price, 
FORMAT(S.ListPrice, 'C2', 'pt-BR') AS ListPrice, IIF(S.ListPrice > S.Price, 1, 0) AS MOSTRA
FROM dt_Product AS P
INNER JOIN dt_Sku AS S
ON S.ProductID = P.ProductID
INNER JOIN dt_preferencias_categorias AS PC ON PC.email = @email
WHERE PC.pref_jantar = 2 AND
S.IsActive = 1
ORDER BY NEWID()

-- recomendaçõesQuarto
SELECT TOP 2 S.ProductName, S.ImageUrlBig, CONCAT('https://www.madesa.com', S.DetailUrl) AS DetailUrl, FORMAT(S.Price, 'C2', 'pt-BR') AS Price, 
FORMAT(S.ListPrice, 'C2', 'pt-BR') AS ListPrice, IIF(S.ListPrice > S.Price, 1, 0) AS MOSTRA
FROM dt_Product AS P
INNER JOIN dt_Sku AS S
ON S.ProductID = P.ProductID
INNER JOIN dt_preferencias_categorias AS PC ON PC.email = @email
WHERE PC.pref_quarto = 3 AND
S.IsActive = 1
ORDER BY NEWID()

-- recomendaçõesEstar
SELECT TOP 2 S.ProductName, S.ImageUrlBig, CONCAT('https://www.madesa.com', S.DetailUrl) AS DetailUrl, FORMAT(S.Price, 'C2', 'pt-BR') AS Price, 
FORMAT(S.ListPrice, 'C2', 'pt-BR') AS ListPrice, IIF(S.ListPrice > S.Price, 1, 0) AS MOSTRA
FROM dt_Product AS P
INNER JOIN dt_Sku AS S
ON S.ProductID = P.ProductID
INNER JOIN dt_preferencias_categorias AS PC ON PC.email = @email
WHERE PC.pref_estar = 1 AND
S.IsActive = 1
ORDER BY NEWID()

-- recomendaçõesEscritorio
SELECT TOP 2 S.ProductName, S.ImageUrlBig, CONCAT('https://www.madesa.com', S.DetailUrl) AS DetailUrl, FORMAT(S.Price, 'C2', 'pt-BR') AS Price, 
FORMAT(S.ListPrice, 'C2', 'pt-BR') AS ListPrice, IIF(S.ListPrice > S.Price, 1, 0) AS MOSTRA
FROM dt_Product AS P
INNER JOIN dt_Sku AS S
ON S.ProductID = P.ProductID
INNER JOIN dt_preferencias_categorias AS PC ON PC.email = @email
WHERE PC.pref_escritorio = 4 AND
S.IsActive = 1
ORDER BY NEWID()

/*
00000
00001
00010
00011
00100
00101
00110
00111
01000
01001
01010
01011
01100
01101
01110
01111
10000
10001
10010
10011
10100
10101
10110
10111
11000
11001
11010
11011
11100
11101
11110
11111
*/