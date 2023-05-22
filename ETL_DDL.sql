CREATE TABLE dim_ajkk_adr (
addr_id     NUMBER(10) NOT NULL,
    postal_code VARCHAR2(5),
    street      VARCHAR2(30),
    city        VARCHAR2(60) NOT NULL,
    state       VARCHAR2(60) NOT NULL,
    country     VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN dim_ajkk_adr.addr_id IS
    'Primary id ';

COMMENT ON COLUMN dim_ajkk_adr.postal_code IS
    'postal code';

COMMENT ON COLUMN dim_ajkk_adr.street IS
    'address of the street ';

COMMENT ON COLUMN dim_ajkk_adr.city IS
    'CITY OF THE CUSTOMER';

COMMENT ON COLUMN dim_ajkk_adr.state IS
    'NAME OF THE STATE';

COMMENT ON COLUMN dim_ajkk_adr.country IS
    'COUNTRY OF THE CUSTOMER';

ALTER TABLE dim_ajkk_adr ADD CONSTRAINT dim_ajkk_adr_pk PRIMARY KEY ( addr_id );

CREATE TABLE dim_ajkk_ctg (
    cat_id   NUMBER(2) NOT NULL,
    cat_name VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN dim_ajkk_ctg.cat_id IS
    'PRIMARY KEY';

COMMENT ON COLUMN dim_ajkk_ctg.cat_name IS
    'CATEGORY NAME';

ALTER TABLE dim_ajkk_ctg ADD CONSTRAINT dim_ajkk_ctg_pk PRIMARY KEY ( cat_id );

CREATE TABLE dim_ajkk_cu (
    cust_id    NUMBER(30) NOT NULL,
    cust_fname VARCHAR2(30) NOT NULL,
    cust_lname VARCHAR2(30) NOT NULL,
    segment    VARCHAR2(15) NOT NULL
);

COMMENT ON COLUMN dim_ajkk_cu.cust_fname IS
    'FIRST NAME OF THE CUSTOMER';

COMMENT ON COLUMN dim_ajkk_cu.cust_lname IS
    'CUSTOMER LAST NAME';

COMMENT ON COLUMN dim_ajkk_cu.segment IS
    'segment of the order ';

ALTER TABLE dim_ajkk_cu ADD CONSTRAINT dim_ajkk_cu_pk PRIMARY KEY ( cust_id );

CREATE TABLE dim_ajkk_mkt (
    market_id   NUMBER(10) NOT NULL,
    market_name VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN dim_ajkk_mkt.market_id IS
    'primary id';

COMMENT ON COLUMN dim_ajkk_mkt.market_name IS
    'market name ';

ALTER TABLE dim_ajkk_mkt ADD CONSTRAINT dim_ajkk_mkt_pk PRIMARY KEY ( market_id );

CREATE TABLE dim_ajkk_od (
    row_id     NUMBER(20) NOT NULL,
    ord_id     VARCHAR2(30) NOT NULL,
    order_date DATE NOT NULL
);

COMMENT ON COLUMN dim_ajkk_od.row_id IS
    'primary key';

COMMENT ON COLUMN dim_ajkk_od.order_date IS
    'DATE OF ORDER';

ALTER TABLE dim_ajkk_od ADD CONSTRAINT dim_ajkk_od_pk PRIMARY KEY ( row_id );

CREATE TABLE dim_ajkk_pr (
    prod_id   VARCHAR2(15) NOT NULL,
    prod_name VARCHAR2(255) NOT NULL
);

COMMENT ON COLUMN dim_ajkk_pr.prod_id IS
    'PRIMARY KEY';

COMMENT ON COLUMN dim_ajkk_pr.prod_name IS
    'PRODUCT NAME';

ALTER TABLE dim_ajkk_pr ADD CONSTRAINT dim_ajkk_pr_pk PRIMARY KEY ( prod_id );

CREATE TABLE dim_ajkk_re (
    ord_id        VARCHAR2(30) NOT NULL,
    return_status VARCHAR2(3) NOT NULL
);

COMMENT ON COLUMN dim_ajkk_re.ord_id IS
    'ORDER ID OF THE PRODUCT';

COMMENT ON COLUMN dim_ajkk_re.return_status IS
    'STATUS OF THE RETURN INITIATED';

ALTER TABLE dim_ajkk_re ADD CONSTRAINT dim_ajkk_re_pk PRIMARY KEY ( ord_id );

CREATE TABLE dim_ajkk_reg (
    reg_id   NUMBER(20) NOT NULL,
    reg_name VARCHAR2(30) NOT NULL);

COMMENT ON COLUMN dim_ajkk_reg.reg_id IS
    'PRIMARY KEY';

COMMENT ON COLUMN dim_ajkk_reg.reg_name IS
    'region name';

ALTER TABLE dim_ajkk_reg ADD CONSTRAINT dim_ajkk_reg_pk PRIMARY KEY ( reg_id );

CREATE TABLE dim_ajkk_sc (
    sub_id   NUMBER(3) NOT NULL,
    sub_name VARCHAR2(30) NOT NULL);

COMMENT ON COLUMN dim_ajkk_sc.sub_id IS
    'PRIMARY KEY';

COMMENT ON COLUMN dim_ajkk_sc.sub_name IS
    'SUB CATEGORY NAME';

ALTER TABLE dim_ajkk_sc ADD CONSTRAINT dim_ajkk_sc_pk PRIMARY KEY ( sub_id );

CREATE TABLE fact_ajkk_odpr (
    od_prod_id NUMBER(10) NOT NULL,
    quantity   NUMBER(10) NOT NULL,
    discount   NUMBER(10) NOT NULL,
    profit     NUMBER(10, 2) NOT NULL,
    ship_date  DATE NOT NULL,
    ship_cost  NUMBER(10, 5) NOT NULL,
    sales      NUMBER(10, 2) NOT NULL,
    priority   VARCHAR2(30) NOT NULL,
    ship_mode  VARCHAR2(30) NOT NULL,
    ord_id     VARCHAR2(30) NOT NULL,
    addr_id    NUMBER(10) NOT NULL,
    market_id  NUMBER(10) NOT NULL,
    reg_id     NUMBER(20) NOT NULL,
    cat_id     NUMBER(2) NOT NULL,
    sub_id     NUMBER(3) NOT NULL,
    cust_id    NUMBER(30) NOT NULL,
    prod_id    VARCHAR2(15) NOT NULL,
    row_id     NUMBER(20) NOT NULL
);

COMMENT ON COLUMN fact_ajkk_odpr.od_prod_id IS
    'PRIMARY ID';

COMMENT ON COLUMN fact_ajkk_odpr.quantity IS
    'QUANTITY OF THE PRODUCTS';
COMMENT ON COLUMN fact_ajkk_odpr.discount IS
    'DISCOUNT';
COMMENT ON COLUMN fact_ajkk_odpr.profit IS
    'PROFIT OF THE PRODUCT';
COMMENT ON COLUMN fact_ajkk_odpr.ship_date IS
    'date of the shipment';
COMMENT ON COLUMN fact_ajkk_odpr.ship_cost IS
    'SHIPMENT COST';
  COMMENT ON COLUMN fact_ajkk_odpr.sales IS
    'SALES OF THE PRODUCT';
  COMMENT ON COLUMN fact_ajkk_odpr.priority IS
    'NAME OF THE PRIORITY';
COMMENT ON COLUMN fact_ajkk_odpr.ship_mode IS
 'NAME OF THE MODE OF SHIPMENT';
COMMENT ON COLUMN fact_ajkk_odpr.ord_id IS
    'ORDER ID';
COMMENT ON COLUMN fact_ajkk_odpr.addr_id IS
    'ADDRESS ID';
COMMENT ON COLUMN fact_ajkk_odpr.market_id IS
    'MARKET ID';
COMMENT ON COLUMN fact_ajkk_odpr.reg_id IS
    'REGION ID';
COMMENT ON COLUMN fact_ajkk_odpr.cat_id IS
    'CATEGORY ID';
COMMENT ON COLUMN fact_ajkk_odpr.sub_id IS
    'SUBCATEGORY ID';
   COMMENT ON COLUMN fact_ajkk_odpr.cust_id IS
    'CUSTOMER ID';
    COMMENT ON COLUMN fact_ajkk_odpr.prod_id IS
    'PRODUCT ID';
    COMMENT ON COLUMN fact_ajkk_odpr.row_id IS
    'ROW ID';
   ALTER TABLE fact_ajkk_odpr ADD CONSTRAINT fact_ajkk_odpr_pk PRIMARY KEY ( od_prod_id );
ALTER TABLE fact_ajkk_odpr
  ADD CONSTRAINT fact_ajkk_odpr_dim_ajkk_adr_fk FOREIGN KEY ( addr_id )
   REFERENCES dim_ajkk_adr ( addr_id );
ALTER TABLE fact_ajkk_odpr
 ADD CONSTRAINT fact_ajkk_odpr_dim_ajkk_ctg_fk FOREIGN KEY ( cat_id )
  REFERENCES dim_ajkk_ctg ( cat_id );
ALTER TABLE fact_ajkk_odpr
 ADD CONSTRAINT fact_ajkk_odpr_dim_ajkk_cu_fk FOREIGN KEY ( cust_id )
 REFERENCES dim_ajkk_cu ( cust_id );
              ALTER TABLE fact_ajkk_odpr
  ADD CONSTRAINT fact_ajkk_odpr_dim_ajkk_mkt_fk FOREIGN KEY ( market_id )
   REFERENCES dim_ajkk_mkt ( market_id );

ALTER TABLE fact_ajkk_odpr
    ADD CONSTRAINT fact_ajkk_odpr_dim_ajkk_od_fk FOREIGN KEY ( row_id )
        REFERENCES dim_ajkk_od ( row_id );

ALTER TABLE fact_ajkk_odpr
    ADD CONSTRAINT fact_ajkk_odpr_dim_ajkk_pr_fk FOREIGN KEY ( prod_id )
        REFERENCES dim_ajkk_pr ( prod_id );

ALTER TABLE fact_ajkk_odpr
    ADD CONSTRAINT fact_ajkk_odpr_dim_ajkk_re_fk FOREIGN KEY ( ord_id )
        REFERENCES dim_ajkk_re ( ord_id );

ALTER TABLE fact_ajkk_odpr
    ADD CONSTRAINT fact_ajkk_odpr_dim_ajkk_reg_fk FOREIGN KEY ( reg_id )
        REFERENCES dim_ajkk_reg ( reg_id );

ALTER TABLE fact_ajkk_odpr
    ADD CONSTRAINT fact_ajkk_odpr_dim_ajkk_sc_fk FOREIGN KEY ( sub_id )
        REFERENCES dim_ajkk_sc ( sub_id );
