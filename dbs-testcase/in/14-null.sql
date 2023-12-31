-- @Name: null
-- @Depends: optional
-- @Flags: null
-- @Description: Check for "NULL" support
-- @Score: 2

USE DB;

-- Prepare data
CREATE TABLE T201 (ID INT, DATA VARCHAR(16), PRIMARY KEY (ID));

CREATE TABLE T202 (ID INT, T201_ID INT, DATA VARCHAR(16), PRIMARY KEY (ID), FOREIGN KEY (T201_ID) REFERENCES T201(ID));

CREATE TABLE T203 (ID INT, T201_ID INT NOT NULL, NN INT NOT NULL, DATA VARCHAR(16) NOT NULL, PRIMARY KEY (ID), FOREIGN KEY (T201_ID) REFERENCES T201(ID));

INSERT INTO T201 VALUES (1, '1'), (2, '2'), (3, '3'), (4, '4');
INSERT INTO T202 VALUES (1, 1, '1_1'), (2, 2, '2_2'), (3, 3, '3_3');
INSERT INTO T203 VALUES (1, 1, 1, '1_1'), (2, 2, 2, '2_2'), (3, 3, 3, '3_3');


-- Check set normal data to null
UPDATE T201 SET DATA = NULL WHERE T201.ID > 2;
SELECT * FROM T201;

-- Check null query
SELECT * FROM T201 WHERE T201.DATA < '4';
SELECT * FROM T201 WHERE T201.DATA IS NULL;
SELECT * FROM T201 WHERE T201.DATA IS NOT NULL;

-- Check error: not null constraint and pk can't be null
UPDATE T203 SET ID = NULL WHERE T203.ID = 1;
UPDATE T203 SET NN = NULL WHERE T203.ID = 1;

-- Check set null for fk
UPDATE T202 SET T201_ID = NULL WHERE T202.T201_ID = 1;
UPDATE T203 SET T201_ID = NULL WHERE T203.T201_ID = 1;
SELECT * FROM T202;
-- Line 1 succeeded ans line 2 failed

