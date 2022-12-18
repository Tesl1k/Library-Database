DECLARE @n INT, @len INT, @name NVARCHAR(55), @amount_peni INT;
SET @n = 1;
SET @amount_peni = 0;
SET @len = (SELECT TOP 1 id FROM ticket ORDER BY id DESC) + 1;
WHILE @n != @len
	BEGIN		
		SET @amount_peni += dbo.add_peni(@n);
		SET @name = (SELECT first_name FROM reader WHERE id = (SELECT reader_id FROM ticket WHERE id = @n));				
		UPDATE reader
		SET amount_peni = @amount_peni WHERE id = (SELECT reader_id FROM ticket WHERE id = @n);
		PRINT @name + ' ' + CAST(dbo.add_peni(@n) AS VARCHAR(10)) + ' ' + CAST(@amount_peni AS VARCHAR(20));
		IF (SELECT reader_id FROM ticket WHERE id = @n) != 1 AND (SELECT reader_id FROM ticket WHERE id = @n) != (SELECT reader_id FROM ticket WHERE id = @n + 1) OR (SELECT reader_id FROM ticket WHERE id = @n - 1) IS NULL
			SET @amount_peni = 0;
		SET @n += 1;
	END;



