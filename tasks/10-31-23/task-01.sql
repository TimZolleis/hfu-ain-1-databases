-- This will fail, since C is nullable.
CREATE TABLE T
(
    c int
);
ALTER TABLE T
    ADD PRIMARY KEY (c);


-- This could be changed in such a way that it works:
CREATE TABLE T
(
    c int NOT NULL
);
ALTER TABLE T
    ADD PRIMARY KEY (c);

