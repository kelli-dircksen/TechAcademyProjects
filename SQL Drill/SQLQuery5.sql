USE [Library]
GO

SELECT BranchName, COUNT(DueDate) AS TotalBooksOut FROM LIBRARY_BRANCH
INNER JOIN BOOK_LOANS
ON BOOK_LOANS.BranchID = LIBRARY_BRANCH.BranchID
WHERE DueDate >='2017-4-13'
GROUP BY BranchName