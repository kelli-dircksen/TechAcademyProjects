USE [Library]
GO

SELECT COUNT(No_Of_Copies) AS NumerOfCopies FROM BOOK_COPIES
INNER JOIN BOOK
ON BOOK_COPIES.BookID = BOOK.BookID
INNER JOIN LIBRARY_BRANCH
ON LIBRARY_BRANCH.BranchID=BOOK_COPIES.BranchID
WHERE Title='The Lost Tribe' AND BranchName = 'Sharpstown'