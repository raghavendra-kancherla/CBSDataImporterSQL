USE CRM
GO

IF OBJECT_ID('dbo.Sport') IS NULL
Begin

	CREATE TABLE dbo.Sport (
	[SportId] INT NOT NULL Primary Key ,
	[SportName] Varchar(100) NOT NUll
	)
END

IF OBJECT_ID('dbo.Player') IS NULL
Begin
	CREATE TABLE dbo.Player (
	[PlayerId] INT NOT NULL Primary Key IDENTITY,
	[PlayerExternalId] INT NOT NULL,
	[FirstName] VARCHAR(50)  NULL,
	[LastName] VARCHAR(50) NULL,
	[Age] INT NULL,
	[Photo] VARCHAR(200) NULL,
	[ProStatus] VARCHAR(20) NULL,
	[ProTeam] VARCHAR(50) NULL,
	[Position] VARCHAR(20) NULL,
	[OffenseDefenseEligibility] VARCHAR(50) NULL,
	[EliasId] VARCHAR(50) NULL,
	[Bats] VARCHAR(50) NULL,
	[Throws] VARCHAR(50)NULL,
	[ByeWeek] VARCHAR(50) NULL,
	[Icons] Varchar(250) NULL,
	[SportId] INT NOT NUll
	)
END

IF TYPE_ID(N'dbo.PlayerUdt') IS  NULL
BEGIN
	CREATE Type dbo.PlayerUdt AS Table(
	[PlayerExternalId] INT NOT NULL,
	[FirstName] VARCHAR(50)  NULL,
	[LastName] VARCHAR(50) NULL,
	[Age] INT NULL,
	[Photo] VARCHAR(200) NULL,
	[ProStatus] VARCHAR(20) NULL,
	[ProTeam] VARCHAR(50) NULL,
	[Position] VARCHAR(20) NULL,
	[OffenseDefenseEligibility] VARCHAR(50) NULL,
	[EliasId] VARCHAR(50) NULL,
	[Bats] VARCHAR(50) NULL,
	[Throws] VARCHAR(50)NULL,
	[ByeWeek] VARCHAR(50) NULL,
	[Icons] Varchar(250) NULL,
	[SportId] INT NOT NUll
	)
END


INSERT INTO dbo.Sport
VALUES (1, 'Football'), (2,'BasketBall'), (3,'BaseBall')
