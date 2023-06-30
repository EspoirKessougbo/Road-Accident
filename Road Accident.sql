SELECT * FROM luke.roadaccident;

-- Total Casualties taken place after the accident
SELECT sum(Number_of_Casualties) AS `Total Casualties`
FROM roadaccident;
-- The total asualties takes place after the accident is 417883

-- Checking the types of accident_Severity
SELECT DISTINCT(Accident_Severity)
FROM roadaccident;
-- I noticed a typo error "Fetal" instead of "Fatal"

-- I am correcting the typo error by updating the table
-- UPDATE roadaccident
-- SET Accident_Severity = "Fatal"
-- WHERE Accident_Severity = "Fetal";

-- Total Casualies & percentage of total with respect to accident severity 

WITH CTE_Accident AS (SELECT DISTINCT(Accident_Severity),
 sum(Number_of_Casualties) AS Total
FROM roadaccident
GROUP BY Accident_Severity)
SELECT DISTINCT(Accident_Severity), 
Total/(SELECT sum(Number_of_Casualties) 
FROM roadaccident) AS `Accident%`
FROM CTE_Accident;


SELECT Accident_severity ,sum(Number_of_Casualties) As Number_of_Casualties
-- /(SELECT sum(Number_of_Casualties) FROM roadaccident) AS CasualityRate
FROM roadaccident
WHERE Accident_severity= "Serious";

SELECT `Accident Date`, Accident_Severity ,Number_of_Casualties
FROM roadaccident
WHERE Accident_Severity="serious";

SELECT Accident_severity ,SUM(Number_of_Casualties) AS Number_of_Casualties
-- /(SELECT sum(Number_of_Casualties) FROM roadaccident) AS CasualityRate
FROM roadaccident
WHERE Accident_severity= "Fatal";

SELECT Accident_severity ,SUM(Number_of_Casualties) AS Number_of_Casualties
-- /(SELECT sum(Number_of_Casualties) FROM roadaccident) AS CasualityRate
FROM roadaccident
WHERE Accident_severity= "Slight";

-- Checking the type of vehicle
SELECT DISTINCT(Vehicle_Type) , SUM(Number_of_Casualties)
FROM roadaccident
GROUP BY 1;


-- Total Casualties with respect to vehicle type
SELECT DISTINCT(Vehicle_Type) , SUM(Number_of_Casualties)
FROM roadaccident
GROUP BY 1;

-- Monthly trend showing comparison of casualties for Current Year and Previous Year
-- SELECT Number_of_Casualties , `Accident Date`
-- FROM roadaccident
-- WHERE `Accident Date` BETWEEN '1/1/2021' AND '31/12/2021'
-- ORDER BY `Accident Date`;

-- SELECT Number_of_Casualties , `Accident Date`
-- FROM roadaccident
-- WHERE `Accident Date` > '1/1/2022'
-- ORDER BY `Accident Date`;


-- Maximum casualties by Road Type
SELECT DISTINCT(Road_Type) , SUM(Number_of_Casualties)
FROM roadaccident
GROUP BY 1;

-- Distribution of total casualties by Road Surface
SELECT DISTINCT(Road_Surface_Conditions) , SUM(Number_of_Casualties)
FROM roadaccident
GROUP BY 1;

-- Upading the blank road_surface_conditions table to unspecified
--  UPDATE roadaccident
-- SET Road_Surface_Conditions ="unspecified"
-- WHERE Road_Surface_Conditions = 'NULL';

-- Relation between Casualties by Area/Location & by Day/Night

-- By rural Area and By day/night
SELECT Urban_or_Rural_Area,Light_Conditions, SUM(Number_of_Casualties)
FROM roadaccident
WHERE Urban_or_Rural_Area ='Rural' AND Light_Conditions= 'Daylight';

SELECT Urban_or_Rural_Area,Light_Conditions, SUM(Number_of_Casualties)
FROM roadaccident
WHERE Urban_or_Rural_Area ='Rural' AND  Light_Conditions LIKE 'Darkness%'
GROUP BY 1,2;
 
 -- by urban area and by day/night
 SELECT Urban_or_Rural_Area,Light_Conditions, SUM(Number_of_Casualties)
FROM roadaccident
WHERE Urban_or_Rural_Area ='Urban' AND Light_Conditions= 'Daylight';

SELECT Urban_or_Rural_Area,Light_Conditions, SUM(Number_of_Casualties)
FROM roadaccident
WHERE Urban_or_Rural_Area ='Urban' AND  Light_Conditions LIKE 'Darkness%'
GROUP BY 1,2;



