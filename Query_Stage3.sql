/*
START STAGE 3
*/
SELECT
    a.Title AS Title,
    COUNT(il.InvoiceLineId) AS number_of_album
FROM Album a
JOIN Track t
    ON a.AlbumId = t.AlbumId
JOIN InvoiceLine il
    ON t.TrackId = il.TrackId
JOIN Invoice i
    ON il.InvoiceId = i.InvoiceId
GROUP BY a.AlbumId
ORDER BY number_of_album DESC
LIMIT 5;
    
/*
END STAGE 3
*/

/*
Other Solution:
--
best_selling_albums = "
SELECT
    a.Title AS Title,
    COUNT(il.InvoiceLineId) AS number_of_album
FROM Album a
JOIN Track t
    ON a.AlbumId = t.AlbumId
JOIN InvoiceLine il
    ON t.TrackId = il.TrackId
JOIN Invoice i
    ON il.InvoiceId = i.InvoiceId
GROUP BY a.AlbumId
ORDER BY number_of_album DESC
LIMIT 5;
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