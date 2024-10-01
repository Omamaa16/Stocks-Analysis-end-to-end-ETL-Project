INSERT INTO "Stocks_F" ("Stock_ID", "Company_ID", "Date_ID", "Dividends", "Price_at_Closing", 
"Max_Value", "Min_Value", "Price_at_Opening", "Volume", "Marketcap", "Revenuegrowth", 
"Currentprice", "Weight")
SELECT COALESCE(max_stock_id, 0) + ROW_NUMBER() OVER (ORDER BY s."Symbol", s."Date") AS Stock_ID, 
c."Company_ID", d."date_id", s."Dividends", s."Price_at_Closing", s."Max_Value", s."Min_Value", 
s."Price_at_Opening", s."Volume", comp."Marketcap", comp."Revenuegrowth", comp."Currentprice", 
comp."Weight"
FROM public.stocks s
LEFT JOIN symbol_dim sym ON s."Symbol" = sym."Symbol"
LEFT JOIN company_dim c ON sym."Symbol_ID" = c."Symbol_ID"
LEFT JOIN date_dim d ON s."Date" = d."date"
LEFT JOIN public.companies comp ON s."Symbol" = comp."Symbol"
CROSS JOIN (SELECT MAX("Stock_ID") AS max_stock_id FROM "Stocks_F") x
WHERE c."Company_ID" IS NOT NULL AND d."date_id" IS NOT NULL
GROUP BY s."Symbol", s."Date", c."Company_ID", d."date_id", s."Dividends", s."Price_at_Closing", s."Max_Value", 
s."Min_Value", s."Price_at_Opening", s."Volume", comp."Marketcap", comp."Revenuegrowth", 
comp."Currentprice", comp."Weight", x.max_stock_id;
