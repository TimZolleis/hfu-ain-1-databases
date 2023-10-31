-- This will fail, since t2 references t1 and t2 is not empty.
DROP TABLE IF EXISTS t1;
CREATE TABLE t1
(
    id int primary key
);

INSERT INTO t1
VALUES (4711);
DROP TABLE IF EXISTS t2;
CREATE TABLE t2
(
    id int primary key,
    c  int references t1
);
INSERT INTO t2
VALUES (0, 4711);
DELETE
FROM t1;

-- We can fix the delete statement as follows:
DELETE
FROM t2
WHERE c IN (SELECT id FROM t1);

DELETE
FROM t1;


-- This will set the foreign key column in the row referencing t1 in t2 to null.
DROP TABLE t1;
CREATE TABLE t1
(
    id int primary key
);
INSERT INTO t1
VALUES (4711);
DROP TABLE t2;
CREATE TABLE t2
(
    id int primary key,
    c  int references t1 on delete set null
);
INSERT INTO t2
VALUES (0, 4711);
DELETE
FROM t1;


DROP TABLE t1;
CREATE TABLE t1
(
    id int primary key
);
INSERT INTO t1
VALUES (4711);
DROP TABLE t2;

-- With that definition, it will not set the foreign key column null but rather delete the row referencing t1 in t2.
CREATE TABLE t2
(
    id int primary key,
    c  int references t1 on delete cascade
);
INSERT INTO t2
VALUES (0, 4711);
DELETE
FROM t1;


-- Delete all entries in t1 and t2
DELETE
FROM t1;
DELETE
FROM t2;

-- Create a table called t3 that references t2 with cascade
CREATE TABLE t3
(
    id int primary key,
    c  int references t2 on delete cascade
);

-- Alter table t1 to add a column "c" with the int datatype
ALTER TABLE t1
    ADD c int;

-- Alter table t1 to have a foreign key constraint on column "c" referencing t3
ALTER TABLE t1
    ADD FOREIGN KEY (c) REFERENCES t3;


-- Now, we have the following structure:
-- 1. t1 has a column "c" that references t3
-- 2. t3 has a column "c" that references t2
-- 3. t2 has a column "c" that references t1
-- It's essentially a circle!


-- With that structure, it is not possible to insert a dataset after executing all three create table statements, since we cannot satisfy the foreign key constraints. We have to modify it like that:

CREATE TABLE t1
(
    id int primary key
);

CREATE TABLE t2
(
    id int primary key,
    c  int references t1 on delete cascade
);

CREATE TABLE t3
(
    id int primary key,
    c  int references t2 on delete cascade
);

ALTER TABLE t1
    ADD c int;

-- Inser the data here, so the reference "ring" is not complete yet
INSERT INTO t1
VALUES (4711, 0);
INSERT INTO t2
VALUES (0, 4711);
INSERT INTO t3
VALUES (0, 0);
ALTER TABLE t1
    ADD FOREIGN KEY (c) REFERENCES t3 ON DELETE CASCADE;


-- Delete something from t3. It is possible because we used cascade, but deletes every record from every table
DELETE
FROM T3;




