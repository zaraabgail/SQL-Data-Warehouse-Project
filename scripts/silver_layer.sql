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

