/*
START STAGE 1
*/
DELETE FROM Customer
WHERE CustomerId NOT IN (
    SELECT MIN(CustomerId)
    FROM Customer
    GROUP BY Email
);

/*
END STAGE 1
*/

/*
Other Solution:
--
duplicate_email = "
DELETE FROM Customer
WHERE CustomerId NOT IN (
    SELECT MIN(CustomerId)
    FROM Customer
    GROUP BY Email
);
"
*/

/*
Other Solution:
--
duplicate_email = "
DELETE FROM Customer
WHERE CustomerId IN (
    SELECT c1.CustomerId
    FROM Customer c1
    JOIN Customer c2 ON c1.Email = c2.Email AND c1.CustomerId > c2.CustomerId
);
"
*/

/*
Other Solution:
--
duplicate_email = "DELETE FROM Customer
                   WHERE CustomerId NOT IN (
                       SELECT * FROM (
                           SELECT MIN(CustomerId) FROM Customer
                           GROUP BY Email
                       )
                    );
    "
*/

/*
Other Solution:
--
duplicate_email = "
        DELETE FROM Customer
        WHERE (CustomerId, Email) NOT IN (
          SELECT MIN(CustomerId), Email
          FROM Customer
          GROUP BY Email
          HAVING COUNT(Email) > 1 OR COUNT(Email) = 1
        );
    "
*/

/*
Other Solution:
--

*/

/*
Other Solution:
--

*/

/*
Other Solution:
--

*/