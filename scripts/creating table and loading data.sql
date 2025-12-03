-- creating tables --

-- to check if the tables already exist or not
IF OBJECT_ID('bronze.crm_cust_info') IS NOT NULL
	DROP TABLE	bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info (
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);
GO
IF OBJECT_ID('bronze.crm_prd_id') IS NOT NULL
	DROP TABLE	bronze.crm_prd_id;

CREATE TABLE bronze.crm_prd_id (
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost NVARCHAR(50),
	prd_line NVARCHAR(50),
	prd_start_dt DATE,
	prd_end_dt DATE
);

GO
IF OBJECT_ID('bronze.crm_sales_details') IS NOT NULL
	DROP TABLE	bronze.crm_sales_details;

CREATE TABLE bronze.crm_sales_details (
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);

GO
IF OBJECT_ID('bronze.erp_cust_az12') IS NOT NULL
	DROP TABLE	bronze.erp_cust_az12;

CREATE TABLE bronze.erp_cust_az12(
	cid NVARCHAR(50),
	bdate DATE,
	gen VARCHAR(10)
);

GO
IF OBJECT_ID('bronze.erp_loc_a101') IS NOT NULL
	DROP TABLE	bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101(
	cid NVARCHAR(50),
	cntry VARCHAR(50)
);

GO
IF OBJECT_ID('bronze.erp_px_cat_g1v1') IS NOT NULL
	DROP TABLE	bronze.erp_px_cat_g1v1;
CREATE TABLE bronze.erp_px_cat_g1v1(
	id NVARCHAR(50),
	cat VARCHAR(50),
	subcat VARCHAR(50),
	maintenence VARCHAR(50)
);


-- loading data -- 

-- to have an empty table
TRUNCATE TABLE  bronze.crm_cust_info;

BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\user\Documents\Data Engineering\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
SELECT * FROM bronze.crm_cust_info


TRUNCATE TABLE  bronze.crm_prd_id;
BULK INSERT bronze.crm_prd_id
FROM 'C:\Users\user\Documents\Data Engineering\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
SELECT * FROM bronze.crm_prd_id;



TRUNCATE TABLE  bronze.crm_sales_details;
BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\user\Documents\Data Engineering\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
SELECT * FROM bronze.crm_sales_details;
GO

TRUNCATE TABLE  bronze.erp_cust_az12;
BULK INSERT bronze.erp_cust_az12
FROM 'C:\Users\user\Documents\Data Engineering\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
SELECT * FROM bronze.erp_cust_az12
GO


TRUNCATE TABLE  bronze.erp_loc_a101;
BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\user\Documents\Data Engineering\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
SELECT * FROM bronze.erp_loc_a101
GO


TRUNCATE TABLE  bronze.erp_px_cat_g1v1;
BULK INSERT bronze.erp_px_cat_g1v1
FROM 'C:\Users\user\Documents\Data Engineering\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
SELECT * FROM bronze.erp_px_cat_g1v1
GO


