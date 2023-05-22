-- Create and populate the new columns
ALTER TABLE ajkk_awesome_inc_table ADD COLUMN `Customer FName` VARCHAR(255) AFTER `Customer Name`;
ALTER TABLE ajkk_awesome_inc_table ADD COLUMN `Customer LName` VARCHAR(255) AFTER `Customer FName`;
UPDATE ajkk_awesome_inc_table SET `Customer FName` = SUBSTRING_INDEX(`Customer Name`, ' ', 1);
UPDATE ajkk_awesome_inc_table SET `Customer LName` = SUBSTRING(`Customer Name`, LENGTH(`Customer FName`) + 2);

-- Drop the original column
ALTER TABLE ajkk_awesome_inc_table DROP COLUMN `Customer Name`;

UPDATE ajkk_awesome_inc_table
SET Sales = REPLACE(Sales, '$', ''),
    Profit = REPLACE(Profit, '$', '');

UPDATE ajkk_awesome_inc_table SET profit = REPLACE(profit, ',', '');
UPDATE ajkk_awesome_inc_table SET sales = REPLACE(sales, ',', '');

INSERT INTO ajkk_market (MARKET_NAME)
SELECT DISTINCT ajkk_awesome_inc_table.MARKET
FROM ajkk_awesome_inc_table;


INSERT INTO ajkk_region (REG_NAME, MARKET_ID)
SELECT DISTINCT ai.REGION, am.MARKET_ID
FROM ajkk_awesome_inc_table ai
INNER JOIN ajkk_market am ON ai.MARKET = am.MARKET_NAME
ON DUPLICATE KEY UPDATE REG_NAME = ai.REGION, MARKET_ID = am.MARKET_ID;

INSERT INTO ajkk_address (POSTAL_CODE, STREET, CITY, STATE, COUNTRY, REG_ID)
SELECT DISTINCT ajkk_awesome_inc_table.`POSTAL CODE`, NULL AS STREET, ajkk_awesome_inc_table.CITY, ajkk_awesome_inc_table.STATE, ajkk_awesome_inc_table.COUNTRY, ajkk_region.REG_ID
FROM ajkk_awesome_inc_table
INNER JOIN ajkk_region ON ajkk_awesome_inc_table.REGION = ajkk_region.REG_NAME
WHERE NOT EXISTS (
    SELECT 1
    FROM ajkk_address
    WHERE ajkk_address.CITY = ajkk_awesome_inc_table.CITY AND ajkk_address.STATE = ajkk_awesome_inc_table.STATE
    AND ajkk_address.COUNTRY = ajkk_awesome_inc_table.COUNTRY AND ajkk_address.POSTAL_CODE = ajkk_awesome_inc_table.`POSTAL CODE`
);


INSERT INTO ajkk_customer (CUST_ID, CUST_FNAME, CUST_LNAME, SEGMENT, ADDR_ID)
SELECT DISTINCT a.`Customer ID`, a.`Customer FName`, a.`Customer LName`, a.SEGMENT, ad.ADDR_ID
FROM ajkk_awesome_inc_table a
INNER JOIN ajkk_address ad ON a.`POSTAL CODE` = ad.POSTAL_CODE
AND a.CITY = ad.CITY
AND a.STATE = ad.STATE
AND a.COUNTRY = ad.COUNTRY
WHERE NOT EXISTS (
SELECT 1
FROM ajkk_customer c
WHERE c.CUST_ID = a.`Customer ID`
AND c.ADDR_ID = ad.ADDR_ID
);


INSERT INTO ajkk_order (ROW_ID, ORD_ID, ORDER_DATE, CUST_ID, ADDR_ID)
SELECT ai.`Row ID`, ai.`Order ID`, STR_TO_DATE(ai.`Order Date`, '%m/%d/%Y'), ai.`Customer ID`, aa.ADDR_ID
FROM ajkk_awesome_inc_table ai
INNER JOIN ajkk_address aa ON ai.`POSTAL CODE` = aa.POSTAL_CODE
AND ai.CITY = aa.CITY
AND ai.STATE = aa.STATE
AND ai.COUNTRY = aa.COUNTRY
INNER JOIN ajkk_customer ac ON ai.`Customer ID` = ac.CUST_ID
AND ai.`Customer FName` = ac.CUST_FNAME
AND ai.`Customer LName` = ac.CUST_LNAME
AND ai.SEGMENT = ac.SEGMENT
AND aa.ADDR_ID = ac.ADDR_ID;


INSERT IGNORE INTO ajkk_ord_return (ORD_ID, RETURN_STATUS, ROW_ID)
SELECT o.ORD_ID, IF(a.RETURNED = 'Yes', 'Yes', 'No') AS RETURN_STATUS, MIN(o.ROW_ID) AS ROW_ID
FROM ajkk_order o
LEFT JOIN ajkk_awesome_inc_returns a ON o.ORD_ID = a.`Order Id`
WHERE NOT EXISTS (
  SELECT 1 FROM ajkk_ord_return r WHERE r.ORD_ID = o.ORD_ID
)
GROUP BY o.ORD_ID, a.RETURNED;
