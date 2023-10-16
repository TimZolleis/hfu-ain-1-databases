-- Create a table that matches the titanic.csv file
CREATE TABLE Titanic
(
    class    int,
    survived bool,
    name     varchar(100),
    gender   enum ('male', 'female'),
    age      int,
    sibsp    int,
    parch    int,
    ticket   varchar(100),
    fare     int,
    cabin    varchar(100),
    embarked enum ('C', 'Q', 'S'),
    boat     varchar(100),
    body     int,
    home     varchar(100)
);

-- Read the CSV with CSVREAD
INSERT INTO Titanic(SELECT *
                    FROM csvread('/opt/h2-data/titanic.csv'));

-- Create a unique column of name, gender and class
ALTER TABLE Titanic
    ADD UNIQUE (name, gender, class, age);
