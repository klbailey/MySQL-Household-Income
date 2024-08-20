SELECT * 
FROM us_project.us_household_income;

# Look at water and land by state largest to smallest
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_project.us_household_income
GROUP BY State_Name
ORDER BY 2 DESC;

# Look at water who has most lakes, streams, etc 
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_project.us_household_income
GROUP BY State_Name
ORDER BY 3 DESC;

# Identify top 10 largest states by land
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_project.us_household_income
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10;

# Identify top 10 largest states by water
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_project.us_household_income
GROUP BY State_Name
ORDER BY 3 DESC
LIMIT 10;

# Tie 2 tables together JOIN by id from statistics table and if not in income because not all imported leave blank
SELECT * 
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN != 0; # Filter out those not reported 

# Look at some categorical data
SELECT u.State_Name, County, Type, `Primary`, Mean, Median
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN != 0;
    
# Look at mean By state what is average income 
SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN != 0
GROUP BY u.State_Name
ORDER BY 2 # column 2 mean
LIMIT 5; # what is lowest

SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN != 0
GROUP BY u.State_Name
ORDER BY 2 DESC
LIMIT 10; # what is highest

# Look at median By state what is median income 
SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN != 0
GROUP BY u.State_Name
ORDER BY 3 DESC # column 3 Median
LIMIT 10; # what is highest

SELECT u.State_Name, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN != 0
GROUP BY u.State_Name
ORDER BY 3 ASC
LIMIT 10; # what is lowest
   
# Look at Type
SELECT Type, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN != 0
GROUP BY 1
ORDER BY 2 DESC # High to low
LIMIT 10; 

# With the following Municipality doesn't get listed unless change LIMIT from 10 to 20
SELECT Type, COUNT(TYPE), ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN != 0
GROUP BY 1
ORDER BY 3 DESC # High to low
LIMIT 20; 

# There is only 1 Municipality when limit 20 so average is high
# Look at median:
SELECT Type, COUNT(TYPE), ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN != 0
GROUP BY 1
ORDER BY 4 DESC # High to low
LIMIT 20; 

# CDP is high Community, Urban, County, very low
# What state has Community?
SELECT *
FROM us_household_income
WHERE Type = 'Community';

# It's Puerto Rico
# Can filter out some outliers
SELECT Type, COUNT(TYPE), ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
WHERE MEAN != 0
GROUP BY 1
HAVING COUNT(TYPE) > 100
ORDER BY 4 DESC # High to low
LIMIT 20; 

# Look at data again
SELECT * 
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
	ON u.id = us.id;
    
# Big cities, LA, Dallas, see what their salaries are
SELECT u.State_Name, City, ROUND(AVG(Mean), 1), ROUND(AVG(Median), 1)
FROM us_project.us_household_income u
INNER JOIN us_project.us_household_income_statistics us
	ON u.id = us.id
GROUP BY u.State_Name, City
ORDER BY ROUND(AVG(Mean), 1) DESC; #highest average hh income city

# Highest Delta Junction, Alaska 242857.0; May cap out at 3000000.0?