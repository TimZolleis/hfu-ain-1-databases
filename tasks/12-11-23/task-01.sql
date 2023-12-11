-- Hochschule
CREATE TABLE Hochschule
(
    id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);
-- Fakultät
CREATE TABLE Fakultät
(
    id            INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name          VARCHAR(255) NOT NULL,
    hochschule_id INT          NOT NULL,
    FOREIGN KEY (hochschule_id) REFERENCES Hochschule (id),
    UNIQUE (name, hochschule_id)
);

-- Dozent
CREATE TABLE Dozent
(
    id          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    fakultät_id INT          NOT NULL,
    FOREIGN KEY (fakultät_id) REFERENCES Fakultät (id)
);

-- Student
CREATE TABLE STUDENT
(
    id          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    fakultät_id INT,
    FOREIGN KEY (fakultät_id) REFERENCES Fakultät (id)
);

-- Vorlesung
CREATE TABLE Vorlesung
(
    id        INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name      VARCHAR(255) NOT NULL,
    dozent_id INT          NOT NULL,
    FOREIGN KEY (dozent_id) REFERENCES Dozent (id)
);

--VorlesungStudent
CREATE TABLE VorlesungStudent
(
    vorlesung_id INT NOT NULL,
    student_id   INT NOT NULL,
    FOREIGN KEY (vorlesung_id) REFERENCES Vorlesung (id),
    FOREIGN KEY (student_id) REFERENCES Student (id),
    PRIMARY KEY (vorlesung_id, student_id)
);