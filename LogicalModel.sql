CREATE TABLE ajkk_address (
    addr_id     BIGINT NOT NULL COMMENT 'Primary id ' AUTO_INCREMENT,
    postal_code VARCHAR(5) COMMENT 'POSTAL CODE',
    street      VARCHAR(30) COMMENT 'ADDRESS OF THE STREET ',
    city        VARCHAR(60) NOT NULL COMMENT 'CITY OF THE CUSTOMER',
    state       VARCHAR(60) NOT NULL COMMENT 'NAME OF THE STATE',
    country     VARCHAR(50) NOT NULL COMMENT 'COUNTRY OF THE CUSTOMER',
    tbl_last_dt DATETIME COMMENT 'LAST UPDATED TIMESTAMP',
    reg_id      BIGINT NOT NULL COMMENT 'REGION ID',
    PRIMARY KEY (addr_id)
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_address.addr_id IS
    'Primary id '; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_address.postal_code IS
    'postal code'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_address.street IS
    'address of the street '; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_address.city IS
    'CITY OF THE CUSTOMER'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_address.state IS
    'NAME OF THE STATE'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_address.country IS
    'COUNTRY OF THE CUSTOMER'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_address.tbl_last_dt IS
    'LAST UPDATED TIMESTAMP'; */

CREATE UNIQUE INDEX idx_addr_id ON ajkk_address (addr_id);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ajkk_ctg (
    cat_id      TINYINT NOT NULL COMMENT 'PRIMARY KEY' AUTO_INCREMENT,
    cat_name    VARCHAR(30) NOT NULL COMMENT 'CATEGORY NAME',
    tbl_last_dt DATETIME COMMENT 'LAST UPDATED TIMESTAMP',
    PRIMARY KEY ( cat_id )
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_ctg.cat_id IS
    'PRIMARY KEY'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_ctg.cat_name IS
    'CATEGORY NAME'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_ctg.tbl_last_dt IS
    'LST UPDATED TIMESTAMP'; */

CREATE UNIQUE INDEX idx_cat_id ON ajkk_ctg (cat_id);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ajkk_customer (
    cust_id     VARCHAR(30) NOT NULL COMMENT 'ID OF THE CUSTOMER',
    cust_fname  VARCHAR(30) NOT NULL COMMENT 'FIRST NAME OF THE CUSTOMER',
    cust_lname  VARCHAR(30) NOT NULL COMMENT 'CUSTOMER LAST NAME',
    segment     VARCHAR(15) NOT NULL COMMENT 'SEGMENT OF THE ORDER ',
    addr_id     BIGINT NOT NULL COMMENT 'ADDRESS OF THE ORDER ',
    tbl_last_dt DATETIME COMMENT 'LAST UPDATED TIMESTAMP'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_customer.cust_fname IS
    'FIRST NAME OF THE CUSTOMER'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_customer.cust_lname IS
    'CUSTOMER LAST NAME'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_customer.segment IS
    'segment of the order '; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_customer.tbl_last_dt IS
    'LAST UPDATED TIMESTAMP'; */

ALTER TABLE ajkk_customer ADD CONSTRAINT ajkk_customer_pk PRIMARY KEY ( cust_id, addr_id );

CREATE UNIQUE INDEX cust_addr_idx ON ajkk_customer (cust_id, addr_id);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ajkk_market (
    market_id   BIGINT NOT NULL COMMENT 'PRIMARY ID' AUTO_INCREMENT,
    market_name VARCHAR(30) NOT NULL COMMENT 'MARKET NAME',
    tbl_last_dt DATETIME COMMENT 'LAST UPDATED TIMESTAMP',
    PRIMARY KEY ( market_id )
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_market.market_id IS
    'primary id'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_market.market_name IS
    'market name '; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_market.tbl_last_dt IS
    'LAST UPDATED TIMESTAMP'; */

CREATE UNIQUE INDEX ajkk_market_idx ON ajkk_market (market_id);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ajkk_od_prod (
    od_prod_id  BIGINT NOT NULL COMMENT 'PRIMARY ID' AUTO_INCREMENT,
    quantity    BIGINT NOT NULL COMMENT 'QUANTITY OF THE PRODUCTS',
    discount    BIGINT NOT NULL COMMENT 'DISCOUNT
',
    profit      DECIMAL(10,2) NOT NULL COMMENT 'PROFIT OF THE PRODUCT',
    ship_date   DATETIME NOT NULL COMMENT 'date of the shipment
',
    ship_cost   DECIMAL(10,5) NOT NULL COMMENT 'SHIPMENT COST',
    sales       DECIMAL(10,2) NOT NULL COMMENT 'SALES OF THE PRODUCT',
    prod_id     VARCHAR(15) NOT NULL COMMENT 'PRODUCT ID',
    priority    VARCHAR(30) NOT NULL COMMENT 'NAME OF THE PRIORITY
',
    ship_mode   VARCHAR(30) NOT NULL COMMENT 'NAME OF THE MODE OF SHIPMENT',
    row_id      DECIMAL(20) NOT NULL COMMENT 'ROW ID',
    tbl_last_dt DATETIME COMMENT 'LAST UPDATED TIMESTAMP',
    PRIMARY KEY ( od_prod_id )
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_od_prod.od_prod_id IS
    'PRIMARY ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_od_prod.quantity IS
    'QUANTITY OF THE PRODUCTS'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_od_prod.discount IS
    'DISCOUNT
'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_od_prod.profit IS
    'PROFIT OF THE PRODUCT'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_od_prod.ship_date IS
    'date of the shipment
'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_od_prod.ship_cost IS
    'SHIPMENT COST'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_od_prod.sales IS
    'SALES OF THE PRODUCT'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_od_prod.priority IS
    'NAME OF THE PRIORITY
'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_od_prod.ship_mode IS
    'NAME OF THE MODE OF SHIPMENT'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_od_prod.tbl_last_dt IS
    'LAST UPDATED TIMESTAMP'; */

CREATE UNIQUE INDEX ajkk_odprod_idx ON ajkk_od_prod (od_prod_id);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ajkk_ord_return (
    ord_id        VARCHAR(30) NOT NULL COMMENT 'ORDER ID OF THE PRODUCT',
    return_status VARCHAR(3) NOT NULL COMMENT 'STATUS OF THE RETURN INITIATED',
    tbl_last_dt   DATETIME COMMENT 'LAST UPDATED TIMESTAMP',
    row_id        DECIMAL(20) NOT NULL COMMENT 'ROW ID'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_ord_return.ord_id IS
    'ORDER ID OF THE PRODUCT'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_ord_return.return_status IS
    'STATUS OF THE RETURN INITIATED'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_ord_return.tbl_last_dt IS
    'LAST UPDATED TIMESTAMP'; */

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE UNIQUE INDEX ajkk_ord_return__idx ON
    ajkk_ord_return (
        row_id
    ASC );

ALTER TABLE ajkk_ord_return ADD CONSTRAINT ajkk_ord_return_pk PRIMARY KEY ( ord_id );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ajkk_order (
    row_id      DECIMAL(20) NOT NULL COMMENT 'ROW ID',
    ord_id      VARCHAR(30) NOT NULL COMMENT 'ORDER ID',
    order_date  DATETIME NOT NULL COMMENT 'DATE OF ORDER',
    tbl_last_dt DATETIME NOT NULL COMMENT 'LAST UPDATED TIMESTAMP',
    cust_id     VARCHAR(30) NOT NULL COMMENT 'CUSTOMER ID',
    addr_id    BIGINT NOT NULL COMMENT 'ADDRESS ID'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_order.row_id IS
    'primary key'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_order.order_date IS
    'DATE OF ORDER'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_order.tbl_last_dt IS
    'LAST UPDATED TIMESTAMP'; */

ALTER TABLE ajkk_order ADD CONSTRAINT ajkk_order_pk PRIMARY KEY ( row_id );

CREATE UNIQUE INDEX ajkk_order_idx ON ajkk_order (row_id);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ajkk_product (
    prod_id     VARCHAR(15) NOT NULL COMMENT 'PRIMARY KEY',
    prod_name   VARCHAR(255) NOT NULL COMMENT 'PRODUCT NAME',
    sub_id      SMALLINT NOT NULL COMMENT 'SUB CATEGORY ID',
    tbl_last_dt DATETIME COMMENT 'LAST UPDATED TIMESTAMP'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_product.prod_id IS
    'PRIMARY KEY'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_product.prod_name IS
    'PRODUCT NAME'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_product.tbl_last_dt IS
    'LAST UPDATED TIMESTAMP'; */

ALTER TABLE ajkk_product ADD CONSTRAINT ajkk_product_pk PRIMARY KEY ( prod_id );

CREATE UNIQUE INDEX ajkk_prod_idx ON ajkk_product (product_id);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ajkk_region (
    reg_id      BIGINT NOT NULL COMMENT 'PRIMARY KEY' AUTO_INCREMENT,
    reg_name    VARCHAR(30) NOT NULL COMMENT 'REGION NAME',
    market_id   BIGINT NOT NULL COMMENT 'MARKET ID',
    tbl_last_dt DATETIME COMMENT 'LAST UPDATED TIMESTAMP',
    PRIMARY KEY ( reg_id ) 
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_region.reg_id IS
    'PRIMARY KEY'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_region.reg_name IS
    'region name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_region.tbl_last_dt IS
    'LAST UPDATED TIMESTAMP'; */

CREATE UNIQUE INDEX ajkk_region_idx ON ajkk_region (reg_id);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE ajkk_sub_ctg (
    sub_id      SMALLINT NOT NULL COMMENT 'PRIMARY KEY' AUTO_INCREMENT,
    sub_name    VARCHAR(30) NOT NULL COMMENT 'SUB CATEGORY NAME',
    cat_id      TINYINT NOT NULL COMMENT 'CATEGORY ID',
    tbl_last_dt DATETIME COMMENT 'LAST UPDATED TIMESTAMP',
    PRIMARY KEY ( sub_id )
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_sub_ctg.sub_id IS
    'PRIMARY KEY'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_sub_ctg.sub_name IS
    'SUB CATEGORY NAME'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN ajkk_sub_ctg.tbl_last_dt IS
    'LAST UPDATED TIMESTAMP'; */

CREATE UNIQUE INDEX ajkk_sub_ctg_idx ON ajkk_sub_ctg (sub_id);

ALTER TABLE ajkk_address
    ADD CONSTRAINT ajkk_address_ajkk_region_fk FOREIGN KEY ( reg_id )
        REFERENCES ajkk_region ( reg_id );

ALTER TABLE ajkk_customer
    ADD CONSTRAINT ajkk_customer_ajkk_address_fk FOREIGN KEY ( addr_id )
        REFERENCES ajkk_address ( addr_id );

ALTER TABLE ajkk_od_prod
    ADD CONSTRAINT ajkk_od_prod_ajkk_order_fk FOREIGN KEY ( row_id )
        REFERENCES ajkk_order ( row_id );

ALTER TABLE ajkk_od_prod
    ADD CONSTRAINT ajkk_od_prod_ajkk_product_fk FOREIGN KEY ( prod_id )
        REFERENCES ajkk_product ( prod_id );

ALTER TABLE ajkk_ord_return
    ADD CONSTRAINT ajkk_ord_return_ajkk_order_fk FOREIGN KEY ( row_id )
        REFERENCES ajkk_order ( row_id );

ALTER TABLE ajkk_order
    ADD CONSTRAINT ajkk_order_ajkk_customer_fk FOREIGN KEY ( cust_id )
        REFERENCES ajkk_customer ( cust_id );

ALTER TABLE ajkk_product
    ADD CONSTRAINT ajkk_product_ajkk_sub_ctg_fk FOREIGN KEY ( sub_id )
        REFERENCES ajkk_sub_ctg ( sub_id );

ALTER TABLE ajkk_region
    ADD CONSTRAINT ajkk_region_ajkk_market_fk FOREIGN KEY ( market_id )
        REFERENCES ajkk_market ( market_id );

ALTER TABLE ajkk_sub_ctg
    ADD CONSTRAINT ajkk_sub_ctg_ajkk_ctg_fk FOREIGN KEY ( cat_id )
        REFERENCES ajkk_ctg ( cat_id );
        
DELIMITER $$

CREATE TRIGGER `TI_AJKK_MARK_default_date` BEFORE INSERT ON `AJKK_MARKET`
FOR EACH ROW
if ( isnull(new.tbl_last_dt) ) then
set new.tbl_last_dt=current_timestamp();
end if;
$$
delimiter ;
DELIMITER $$
CREATE TRIGGER `TU_AJKK_MARK_default_date` BEFORE UPDATE ON `AJKK_MARKET` FOR EACH ROW
set NEW.tbl_last_dt=current_timestamp();
$$
delimiter ;

 

DELIMITER $$
CREATE TRIGGER `TI_AJKK_REGION_default_date` BEFORE INSERT ON `AJKK_REGION`
FOR EACH ROW
if ( isnull(new.tbl_last_dt) ) then
set new.tbl_last_dt=current_timestamp();
end if;
$$
delimiter ;
DELIMITER $$
CREATE TRIGGER `TU_AJKK_REGION_default_date` BEFORE UPDATE ON `AJKK_REGION` FOR EACH ROW
set NEW.tbl_last_dt=current_timestamp();
$$
delimiter ;

 

DELIMITER $$
CREATE TRIGGER `TI_AJKK_PRODUCT_default_date` BEFORE INSERT ON `AJKK_PRODUCT`
FOR EACH ROW
if ( isnull(new.tbl_last_dt) ) then
set new.tbl_last_dt=current_timestamp();
end if;
$$
delimiter ;
DELIMITER $$
CREATE TRIGGER `TU_AJKK_PRODUCT_default_date` BEFORE UPDATE ON `AJKK_PRODUCT` FOR
EACH ROW
set NEW.tbl_last_dt=current_timestamp();
$$
delimiter ;


DELIMITER $$
CREATE TRIGGER `TI_AJKK_SUB_CTG_default_date` BEFORE INSERT ON `AJKK_SUB_CTG`
FOR EACH ROW
if ( isnull(new.tbl_last_dt) ) then
set new.tbl_last_dt=current_timestamp();
end if;
$$
delimiter ;
DELIMITER $$
CREATE TRIGGER `TU_AJKK_SUB_CTG_default_date` BEFORE UPDATE ON `AJKK_SUB_CTG` FOR
EACH ROW
set NEW.tbl_last_dt=current_timestamp();
$$
delimiter ;
DELIMITER $$
CREATE TRIGGER `TI_AJKK_CTG_default_date` BEFORE INSERT ON `AJKK_CTG`
FOR EACH ROW
if ( isnull(new.tbl_last_dt) ) then
set new.tbl_last_dt=current_timestamp();
end if;
$$
delimiter ;
DELIMITER $$
CREATE TRIGGER `TU_AJKK_CTG_default_date` BEFORE UPDATE ON `AJKK_CTG` FOR
EACH ROW
set NEW.tbl_last_dt=current_timestamp();
$$
delimiter ;

DELIMITER $$
CREATE TRIGGER `TI_AJKK_ODPROD_default_date` BEFORE INSERT ON `AJKK_OD_PROD`
FOR EACH ROW
if ( isnull(new.tbl_last_dt) ) then
set new.tbl_last_dt=current_timestamp();
end if;
$$
delimiter ;
DELIMITER $$
CREATE TRIGGER `TU_AJKK_ODPROD_default_date` BEFORE UPDATE ON `AJKK_OD_PROD` FOR
EACH ROW
set NEW.tbl_last_dt=current_timestamp();
$$
delimiter ;



DELIMITER $$
CREATE TRIGGER `TI_AJKK_ORDRET_default_date` BEFORE INSERT ON `AJKK_ORD_RETURN`
FOR EACH ROW
if ( isnull(new.tbl_last_dt) ) then
set new.tbl_last_dt=current_timestamp();
end if;
$$
delimiter ;
DELIMITER $$
CREATE TRIGGER `TU_AJKK_ORDRET_default_date` BEFORE UPDATE ON `AJKK_ORD_RETURN` FOR
EACH ROW
set NEW.tbl_last_dt=current_timestamp();
$$
delimiter ;



DELIMITER $$
CREATE TRIGGER `TI_AJKK_ORDER_default_date` BEFORE INSERT ON `AJKK_ORDER`
FOR EACH ROW
if ( isnull(new.tbl_last_dt) ) then
set new.tbl_last_dt=current_timestamp();
end if;
$$
delimiter ;
DELIMITER $$
CREATE TRIGGER `TU_AJKK_ORDER_default_date` BEFORE UPDATE ON `AJKK_ORDER` FOR
EACH ROW
set NEW.tbl_last_dt=current_timestamp();
$$
delimiter ;



DELIMITER $$
CREATE TRIGGER `TI_AJKK_CUSTOMER_default_date` BEFORE INSERT ON `AJKK_CUSTOMER`
FOR EACH ROW
if ( isnull(new.tbl_last_dt) ) then
set new.tbl_last_dt=current_timestamp();
end if;
$$
delimiter ;
DELIMITER $$
CREATE TRIGGER `TU_AJKK_CUSTOMER_default_date` BEFORE UPDATE ON `AJKK_CUSTOMER` FOR
EACH ROW
set NEW.tbl_last_dt=current_timestamp();
$$
delimiter ;




DELIMITER $$
CREATE TRIGGER `TI_AJKK_ADDRESS_default_date` BEFORE INSERT ON `AJKK_ADDRESS`
FOR EACH ROW
if ( isnull(new.tbl_last_dt) ) then
set new.tbl_last_dt=current_timestamp();
end if;
$$
delimiter ;
DELIMITER $$
CREATE TRIGGER `TU_AJKK_ADDRESS_default_date` BEFORE UPDATE ON `AJKK_ADDRESS` FOR
EACH ROW
set NEW.tbl_last_dt=current_timestamp();
$$
delimiter ;
