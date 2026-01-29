/*
START STAGE 4
*/
SELECT
    DISTINCT(p.Name) AS playlist_name,
    time(ROUND(SUM(t.Milliseconds) / 1000), 'unixepoch') AS total_time
FROM Playlist p
JOIN PlaylistTrack pt
    ON p.PlaylistId = pt.PlaylistId
JOIN Track t
    ON pt.TrackId = t.TrackId
GROUP BY playlist_name
ORDER BY total_time DESC
LIMIT 5;
    
/*
END STAGE 4
*/

/*
Other Solution:
--
playlist_duration = "
SELECT
    DISTINCT(p.Name) AS playlist_name,
    time(ROUND(SUM(t.Milliseconds) / 1000), 'unixepoch') AS total_time
FROM Playlist p
JOIN PlaylistTrack pt
    ON p.PlaylistId = pt.PlaylistId
JOIN Track t
    ON pt.TrackId = t.TrackId
GROUP BY playlist_name
ORDER BY total_time DESC
LIMIT 5;
"
*/

/*
Other Solution:
--
    SELECT
        p.Name AS playlist_name,
        TIME(SUM(t.Milliseconds)/1000, 'unixepoch') AS total_time
    FROM
        Playlist p
    JOIN PlaylistTrack pt
        ON p.PlaylistId = pt.PlaylistId
    JOIN Track t
        ON pt.TrackId = t.TrackId
    GROUP BY
        p.Name
    ORDER BY
        total_time DESC
    LIMIT 5
    ;
*/

/*
Other Solution:
--

*/

/*
Other Solution:
--
SELECT DISTINCT(playlist_name), total_time
FROM (SELECT Playlist.Name                                            AS playlist_name,
             TIME(ROUND(SUM(Track.Milliseconds) / 1000), 'unixepoch') AS total_time
      FROM Playlist
               LEFT JOIN PlaylistTrack ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
               LEFT JOIN Track ON PlaylistTrack.TrackId = Track.TrackId
      GROUP BY Playlist.Name)
ORDER BY total_time DESC
LIMIT 5;
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