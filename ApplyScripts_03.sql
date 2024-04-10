USE CRM
GO

CREATE OR ALTER PROCEDURE SavePlayers( @Players dbo.PlayerUdt READONLY)
AS
BEGIN

	MERGE dbo.Player as Target
	USING @players AS Source
	ON [Source].PlayerExternalId = [Target]. PlayerExternalId
	AND Source.SportId = [Target].SportId

	WHEN MATCHED  AND 
	COALESCE([Source].[FirstName], '') <> COALESCE(Target.[FirstName], '')
	OR COALESCE([Source].[LastName], '') <> COALESCE(Target.[LastName], '')
 	OR COALESCE([Source].[Age], '') <> COALESCE(Target.[Age], '')
	OR COALESCE([Source].[Photo], '') <> COALESCE(Target.[Photo], '')
	OR COALESCE([Source].[ProStatus], '') <> COALESCE(Target.[ProStatus], '')
	OR COALESCE([Source].[ProTeam], '') <> COALESCE(Target.[ProTeam], '')
	OR COALESCE([Source].[Position], '') <> COALESCE(Target.[Position], '')
	OR COALESCE([Source].[OffenseDefenseEligibility], '') <> COALESCE(Target.[OffenseDefenseEligibility], '')
	OR COALESCE([Source].[EliasId], '') <> COALESCE(Target.[EliasId], '')
	OR COALESCE([Source].[Bats], '') <> COALESCE(Target.[Bats], '')
	OR COALESCE([Source].[Throws], '') <> COALESCE(Target.[Throws], '')
	OR COALESCE([Source].[ByeWeek], '') <> COALESCE(Target.[ByeWeek], '')
	OR COALESCE([Source].[Icons], '') <> COALESCE(Target.[Icons], '')

	THEN UPDATE SET
	Target.FirstName = [Source].FirstName,
	Target.LastName = [Source].LastName,
	Target.Age = [Source].Age,	
	Target.Photo = [Source].Photo,
	Target.ProStatus = [Source].ProStatus,
	Target.ProTeam = [Source].ProTeam,	
	Target.Position = [Source].Position,
	Target.OffenseDefenseEligibility = [Source].OffenseDefenseEligibility,	
	Target.EliasId = [Source].EliasId,	
	Target.Bats = [Source].Bats ,
	Target.Throws = [Source].Throws ,	
	Target.ByeWeek = [Source].ByeWeek ,	
	Target.Icons = [Source].Icons 

	WHEN NOT MATCHED BY Target THEN
	INSERT			
	(PlayerExternalId,
	FirstName,
	LastName,
	Age,	
	Photo,
	ProStatus,
	ProTeam,	
	Position,
	OffenseDefenseEligibility,	
	EliasId,	
	Bats,
	Throws,	
	ByeWeek,	
	Icons,
	SportId)
		VALUES(
		Source.PlayerExternalId,
		Source.FirstName,
		Source.LastName,
		Source.Age,	
		Source.Photo,
		Source.ProStatus,
		Source.ProTeam,	
		Source.Position,
		Source.OffenseDefenseEligibility,	
		Source.EliasId,	
		Source.Bats,
		Source.Throws,	
		Source.ByeWeek,	
		Source.Icons,
		Source.SportId)
		;
END

