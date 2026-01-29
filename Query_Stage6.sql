/*
START STAGE 6
*/
WITH BestSellingArtist AS (
    SELECT
        ar.ArtistId,
        ar.Name,
        SUM(il.Quantity * il.UnitPrice) AS total_sales
    FROM Artist ar
    JOIN Album al ON ar.ArtistId = al.ArtistId
    JOIN Track t ON al.AlbumId = t.AlbumId
    JOIN InvoiceLine il ON t.TrackId = il.TrackId
    GROUP BY ar.ArtistId
    ORDER BY total_sales DESC
    LIMIT 1
),
CustomerSales AS (
    SELECT
        c.CustomerId,
        c.FirstName || ' ' || c.LastName AS FullName,
        SUM(il.Quantity * il.UnitPrice) AS price
    FROM Customer c
    JOIN Invoice i ON c.CustomerId = i.CustomerId
    JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
    JOIN Track t ON il.TrackId = t.TrackId
    JOIN Album al ON t.AlbumId = al.AlbumId
    JOIN BestSellingArtist bsa ON al.ArtistId = bsa.ArtistId
    GROUP BY c.CustomerId
)
SELECT
    CustomerId,
    FullName,
    ROUND(price, 2) AS price
FROM CustomerSales
ORDER BY price DESC
LIMIT 4;
    
/*
END STAGE 6
*/

/*
Other Solution:
--
top_purchaser = "
WITH BestSellingArtist AS (
    SELECT
        ar.ArtistId,
        ar.Name,
        SUM(il.Quantity * il.UnitPrice) AS total_sales
    FROM Artist ar
    JOIN Album al ON ar.ArtistId = al.ArtistId
    JOIN Track t ON al.AlbumId = t.AlbumId
    JOIN InvoiceLine il ON t.TrackId = il.TrackId
    GROUP BY ar.ArtistId
    ORDER BY total_sales DESC
    LIMIT 1
),
CustomerSales AS (
    SELECT
        c.CustomerId,
        c.FirstName || ' ' || c.LastName AS FullName,
        SUM(il.Quantity * il.UnitPrice) AS price
    FROM Customer c
    JOIN Invoice i ON c.CustomerId = i.CustomerId
    JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
    JOIN Track t ON il.TrackId = t.TrackId
    JOIN Album al ON t.AlbumId = al.AlbumId
    JOIN BestSellingArtist bsa ON al.ArtistId = bsa.ArtistId
    GROUP BY c.CustomerId
)
SELECT
    CustomerId,
    FullName,
    ROUND(price, 2) AS price
FROM CustomerSales
ORDER BY price DESC
LIMIT 4;"
*/

/*
Other Solution:
--
WITH top_artist AS (SELECT ar.ArtistId                               AS artist_id,
                           ROUND(SUM(il.Quantity * il.UnitPrice), 1) AS total_price
                    FROM Artist ar
                             JOIN Album a
                                  ON ar.ArtistId = a.ArtistId
                             JOIN Track t
                                  ON a.AlbumId = t.AlbumId
                             JOIN InvoiceLine il
                                  ON t.TrackId = il.TrackId
                    GROUP BY ar.ArtistId
                    ORDER BY total_price DESC
                    LIMIT 1)

SELECT c.CustomerId,
       c.FirstName || ' ' || c.LastName          AS FullName,
       ROUND(SUM(il.Quantity * il.UnitPrice), 2) AS price
FROM Customer c
         JOIN Invoice i
              ON c.CustomerId = i.CustomerId
         JOIN InvoiceLine il
              ON i.InvoiceId = il.InvoiceId
         JOIN Track t
              ON il.TrackId = t.TrackId
         JOIN Album a
              ON t.AlbumId = a.AlbumId
         CROSS JOIN top_artist
WHERE a.ArtistId = top_artist.artist_id
GROUP BY c.CustomerId, FullName
ORDER BY price DESC
LIMIT 4
;
*/

/*
Other Solution:
--
SELECT
    C.CustomerId,
    C.FirstName || ' ' || C.LastName AS FullName,
     ROUND(SUM(IL.Quantity * IL.UnitPrice), 2) AS price
FROM
    Customer C
JOIN
    Invoice I ON C.CustomerId = I.CustomerId
JOIN
    InvoiceLine IL ON I.InvoiceId = IL.InvoiceId
JOIN
    Track T ON IL.TrackId = T.TrackId
JOIN
    Album A ON T.AlbumId = A.AlbumId
JOIN
    Artist AR ON A.ArtistId = AR.ArtistId
WHERE
    AR.ArtistId = (
        SELECT
        Art.ArtistId
        FROM InvoiceLine IL
        JOIN Track T ON IL.TrackId = T.TrackId
        JOIN Album A ON T.AlbumId = A.AlbumId
        JOIN Artist Art ON A.ArtistId = Art.ArtistId
        GROUP BY Art.Name
        ORDER BY SUM(IL.Quantity * IL.UnitPrice) DESC
        LIMIT 1
    )
GROUP BY
    C.CustomerId,
    FullName
ORDER BY
     ROUND(SUM(IL.Quantity * IL.UnitPrice), 2) DESC
LIMIT 4;
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