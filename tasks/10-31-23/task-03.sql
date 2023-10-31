-- Remove the column "embarked" from the titanic table and store it in an extra table called "embarked"


CREATE TABLE embarked
(
    id      INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    kuerzel VARCHAR(1) unique
);

-- Copy all embarkings from Titanic to Embarking
INSERT INTO embarked(kuerzel)(SELECT DISTINCT embarked
                              FROM Titanic
                              where EMBARKED IS NOT NULL);



ALTER TABLE embarked
    ADD COLUMN name VARCHAR(100) UNIQUE;

ALTER TABLE embarked
    ADD CONSTRAINT name_constraint CHECK (LOWER(LEFT(name, 1)) = LOWER(kuerzel));

UPDATE embarked
SET name = 'Cherbourg'
WHERE kuerzel = 'C';

UPDATE embarked
SET name = 'Queenstown'
WHERE kuerzel = 'Q';

UPDATE embarked
SET name = 'Southampton'
WHERE kuerzel = 'S';

-- Add a column "embarked_id" to the titanic table
ALTER TABLE titanic
    ADD COLUMN embarked_id INT;


-- Reference the embarked table with the id
ALTER TABLE titanic
    ADD CONSTRAINT FK_embarked_id
        FOREIGN KEY (embarked_id) REFERENCES embarked (id);

-- Add the respective ID values
-- noinspection SqlWithoutWhere
UPDATE TITANIC
SET TITANIC.embarked_id = (SELECT embarked.id
                           FROM embarked
                           WHERE embarked.kuerzel = titanic.embarked);


-- Delete the the "embarked" column from the titanic table
ALTER TABLE titanic
    DROP COLUMN embarked;

-- Delete the "kurzel" column from the embarked table

ALTER TABLE embarked
    DROP CONSTRAINT name_constraint;

ALTER TABLE embarked
    DROP COLUMN kuerzel;
