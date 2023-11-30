-- All passengers with specific ticket numbers
SELECT NAME
FROM TITANIC
WHERE TICKET IN ('113038', '1601', '21228', 'C 17368', 'A/5',
                 '21173,' 'A./5.,' '2152', '54636');

-- The amount of data in the table
SELECT COUNT(NAME)
FROM TITANIC;

-- How many survived?
SELECT COUNT(CASE WHEN SURVIVED = true THEN 1 END) AS "SURVIVED", COUNT(CASE WHEN SURVIVED = false THEN 1 END) AS "DIED"
FROM TITANIC;

-- Select all that are max 15 years old, and all over 15 years old
SELECT COUNT(CASE WHEN AGE <= 15 THEN 1 END) AS "UNDER 15", COUNT(CASE WHEN AGE > 15 THEN 1 END) AS "OVER 15"
FROM TITANIC;

-- The average age of all passengers, all that survived and all that died
SELECT AVG(AGE)                                     AS "ALL PASSENGERS",
       AVG(CASE WHEN SURVIVED = true THEN AGE END)  AS "SURVIVED",
       AVG(CASE WHEN SURVIVED = false THEN AGE END) AS "DIED"
FROM TITANIC;


-- All boats that are unique
SELECT DISTINCT BOAT
FROM TITANIC
WHERE BOAT NOT LIKE '% %';

-- Create a list of all boats with the number of passengers in it
SELECT BOAT, COUNT(BOAT) AS "PASSENGERS"
FROM TITANIC
WHERE BOAT NOT LIKE '% %'
GROUP BY BOAT;


-- Select all boats that have min 25. passengers
SELECT BOAT as "BOAT WITH >= 25 PASS", COUNT(BOAT) AS "PASSENGERS"
FROM TITANIC
WHERE BOAT NOT LIKE '% %'
GROUP BY BOAT
HAVING COUNT(BOAT) >= 25;


-- All duplicate tickets where the price is not the same
SELECT NAME, TICKET
FROM TITANIC
WHERE TICKET IN (
    SELECT TICKET
    FROM TITANIC
    GROUP BY TICKET
    HAVING COUNT(*) > 1
       AND COUNT(DISTINCT FARE) > 1
    );

-- Get the amount of people per class that survived
SELECT CLASS, COUNT(CLASS) AS "SURVIVED"
FROM TITANIC
WHERE SURVIVED = true
GROUP BY CLASS;