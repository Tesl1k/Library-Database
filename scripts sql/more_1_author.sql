SELECT * FROM book_author;

SELECT id, book_name 
FROM book
WHERE id IN (SELECT book_id FROM book_author GROUP BY book_id HAVING COUNT(*) > 1);
