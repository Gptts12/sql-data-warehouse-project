/*
Stored Procedure for Bronze Layer
*/

EXEC bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
SET @batch_start_time = GETDATE();
PRINT '========================';
PRINT 'Loading Bronze Layer';
PRINT '========================';

PRINT '------------------------';
PRINT 'Loading CRM Tables';

BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\GeneP\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TaBLOCK
);

SELECT * FROM bronze.crm_prd_info

BULK INSERT bronze.crm_prd_info
FROM 'C:\Users\GeneP\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TaBLOCK
);

BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\GeneP\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TaBLOCK
);

PRINT '========================';
PRINT 'Loading Bronze Layer';
PRINT '========================';

PRINT '------------------------';
PRINT 'Loading ERP Tables';

PRINT '>> Truncating Table';

TRUNCATE TABLE bronze.erp_cust_az12;
BULK INSERT bronze.erp_cust_az12
FROM 'C:\Users\GeneP\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TaBLOCK
);


BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\GeneP\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_erp\loc_a101'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TaBLOCK
);

BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\Users\GeneP\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TaBLOCK
);
END

