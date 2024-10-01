INSERT INTO exchange_dim ("Exchange_ID", "Exchange")
SELECT 
    COALESCE(x.max_exchange_id, 0) + ROW_NUMBER() OVER (ORDER BY s."Exchange") AS Exchange_ID,
    s."Exchange"
FROM (SELECT DISTINCT "Exchange" FROM public.companies) s
LEFT JOIN exchange_dim d ON s."Exchange" = d."Exchange"
CROSS JOIN (SELECT MAX("Exchange_ID") AS max_exchange_id FROM exchange_dim) x  -- Alias for the global max Exchange_ID
WHERE d."Exchange_ID" IS NULL  -- Check for NULL on the surrogate key to avoid inserting existing exchanges
GROUP BY s."Exchange", x.max_exchange_id;