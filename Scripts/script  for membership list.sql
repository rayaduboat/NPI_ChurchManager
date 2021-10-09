Use Cust_Dist_GrLand
GO
CREATE FUNCTION dbo.SplitInts
(
   @List      VARCHAR(MAX),
   @Delimiter VARCHAR(255)
)
RETURNS TABLE
AS
  RETURN ( SELECT Item = CONVERT(INT, Item) FROM
      ( SELECT Item = x.i.value('(./text())[1]', 'varchar(max)')
        FROM ( SELECT [XML] = CONVERT(XML, '<i>'
        + REPLACE(@List, @Delimiter, '</i><i>') + '</i>').query('.')
          ) AS a CROSS APPLY [XML].nodes('i') AS x(i) ) AS y
      WHERE Item IS NOT NULL
  );
GO
CREATE function dbo.fn_GetBranch
(@branchID int)
returns nvarchar(max)
as
begin
    
    declare @branchname nvarchar(max);
	set @branchname=(select [Name] from Branches.Branch where ID=@branchID)
	RETURN @branchname 
end 

Go
CREATE PROCEDURE dbo.sp_WeeklyServiceAggregation 
@branchID nvarchar(max),@month int,@year int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT 
                        BranchName   = dbo.fn_GetBranch(BranchID),
                        [Month]      = SUBSTRING(ActivityDate,4,2),
                        [Year]       = RIGHT(ActivityDate,4),
                        Tithes,
                        Other,
                        MissionaryOffering,
                        AbsentTwoWeeks,
                        ActivityDate,
                        BibleStudyTopic,
                        BranchID,
                        ChildrenCount,
                        CreatedBy,
                        CreatedOn,
                        HolySpiritBaptised,
                        KeyInformation,
                        MenCount,
                        MidWeek,
                        SermonSpeaker,
                        SermonSummary,
                        SermonTitle,
                        ServiceName,
                        SoulsWon,
                        Specify,
                        Visitation,
                        WaterBaptised,
                        WomenCount
 


FROM [Reports].[Table_WeeklyServiceReport] as rp
WHERE rp.BranchID in ( SELECT Id = Item FROM dbo.SplitInts(@branchID, ',')) 
AND SUBSTRING(ActivityDate,4,2)=@month AND RIGHT(ActivityDate,4)=@year
ORDER by rp.BranchID
 END
GO


Create PROCEDURE dbo.sp_WeeklyServiceStatistics 
@branchID nvarchar(max),@month int,@year int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
    SELECT 
                        BranchName         = dbo.fn_GetBranch(BranchID),
                        [Month]            = SUBSTRING(ActivityDate,4,2),
                        [Year]             = RIGHT(ActivityDate,4),
                        Tithes             =  Sum(CAST(Tithes AS money)),
                        MissionaryOffering =  Sum(CAST(MissionaryOffering AS money)),
                        Other              =  Sum(CAST(Other AS money)),                        
						SoulsWon           =  Sum(CAST(SoulsWon AS INT)),
                        WaterBaptised      =  Sum(CAST(WaterBaptised AS INT)),
                        ChildrenCount      =  Sum(CAST(ChildrenCount AS INT)),
                        WomenCount         =  Sum(CAST(WomenCount AS INT)),
                        MenCount           =  Sum(CAST(MenCount AS INT)),
                        Visitation         =  Sum(CAST(Visitation AS INT))

FROM [Reports].[Table_WeeklyServiceReport] as rp
WHERE rp.BranchID in ( SELECT Id = Item FROM dbo.SplitInts(@branchID, ',')) 
AND SUBSTRING(ActivityDate,4,2)=@month AND RIGHT(ActivityDate,4)=@year
GROUP BY BranchID,SUBSTRING(ActivityDate,4,2),RIGHT(ActivityDate,4)
ORDER by rp.BranchID
END

USE Cust_Dist_GrLand
GO

/****** Object:  StoredProcedure [dbo].[usp_GetErrorInfo]    Script Date: 04/05/2019 17:52:17 ******/
DROP PROCEDURE [dbo].[usp_GetErrorInfo]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetErrorInfo]    Script Date: 04/05/2019 17:52:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[usp_GetErrorInfo]  
AS  
SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  
GO




USE Cust_Dist_GrLand
GO
/****** Object:  StoredProcedure [dbo].[sp_AttendanceHistory]    Script Date: 04/05/2019 16:31:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[sp_AttendanceHistory] 
@memberID INT
AS
BEGIN
	 SET NOCOUNT ON --added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
BEGIN TRY
    -- for each  activity hel
	declare @tempTable table(
	ActivityName nvarchar(250),
	[Date] nvarchar(250),
	[Count] int
	) ;
 insert into @tempTable
   Select att.ActivityName, CONCAT( [dbo].fn_TwoDigits(MONTH(att.AttendanceDate)),'-',[dbo].fn_TwoDigits(YEAR(att.AttendanceDate))) as [Date],COUNT(*) as Count  From Members.Member mem 
    inner join Members.Attendance att on mem.MemberID=att.MemberID
	where mem.MemberID=@memberID
    Group by att.ActivityName,CONCAT([dbo].fn_TwoDigits(MONTH(att.AttendanceDate)),'-',[dbo].fn_TwoDigits(YEAR(att.AttendanceDate)))
	

	Select ActivityName,[Date],[Count] From @tempTable
	order by right([Date],4) desc, left([Date],2) desc
	 
END TRY
  
BEGIN CATCH
    Execute [dbo].[usp_GetErrorInfo]

END CATCH
END
Go
USE Cust_Dist_GrLand
GO

/****** Object:  StoredProcedure [dbo].[sp_AttendanceHistory]    Script Date: 03/05/2019 21:00:03 ******/
DROP PROCEDURE [dbo].[sp_AttendanceHistory]
GO

/****** Object:  StoredProcedure [dbo].[sp_AttendanceHistory]    Script Date: 03/05/2019 21:00:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_AttendanceHistory] 
@memberID INT
AS
BEGIN
	 SET NOCOUNT ON --added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
BEGIN TRY
    -- for each  activity hel
	 
  (Select att.ActivityName, CONCAT( [dbo].fn_TwoDigits(MONTH(att.AttendanceDate)),'-',[dbo].fn_TwoDigits(YEAR(att.AttendanceDate))) as [Date],COUNT(*) as Count  From Members.Member mem 
    inner join Members.Attendance att on mem.MemberID=att.MemberID
	where mem.MemberID=@memberID
    Group by att.ActivityName,CONCAT([dbo].fn_TwoDigits(MONTH(att.AttendanceDate)),'-',[dbo].fn_TwoDigits(YEAR(att.AttendanceDate))))
	order by Date
END TRY
  
BEGIN CATCH
    Execute [dbo].[usp_GetErrorInfo]

END CATCH
END
GO



USE Cust_Dist_GrLand
GO

/****** Object:  StoredProcedure [dbo].[sp_BranchBirthdays]    Script Date: 03/05/2019 21:00:55 ******/
DROP PROCEDURE [dbo].[sp_BranchBirthdays]
GO

/****** Object:  StoredProcedure [dbo].[sp_BranchBirthdays]    Script Date: 03/05/2019 21:00:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[sp_BranchBirthdays] 
	-- Add the parameters for the stored procedure here
	@branchid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY
		--trawl through membership and get members celebrating their birthdays by month
		select mem.FirstName,mem.LastName,left(mem.DOB,2) as [Day],SUBSTRING(mem.DOB,4,2) AS [Month] 
		from members.member as mem 
		where (mem.DOB is not null and len(mem.dob)>=4) AND mem.BranchID=@branchid


	END TRY
	BEGIN CATCH
	   EXECUTE  [dbo].[usp_GetErrorInfo]
	END CATCH
END
GO



USE Cust_Dist_GrLand
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAppointmentHistory]    Script Date: 03/05/2019 21:01:26 ******/
DROP PROCEDURE [dbo].[sp_GetAppointmentHistory]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAppointmentHistory]    Script Date: 03/05/2019 21:01:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[sp_GetAppointmentHistory] 
 @memberID INT 
 AS
BEGIN
	 BEGIN TRY
	 set nocount on
	     Select  dbo.fn_GetRoleName(app.Role) as [Role], app.DateOfAppointment as StartDate,app.EndDateOfAppointment as EndDate
		 From Members.MemberAppointment as app
		 where dbo.fn_GetRoleName(app.Role) is not null and app.MemberID=@memberID
		 Group by app.Role,app.DateOfAppointment,app.EndDateOfAppointment
		 order by Max(app.DateOfAppointment)
		 set nocount off
	 END TRY
	 BEGIN CATCH
	    Execute [dbo].[usp_GetErrorInfo]
	 END CATCH
END
GO



USE Cust_Dist_GrLand
GO

/****** Object:  StoredProcedure [dbo].[sp_GivingHistory]    Script Date: 03/05/2019 21:01:52 ******/
DROP PROCEDURE [dbo].[sp_GivingHistory]
GO

/****** Object:  StoredProcedure [dbo].[sp_GivingHistory]    Script Date: 03/05/2019 21:01:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GivingHistory] 
	@memberID INT
AS
BEGIN;

Begin try
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	 if(@memberID<0)return;
	 Select Fund,concat(substring(cast(gv.Date as nvarchar),5,2),'-',left(gv.Date,4)) as Date,sum(Amount) as Amount From Members.Giving as gv
	 where gv.Memberid=@memberID
	 Group by Fund,[Date]
	 order by [Date]
	-- select gv.Fund,mem.MemberID, concat(substring(cast(gv.Date as nvarchar),5,2),'-',left(gv.Date,4)) as Date,sum(gv.Amount) as Amount From Members.Member as mem
	-- inner join Members.Giving as gv on mem.MemberID=gv.Memberid
	---- where mem.MemberID=@memberID
	-- Group by gv.Fund,[Date],mem.MemberID
	-- order by sum(gv.Amount)

end try
 
begin catch
  Execute [dbo].[usp_GetErrorInfo]
end catch
END;
GO



USE Cust_Dist_GrLand
GO

/****** Object:  StoredProcedure [dbo].[usp_GetErrorInfo]    Script Date: 03/05/2019 21:02:11 ******/
DROP PROCEDURE [dbo].[usp_GetErrorInfo]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetErrorInfo]    Script Date: 03/05/2019 21:02:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[usp_GetErrorInfo]  
AS  
SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  
GO



USE Cust_Dist_GrLand
GO

/****** Object:  UserDefinedFunction [dbo].[fn_ChangeDateYYYYMMDD]    Script Date: 03/05/2019 21:02:48 ******/
DROP FUNCTION [dbo].[fn_ChangeDateYYYYMMDD]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_ChangeDateYYYYMMDD]    Script Date: 03/05/2019 21:02:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 Create function [dbo].[fn_ChangeDateYYYYMMDD]
  (@intDate   int)
 returns nvarchar(max)
 as
 begin
        declare @nvarcharDate nvarchar(10);
		set @nvarcharDate=cast(@intDate as nvarchar);
	   return concat( left( @nvarcharDate,4),'-',substring(@nvarcharDate,4,2),'-',right(@nvarcharDate,2))
	    
 end
GO




USE Cust_Dist_GrLand
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetRoleName]    Script Date: 03/05/2019 21:03:11 ******/
DROP FUNCTION [dbo].[fn_GetRoleName]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetRoleName]    Script Date: 03/05/2019 21:03:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 Create function [dbo].[fn_GetRoleName]
  (@roleId   int)
 returns nvarchar(max)
 as
 begin
       declare @roleName nvarchar(max);
	   select @roleName=[Value] from Customer.Dictionary as dic
	   where dic.ID=@roleId and dic.Name='Roles'
	   if(@roleId is null)return 'No roles'
	    
	   return @roleName
 end
GO



USE Cust_Dist_GrLand
GO

/****** Object:  UserDefinedFunction [dbo].[fn_MMYYYY]    Script Date: 03/05/2019 21:03:37 ******/
DROP FUNCTION [dbo].[fn_MMYYYY]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_MMYYYY]    Script Date: 03/05/2019 21:03:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[fn_MMYYYY]
(
	@date nvarchar(20)
)
RETURNS nvarchar(20)
AS
BEGIN
 declare @variable nvarchar(20);
    set @variable= Concat([dbo].[fn_TwoDigits](Month(@date)),'-',Year(@date));
	 
	return @variable;
END

GO



USE Cust_Dist_GrLand
GO
CREATE SCHEMA App
go
/****** Object:  UserDefinedFunction [App].[GetDailyQuote]    Script Date: 03/05/2019 21:04:28 ******/
DROP FUNCTION [App].[GetDailyQuote]
GO

/****** Object:  UserDefinedFunction [App].[GetDailyQuote]    Script Date: 03/05/2019 21:04:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [App].[GetDailyQuote] 
(
	 
)
RETURNS @tempTable Table(
[Id] int,
[Book] nvarchar(50),
[Chapter] nvarchar(50),
[Verse] nvarchar(50),
[Quote] nvarchar(max)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	declare @randNumber int;
	declare @returnQuote int;
	declare @quoteCount int;
	
	--get the number of quote count in dictionary
	set @quoteCount=(select count(*) from App.DailyQuote)
	--get a random number for quote to return
	set @randNumber=(SELECT Floor(@quoteCount*(SELECT  [randomNumber] FROM [Dist_Test].[districtDeveloper].[vw_random])));
	 
	 if @randNumber=0
	  begin
	    set @randNumber=1
	  end
   --select from Quotation table  quote for the day
   INSERT @tempTable  
   SELECT app.Id,app.Book,app.Chapter,app.Verse,app.Quote  
   FROM App.DailyQuote app where app.Id=@randNumber  
   RETURN  
   
END
GO
USE Cust_Dist_GrLand
GO

/****** Object:  UserDefinedFunction [dbo].[fn_TwoDigits]    Script Date: 03/05/2019 21:03:55 ******/
DROP FUNCTION [dbo].[fn_TwoDigits]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_TwoDigits]    Script Date: 03/05/2019 21:03:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[fn_TwoDigits]
(
    @param1 int	 
)
RETURNS nvarchar(max)
AS
BEGIN
   declare @retvalue nvarchar(max)
   if len(@param1)=1
   begin
   set  @retvalue= Concat('0',cast(@param1 as nvarchar));
   end 
   else
   begin
     set  @retvalue= CAST( @param1 AS nvarchar)
   end
   return  @retvalue;
END
GO





USE Cust_Dist_GrLand
GO

/****** Object:  Table [Members].[Theme]    Script Date: 03/05/2019 21:21:08 ******/
DROP TABLE [Members].[Theme]
GO

/****** Object:  Table [Members].[Theme]    Script Date: 03/05/2019 21:21:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Members].[Theme](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Path] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE Cust_Dist_GrLand
GO

/****** Object:  StoredProcedure [Members].[Sp_DeleteMember]    Script Date: 03/05/2019 21:13:47 ******/
DROP PROCEDURE [Members].[Sp_DeleteMember]
GO

/****** Object:  StoredProcedure [Members].[Sp_DeleteMember]    Script Date: 03/05/2019 21:13:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Members].[Sp_DeleteMember] 
 (
 @ID int
 
  )
AS
BEGIN

	SET NOCOUNT ON;
	Begin try
	     Begin Transaction
		  Delete from Members.MemberBaptism where memberID=@ID          
		  Delete from Members.LoginPermissionSet where memberID=@ID     
		  Delete from [Members].[MemberRelation] where memberID=@ID     
		  Delete from [Members].[MemberAppointment] where memberID=@ID  
		  Delete from [Members].[FollowUpResponse] where memberID=@ID   
		  Delete from reports.auditTrail where memberID=@ID             
		  Delete from Members.attendance where memberID=@ID             
		  Delete from Members.Visitation where memberID=@ID	           
		  Delete from Members.MemberGroup where memberID=@ID           
		  Delete from Members.Giving where memberID=@ID                 
          Delete from Members.member where memberID=@ID  
		 Commit Transaction               
   end try
   begin catch
       if @@TRANCOUNT>0 Rollback
   end catch
 
 end
GO


