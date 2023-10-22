-- Add primary key to titanic table
ALTER TABLE Titanic
    ADD COLUMN id INT PRIMARY KEY AUTO_INCREMENT;

SELECT DISTINCT embarked, sibsp, parch
from Titanic;

-- Add nine more constraints to the table
ALTER TABLE Titanic
    ADD CONSTRAINT age_constraint CHECK (age >= 0 OR age IS NULL);

ALTER TABLE Titanic
    ADD CONSTRAINT embarked_constraint CHECK (embarked IN ('C', 'Q', 'S'));

-- I know some people are gonna kill me for that in 2023
ALTER TABLE Titanic
    ADD CONSTRAINT gender_constraint CHECK (gender IN ('male', 'female'));

ALTER TABLE Titanic
    ADD CONSTRAINT parch_constraint CHECK (parch >= 0);

ALTER TABLE Titanic
    ADD CONSTRAINT sibsp_constraint CHECK (sibsp >= 0);

ALTER TABLE TITANIC
    ADD CONSTRAINT fare_constraint CHECK (fare >= 0);

ALTER TABLE TITANIC
    ALTER COLUMN ticket VARCHAR(100) NOT NULL;

ALTER TABLE TITANIC
    ALTER COLUMN name VARCHAR(100) NOT NULL;

ALTER TABLE TITANIC
    ADD CONSTRAINT class_constraint CHECK (class IN (1, 2, 3));


-- Create an own table for embarkings
CREATE TABLE Embarking
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    kuerzel VARCHAR(1)
);

-- Copy all embarkings from Titanic to Embarking
INSERT INTO Embarking(kuerzel)
SELECT DISTINCT embarked
FROM Titanic
where EMBARKED IS NOT NULL;


ALTER TABLE Embarking
    ADD COLUMN name VARCHAR(100);

ALTER TABLE Embarking
    ADD CONSTRAINT name_constraint CHECK (LOWER(LEFT(name, 1)) = LOWER(kuerzel));

UPDATE Embarking
SET name = 'Cherbourg'
WHERE kuerzel = 'C';

UPDATE Embarking
SET name = 'Queenstown'
WHERE kuerzel = 'Q';

UPDATE Embarking
SET name = 'Southampton'
WHERE kuerzel = 'S';