# MySQL-Household-Income

Project Summary: Data Cleaning Process
- Identify and Fix Count Discrepancies:
  - Column 1 (IDs): Check for discrepancies between File 1 (32,292 IDs) and File 2 (32,526 IDs). Work with this raw data to address issues.
- Check for Duplicates:
  - File 1: Verify if there are too many occurrences of any ID. Identify and remove duplicates. There were no duplicates found.
  - File 2: Perform the same check for duplicates.
- State Name Corrections:
  - Correct misspellings and case errors in File 1:
    - "georia" to "Georgia"
    - "alabama" to "Alabama"
- State Abbreviation (State_ab):
  - Ensure the abbreviations are in order in File 1.
- Handle Blank Entries:
  - Place Field: Identify and fix any blank entries (e.g., row ID 32).
- Type Field Consistency:
  - Standardize terms in the "Type" field in File 1 (e.g., "Borough" and "Boroughs" should be consistent).
- Land and Water Area Data:
  - Review the "ALand" and "AWater" columns in File 1. Zeros are acceptable where applicable, such as in areas with water but no land.

Project Summary: Exploratory Data Analysis
- Water and Land Analysis by State:
  - Rank states from largest to smallest by land area.
  - Rank states by water area, focusing on those with the most lakes, streams, etc.
- Top 10 Largest States:
  - Identify the top 10 states by land area.
  - Identify the top 10 states by water area.
- Data Integration:
  - Join tables using the ID from the statistics table. If an ID is missing from the income table, leave the corresponding fields blank.
- Categorical Data Exploration:
  - Analyze the categorical data, such as "Type."
  - Note that "Municipality" is not listed unless the LIMIT is increased from 10 to 20. With a limit of 20, there's only one Municipality, skewing the average.
- Income Analysis by State:
  - Calculate and compare the mean and median income by state:
    - Identify states with the highest and lowest average incomes.
    - Identify states with the highest and lowest median incomes.
- Analysis by Community Type:
  - Median income analysis reveals that "CDP" (Census Designated Place) has high values, while "Community," "Urban," and "County" have very low values.
  - Determine which state has "Community" type entries—it's Puerto Rico.
- Outlier Detection:
  - Filter outliers by focusing on large cities like Los Angeles and Dallas to analyze their salary data.
  - Highest Delta Junction, Alaska, with a reported income of 242,857.0.
  - Data may be potentially capped at 3,000,000.0.
