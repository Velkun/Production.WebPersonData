USE [WebPersonData]
GO
/****** Object:  StoredProcedure [dbo].[Get_Phones]    Script Date: 2021-12-09 14:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Victor>
-- ALTER date: <03/12/2021>
-- Description:	[Get_Phones]
-- =============================================
alter PROCEDURE [dbo].[Get_Emails]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select  
		Id,
		[Emails].Email, 
		[Emails].Remark
	from Emails
END

