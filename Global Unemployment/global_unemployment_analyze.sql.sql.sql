ALTER TABLE public.disoccupazione 
ALTER COLUMN country TYPE varchar(100);

ALTER TABLE public.occupazione 
ALTER COLUMN country TYPE varchar(100);

ALTER TABLE public.disoccupazione 
RENAME COLUMN unemployment TO unemployment_rate;

ALTER TABLE public.occupazione 
RENAME COLUMN employment TO employment_rate;

ALTER TABLE public.mapping_list ALTER COLUMN "name" TYPE VARCHAR(100);


/* Create a global_data table: JOIN occupazione table and disoccupazione table
 * Add region field: LEFT JOIN mapping_list table
 * OUTPUT: iso_code, country, region, sex, age, year, unemployment_rate, employment_rate*/

WITH unemployments AS (
					SELECT *, 
					ROW_NUMBER() OVER () AS row_num_u
					FROM public.disoccupazione), 
	employments AS (
		SELECT *, 
		ROW_number() OVER () AS row_num_e
		FROM public.occupazione) 
SELECT u.iso_code,
		u.country,
		m.region,
		u.sex,
		u.age,
		u."year",
		u.unemployment_rate,
		e.employment_rate
FROM unemployments u
LEFT JOIN employments e ON u.row_num_u = e.row_num_e
LEFT JOIN mapping_list m ON u.country = m.name;
	
--In which countries is the gap between male and female unemployment rates the widest? -EGYPT-

-- 10 countries w highest unemployment gap between female and male
WITH female AS (
		SELECT country,
				sex,
				AVG(unemployment_rate) AS f_avg
		FROM global_data 
		WHERE sex = 'Female'
		GROUP BY country, sex),
male AS (
		SELECT country,
				sex,
				AVG(unemployment_rate) AS m_avg
		FROM global_data  
		WHERE sex = 'Male'
		GROUP BY country, sex)
SELECT f.country,
		f.f_avg - m.m_avg AS avg_unemployment_gap
FROM female f
LEFT JOIN male m ON f.country = m.country
ORDER BY avg_unemployment_gap DESC;


-- 10 countries w highest unemployment gap between male and female
WITH female AS (
		SELECT country,
				sex,
				AVG(unemployment_rate) AS f_avg
		FROM global_data  
		WHERE sex = 'Female'
			AND age = '15+'
		GROUP BY country, sex),
male AS (
		SELECT country,
				sex,
				AVG(unemployment_rate) AS m_avg
		FROM global_data  
		WHERE sex = 'Male'
			AND age = '15+'
		GROUP BY country, sex)
SELECT f.country,
		ROUND((f.f_avg - m.m_avg) :: DECIMAL (10,2),2)  AS gender_gap,
		ROUND(((f.f_avg - m.m_avg)/m.m_avg) :: DECIMAL (10,2),2) AS gender_gap_percentage
FROM female f
LEFT JOIN male m ON f.country = m.country
ORDER BY gender_gap DESC;

-- Has this gap narrowed significantly since 1991? -EGYPT-

WITH female AS (
		SELECT country,
				YEAR,
				sex,
				AVG(unemployment_rate) AS f_avg
		FROM global_data  
		WHERE sex = 'Female'
			AND country = 'Egypt'
		GROUP BY country, sex, year),
male AS (
		SELECT country,
				YEAR,
				sex,
				AVG(unemployment_rate) AS m_avg
		FROM global_data  
		WHERE sex = 'Male'
			AND country = 'Egypt'
		GROUP BY country, sex, year)
SELECT f.country,
		f.YEAR,
		f.f_avg - m.m_avg AS avg_unemployment_gap
FROM female f
LEFT JOIN male m ON f.year = m.YEAR;


--Which countries have experienced the highest volatility (frequent spikes and drops) in employment rates over the last 30 years? - North Macedonia

WITH cte AS (SELECT country, YEAR, AVG(unemployment_rate) AS unemployment_rate
			FROM global_data  
			GROUP BY country, YEAR)
SELECT country, MAX(cte.unemployment_rate) - MIN(cte.unemployment_rate) AS volatility_rate
FROM cte
WHERE country IS NOT NULL
GROUP BY country
ORDER BY volatility_rate DESC;

WITH cte AS (SELECT country, YEAR, AVG(employment_rate) AS employment_rate
			FROM global_data  
			GROUP BY country, YEAR)
SELECT country, MAX(cte.employment_rate) - MIN(cte.employment_rate) AS volatility_rate
FROM cte
WHERE country IS NOT NULL
GROUP BY country
ORDER BY volatility_rate DESC;


-- TOP countries unemployment recover rate after 5 year from Pandemic (2020) 
WITH un_2020 AS (SELECT country, 
						AVG(unemployment_rate) AS unemployment_2020
				FROM global_data 
				WHERE YEAR = 2020
				GROUP BY country, YEAR),
	un_2025 AS (SELECT country, 
						AVG(unemployment_rate) AS unemployment_2025
				FROM global_data  
				WHERE YEAR = 2025
				GROUP BY country, YEAR)			
SELECT  un_2020.country, 
		un_2020.unemployment_2020, 
		un_2025.unemployment_2025,
		(un_2025.unemployment_2025 - un_2020.unemployment_2020)/un_2020.unemployment_2020 *100 AS recover_rate
FROM un_2020 
LEFT JOIN un_2025 ON un_2020.country = un_2025.country
WHERE unemployment_2020 > 10 AND unemployment_2025 IS NOT NULL
ORDER BY recover_rate;

							