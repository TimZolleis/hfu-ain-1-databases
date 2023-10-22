-- Add new columns to the cities table
ALTER TABLE Cities
    ADD COLUMN laengengrad DECIMAL(2, 4);

ALTER TABLE Cities
    ADD COLUMN breitengrad DECIMAl(2, 4);

-- Fill some data
UPDATE TABLE Cities
SET laengengrad = 10.8978, breitengrad = 48.3705
WHERE Name = 'Augsburg';

UPDATE TABLE Cities
SET laengengrad = 11.5819, breitengrad = 48.1351
WHERE Name = 'München';

UPDATE TABLE Cities
SET laengengrad = -0.1277, breitengrad = 51.5070
WHERE Name = 'London';


-- Delete the Beschreibung column from the Attractions table
ALTER TABLE Attractions
DROP
COLUMN Beschreibung;

-- 1. Delete the attractions table
DROP TABLE Attractions;

-- 2. Create the table without a foreign key
CREATE TABLE Attractions
(
    id           int          NOT NULL AUTO_INCREMENT,
    Name         varchar(255) NOT NULL,
    Beschreibung varchar(50)  NOT NULL,
    Stadt        int          NOT NULL,
    PRIMARY KEY (id),
);

-- 3. Add the foreign key
ALTER TABLE Attractions
    ADD CONSTRAINT ref_tabelle_stadt FOREIGN KEY (Stadt) references Stadt (id);


