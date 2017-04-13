USE [Library]
GO

SELECT BORROWERS.Name, BORROWERS.Address, COUNT(DueDate) AS TotalBooksOut
FROM BORROWERS
INNER JOIN BOOK_LOANS
ON BOOK_LOANS.CardNo = BORROWERS.CardNo
WHERE DueDate >= '2017-4-13' 
GROUP BY BORROWERS.Name, BORROWERS.Address
HAVING COUNT(DueDate) >5