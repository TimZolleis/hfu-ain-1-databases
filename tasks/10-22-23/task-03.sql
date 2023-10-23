-- Fix the error in the "reise" table
-- Either make the "id" column a primary key or make it unique
CREATE TABLE Reise
(
    id             int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ziel           varchar(20),
    preis          int,
    dauer          int,
    verkehrsmittel varchar(20),
    anfangsdatum   varchar(20)
);

-- Add two more constraints
ALTER TABLE Reise
    ADD CONSTRAINT reise_preis_constraint CHECK (preis > 0);

ALTER TABLE Reise
    ADD CONSTRAINT reise_dauer_constraint CHECK (dauer > 0);

-- Add some data
INSERT INTO Reise (ziel, preis, dauer, verkehrsmittel, anfangsdatum)
VALUES ('Rom', 100, 3, 'Zug', '2019-01-01'),
       ('Florenz', 120, 4, 'Auto', '2023-06-12'),
       ('London', 70, 7, 'Flugzeug', '2023-08-10');

-- Add constraint that "preis" is at least 50
ALTER TABLE Reise
    ADD CONSTRAINT reise_preis_groesser_50_constraint CHECK (preis >= 50);

-- Add some more data
INSERT INTO Reise (ziel, preis, dauer, verkehrsmittel, anfangsdatum)
VALUES ('Washington DC', 200, 10, 'Flugzeug', '2023-08-10'),
       ('New York', 150, 7, 'Flugzeug', '2023-08-10');

-- Now, split it into some more tables

CREATE TABLE Verkehrsmittel
(
    id   int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(20) UNIQUE
);

CREATE TABLE Ziele
(
    id   int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(20) UNIQUE
);

-- We now define a "fancy" reise table with some foreign keys
CREATE TABLE FancyReise
(
    id                int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ziel_id           int,
    preis             int,
    dauer             int,
    verkehrsmittel_id int,
    anfangsdatum      varchar(20),
    FOREIGN KEY (ziel_id) REFERENCES Ziele (id),
    FOREIGN KEY (verkehrsmittel_id) REFERENCES Verkehrsmittel (id)
);

-- Add three items to each table
INSERT INTO Verkehrsmittel (name)
VALUES ('Zug'),
       ('Auto'),
       ('Flugzeug');


INSERT INTO Ziele (name)
VALUES ('Rom'),
       ('Florenz'),
       ('London');

--Add some more data
INSERT INTO FancyReise (preis, anfangsdatum, dauer, ziel_id, verkehrsmittel_id)
VALUES (100, '2023-06-01', 7, SELECT id from Ziele WHERE name = 'Rom',
        SELECT id from Verkehrsmittel WHERE name = 'Zug'),
       (120, '2023-06-01', 7, SELECT id from Ziele WHERE name = 'Florenz',
        SELECT id from Verkehrsmittel WHERE name = 'Auto'),
       (70, '2023-06-01', 7, SELECT id from Ziele WHERE name = 'London',
        SELECT id from Verkehrsmittel WHERE name = 'Flugzeug');

