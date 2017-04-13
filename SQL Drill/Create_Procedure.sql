USE [Library]
GO

CREATE PROCEDURE dbo.LIBRARY_BRANCH1 @BranchName nvarchar(50), @DueDate nchar(10)
AS 
SELECT BOOK.Title, BORROWERS.Name, BORROWERS.Address FROM LIBRARY_BRANCH
INNER JOIN BOOK_LOANS
ON BOOK_LOANS.BranchID = LIBRARY_BRANCH.BranchID
INNER JOIN BORROWERS
ON BORROWERS.CardNo = BOOK_LOANS.CardNo
INNER JOIN BOOK
ON BOOK.BookID = BOOK_LOANS.BookID
WHERE LIBRARY_BRANCH.BranchName = @BranchName 
AND BOOK_LOANS.DueDate = @DueDate