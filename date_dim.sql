--Creating the table date_dim
CREATE TABLE date_dim (Date_ID bigint, Date date);


--Generating Surrogates
INSERT INTO Date_Dim (Date, Date_ID)
SELECT s."Date", 
COALESCE(max_values.max_date_id, 0) + ROW_NUMBER() OVER (ORDER BY s."Date") AS Date_ID
FROM (SELECT DISTINCT "Date" FROM public.stocks) s
LEFT JOIN Date_Dim d ON s."Date" = d.Date
CROSS JOIN (SELECT MAX(Date_ID) AS max_date_id FROM Date_Dim) max_values  
WHERE d.Date IS NULL
GROUP BY s."Date", max_values.max_date_id;