WITH RankedEmails AS (
    SELECT Id, Email,
           ROW_NUMBER() OVER (PARTITION BY Email ORDER BY Id ASC) AS rn
    FROM Person
)
DELETE FROM Person WHERE Id IN (
    SELECT Id FROM RankedEmails WHERE rn > 1
);

select * from Person

