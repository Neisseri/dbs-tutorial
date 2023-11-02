-- @Name: query-order
-- @Depends: optional
-- @Flags: order
-- @Description: Ordered query for pagination
-- @Score: 2
USE DATASET;

SELECT * FROM NATION ORDER BY N_REGIONKEY;
SELECT * FROM NATION ORDER BY N_REGIONKEY DESC;

SELECT LINEITEM.L_ORDERKEY, LINEITEM.L_LINENUMBER, LINEITEM.L_SUPPKEY FROM LINEITEM WHERE LINEITEM.L_ORDERKEY < 10 ORDER BY L_SUPPKEY LIMIT 10;
SELECT LINEITEM.L_ORDERKEY, LINEITEM.L_LINENUMBER, LINEITEM.L_SUPPKEY FROM LINEITEM WHERE LINEITEM.L_ORDERKEY < 10 ORDER BY L_SUPPKEY LIMIT 9 OFFSET 10;
SELECT LINEITEM.L_ORDERKEY, LINEITEM.L_LINENUMBER, LINEITEM.L_SUPPKEY FROM LINEITEM WHERE LINEITEM.L_ORDERKEY < 10 ORDER BY L_SUPPKEY LIMIT 8 OFFSET 19;
SELECT LINEITEM.L_ORDERKEY, LINEITEM.L_LINENUMBER, LINEITEM.L_SUPPKEY FROM LINEITEM WHERE LINEITEM.L_ORDERKEY < 10 ORDER BY L_SUPPKEY LIMIT 7 OFFSET 27;
