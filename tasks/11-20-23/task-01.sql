-- Select the ones with 'A/5. 3336' as the ticket number
SELECT NAME
FROM TITANIC
WHERE TICKET = 'A/5. 3336';

-- The sibsp column shows everyone's number of siblings and spouses, the parch everyones parents and children. We want the ones without them.
SELECT NAME
FROM TITANIC
WHERE SIBSP = 0
  AND PARCH = 0;

-- Select the types of classes
SELECT DISTINCT CLASS
FROM TITANIC;

-- Select the ones where the ticket price is unknown
SELECT NAME
FROM TITANIC
WHERE FARE IS NULL;

-- Select everyone who travelled for free
SELECT NAME
FROM TITANIC
WHERE FARE = 0;

-- Select the ticket number of John Jacob Astor
SELECT TICKET
FROM TITANIC
WHERE NAME LIKE '%Astor, Mr%';
-- Or we could search explicitly
SELECT TICKET
FROM TITANIC
WHERE NAME = 'Astor, Col. John Jacob';

-- Select everyone who travelled under the same ticket as astor
SELECT NAME
FROM TITANIC
WHERE TICKET = 'PC 17757';

-- Select everyone who survived without a lifeboat
SELECT NAME
FROM TITANIC
WHERE SURVIVED = true
  AND BOAT IS NULL;

-- Select everyone who didn't survive but was in a lifeboat
SELECT NAME
FROM TITANIC
WHERE SURVIVED = false
  AND BOAT IS NOT NULL;


-- Select everyone who was not "Mr" or "Master
SELECT NAME
FROM TITANIC
WHERE GENDER = 'male'
  AND NAME NOT LIKE '%Mr%'
  AND NAME NOT LIKE '%Master%';


-- Select the different boats. It cannot be precise, since some people were in multiple boats
SELECT DISTINCT BOAT
FROM TITANIC
WHERE BOAT IS NOT NULL;


-- Try to get one from germany
SELECT NAME
FROM TITANIC
WHERE HOME LIKE '%Germany%';
SELECT HOME
FROM TITANIC
WHERE NAME = 'Nourney, Mr. Alfred ("Baron von Drachstedt")';

-- Select every girl older than 10 and younger than 16
SELECT NAME
FROM TITANIC
WHERE GENDER = 'female'
  AND AGE BETWEEN 10 AND 16;

-- Select everyone younger than equal 12 without parents or siblings
SELECT NAME
FROM TITANIC
WHERE AGE <= 12
  AND SIBSP = 0
  AND PARCH = 0;