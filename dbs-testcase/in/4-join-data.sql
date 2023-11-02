-- @Name: join-data
-- @Depends: query-data-a
-- @Flags: join
-- @Description: Two table join with large amount data
-- @Score: 3

USE DATASET;

-- Two tables join (25 * 5) 
SELECT NATION.N_NAME, NATION.N_NATIONKEY FROM NATION, REGION WHERE NATION.N_REGIONKEY = REGION.R_REGIONKEY AND NATION.N_NATIONKEY > 20 AND REGION.R_NAME = 'ASIA';

-- Two tables join (3,000 * 25)
SELECT SUPPLIER.S_SUPPKEY, SUPPLIER.S_NAME, SUPPLIER.S_NATIONKEY, NATION.N_NAME FROM SUPPLIER, NATION WHERE SUPPLIER.S_NATIONKEY = NATION.N_NATIONKEY AND NATION.N_NATIONKEY = 24 AND SUPPLIER.S_ACCTBAL > 8888.8;

-- Two tables join (45,000 * 3,000)
SELECT CUSTOMER.C_NAME, SUPPLIER.S_NAME FROM CUSTOMER, SUPPLIER WHERE CUSTOMER.C_NATIONKEY = SUPPLIER.S_NATIONKEY AND CUSTOMER.C_ACCTBAL < -999 AND SUPPLIER.S_ACCTBAL < -888;
