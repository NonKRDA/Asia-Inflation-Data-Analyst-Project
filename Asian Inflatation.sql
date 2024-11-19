-- Show Table
SELECT * FROM inflatea.inflations_a;

-- Count Row
-- Count the total number of records in the dataset.
SELECT COUNT(*) Count_Row
FROM inflations_a;

-- Unique Region
-- List all unique RegionalMember values.
SELECT DISTINCT RegionalMember 
FROM inflations_a;

-- Average Inflation Rate
-- Calculate the average inflation rate for all regions.
SELECT ROUND(AVG(Inflation),2) as avg_inflatation
FROM inflations_a;

-- Group by Region
-- Find the average inflation rate per RegionalMember
SELECT RegionalMember, ROUND(AVG(Inflation),2) AS AvgInflation 
FROM inflations_a 
GROUP BY RegionalMember;

-- Filter by Year
-- Get records where the year is greater than 2020
SELECT * FROM inflations_a WHERE Year > 2020;


-- Find regions with an average inflation rate above 5%
SELECT RegionalMember, ROUND(AVG(Inflation),2) AS AvgInflation 
FROM inflations_a 
GROUP BY RegionalMember 
HAVING AVG(Inflation) > 5;

-- Calculate the average inflation rate per subregion, excluding those with missing Subregion.
SELECT Subregion, AVG(Inflation) AS AvgInflation 
FROM inflations_a 
WHERE Subregion IS NOT NULL 
GROUP BY Subregion;

-- Rank regions by their average inflation in 2022.
SELECT RegionalMember, AVG(Inflation) AS AvgInflation, 
       DENSE_RANK() OVER (ORDER BY AVG(Inflation) DESC) AS Ranking
FROM inflations_a 
WHERE Year = 2022
GROUP BY RegionalMember;

-- Maximum and Minimum Inflation per Region:
SELECT RegionalMember, 
       MAX(Inflation) AS MaxInflation, 
       MIN(Inflation) AS MinInflation 
FROM inflations_a 
GROUP BY RegionalMember;

-- Categorize inflation rates as "Low", "Medium", "High" 
-- based on predefined thresholds and create a new column.
SELECT RegionalMember, Year, Inflation,
       CASE 
         WHEN Inflation < 2 THEN 'Low'
         WHEN Inflation BETWEEN 2 AND 4 THEN 'Medium'
         ELSE 'High'
       END AS InflationCategory
FROM inflations_a;


