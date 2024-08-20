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
