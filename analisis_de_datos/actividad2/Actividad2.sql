select album.Title as album,track.Name,artis.Name as artistName  from artist artis
inner join album on album.ArtistId=artis.Artistid
inner join track on track.AlbumId=album.Albumid
where artis.name="AC/DC";

select album.Title as album,track.Name,artis.Name as artistName  from artist artis
inner join album on album.ArtistId=artis.Artistid
inner join track on track.AlbumId=album.Albumid
inner join Genre on Genre.GenreId=track.GenreId
where Genre.name="Rock";


SELECT DISTINCT c.CustomerId, c.FirstName, c.LastName, c.Email
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock'
ORDER BY c.LastName, c.FirstName;

SELECT 
    c.CustomerId, 
    c.FirstName, 
    c.LastName, 
    c.Email, 
    COUNT(il.TrackId) AS total_songs_purchased
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
GROUP BY c.CustomerId, c.FirstName, c.LastName, c.Email
ORDER BY total_songs_purchased DESC;



