-- Create the "barcodes" table
CREATE TABLE barcodes
(
    id        int generated always as identity primary key,
    taxon     varchar(50) not null,
    type      varchar(1),
    voucherID varchar(12),
    gardenID  varchar(30),
    sampleID  varchar(12),
    origin    varchar(70),
    rpoB      varchar(12),
    rpoC      varchar(12),
    matK      varchar(12),
    trnHpsbA  varchar(12),
    rpl32     varchar(12)
);


-- You could use SELECT DISTINCT per column and count to get the amount of non-distinct values...but that takes forever


-- Read the data from the CSV file
INSERT INTO barcodes (taxon, type, voucherID, gardenID, sampleID, origin, rpoB, rpoC, matK, trnHpsbA, rpl32)
        (SELECT * FROM csvread('barcodes.csv'));

-- Check if the data exists
SELECT *
FROM barcodes;


-- Get the number of distinct taxa
SELECT COUNT(DISTINCT taxon)
FROM barcodes;

-- Create the "taxa" table
CREATE TABLE taxa
(
    id   int generated always as identity primary key,
    name varchar(50) unique not null
);

-- Copy the taxa data to the new table
INSERT INTO taxa (name)
        (SELECT DISTINCT taxon FROM barcodes WHERE taxon IS NOT NULL);

-- Add the taxonId column to the barcodes table
ALTER TABLE barcodes
    ADD COLUMN taxonId int;

-- Update the taxonId column
UPDATE barcodes
SET taxonId = (SELECT id FROM taxa WHERE name = barcodes.taxon);

-- Make taxonID a foreign key for taxa
ALTER TABLE barcodes
    ADD CONSTRAINT fk_taxonId FOREIGN KEY (taxonId) REFERENCES taxa (id);

-- Remove the taxon column from the barcodes table
ALTER TABLE barcodes
    DROP COLUMN taxon;