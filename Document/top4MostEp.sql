USE [AnimeVietsub]
GO

/* select top 4 phim co so luong tap nhieu nhat */
/*sai*/
select an.AniID,an.AniSeason,an.AniName,an.ReleaseTime,an.AniStatus,an.EpsMax,an.UpdateTime,f.countEp from 
(select TOP 4 a.AniID ,Count(EpID) as countEp
from dbo.AnimeEpisodes ae
INNER JOIN dbo.Anime a
    ON ae.AniID = a.AniID
GROUP BY a.AniID,ae.SourceID
order by countEp desc) f inner join Anime an on f.AniID=an.AniID


SELECT TOP 4 [AniID]
      ,[AniName]
      ,[AniSeason]
      ,[ReleaseTime]
      ,[AniStatus]
      ,[EpsMax]
      ,[UpdateTime]
      ,[EpsReleased]
	  ,[Desc]
	  ,[Picture]
  FROM [Anime]
  Order by EpsReleased desc
/*select top 24 phim phat hanh trong cung mua*/
  /**/
SELECT TOP 24 [AniID]
      ,[AniName]
      ,[AniSeason]
      ,[ReleaseTime]
      ,[AniStatus]
      ,[EpsMax]
      ,[UpdateTime]
      ,[EpsReleased]
	  ,[Desc]
	  ,[Picture]
  FROM [Anime]
  WHERE ReleaseTime < GETDATE() AND ReleaseTime >= '20180101'  
  Order by UpdateTime desc

  /*top 10 anime co luong view trong ngay nhieu nhat*/
 SELECT TOP 10 a.[AniID]
      ,[AniName]
      ,[AniSeason]
      ,[ReleaseTime]
      ,[AniStatus]
      ,[EpsMax]
      ,[UpdateTime]
      ,[EpsReleased]
	  ,[Desc]
	  ,[Picture]
  FROM [Anime] a inner join [WatchStatisticByDay] w ON a.AniID=w.AniID AND convert(date, w.Date) = convert(date, GETDATE())
  Order by w.TimeClicked desc

  /*top 10 anime co luong view trong tuan nhieu nhat*/
 SELECT TOP 10 a.[AniID]
      ,[AniName]
      ,[AniSeason]
      ,[ReleaseTime]
      ,[AniStatus]
      ,[EpsMax]
      ,[UpdateTime]
      ,[EpsReleased]
	  ,[Desc]
	  ,[Picture]
  FROM [Anime] a inner join [WatchStatisticByDay] w ON a.AniID=w.AniID AND convert(date, w.Date) = convert(date, GETDATE())
  Order by w.TimeClicked desc
  /*top 24 anime moi update*/
  SELECT TOP 24 [AniID]
      ,[AniName]
      ,[AniSeason]
      ,[ReleaseTime]
      ,[AniStatus]
      ,[EpsMax]
      ,[UpdateTime]
      ,[EpsReleased]
	  ,[Desc]
	  ,[Picture]
  FROM [Anime] 
  Order by UpdateTime desc
 /*update khi click vao link 1 ANIME ID*/
 BEGIN
 IF (Select count(*) from WatchStatisticByDay WHERE AniID=? AND convert(date,[Date]) = convert(date, GETDATE())) =0
 INSERT INTO [WatchStatisticByDay]
           ([AniID]
           ,[Date]
           ,[TimeClicked])
     VALUES
           (?,GETDATE(),1)
ELSE
UPDATE [WatchStatisticByDay]
   SET [TimeClicked] = (Select TimeClicked from WatchStatisticByDay WHERE AniID=? AND convert(date,[Date]) = convert(date, GETDATE())) +1
 WHERE AniID =?
 END
 --================================================
 /*Trigger khi add || update them ep + add them EP/source EP  + update table Anime -> thi dong thoi cap nhat lai UpdateTime trong table Anime*/

CREATE TRIGGER Auto_Update_UpdateTime_Anime_on_insert ON AnimeEpisodes AFTER INSERT
AS 
  BEGIN
	UPDATE Anime
	   SET [UpdateTime] = GETDATE()
	   FROM inserted i, Anime a
	 WHERE  a.AniID = i.AniID
	END
	
CREATE TRIGGER Auto_Update_UpdateTime_Anime_on_update ON AnimeEpisodes AFTER update
AS 
  BEGIN
	UPDATE Anime
	   SET [UpdateTime] = GETDATE()
	   FROM inserted i, Anime a
	 WHERE  a.AniID = i.AniID
	END

	CREATE TRIGGER Auto_Update_UpdateTime_Anime_on_table_insert ON Anime AFTER INSERT
AS 
  BEGIN
	UPDATE Anime
	   SET [UpdateTime] = GETDATE()
	   FROM inserted i, Anime a
	 WHERE  a.AniID = i.AniID
	END
		CREATE TRIGGER Auto_Update_UpdateTime_Anime_on_table_update ON Anime AFTER update
AS 
  BEGIN
	UPDATE Anime
	   SET [UpdateTime] = GETDATE()
	   FROM inserted i, Anime a
	 WHERE  a.AniID = i.AniID
	END
/*trigger neu EpsReleased == EpsMax thi cap nhat lai status*/
--Int thi van phai '1' 
CREATE TRIGGER Auto_Update_Status_Anime_on_update ON Anime AFTER update
AS 
	if(Select a.AniID from Anime a inner join inserted i on a.AniID=i.AniID AND a.EpsMax=a.EpsReleased AND a.AniStatus != 1) >=1 
	  BEGIN
	UPDATE Anime
	   SET [AniStatus]= 1
	   FROM inserted i, Anime a
	 WHERE  a.AniID = i.AniID
	END
--DROP trigger Auto_Update_Status_Anime_on_insert
CREATE TRIGGER Auto_Update_Status_Anime_on_insert ON Anime AFTER insert
AS 
	if(Select a.AniID from Anime a inner join inserted i on a.AniID=i.AniID AND a.EpsMax=a.EpsReleased AND a.AniStatus != 1) >=1 
  BEGIN
	UPDATE Anime
	   SET [AniStatus]= 1
	   FROM inserted i, Anime a
	 WHERE  a.AniID = i.AniID
	END
--==============================================
--DROP trigger create_all_base_thing_when_Anime_cield_inserted
CREATE TRIGGER create_all_base_thing_when_Anime_cield_inserted ON Anime AFTER insert
AS 
  BEGIN
	INSERT INTO [WatchStatisticByDay]
           ([AniID]
           ,[Date]
           ,[TimeClicked])
     VALUES((select AniID from Inserted)
           ,GETDATE()
           ,0)
	END
--trigger xu li ngay  history va favorite

--reseed
USE AnimeVietsub;  
GO  
DBCC CHECKIDENT ('Anime', RESEED,0);  
GO
--
USE AnimeVietsub;  
GO  
DBCC CHECKIDENT ('AnimeEpisodes', RESEED, 0);  
GO