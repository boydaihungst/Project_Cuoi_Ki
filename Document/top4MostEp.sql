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