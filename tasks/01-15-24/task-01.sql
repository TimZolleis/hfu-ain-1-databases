// Get passenger per embarked
Select count(*) as PASSENGERS, EMBARKED.CITY AS CITY
From TITANIC,
     EMBARKED
WHERE EMBARKED.ID = TITANIC.EMBARKED_ID
GROUP BY EMBARKED.ID;

//Get name and age of the oldest passenger
SELECT NAME, AGE
FROM TITANIC
WHERE AGE IN (SELECT MAX(AGE) FROM TITANIC);

//Use a subquery instead of a join to
SELECT COUNT(*) AS COUNT
FROM TITANIC
WHERE TITANIC.EMBARKED_ID IN (SELECT ID FROM EMBARKED WHERE CITY LIKE '%town');

//This query returns the embared_id of the harbor with the least embarkings
SELECT EMBARKED_ID
FROM TITANIC,
     EMBARKED
WHERE EMBARKED_ID = EMBARKED.ID
GROUP BY TITANIC.EMBARKED_ID
HAVING COUNT(*) <= ALL (SELECT COUNT(*)
                        FROM TITANIC,
                             EMBARKED
                        WHERE EMBARKED_ID = EMBARKED.ID
                        GROUP BY EMBARKED_ID);

//Name of the passengers that embarked in the least used harbor
SELECT TITANIC.NAME, TITANIC.EMBARKED_ID
FROM TITANIC
WHERE EMBARKED_ID = (
    //Embarked ID of the least used harbor
    SELECT EMBARKED_ID
    FROM TITANIC,
         EMBARKED
    WHERE EMBARKED_ID = EMBARKED.ID
    GROUP BY TITANIC.EMBARKED_ID
    HAVING COUNT(*) <= ALL (
        //Embarked ID and count per harbor
        SELECT COUNT(*)
        FROM TITANIC,
             EMBARKED
        WHERE EMBARKED_ID = EMBARKED.ID
        GROUP BY EMBARKED_ID)
    );

//This query does not work because there a nulls in the age column
select name, age
from titanic
where age >= all (select age from titanic);

//We can fix this tho
SELECT NAME, AGE
FROM TITANIC
WHERE AGE >= ALL (SELECT AGE FROM TITANIC WHERE AGE IS NOT NULL);
