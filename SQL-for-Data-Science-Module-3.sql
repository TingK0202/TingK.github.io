--Q1) Using a subquery, find the names of all the tracks for the album "Californication".

SELECT Name, T.AlbumId, T.TrackId
FROM Tracks T
WHERE T.AlbumId IN (SELECT AlbumId 
     FROM Albums A
     WHERE A.Title = 'Californication');
      
-------------------------------------------------------------------------------------------------------------------
--Q2) Find the total number of invoices for each customer along with the customer's full name, city and email.

SELECT C.CustomerId, FirstName, LastName, City, Email, COUNT(InvoiceId) AS Totalnum_invoice
From Customers C
LEFT JOIN Invoices I 
ON C.CustomerId = I.CustomerId
Group BY C.CustomerId

-------------------------------------------------------------------------------------------------------------------
--Q3) Retrieve the track name, album, artistID, and trackID for all the albums.

SELECT t.TrackId, t.Name, a.Title, ar.ArtistId
FROM Tracks t
LEFT JOIN Albums a ON t.AlbumId = a.AlbumId
LEFT JOIN Artists ar ON a.ArtistId = ar.ArtistId

-------------------------------------------------------------------------------------------------------------------
--Q4) Retrieve a list with the managers last name, and the last name of the employees who report to him or her.

SELECT E1.LastName as Managers_LastName, E2.LastName as Employees_LastName
FROM Employees as E1
INNER JOIN Employees as E2
WHERE E1.EmployeeId = E2.ReportsTo

-------------------------------------------------------------------------------------------------------------------
--Q5) Find the name and ID of the artists who do not have albums.

SELECT Name, A1.ArtistId
FROM Artists A1
LEFT JOIN Albums A2 ON A1.ArtistId = A2.ArtistId
WHERE AlbumId IS NULL

-------------------------------------------------------------------------------------------------------------------
--Q6) Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.

SELECT FirstName, LastName
FROM Employees
UNION 
SELECT FirstName, LastName
FROM Customers
ORDER BY LastName DESC

-------------------------------------------------------------------------------------------------------------------
--Q7) See if there are any customers who have a different city listed in their billing city versus their customer city.

SELECT CustomerId, City
FROM Customers
WHERE City NOT IN (SELECT BillingCity FROM Invoices)
