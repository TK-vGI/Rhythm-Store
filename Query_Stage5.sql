/*
START STAGE 5
*/
SELECT ar.Name                          AS artist_name,
       round(SUM(i.Quantity * i.UnitPrice),1) AS total_price
FROM Artist ar
         LEFT JOIN Album al
             ON al.ArtistId = ar.ArtistId
         LEFT JOIN Track t
             ON t.AlbumId = al.AlbumId
         LEFT JOIN InvoiceLine i
             ON i.TrackId = t.TrackId
GROUP BY
    ar.ArtistId
ORDER BY
    total_price DESC
LIMIT 5;
    
/*
END STAGE 5
*/

/*
Other Solution:
--
best_sell_artist  = "
SELECT ar.Name                          AS artist_name,
       round(SUM(i.Quantity * i.UnitPrice),1) AS total_price
FROM Artist ar
         LEFT JOIN Album al
             ON al.ArtistId = ar.ArtistId
         LEFT JOIN Track t
             ON t.AlbumId = al.AlbumId
         LEFT JOIN InvoiceLine i
             ON i.TrackId = t.TrackId
GROUP BY
    ar.ArtistId
ORDER BY
    total_price DESC
LIMIT 5;
"
*/

/*
Other Solution:
--
SELECT
    ar.Name AS artist_name,
    ROUND(SUM(il.UnitPrice * il.Quantity), 1) AS total_price
FROM Artist ar
JOIN Album al ON ar.ArtistId = al.ArtistId
JOIN Track t ON al.AlbumId = t.AlbumId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY ar.Name
ORDER BY total_price DESC
LIMIT 5;
*/

/*
Other Solution:
--
SELECT artist_name, total_price FROM
(SELECT artist_name, ROUND(SUM(price), 1) AS total_price
FROM
(SELECT Artist.name AS artist_name,
InvoiceLine.UnitPrice * InvoiceLine.Quantity AS price
FROM Artist
LEFT JOIN Album ON Artist.ArtistId = Album.ArtistId
LEFT JOIN Track ON Album.AlbumId = Track.AlbumId
LEFT JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId)
GROUP BY artist_name)
ORDER BY total_price DESC LIMIT 5;"
*/

/*
Other Solution:
--
best_sell_artist = "SELECT Artist.Name as artist_name, ROUND(SUM(IL.Quantity*IL.UnitPrice),1) as total_price
    FROM Artist
    JOIN Album ON Artist.ArtistId = Album.ArtistId
    JOIN Track ON Track.AlbumId = Album.AlbumId
    JOIN InvoiceLine as IL ON Track.TrackId = IL.TrackId
    GROUP BY artist_name ORDER BY total_price DESC LIMIT 5;"
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