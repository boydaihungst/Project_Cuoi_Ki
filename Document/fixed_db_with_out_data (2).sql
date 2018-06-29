USE [AnimeVietsub]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 29-Jun-18 8:41:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[AccID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](150) NOT NULL,
	[Password] [varchar](150) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Anime]    Script Date: 29-Jun-18 8:41:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anime](
	[AniID] [int] IDENTITY(1,1) NOT NULL,
	[AniName] [ntext] NOT NULL,
	[AniSeason] [int] NULL,
	[ReleaseTime] [date] NULL,
	[AniStatus] [int] NULL,
	[EpsMax] [int] NULL,
	[UpdateTime] [date] NULL,
	[EpsReleased] [int] NULL,
	[Desc] [ntext] NULL,
	[Picture] [ntext] NULL,
 CONSTRAINT [PK_Anime_1] PRIMARY KEY CLUSTERED 
(
	[AniID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AnimeEpisodes]    Script Date: 29-Jun-18 8:41:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimeEpisodes](
	[EpID] [int] IDENTITY(1,1) NOT NULL,
	[AniID] [int] NOT NULL,
	[EpName] [int] NULL,
	[SourceID] [int] NOT NULL,
 CONSTRAINT [PK_AnimeEpisodes] PRIMARY KEY CLUSTERED 
(
	[EpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategorieDetails]    Script Date: 29-Jun-18 8:41:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategorieDetails](
	[CatID] [int] NOT NULL,
	[AniID] [int] NOT NULL,
 CONSTRAINT [PK_CategorieDetails] PRIMARY KEY CLUSTERED 
(
	[CatID] ASC,
	[AniID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 29-Jun-18 8:41:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CatID] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](150) NOT NULL,
	[Desc] [ntext] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EpisodeSource]    Script Date: 29-Jun-18 8:41:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EpisodeSource](
	[SourceID] [int] IDENTITY(1,1) NOT NULL,
	[SourceName] [nvarchar](50) NULL,
 CONSTRAINT [PK_EpisodeSource] PRIMARY KEY CLUSTERED 
(
	[SourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EpisodeSourceDetails]    Script Date: 29-Jun-18 8:41:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EpisodeSourceDetails](
	[AniID] [int] NOT NULL,
	[SourceID] [int] NOT NULL,
 CONSTRAINT [PK_EpisodeSourceDetails] PRIMARY KEY CLUSTERED 
(
	[AniID] ASC,
	[SourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 29-Jun-18 8:41:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[AccID] [int] NOT NULL,
	[FavID] [int] IDENTITY(1,1) NOT NULL,
	[AniID] [int] NOT NULL,
	[AddedDate] [date] NULL,
 CONSTRAINT [PK_Favorite] PRIMARY KEY CLUSTERED 
(
	[FavID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[History]    Script Date: 29-Jun-18 8:41:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[HisID] [int] IDENTITY(1,1) NOT NULL,
	[AccID] [int] NOT NULL,
	[AniID] [int] NOT NULL,
	[WatchedDate] [date] NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[HisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WatchStatisticByDay]    Script Date: 29-Jun-18 8:41:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatchStatisticByDay](
	[AniID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[TimeClicked] [int] NOT NULL,
 CONSTRAINT [PK_WatchStatisticByDay] PRIMARY KEY CLUSTERED 
(
	[AniID] ASC,
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Anime] ON 

INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture]) VALUES (1, N'Uma Musume: Pretty Derby (TV)', 1, CAST(N'2018-06-01' AS Date), 1, 12, CAST(N'2018-06-25' AS Date), 12, N'Cuoc chien giua cac  nhan vat trong the Cuoc chien giua cac  nhan vat trong the gioi aoCuoc chien giua cac  nhan vat trong the gioi aogioi ao', N'img/imgdemo.jpg')
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture]) VALUES (2, N'SAO1', 1, CAST(N'2018-01-01' AS Date), 2, 12, CAST(N'2018-06-02' AS Date), 4, N'Cuoc chien giua cac  nhan vat trong the gioi ao', N'img/imgdemo.jpg')
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture]) VALUES (3, N'SAO2', 1, CAST(N'2018-06-01' AS Date), 2, 12, CAST(N'2018-06-02' AS Date), 3, N'Cuoc chien giua cac  nhan vat trong the gioi ao', N'img/imgdemo.jpg')
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture]) VALUES (4, N'SAO3', 1, CAST(N'2018-06-01' AS Date), 0, 12, CAST(N'2018-06-02' AS Date), 0, N'Cuoc chien giua cac  nhan vat trong the gioi aoCuoc chien giua cac  nhan vat trong the gioi ao', N'img/imgdemo.jpg')
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture]) VALUES (5, N'SAO4', 1, CAST(N'2018-06-01' AS Date), 0, 12, CAST(N'2018-06-02' AS Date), 0, N'Cuoc chien giua cac  nhan vat trong the gioi ao', N'img/imgdemo.jpg')
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture]) VALUES (6, N'SAO5', 1, CAST(N'2018-06-01' AS Date), 0, 12, CAST(N'2018-06-02' AS Date), 0, N'Cuoc chien giua cac  nhan vat trong the gioi ao', N'img/imgdemo.jpg')
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture]) VALUES (7, N'SAO6', 1, CAST(N'2018-06-01' AS Date), 0, 12, CAST(N'2018-06-02' AS Date), 0, N'Cuoc chien giua cac  nhan vat trong the gioi ao', N'img/imgdemo.jpg')
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture]) VALUES (8, N'SAO7', 1, CAST(N'2018-06-01' AS Date), 0, 12, CAST(N'2018-06-02' AS Date), 0, N'Cuoc chien giua cac  nhan vat trong the gioi ao', N'img/imgdemo.jpg')
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture]) VALUES (9, N'SAO8', 1, CAST(N'2018-06-01' AS Date), 1, 12, CAST(N'2018-06-02' AS Date), 0, N'Cuoc chien giua cac  nhan vat trong the gioi ao', N'img/imgdemo.jpg')
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture]) VALUES (57, N'SAO8', 1, CAST(N'2018-06-01' AS Date), 1, 12, CAST(N'2018-06-25' AS Date), 12, N'Cuoc chien giua cac  nhan vat trong the gioi ao', N'img/imgdemo.jpg')
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture]) VALUES (58, N'SAO8', 1, CAST(N'2018-06-01' AS Date), 1, 12, CAST(N'2018-06-25' AS Date), 12, N'Cuoc chien giua cac  nhan vat trong the gioi ao', N'img/imgdemo.jpg')
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture]) VALUES (59, N'SAO8', 1, CAST(N'2018-06-01' AS Date), 1, 12, CAST(N'2018-06-25' AS Date), 12, N'Cuoc chien giua cac  nhan vat trong the gioi ao', N'img/imgdemo.jpg')
SET IDENTITY_INSERT [dbo].[Anime] OFF
SET IDENTITY_INSERT [dbo].[AnimeEpisodes] ON 

INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpName], [SourceID]) VALUES (1, 1, 1, 1)
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpName], [SourceID]) VALUES (2, 1, 2, 1)
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpName], [SourceID]) VALUES (3, 1, 3, 1)
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpName], [SourceID]) VALUES (4, 1, 4, 1)
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpName], [SourceID]) VALUES (5, 1, 5, 1)
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpName], [SourceID]) VALUES (6, 1, 6, 1)
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpName], [SourceID]) VALUES (7, 2, 1, 2)
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpName], [SourceID]) VALUES (8, 2, 2, 2)
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpName], [SourceID]) VALUES (10, 2, 3, 2)
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpName], [SourceID]) VALUES (11, 2, 4, 2)
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpName], [SourceID]) VALUES (12, 3, 1, 1)
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpName], [SourceID]) VALUES (13, 3, 2, 1)
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpName], [SourceID]) VALUES (14, 3, 3, 1)
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpName], [SourceID]) VALUES (15, 1, 1, 2)
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpName], [SourceID]) VALUES (16, 1, 7, 1)
SET IDENTITY_INSERT [dbo].[AnimeEpisodes] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (1, N'Âm Nhạc', N'Anime theo thể loại này kể về cuộc sống hằng ngày của những nhân vật có liên quan tới âm nhạc. Thường là theo một thể loại nhạc nhất định, xoay quanh quá trình luyện tập, khao khát hoàn thiện bản thân của nhân vật và theo đuổi một mục tiêu nào đó.')
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (2, N'Cảnh Sát', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (3, N'Demons', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (4, N'Đời Thường', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (5, N'Drama', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (6, N'Drama Nhật Bản', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (7, N'Ecchi', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (8, N'Fantasy', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (9, N'Hài Hước', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (10, N'Hành Động', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (11, N'Harem', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (12, N'Học Đường', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (13, N'Huyền Bí', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (14, N'Josei', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (15, N'Khoa Học', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (16, N'Không Gian', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (17, N'Kinh Dị', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (18, N'Lãnh Mạn', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (19, N'Lịch Sử', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (20, N'Ma Cà Rồng', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (21, N'Mecha', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (22, N'Parody', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (23, N'Phép Thuật', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (24, N'Phiêu Lưu', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (25, N'Quân Đội', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (26, N'Samurai', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (27, N'Seinen', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (28, N'Shoujo', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (29, N'Shoujo Ai', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (30, N'Shounen', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (31, N'Shounen Ai', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (32, N'Siêu Năng Lực', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (33, N'Siêu Nhiên', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (34, N'Tâm Lý Học', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (35, N'Thể Thao', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (36, N'Thriller', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (37, N'Tragedy', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (38, N'Trẻ Em', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (39, N'Trò Chơi', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (40, N'Võ Thuật', NULL)
INSERT [dbo].[Categories] ([CatID], [CatName], [Desc]) VALUES (41, N'Xe Hơi', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[EpisodeSource] ON 

INSERT [dbo].[EpisodeSource] ([SourceID], [SourceName]) VALUES (1, N'Youtube')
INSERT [dbo].[EpisodeSource] ([SourceID], [SourceName]) VALUES (2, N'GG Drive')
SET IDENTITY_INSERT [dbo].[EpisodeSource] OFF
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (1, CAST(N'2018-06-24' AS Date), 7)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (1, CAST(N'2018-06-25' AS Date), 7)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (1, CAST(N'2018-06-26' AS Date), 8)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (2, CAST(N'2018-06-24' AS Date), 12)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (2, CAST(N'2018-06-26' AS Date), 8)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (3, CAST(N'2018-06-04' AS Date), 2)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (3, CAST(N'2018-06-26' AS Date), 8)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (4, CAST(N'2018-06-26' AS Date), 8)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (5, CAST(N'2018-06-26' AS Date), 8)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (6, CAST(N'2018-06-26' AS Date), 8)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (7, CAST(N'2018-06-26' AS Date), 8)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (8, CAST(N'2018-06-26' AS Date), 8)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (9, CAST(N'2018-06-26' AS Date), 8)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (59, CAST(N'2018-06-25' AS Date), 0)
ALTER TABLE [dbo].[AnimeEpisodes]  WITH CHECK ADD  CONSTRAINT [FK_AnimeEpisodes_Anime] FOREIGN KEY([AniID])
REFERENCES [dbo].[Anime] ([AniID])
GO
ALTER TABLE [dbo].[AnimeEpisodes] CHECK CONSTRAINT [FK_AnimeEpisodes_Anime]
GO
ALTER TABLE [dbo].[AnimeEpisodes]  WITH CHECK ADD  CONSTRAINT [FK_AnimeEpisodes_EpisodeSource] FOREIGN KEY([SourceID])
REFERENCES [dbo].[EpisodeSource] ([SourceID])
GO
ALTER TABLE [dbo].[AnimeEpisodes] CHECK CONSTRAINT [FK_AnimeEpisodes_EpisodeSource]
GO
ALTER TABLE [dbo].[CategorieDetails]  WITH CHECK ADD  CONSTRAINT [FK_CategorieDetails_Anime] FOREIGN KEY([AniID])
REFERENCES [dbo].[Anime] ([AniID])
GO
ALTER TABLE [dbo].[CategorieDetails] CHECK CONSTRAINT [FK_CategorieDetails_Anime]
GO
ALTER TABLE [dbo].[CategorieDetails]  WITH CHECK ADD  CONSTRAINT [FK_CategorieDetails_Categories] FOREIGN KEY([CatID])
REFERENCES [dbo].[Categories] ([CatID])
GO
ALTER TABLE [dbo].[CategorieDetails] CHECK CONSTRAINT [FK_CategorieDetails_Categories]
GO
ALTER TABLE [dbo].[EpisodeSourceDetails]  WITH CHECK ADD  CONSTRAINT [FK_EpisodeSourceDetails_Anime] FOREIGN KEY([AniID])
REFERENCES [dbo].[Anime] ([AniID])
GO
ALTER TABLE [dbo].[EpisodeSourceDetails] CHECK CONSTRAINT [FK_EpisodeSourceDetails_Anime]
GO
ALTER TABLE [dbo].[EpisodeSourceDetails]  WITH CHECK ADD  CONSTRAINT [FK_EpisodeSourceDetails_EpisodeSource] FOREIGN KEY([SourceID])
REFERENCES [dbo].[EpisodeSource] ([SourceID])
GO
ALTER TABLE [dbo].[EpisodeSourceDetails] CHECK CONSTRAINT [FK_EpisodeSourceDetails_EpisodeSource]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_Account] FOREIGN KEY([AccID])
REFERENCES [dbo].[Account] ([AccID])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_Account]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_Anime1] FOREIGN KEY([AniID])
REFERENCES [dbo].[Anime] ([AniID])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_Anime1]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Account] FOREIGN KEY([AccID])
REFERENCES [dbo].[Account] ([AccID])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Account]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Anime] FOREIGN KEY([AccID])
REFERENCES [dbo].[Anime] ([AniID])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Anime]
GO
ALTER TABLE [dbo].[WatchStatisticByDay]  WITH CHECK ADD  CONSTRAINT [FK_WatchStatisticByDay_Anime] FOREIGN KEY([AniID])
REFERENCES [dbo].[Anime] ([AniID])
GO
ALTER TABLE [dbo].[WatchStatisticByDay] CHECK CONSTRAINT [FK_WatchStatisticByDay_Anime]
GO
