-- WINDOWED FUNCTIONS

SELECT x.*, product_name

FROM (

	SELECT 
	vendor_id
	,market_date
	,product_id
	,original_price
	,ROW_NUMBER() OVER (PARTITION BY vendor_id ORDER BY original_price DESC) AS price_rank

	FROM vendor_inventory
	) x
INNER JOIN product p
	ON x.product_id = p.product_id
	
WHERE x.price_rank = 1