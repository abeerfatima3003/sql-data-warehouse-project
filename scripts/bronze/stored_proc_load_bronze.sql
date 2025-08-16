/*
============================================================================
Stored Procedure: Load Bronze Layer (Source -> bronze)
============================================================================
Script Purpose: 
	This stored procedure loads data into the 'bronze' schema from external CSV files.
	It performs the loading actions:
	- Truncates the bronze tables before loading data.
	- Uses the 'BULK INSERT' command to load data from CSV files to Bronze tables.

Parameters:
	None.
	This stored procedure does not accept any parameters or return any values.

Usage Example:
	EXEC bronze.load_bronze;
*/


/*
============================================================================
Srored Procedure: Load Bronze Layer (Source -> bronze)
============================================================================
Script Purpose: 
	This stored procedure loads data into the 'bronze' schema from external CSV files.
	It performs the loading actions:
	- Truncates the bronze tables before loading data.
	- Uses the 'BULK INSERT' command to load data from CSV files to Bronze tables.

Parameters:
	None.
	This stored procedure does not accept any parameters or return any values.

Usage Example:
	EXEC bronze.load_bronze;
*/


-- Stored Procedures
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	-- Tracking ETL Duration--
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '==================================================';
		PRINT 'Loading BRONZE layer';
		PRINT '==================================================';

		PRINT '++++++++++++++++++++++++++++++++++++++++++++++++++';
		PRINT 'Loading CRM tables';
		PRINT '++++++++++++++++++++++++++++++++++++++++++++++++++';

		/* Sometimes we load the data twice in the table because of which the columns later
		show twice as much data.
		Hence use TRUNCATE - Quickly deleting the table and resetting it to empty
		*/

		SET @start_time = GETDATE();
		PRINT '>>Truncating Table : bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;

		/*
		Loading the data from csv file to the database table
		First BULK INSERT -> then specify table name -> Find the location of the file -> specify the file name 
		-> (how to handle the file) -> row header (the data starts from the 2nd row) -> then specify the field terminator
		-> Tablock- option to improve the performance ( locking the table while it loads)
		*/
		PRINT '>>Inserting Data Into: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\sql\dwh_project\datasets\source_crm\cust_info.csv' 
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'; 
		PRINT '>> ------------------';


		-- LOADING ALL THE TABLES


		SET @start_time = GETDATE();
		PRINT '>>Truncating Table : bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>>Inserting Data Into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\sql\dwh_project\datasets\source_crm\prd_info.csv' 
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'; 
		PRINT '>> ------------------';

-----------------------------------------------------------------------------------------

		SET @start_time = GETDATE();
		PRINT '>>Truncating Table : bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>>Inserting Data Into: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\sql\dwh_project\datasets\source_crm\sales_details.csv' 
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'; 
		PRINT '>> ------------------';

-----------------------------------------------------------------------------------------

		PRINT '++++++++++++++++++++++++++++++++++++++++++++++++++';
		PRINT 'Loading ERP tables';
		PRINT '++++++++++++++++++++++++++++++++++++++++++++++++++';

		SET @start_time = GETDATE();
		PRINT '>>Truncating Table : bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT '>>Inserting Data Into: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\sql\dwh_project\datasets\source_erp\cust_az12.csv' 
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'; 
		PRINT '>> ------------------';

-----------------------------------------------------------------------------------------

		SET @start_time = GETDATE();
		PRINT '>>Truncating Table : bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT '>>Inserting Data Into: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\sql\dwh_project\datasets\source_erp\loc_a101.csv' 
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'; 
		PRINT '>> ------------------';

-----------------------------------------------------------------------------------------

		SET @start_time = GETDATE();
		PRINT '>>Truncating Table : bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		PRINT '>>Inserting Data Into: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\sql\dwh_project\datasets\source_erp\px_cat_g1v2.csv' 
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'; 
		PRINT '>> ------------------';

		SET @batch_end_time = GETDATE();
		PRINT '============================================='
		PRINT 'Loading Bronze Layer is Completed';
		PRINT '>> Total Load Duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + 'seconds'; 
		PRINT '============================================='
	END TRY
	BEGIN CATCH
		PRINT '===============================================';
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Meesage' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT '===============================================';
	END CATCH
END

EXEC bronze.load_bronze;
