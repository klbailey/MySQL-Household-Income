# File 1
SELECT * 
FROM us_project.us_household_income;

# File 2
SELECT * 
FROM us_project.us_household_income_statistics;

# 1 Fix i>>?id in Column 1
ALTER TABLE us_project.us_household_income_statistics RENAME COLUMN `ï»¿id` TO `id`;

# 2 Count of ids; file 1 32292 file 2 32526 happens in mysql we are instructed to work with this raw data at this time
SELECT COUNT(id)
FROM us_project.us_household_income;

SELECT COUNT(id)
FROM us_project.us_household_income_statistics;

# 3 Look at file 1 to determine if there are too many of one - check for duplicates
SELECT id, COUNT(id)
FROM us_project.us_household_income
GROUP BY id
HAVING COUNT(id) > 1;

# 4 Identify the duplicates File 1
SELECT *
FROM (
	SELECT row_id, id, 
	ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
	FROM us_project.us_household_income
) duplicates
WHERE row_num > 1;

# 5 Remove the duplicates File 1
DELETE FROM us_household_income
WHERE row_id IN (
	SELECT row_id
	FROM (
		SELECT row_id, id, 
		ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
		FROM us_project.us_household_income
		) duplicates
	WHERE row_num > 1);
    
# 6 Look at file 2 to determine if there are too many of one - check for duplicates
SELECT id, COUNT(id)
FROM us_project.us_household_income_statistics
GROUP BY id
HAVING COUNT(id) > 1;

# There are no duplicates in file 1
# 7 Look at state name if lower case or misspelling
SELECT DISTINCT State_Name
FROM us_project.us_household_income
ORDER BY 1;

# 8 Correct georia to Georgia file 1
UPDATE  us_project.us_household_income
SET State_Name = 'Georgia'
WHERE State_Name = 'georia';

# 9 Correct alabama to Alabama file 1
UPDATE  us_project.us_household_income
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama';

# 10 Look at State_ab file 1
SELECT DISTINCT State_ab
FROM us_project.us_household_income
ORDER BY 1;

# Looks in order
# 11 Look at blank Place file 1
SELECT *
FROM us_project.us_household_income
WHERE Place = ''
ORDER BY 1;

# row_id 32 returned
# 12 Fix blank Place File 1 
SELECT *
FROM us_project.us_household_income
WHERE County = 'Autauga County'
ORDER BY 1;

UPDATE us_project.us_household_income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont';

# 13 Look at Type File 1
SELECT Type, COUNT(Type)
FROM us_project.us_household_income
GROUP BY Type;

# Borough/Boroughs should be same
UPDATE us_project.us_household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs';

# 14 Look at ALand and AWater in file 1 as there were 0s in these columns
SELECT DISTINCT ALand, AWater
FROM us_project.us_household_income
WHERE (ALand = 0 OR ALand = '' OR ALand IS NULL);

# Appears areas where there is water and no land Don't need to change 0 in ALand




