USE [WebPersonData]
GO
/****** Object:  StoredProcedure [dbo].[Save_Person]    Script Date: 2021-12-06 22:40:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Victor>
-- ALTER date: <03/12/2021>
-- Description:	<save Persons >
-- =============================================
ALTER PROCEDURE [dbo].[Save_Person]
@ID int OUTPUT ,
@CardId varchar(10),
@rName nvarchar(100),
@tGenderId int,
@rBirthday date,
@tPhoneId int,
@PhonePrefix varchar(4),
@Phone		 varchar(10),
@tEmailId	int,
@Email		nvarchar(100),
@Remark		nvarchar(100)

AS
BEGIN
	DECLARE @err int,
			@TempID int
	IF isnull(@ID ,0)<1
		BEGIN
			Select @TempID = Count  (Id ) FROM [dbo].[Persons] 
			if @TempID > 0
			SELECT @TempID = MAX ([dbo].[Persons].Id ) FROM [dbo].[Persons]
			SET @TempID = @TempID + 1
			INSERT INTO [dbo].[Persons]
			(
				[CardId]	,
				[rName]		,
				[tGenderId]	,
				[rBirthday]	,
				[tPhoneId]  ,
				[tEmailId]  ,
				[Remark]
			)
			VALUES
			(
				@CardId		,
				@rName		,
				@tGenderId	,
				@rBirthday	,
				@tPhoneId	,
				@tEmailId	,
				@Remark
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
			UPDATE [dbo].[Persons]
			SET [CardId]	= @CardId		,
				[rName]		= @rName		,
				[tGenderId]	= @tGenderId	,
				[rBirthday]	= @rBirthday	,
				[tPhoneId]  = @tPhoneId	,
				[tEmailId]  = @tEmailId	,
				[Remark]	= @Remark

			WHERE [Persons].[Id] = @ID
			SELECT @err = coalesce(nullif(@err, 0), @@error)
		END

		exec Save_Email @tEmailId, @Email, ''
		exec Save_Phone @tPhoneId, @PhonePrefix, @Phone

	RETURN @err
END

