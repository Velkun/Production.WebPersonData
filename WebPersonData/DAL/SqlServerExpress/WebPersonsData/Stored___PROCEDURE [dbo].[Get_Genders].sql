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
-- Description:	<>
-- =============================================
alter PROCEDURE [dbo].[Get_Genders]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select  
		Id,
		[Genders].[key] , 
		[Genders].Name
	from Genders
END

