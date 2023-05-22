CREATE OR REPLACE STORAGE INTEGRATION aws_s3_integration
type=external_stage
storage_provider='S3'
enabled=true
storage_aws_role_arn='arn:aws:iam::<ID>:role/DBMS_role'
storage_allowed_locations=('s3://snowflakedbms/');

CREATE OR REPLACE FILE FORMAT DBMS_FILES
TYPE = 'CSV'
FIELD_DELIMITER=','
SKIP_HEADER=1;

CREATE OR REPLACE STAGE DBMS_stage
storage_integration=aws_s3_integration
file_format=DBMS_FILES
Url = 's3://snowflakedbms/';


Grant usage on integration aws_s3_integration to role accountadmin;


ALTER WAREHOUSE DBMS_PROJECT RESUME;
CREATE OR replace TABLE orders (
    row_id VARCHAR(255) PRIMARY KEY,
    ord_id VARCHAR(255));

COPY INTO dim_ajkk_adr
FROM @dbms_stage/DBMS_files/fullstg_dim_ajkk_adr.csv
FILE_FORMAT = (
    FORMAT_NAME = DBMS_FILES
    error_on_column_count_mismatch=false);
select * from dim_ajkk_adr;

COPY INTO dim_ajkk_ctg
FROM @dbms_stage/DBMS_files/fullstg_dim_ajkk_ctg.csv
FILE_FORMAT = (
    FORMAT_NAME = DBMS_FILES);
    select * from dim_ajkk_ctg;

COPY INTO dim_ajkk_cu
FROM @dbms_stage/DBMS_files/fullstg_dim_ajkk_cu.csv
FILE_FORMAT = (
    FORMAT_NAME = DBMS_FILES);
select * from dim_ajkk_cu;

COPY INTO dim_ajkk_mkt
FROM @dbms_stage/DBMS_files/fullstg_dim_ajkk_mkt.csv
FILE_FORMAT = (
    FORMAT_NAME = DBMS_FILES);
select * from dim_ajkk_mkt;

COPY INTO dim_ajkk_od
FROM @dbms_stage/DBMS_files/fullstg_dim_ajkk_order.csv
FILE_FORMAT = (
    FORMAT_NAME = DBMS_FILES);
select * from dim_ajkk_od;

COPY INTO dim_ajkk_pr
FROM @dbms_stage/DBMS_files/fullstg_dim_ajkk_pr.csv
FILE_FORMAT = (
    FORMAT_NAME = DBMS_FILES);
select * from dim_ajkk_pr;

COPY INTO dim_ajkk_re
FROM @dbms_stage/DBMS_files/fullstg_dim_ajkk_re.csv
FILE_FORMAT = (
    FORMAT_NAME = DBMS_FILES);
select * from dim_ajkk_re;

COPY INTO dim_ajkk_reg
FROM @dbms_stage/DBMS_files/fullstg_dim_ajkk_reg.csv
FILE_FORMAT = (
    FORMAT_NAME = DBMS_FILES);
select * from dim_ajkk_reg;

COPY INTO dim_ajkk_sc
FROM @dbms_stage/DBMS_files/fullstg_dim_ajkk_sc.csv
FILE_FORMAT = (
    FORMAT_NAME = DBMS_FILES);
select * from dim_ajkk_sc;

COPY INTO fact_ajkk_odpr
FROM @dbms_stage/DBMS_files/fullstg_dim_ajkk_od_prod.csv
FILE_FORMAT = (
    FORMAT_NAME = DBMS_FILES
    );
select * from dim_ajkk_odpr;



To CREATE DIM_DATE:

CREATE TABLE DIM_DATE AS
SELECT
 n AS ENTRY_ID,
 DATEADD(day, n, '1970-12-31') AS Full_Date,
 TO_CHAR(DATEADD(day, n, '1970-12-31'), 'DD') AS Days,
 TO_CHAR(DATEADD(day, n, '1970-12-31'), 'Mon') AS Month_Short,
 TO_CHAR(DATEADD(day, n, '1970-12-31'), 'MM') AS Month_Num,
 TO_CHAR(DATEADD(day, n, '1970-12-31'), 'Month') AS Month_Long,
 TO_CHAR(DATEADD(day, n, '1970-12-31'), 'D') AS Day_Of_Week_Short,
 TO_CHAR(DATEADD(day, n, '1970-12-31'), 'Day') AS Day_Of_Week_Long,
 TO_CHAR(DATEADD(day, n, '1970-12-31'), 'YYYY') AS Year,
 CASE
 WHEN TO_CHAR(DATEADD(day, n, '1970-12-31'), 'MM') IN (1,2,3) THEN 'Q1'
 WHEN TO_CHAR(DATEADD(day, n, '1970-12-31'), 'MM') IN (4,5,6) THEN 'Q2'
 WHEN TO_CHAR(DATEADD(day, n, '1970-12-31'), 'MM') IN (7,8,9) THEN 'Q3'
 ELSE
 'Q4'
 END Quarter,
 TO_CHAR(DATEADD(day, n, '1970-12-31'), 'MM')||
 TO_CHAR(DATEADD(day, n, '1970-12-31'), 'DD')||
 TO_CHAR(DATEADD(day, n, '1970-12-31'), 'YYYY')
 AS DATE_ID
FROM (
 SELECT ROW_NUMBER() OVER (ORDER BY SEQ4()) AS n
FROM TABLE(GENERATOR(ROWCOUNT => 36600)));

ALTER TABLE DIM_DATE ADD CONSTRAINT PK_DIM_DATE PRIMARY KEY (DATE_ID);

ALTER TABLE fact_ajkk_odpr ADD date_id string;
UPDATE fact_ajkk_odpr SET date_id = TO_CHAR(ship_date, 'mmddyyyy');

alter table fact_ajkk_odpr cluster by (ship_date,'mmddyy');

select od_prod_id,quantity,discount,profit,ship_cost,sales,priority,ship_mode,ord_id,addr_id,market_id,reg_id,cat_id,
sub_id,cust_id,prod_id,row_id,e.date_id, d.date_id from fact_ajkk_odpr e join dim_date d on e.date_id = d.date_id;

alter table fact_ajkk_odpr add constraint fk_date_id foreign key (date_id) references dim_date(date_id);
