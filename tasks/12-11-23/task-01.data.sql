-- Insert some records for Hochschule
INSERT INTO Hochschule (name)
VALUES ('Freie Universität Berlin'),
       ('Heidelberg University'),
       ('University of Cologne'),
       ('Leipzig University'),
       ('Hochschule Furtwangen');
-- Insert some faculty records
INSERT INTO Fakultät (name, hochschule_id)
VALUES ('Psychologie', 1),
       ('Chemie', 2),
       ('Geschichte', 3),
       ('Mathematik', 4),
       ('Philosophie', 5),
       ('Soziologie', 1),
       ('Ingenieurwissenschaften', 2),
       ('Medizin', 3),
       ('Informatik', 4),
       ('Wirtschaftswissenschaften', 5);


-- Insert some records for Dozent
INSERT INTO Dozent (name, fakultät_id)
VALUES ('Prof. Becker', 1),
       ('Dr. Müller', 2),
       ('Dr. Weber', 3),
       ('Prof. Schneider', 4),
       ('Dr. Hofmann', 5),
       ('Prof. Wagner', 1),
       ('Dr. Richter', 2),
       ('Prof. Klein', 3),
       ('Dr. Wolf', 4),
       ('Prof. Schröder', 5);

-- Insert some records for Student
INSERT INTO Student (name, fakultät_id)
VALUES ('Anna Schmidt', 1),
       ('Lukas Fischer', 2),
       ('Sophie Meyer', 3),
       ('Maximilian Bauer', 4),
       ('Emilia Schmid', 5),
       ('Leon Wagner', 1),
       ('Emma Müller', 2),
       ('Noah Weber', 3),
       ('Mia Hoffmann', 4),
       ('Paul Schneider', 5);

-- Insert some records for Vorlesung
INSERT INTO Vorlesung (name, dozent_id)
VALUES ('Neuropsychologie', 1),
       ('Organische Chemie', 2),
       ('Europäische Geschichte', 3),
       ('Algebra', 4),
       ('Logik', 5),
       ('Mikrosoziologie', 1),
       ('Elektrotechnik', 2),
       ('Anatomie', 3),
       ('Softwareentwicklung', 4),
       ('Makroökonomie', 5);

-- Map some students to some lectures
INSERT INTO VorlesungStudent (vorlesung_id, student_id)
VALUES (1, 4),
       (2, 1),
       (4, 1),
       (5, 7),
       (10, 1),
       (8, 2),
       (8, 7),
       (3, 8),
       (7, 3),
       (9, 10);
