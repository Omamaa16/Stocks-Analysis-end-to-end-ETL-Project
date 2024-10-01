INSERT INTO "Location_Dim" ("Location_ID", "Country", "City", "State")
SELECT 
    COALESCE(x.max_loc_id, 0) + ROW_NUMBER() OVER (ORDER BY s."Country", s."City") AS Location_ID,
    s."Country", s."City", s."State"
FROM (SELECT DISTINCT "Country", "City", "State" FROM public.companies) s
LEFT JOIN "Location_Dim" d ON s."Country"=d."Country" and s."City"=d."City" and s."State"=d."State"
CROSS JOIN (SELECT MAX("Location_ID") AS max_loc_id FROM "Location_Dim") x  -- Alias for the global max Exchange_ID
WHERE d."Location_ID" IS NULL  -- Check for NULL on the surrogate key to avoid inserting existing exchanges
GROUP BY s."Country", s."City", s."State", x.max_loc_id;