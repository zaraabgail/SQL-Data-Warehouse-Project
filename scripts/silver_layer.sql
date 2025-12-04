IF OBJECT_ID('silver.crm_cust_info') IS NOT NULL
	DROP TABLE	silver.crm_cust_info;

CREATE TABLE silver.crm_cust_info (
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO
IF OBJECT_ID('silver.crm_prd_id') IS NOT NULL
	DROP TABLE	silver.crm_prd_id;

CREATE TABLE silver.crm_prd_id (
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost NVARCHAR(50),
	prd_line NVARCHAR(50),
	prd_start_dt DATE,
	prd_end_dt DATE,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

GO
IF OBJECT_ID('silver.crm_sales_details') IS NOT NULL
	DROP TABLE	silver.crm_sales_details;

CREATE TABLE silver.crm_sales_details (
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

GO
IF OBJECT_ID('silver.erp_cust_az12') IS NOT NULL
	DROP TABLE	silver.erp_cust_az12;

CREATE TABLE silver.erp_cust_az12(
	cid NVARCHAR(50),
	bdate DATE,
	gen VARCHAR(10),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

GO
IF OBJECT_ID('silver.erp_loc_a101') IS NOT NULL
	DROP TABLE	silver.erp_loc_a101;
CREATE TABLE silver.erp_loc_a101(
	cid NVARCHAR(50),
	cntry VARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

GO
IF OBJECT_ID('silver.erp_px_cat_g1v1') IS NOT NULL
	DROP TABLE	silver.erp_px_cat_g1v1;
CREATE TABLE silver.erp_px_cat_g1v1(
	id NVARCHAR(50),
	cat VARCHAR(50),
	subcat VARCHAR(50),
	maintenence VARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

-- checking data quality of cust info table
SELECT * from bronze.crm_cust_info;

-- finding if all the keys are unique
select cst_id, COUNT(*) 
from bronze.crm_cust_info 
group by cst_id 
having count(*) >1 or cst_id is NULL;

-- checking data consistency for binary columns
SELECT DISTINCT cst_gndr, cst_marital_status 
FROM bronze.crm_cust_info;

-- query to check unwanted spaces
SELECT cst_firstname from bronze.crm_cust_info
where cst_firstname != TRIM(cst_firstname);

SELECT cst_lastname from bronze.crm_cust_info
where cst_lastname != TRIM(cst_lastname);

-- cleaning the data
TRUNCATE TABLE silver.crm_cust_info;
INSERT INTO silver.crm_cust_info (
	cst_id,
	cst_key,
	cst_firstname,
	cst_lastname,
	cst_marital_status,
	cst_gndr,
	cst_create_date)

SELECT
	cst_id,
	cst_key,
	TRIM(cst_firstname) as cst_firstname,
	TRIM(cst_lastname) as cst_lastname,

	CASE WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
		WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
		ELSE 'n/a'
	END cst_marital_status,

	CASE WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
		WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
		ELSE 'n/a'
	END cst_gndr,

	cst_create_date
	FROM
	(
	SELECT *,
	ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) as flag_last
	from bronze.crm_cust_info
	WHERE cst_id IS NOT NULL
)t WHERE flag_last = 1;

-- checking quality of clean data in silver layer

select cst_id, COUNT(*) 
from silver.crm_cust_info 
group by cst_id 
having count(*) >1 or cst_id is NULL;

select * from silver.crm_cust_info 

SELECT cst_lastname from silver.crm_cust_info
where cst_lastname != TRIM(cst_lastname);
