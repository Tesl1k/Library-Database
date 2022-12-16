USE library;
GO
ALTER TRIGGER add_and_delete_book
ON ticket
CREATE INSERT, DELETE
AS
UPDATE reader
SET book_amount = (SELECT COUNT(reader_id) FROM ticket WHERE reader_id = (SELECT TOP 1 reader_id FROM inserted) OR reader_id = (SELECT TOP 1 reader_id FROM deleted) GROUP BY reader_id)
WHERE id = (SELECT reader_id FROM inserted) OR id =  (SELECT reader_id FROM deleted);
IF (SELECT TOP 1 book_amount FROM reader ORDER BY book_amount) IS NULL
	BEGIN
	UPDATE reader
	SET book_amount = 0
	WHERE id = (SELECT TOP 1 id FROM reader ORDER BY book_amount)
	END;
UPDATE ticket
SET date_of_issue = GETDATE()
WHERE id = (SELECT id FROM inserted);
UPDATE book
SET books_now = total_books - (SELECT COUNT(book_id) FROM ticket WHERE book_id = (SELECT TOP 1 book_id FROM inserted) OR book_id = (SELECT TOP 1 book_id FROM deleted) GROUP BY book_id)
WHERE id = (SELECT book_id FROM inserted) OR id = (SELECT book_id FROM deleted)
IF (SELECT TOP 1 books_now FROM book ORDER BY books_now) IS NULL
	BEGIN
	UPDATE book
	SET books_now = total_books
	WHERE id = (SELECT TOP 1 id FROM book ORDER BY books_now)
	END;
