USE CRM
GO

CREATE OR ALTER PROCEDURE GetAvailableSports AS
BEGIN
SELECT SportId, SportName from dbo.Sport
END

--EXEC GetAvailableSports