INSERT INTO company_dim ("Company_ID", "Exchange_ID", "Location_ID", "Symbol_ID", "Name", "Industry")
SELECT 
    COALESCE(c.max_company_id, 0) + ROW_NUMBER() OVER (ORDER BY comp."Name") AS Company_ID,
    e."Exchange_ID",     -- Fetch from exchange_dim
    l."Location_ID",     -- Fetch from location_dim
    sy."Symbol_ID",      -- Fetch from symbol_dim
    comp."Name",         -- Fetch directly from companies table
    comp."Industry"      -- Fetch directly from companies table
FROM (SELECT DISTINCT "Name", "Exchange", "Country", "City", "State", "Symbol", "Industry" FROM public.companies) comp
-- Join with exchange_dim to get Exchange_ID
LEFT JOIN exchange_dim e ON comp."Exchange" = e."Exchange"
-- Join with location_dim to get Location_ID
LEFT JOIN "Location_Dim" l ON comp."Country" = l."Country" 
    AND comp."City" = l."City" 
    AND comp."State" = l."State"
-- Join with symbol_dim to get Symbol_ID
LEFT JOIN symbol_dim sy ON comp."Symbol" = sy."Symbol"
-- Get the max Company_ID from company_dim to assign a new surrogate key
CROSS JOIN (SELECT MAX("Company_ID") AS max_company_id FROM company_dim) c
WHERE e."Exchange_ID" IS NOT NULL     -- Ensure that the exchange exists in the exchange_dim table
  AND l."Location_ID" IS NOT NULL     -- Ensure that the location exists in the location_dim table
  AND sy."Symbol_ID" IS NOT NULL      -- Ensure that the symbol exists in the symbol_dim table
  AND comp."Name" IS NOT NULL         -- Avoid inserting companies with missing names
GROUP BY e."Exchange_ID", l."Location_ID", sy."Symbol_ID", comp."Name", comp."Industry", c.max_company_id;

