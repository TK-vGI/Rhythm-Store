/*
START STAGE 2
*/
SELECT c.CustomerId,
       c.FirstName,
       c.LastName,
       c.Email
FROM Customer c
LEFT JOIN Invoice i ON i.CustomerId = c.CustomerId
WHERE i.InvoiceDate IS NULL
ORDER BY i.CustomerId;
    
/*
END STAGE 2
*/

/*
Other Solution:
--
passive_customers = "
SELECT c.CustomerId,
       c.FirstName,
       c.LastName,
       c.Email
FROM Customer c
LEFT JOIN Invoice i ON i.CustomerId = c.CustomerId
WHERE i.InvoiceDate IS NULL
ORDER BY i.CustomerId;
"
*/

/*
Other Solution:
--
    SELECT
        CustomerId,
        FirstName,
        LastName,
        Email
    FROM
        Customer
    WHERE CustomerId NOT IN(
        SELECT CustomerID
        FROM Invoice
    )
    ORDER BY CustomerId
    ;
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