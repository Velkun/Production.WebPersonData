USE [WebPersonData]
GO
/****** Object:  StoredProcedure [dbo].[Save_Phone]    Script Date: 2021-12-06 21:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Victor>
-- ALTER date: <03/12/2021>
-- Description:	<Get_Persons>
-- =============================================
alter PROCEDURE [dbo].[Get_Persons]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select  
		Persons.[Id] as Id,
		CardId,
		rName,
		tGenderId,
		[Genders].[key] as GenderKey, 
		[Genders].Name as GenderName,
		rBirthday,
		tPhoneId,
		[Phones].Prefix ,
		[Phones].Number as Phone,
		tEmailId,
		[Emails].Email ,
		Persons.[Remark] as Remark
	from Persons
		inner join 
			[Emails] on 
			[Emails] .[Id] = tEmailId 
		inner join [Phones] on
			[Phones].Id = tPhoneId
		left outer join [Genders] on
			[Genders].Id = tGenderId
END

