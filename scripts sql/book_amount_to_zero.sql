USE library
GO
CREATE TRIGGER book_zero
ON reader
AFTER INSERT
AS
UPDATE reader
SET book_amount = 0
WHERE id = (SELECT id FROM inserted)