ALTER FUNCTION add_peni(@id INT)
RETURNS INT
AS
BEGIN
DECLARE @amount_peni int, @date_of_issue DATE, @return_date DATE;
SET @amount_peni = 0;
SET @date_of_issue = (SELECT date_of_issue FROM ticket WHERE id = @id);
SET @return_date = (SELECT return_date FROM ticket WHERE id = @id);
IF DATEDIFF (day, @date_of_issue, @return_date) > 7
		BEGIN
			SET @amount_peni += (DATEDIFF (day, @date_of_issue, @return_date) - 7) * 5;	
			END;
		IF @return_date IS NULL AND DATEDIFF (day, @date_of_issue, GETDATE()) > 7
			BEGIN
			SET @amount_peni += (DATEDIFF (day, @date_of_issue, GETDATE()) - 7) * 5;
		END;
RETURN @amount_peni
END;