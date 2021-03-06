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
-- Description:	<save phone >
-- =============================================
ALTER PROCEDURE [dbo].[Save_Phone]
@ID int OUTPUT ,
@Prefix varchar(4),
@Number varchar(10)
AS
BEGIN
	DECLARE @err int,
			@TempID int
	IF isnull(@ID ,0)<1
		BEGIN
			Select @TempID = Count  (Id ) FROM [dbo].[Phones] 
			if @TempID > 0
			SELECT @TempID = MAX ([dbo].[Phones].Id ) FROM [dbo].[Phones]
			SET @TempID = @TempID + 1
			INSERT INTO [dbo].[Phones]
			(
				[Prefix]  ,
				[Number]
			)
			VALUES
			(
				@Prefix,
				@Number
			)
			SELECT @err = coalesce(nullif(@err, 0), @@error)

			SET @ID = @TempID

			IF (@err = 0)
				BEGIN
					SET @ID = @TempID
				END
		END
	ELSE
		BEGIN
			UPDATE [dbo].[Phones]
			SET 
				[Prefix]	= @Prefix,
				[Number]	= @Number

			WHERE [Phones].[Id] = @ID
			SELECT @err = coalesce(nullif(@err, 0), @@error)
		END
	RETURN @err
END

