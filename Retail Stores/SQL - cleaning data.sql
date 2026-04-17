/* Check missing value: 
 
 | missing_item | missing_price | missing_quantity | missing_total | 
 |     1213     |      609      |      604         |      604      |
 
 */

SELECT COUNT(CASE WHEN item = '' THEN 1 END) AS missing_item,
	   COUNT(CASE WHEN price_per_unit IS NULL THEN 1 END) AS missing_price,
	   COUNT(CASE WHEN quantity IS NULL THEN 1 END) AS missing_quantity,
	   COUNT(CASE WHEN total_spent IS NULL THEN 1 END) AS missing_total
FROM raw_data


----Create Product list by category

WITH food AS (
			  SELECT category, item, AVG(price_per_unit) FROM retail_store_sales 
			  WHERE category = 'Food' AND item <> ''
			  GROUP BY category, item
			  ORDER BY item), --- Create Food menu: item code and price		  
	menu AS (
			 SELECT category, item, AVG(price_per_unit) FROM retail_store_sales 
			 WHERE category = 'Patisserie' AND item <> ''
			 GROUP BY category, item
		 	 ORDER BY item), --- Create Patisserie menu: item code and price
	milk_products AS (
			 SELECT category, item, AVG(price_per_unit) FROM retail_store_sales 
			 WHERE category = 'Milk Products' AND item <> ''
			 GROUP BY category, item
			 ORDER BY item), --- Create Milk Products menu: item code and price
	butchers AS (
			 SELECT category, item, AVG(price_per_unit) FROM retail_store_sales 
 			 WHERE category = 'Butchers' AND item <> ''
			 GROUP BY category, item
			 ORDER BY item), --- Create Butchers menu: item code and price
	beverages AS (
			 SELECT category, item, AVG(price_per_unit) FROM retail_store_sales 
			 WHERE category = 'Beverages' AND item <> ''
			 GROUP BY category, item
			 ORDER BY item), --- Create Beverages menu: item code and price
	computers_and_electric_accessories AS (
			 SELECT category, item, AVG(price_per_unit) FROM retail_store_sales 
			 WHERE category = 'Computers and electric accessories' AND item <> ''
			 GROUP BY category, item
			 ORDER BY item) --- Create Computers and electric Accessories menu: item code and price
SELECT * FROM beverages b 
UNION
SELECT * FROM butchers bu 
UNION 
SELECT * FROM computers_and_electric_accessories caea  
UNION 
SELECT * FROM electric_household_essentials ehe 
UNION 
SELECT * FROM food f 
UNION 
SELECT * FROM furniture fu 
UNION 
SELECT * FROM milk_products mp  
UNION 
SELECT * FROM patisserie p
ORDER BY category

--- Set '' value to NULL value for item field 

UPDATE retail_store_sales 
SET item = NULL 
WHERE item = ''

--- Fill missing data for price_per_unit field

UPDATE retail_store_sales 
SET price_per_unit = total_spent/quantity 
WHERE total_spent IS NOT NULL AND price_per_unit IS NULL AND  quantity IS NOT NULL

--- Join retail table and menu table to find missing item value 
SELECT r.item, m.item
FROM retail_store_sales r
LEFT JOIN menu m ON r.category = m. category AND r.price_per_unit = m.price
WHERE r.item IS NULL AND m.item IS NOT NULL;

--- Fill missing data for item field

UPDATE retail_store_sales r
SET item = m.item
FROM menu m
WHERE r.category = m.category 
  AND r.price_per_unit = m.price
  AND r.item IS NULL 
  AND m.item IS NOT NULL
  
--- Change data type for transaction_data field
  
ALTER TABLE retail_store_sales 
ALTER COLUMN transaction_data TYPE date
USING transaction_data::date


/* Check missing value after cleaning data:
 
 | missing_item | missing_price | missing_quantity | missing_total | 
 |       0      |       0       |      604         |      604      |
 
 */
 
SELECT COUNT(CASE WHEN item = '' THEN 1 END) AS missing_item,
	   COUNT(CASE WHEN price_per_unit IS NULL THEN 1 END) AS missing_price,
	   COUNT(CASE WHEN quantity IS NULL THEN 1 END) AS missing_quantity,
	   COUNT(CASE WHEN total_spent IS NULL THEN 1 END) AS missing_total
FROM retail_store_sales

--- Check number of customer_id before making decision of delete or keep missing data row: 25 customer_id
SELECT DISTINCT customer_id 
FROM retail_store_sales 
ORDER BY customer_id

/* Check: missing data of quantity and total for all 25 customer_id after cleaning:
 
 CUST_01: 22 rows| CUST_06: 21 rows| CUST_11: 22 rows| CUST_16: 21 rows|CUST_21: 22 rows|
 CUST_02: 21 rows| CUST_07: 30 rows| CUST_12: 20 rows| CUST_17: 31 rows|CUST_22: 27 rows|
 CUST_03: 19 rows| CUST_08: 26 rows| CUST_13: 26 rows| CUST_18: 33 rows|CUST_23: 32 rows|
 CUST_04: 19 rows| CUST_09: 21 rows| CUST_14: 18 rows| CUST_19: 30 rows|CUST_24: 24 rows|
 CUST_05: 28 rows| CUST_10: 20 rows| CUST_15: 18 rows| CUST_20: 27 rows|CUST_25: 26 rows|
 
 My decision: delete 604 rows / 12,575 rows */ 

SELECT COUNT(CASE WHEN customer_id = 'CUST_01' THEN 1 END) AS CUST_01_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_02' THEN 1 END) AS CUST_02_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_03' THEN 1 END) AS CUST_03_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_04' THEN 1 END) AS CUST_04_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_05' THEN 1 END) AS CUST_05_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_06' THEN 1 END) AS CUST_06_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_07' THEN 1 END) AS CUST_07_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_08' THEN 1 END) AS CUST_08_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_09' THEN 1 END) AS CUST_09_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_10' THEN 1 END) AS CUST_10_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_11' THEN 1 END) AS CUST_11_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_12' THEN 1 END) AS CUST_12_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_13' THEN 1 END) AS CUST_13_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_14' THEN 1 END) AS CUST_14_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_15' THEN 1 END) AS CUST_15_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_16' THEN 1 END) AS CUST_16_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_17' THEN 1 END) AS CUST_17_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_18' THEN 1 END) AS CUST_18_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_19' THEN 1 END) AS CUST_19_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_20' THEN 1 END) AS CUST_20_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_21' THEN 1 END) AS CUST_21_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_22' THEN 1 END) AS CUST_22_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_23' THEN 1 END) AS CUST_23_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_24' THEN 1 END) AS CUST_24_missing,
	   COUNT(CASE WHEN customer_id = 'CUST_25' THEN 1 END) AS CUST_25_missing
FROM retail_store_sales 
WHERE quantity IS NULL AND total_spent IS NULL

--- Delete 604 row of missing data

DELETE FROM retail_store_sales 
WHERE quantity IS NULL AND  total_spent IS NULL 

SELECT * FROM retail_store_sales

--- Check duplicate row

SELECT *, row_number() OVER(PARTITION BY transaction_id, customer_id, category, item, price_per_unit, quantity, total_spent, payment_menthod, LOCATION, transaction_data, discount_applied)
FROM retail_store_sales
