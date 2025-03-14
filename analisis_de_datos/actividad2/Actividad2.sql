
#------------------------------------------------------------------------------------#
/* Traer todas las canciónes de la banda AC/DC    */
select album.Title as album,track.Name,artis.Name as artistName  from artist artis
inner join album on album.ArtistId=artis.Artistid
inner join track on track.AlbumId=album.Albumid
where artis.name="AC/DC";
#------------------------------------------------------------------------------------#


#------------------------------------------------------------------------------------#
/*  Traer todas las canciones del género de Rock    */
select album.Title as album,track.Name,artis.Name as artistName  from artist artis
inner join album on album.ArtistId=artis.Artistid
inner join track on track.AlbumId=album.Albumid
inner join Genre on Genre.GenreId=track.GenreId
where Genre.name="Rock";
#------------------------------------------------------------------------------------#

#------------------------------------------------------------------------------------#
/*  Traer todos los clientes que compraron canciones de Rock */
SELECT DISTINCT c.CustomerId, c.FirstName, c.LastName, c.Email
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock'
ORDER BY c.LastName, c.FirstName;
#------------------------------------------------------------------------------------#


#------------------------------------------------------------------------------------#
/*  Traer la cantidad de canciones compradas por cada cliente  */
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
#------------------------------------------------------------------------------------#



