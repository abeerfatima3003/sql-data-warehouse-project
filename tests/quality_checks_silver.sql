/*
****************************************************************************************
Quality Checks
****************************************************************************************
Script Purpose:
This script performs various quality checks for data consistency, accuracy and standardization
across the 'silver' schemas. It includes checks for: 
  - Null or Duplicate primary keys
  - Unwanted Spaces in string fields
  - Data Standardization & consistency
  - Invalid date ranges and orders
  - Data consistency between related fields 

Usage Notes:
  - Run these checks after data loading Silver Layer
  - Investigate and resolve any discrepancies found during the checks.
----------------------------------------------------------------------------------------
*/

========================================================================================
-- Checking 'silver.crm_cust_info'
========================================================================================
-- Quality Check
  
-- Check for Nulls or Duplicates in Primary key
-- Expectation: No Result
SELECT 
cst_id,
COUNT (*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT (*) > 1 OR cst_id IS NULL

-- Check for unwanted spaces in string values
--Expectation: No Results
SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

SELECT cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

-- Data Standardization & Consistency
SELECT DISTINCT cst_gender
FROM silver.crm_cust_info

SELECT DISTINCT cst_martial_status
FROM silver.crm_cust_info

========================================================================================
-- Checking 'silver.crm_prd_info'
========================================================================================
-- QUALITY CHECK

-- Check for Nulls or Duplicates in Primary key
-- Expectation: No Result
SELECT 
prd_id,
COUNT (*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT (*) > 1 OR prd_id IS NULL

-- Check for unwanted spaces in string values
--Expectation: No Results
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm!= TRIM(prd_nm)

-- Check for NULLs or Negative Numbers
-- Expectation: No Results
SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost iS NULL

-- Data Standardization & Consistency
SELECT DISTINCT prd_line
FROM silver.crm_prd_info

-- Check for Invalid Dates Orders
SELECT *
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt

========================================================================================
-- Checking 'silver.crm_sales_details'
========================================================================================
-- QUALITY CHECK
  
-- Check for Invalid Dates
-- Expectation: No Result
SELECT 
*
FROM
silver.crm_sales_details
WHERE sls_ord_dt > sls_ship_dt OR sls_ord_dt > sls_due_dt

-- Checking Data Consistency
-- Expectation: No Result
SELECT DISTINCT
sls_sales,
sls_quantity,
sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL Or sls_price IS NULL
OR sls_sales <= 0  OR sls_quantity <= 0  Or sls_price <= 0 
ORDER BY sls_sales, sls_quantity, sls_price

========================================================================================
-- Checking 'silver.erp_cust_az12'
========================================================================================
-- QUALITY CHECK

-- Identify out-of-range dates
-- Expectation: No result
SELECT DISTINCT 
bdate
FROM silver.erp_cust_az12
WHERE bdate < '1900-01-01' OR bdate > GETDATE()

-- Data Standardization and Consistency 
SELECT DISTINCT
gen
FROM silver.erp_cust_az12

========================================================================================
-- Checking 'silver.erp_loc_a101'
========================================================================================
-- QUALITY CHECK

-- Data Standardization and Consistency
SELECT DISTINCT
cntry
FROM silver.erp_loc_a101
ORDER BY cntry

========================================================================================
-- Checking 'silver.erp_px_cat_g1v2'
========================================================================================
-- QUALITY CHECK

-- Check for Unwanted Spaces
-- Expectations: No Results
SELECT 
*
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat)
	OR subcat != TRIM(subcat)
	OR maintenance != TRIM(maintenance);

-- Data Standardization & Consistency 
SELECT DISTINCT 
maintenance
FROM silver.erp_px_cat_g1v2






