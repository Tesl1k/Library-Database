USE library;
GO
CREATE TRIGGER close_add_book
ON ticket
AFTER INSERT
AS
UPDATE reader
SET book_amount = (SELECT COUNT(reader_id) FROM ticket WHERE reader_id = (SELECT TOP 1 reader_id FROM ticket ORDER BY id DESC) GROUP BY reader_id)
WHERE id = (SELECT TOP 1 reader_id FROM ticket ORDER BY id DESC);
UPDATE ticket
SET date_of_issue = GETDATE()
WHERE id = (SELECT TOP 1 id FROM ticket ORDER BY id DESC);