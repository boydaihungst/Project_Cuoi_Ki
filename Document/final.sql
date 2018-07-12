USE [AnimeVietsub]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/12/2018 11:51:43 PM ******/
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
/****** Object:  Table [dbo].[Anime]    Script Date: 7/12/2018 11:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anime](
	[AniID] [int] IDENTITY(1,1) NOT NULL,
	[AniName] [nvarchar](255) NOT NULL,
	[AniSeason] [int] NULL,
	[ReleaseTime] [date] NULL,
	[AniStatus] [int] NULL,
	[EpsMax] [int] NULL,
	[UpdateTime] [date] NULL,
	[EpsReleased] [int] NULL,
	[Desc] [nvarchar](2000) NULL,
	[Picture] [nvarchar](2000) NULL,
	[Trailer] [nvarchar](2000) NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Anime_1] PRIMARY KEY CLUSTERED 
(
	[AniID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AnimeEpisodes]    Script Date: 7/12/2018 11:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimeEpisodes](
	[EpID] [int] IDENTITY(1,1) NOT NULL,
	[AniID] [int] NOT NULL,
	[EpNumber] [int] NULL,
	[SourceID] [int] NOT NULL,
	[Url] [ntext] NULL,
 CONSTRAINT [PK_AnimeEpisodes] PRIMARY KEY CLUSTERED 
(
	[EpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategorieDetails]    Script Date: 7/12/2018 11:51:44 PM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 7/12/2018 11:51:44 PM ******/
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
/****** Object:  Table [dbo].[EpisodeSource]    Script Date: 7/12/2018 11:51:44 PM ******/
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
/****** Object:  Table [dbo].[ErrorReport]    Script Date: 7/12/2018 11:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorReport](
	[AniID] [int] NOT NULL,
	[EpID] [int] NULL,
	[AddedDate] [date] NULL,
	[SourceID] [int] NOT NULL,
	[ReportContent] [nvarchar](150) NOT NULL,
	[ErrID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ErrorReport] PRIMARY KEY CLUSTERED 
(
	[ErrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 7/12/2018 11:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[AccID] [int] NOT NULL,
	[AniID] [int] NOT NULL,
	[AddedDate] [date] NULL,
 CONSTRAINT [PK_Favorite_1] PRIMARY KEY CLUSTERED 
(
	[AccID] ASC,
	[AniID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[History]    Script Date: 7/12/2018 11:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[HisID] [int] IDENTITY(1,1) NOT NULL,
	[AccID] [int] NOT NULL,
	[AniID] [int] NOT NULL,
	[WatchedDate] [date] NULL,
	[EpID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[HisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Type]    Script Date: 7/12/2018 11:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[TypeID] [int] NOT NULL,
	[TypeName] [nvarchar](150) NULL,
	[TypeNameShort] [nchar](10) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Wallpaper]    Script Date: 7/12/2018 11:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallpaper](
	[AniID] [int] NOT NULL,
	[WpID] [int] IDENTITY(1,1) NOT NULL,
	[Link] [ntext] NULL,
 CONSTRAINT [PK_Wallpaper] PRIMARY KEY CLUSTERED 
(
	[AniID] ASC,
	[WpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WatchStatisticByDay]    Script Date: 7/12/2018 11:51:44 PM ******/
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
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccID], [Username], [Password], [Email]) VALUES (1, N'admin', N'admin', N'admin@gmail.com')
INSERT [dbo].[Account] ([AccID], [Username], [Password], [Email]) VALUES (2, N'1', N'1', N'boydaihungst@gmail.com')
INSERT [dbo].[Account] ([AccID], [Username], [Password], [Email]) VALUES (3, N'2', N'1', N'gossip_mixi@yahoo.com')
INSERT [dbo].[Account] ([AccID], [Username], [Password], [Email]) VALUES (4, N'3', N'1', N'bou@gmail.com')
INSERT [dbo].[Account] ([AccID], [Username], [Password], [Email]) VALUES (5, N'4', N'1', N'boydaihungst1@gmail.com')
INSERT [dbo].[Account] ([AccID], [Username], [Password], [Email]) VALUES (6, N'123', N'1', N'2@gmail.com')
INSERT [dbo].[Account] ([AccID], [Username], [Password], [Email]) VALUES (7, N'5', N'5', N'abc@gmail.com')
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Anime] ON 

INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (1, N'Ginga Eiyuu Densetsu', 1, CAST(0x123E0B00 AS Date), 0, 12, CAST(0x753E0B00 AS Date), 6, N'Câu chuyện của Die Neue These Kaikou sẽ tập trung khai thác vào cuộc chiến tranh giành quyền lực và danh tiếng giữa thủ lĩnh của hai bên chiến tuyến là Reinhard von Musel và Yang Wen Li trong cuộc chiến giữa Đế Quốc Thiên Hà (Galactic Empire) và Liên Minh Các Tiểu Hành Tinh Tự Do (Free Planets Alliance) kéo dài qua nhiều thế hệ.', N'img/anime-img/GEDDNT-K.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (2, N'Last Period: Owarinaki Rasen no Monogatari', 1, CAST(0x1B3E0B00 AS Date), 1, 12, CAST(0x753E0B00 AS Date), 12, N'Anime lấy bối cảnh tại một thế giới nơi những loài huyễn thú được gọi là “Spirals” được triệu hồi từ sự cô lập. Những người có thể đánh bại chúng được gọi là “Period”. Haru là một Period tập sự thuộc Phân khu Arc End thứ 8. Tyu nhiên, sau một vụ trộm bí ẩn, sự sụp đổ kinh tế đã xảy ra, và tổng bộ Arc End quyết định bỏ mặc phân khu 8, cùng ba Periods còn lại, bao gồm cả Haru. Haru cùng với hai Period còn lại bắt đầu hành trình khôi phục lại phân khu 8.', N'img/anime-img/lpornm.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (3, N'Megalo Box', 1, CAST(0x153E0B00 AS Date), 1, 13, CAST(0x753E0B00 AS Date), 13, N'Một anime về môn đấu quyền anh, với nhân vật chính là anh chàng JD (Junk Dog). Hôm nay, anh cũng bước lên sàn đấu và thách thức mọi đối thủ, thế nhưng…', N'img/anime-img/mb.jpg', N'https://www.youtube.com/watch?v=rt3kWiTY4CI', 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (4, N'Tada-kun wa Koi wo Shinai', 1, CAST(0x143E0B00 AS Date), 1, 13, CAST(0x753E0B00 AS Date), 13, N'Mitsuyoshi Tada một chàng trai chưa biết yêu, đang chụp ảnh hoa anh đào nở thì gặp Teresa Wagner, một học sinh vừa chuyển trường từ Luxembourg. Teresa bị lạc khỏi người bạn đi cùng khi vừa đến Nhật vì thế Mitsuyoshi đã giúp cô tìm đến quán cafe của ông cô.', N'img/anime-img/tkwkws.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (5, N'Dorei-ku The Animation', 1, CAST(0x1C3E0B00 AS Date), 1, 12, CAST(0x753E0B00 AS Date), 12, N'Câu chuyện xoay quanh trò chơi sinh tử giữa 24 con người và mỗi người đều sở hữu một thiết bị gọi là SCM (slave control method) có thể biến đối thủ của mình thành nô lệ và kẻ nô lệ ấy phải làm theo mọi mệnh lệnh của “chủ nhân” mình dù mệnh lệnh đó ác nghiệt đến thế nào đi chăng nữa. Trở thành nô lệ tình dục, cướp của, thậm chí giết người, nô lệ đều phải phụ tùng chủ nhân. Một trò chơi không có hồi kết, một trò chơi mà ai đã nhỡ nhúng tay vào đều ước rằng nó chưa từng tồn tại.', N'img/anime-img/dkta.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (6, N'Saiki Kusuo no Ψ-nan 2', 2, CAST(0xE53D0B00 AS Date), 0, 23, CAST(0x753E0B00 AS Date), 24, N'Phần 2 của anime Saiki Kusuo no Ψ-nan (TV).
Phim kể về Saiki Kusuo, một pháp sư carry đường giữa-nhưng thích AFK, một tanker đấu sĩ đường trên óc chó, một thằng đi rừng ảo tưởng mình là leesin và một nhỏ support với ulti “suy diễn thần chưởng”.
à quên, Bộ này sub có vài từ ngữ nhạy cảm, cân nhắc trước khi xem nhé', N'img/anime-img/skny2.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (7, N'Akkun to Kanojo', 1, CAST(0x153E0B00 AS Date), 0, NULL, CAST(0x753E0B00 AS Date), 13, N'Bộ phim hài lãng mạn này theo sau cuộc sống hàng ngày của một cậu bé tên là Katakiri của Atsuhiro Akkun Kagari và là bạn của cậu bé Non Nontan, một cậu bé cực kỳ tsundere (ban đầu đang ở ngoài và mài mòn, nhưng sau này tốt bụng). Hành vi của Akkun là khắc nghiệt đối với Nontan với lạm dụng và bỏ bê bằng lời nói, nhưng ông thực sự là head-over-heels cho cô ấy và thường xuyên hoạt động như một stalker của tailing cô hay nghe trộm. Nontan không nhận ra cách của Akkun, và nghĩ rằng hành động của anh ấy rất dễ thương.', N'img/anime-img/atk.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (8, N'Steins;Gate 0', 5, CAST(0x1B3E0B00 AS Date), 0, 23, CAST(0x753E0B00 AS Date), 13, N'Sau khi phải vật lộn và trải qua nhiều bi kịch ở phần Steins;Gate mà vẫn không thể cứu được Kurisu. Okabe quyết định từ bỏ công việc nghiên cứu của mình, sống một cuốc sống bình thường để quên đi quá khứ. Khi mọi thứ đã dần ổn định, Okabe gặp một người từng quen biết với Kurisu và nói với anh rằng bọn họ đang thử nghiệm một loại thiết bị mới có thể lưu trữ kí ức con người và có thể mô phỏng lại họ thông qua đặc điểm và tính cách của họ. Okabe bắt đầu cuộc thử nghiệm với kí ức của Kurisu, và từ đây một chuỗi bi kịch mới lại bắt đầu…..', N'img/anime-img/sg0.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (9, N'Omae wa Mada Gunma wo Shiranai', 1, CAST(0x1B3E0B00 AS Date), 1, 12, CAST(0x753E0B00 AS Date), 12, N'Lấy đề tài về văn hóa tỉnh Gunma, Omae wa Mada Gunma wo Shiranai xoay quanh Kamitsuki Nori, một nam sinh chuyển từ tỉnh Chiba về Gunma sinh sống. Tại đây, cậu cảm nhận được tình yêu quê hương mãnh liệt của những con người Gunma, đồng thời còn trải nghiệm nhiều điều thú vị về sự khác biệt văn hóa vùng miền. Nori đem lòng yêu mến cô gái Shinooka Kyo, song cô lại bày tỏ chỉ yêu những ai là người Gunma.', N'img/anime-img/owmgws.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (10, N'Wotaku ni Koi wa Muzukashii', 1, CAST(0x1C3E0B00 AS Date), 1, 11, CAST(0x753E0B00 AS Date), 11, N'Sau nhiều năm không gặp nhau, một thanh niên otaku và một cô nàng hủ nữ đã vô tình gặp lại nhau khi phát hiện ra cả hai điều đang làm việc trong cùng một công ty. Sau vài buổi nhậu họ bắt đầu hẹn hò, thế nhưng đây liệu có phải là một điều tốt ?', N'img/anime-img/wnkwm.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (11, N'Black Clover (TV)', 2, CAST(0x293D0B00 AS Date), 0, 51, CAST(0x753E0B00 AS Date), 38, N'Aster và Yuno là hai đứa trẻ bị bỏ rơi ở nhà thờ và cùng nhau lớn lên tại đó. Khi còn nhỏ, chúng đã hứa với nhau xem ai sẽ trở thành Ma pháp vương tiếp theo. Thế nhưng, khi cả hai lớn lên, mọi chuyện đã thay đổi. Yuno là thiên tài ma pháp với sức mạnh tuyệt đỉnh trong khi Aster lại không thể sử dụng ma pháp và cố gắng bù đắp bằng thể lực. Khi cả hai được nhận sách phép vào tuổi 15, Yuno đã được ban cuốn sách phép cỏ bốn bá (trong khi đa số là cỏ ba lá) mà Aster lại không có cuốn nào. Tuy nhiên, khi Yuno bị đe dọa, sự thật về sức mạnh của Aster đã được giải mã- cậu ta được ban cuốn sách phép cỏ năm lá, cuốn sách phá ma thuật màu đen. Bấy giờ, hai người bạn trẻ đang hướng ra thế giới, cùng chung mục tiêu.', N'img/anime-img/bc.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (12, N'High School DxD HERO [SS4]', 2, CAST(0x203E0B00 AS Date), 0, 13, CAST(0x753E0B00 AS Date), 12, N'Phần 4 của series anime High School DxD.Nhiều ecchi và nhiều vếu hơn … 😀Nội dung: Hyoudou Issei – một thằng main dâm dê đại non nhưng vẫn chưa có bạn gái.
Thật đúng như các cụ đã nói: ” Bé bằng quả ớt mà đòi lớt phớt tờ rym ”
Nhưng, đêm hôm đó, một bạn gái nứng hết chỗ nói xuất hiện với cái tên
Amano Yuuma rủ cậu đến một nơi vắng vẻ, nhẹ nhàng quỳ xuống,
tay bám lấy chân cậu và nói một điều hết sức quyến rũ:
Cậu có thể “chết đi” được không?', N'img/anime-img/hsdh.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (13, N'Golden Kamuy', 1, CAST(0x183E0B00 AS Date), 1, 12, CAST(0x753E0B00 AS Date), 12, N'Tại Hokkaido, hòn đảo xa xôi miền cực bắc của Nhật Bản, nhân vật chính của chúng ta – Sugimoto Saichi trở về từ cuộc chiến tranh Nga-Nhật thời kì Minh Trị. Với biệt danh “Sugimoto Bất Tử” trong chiến tranh, anh lao vào chạy theo cơn sốt vàng nhằm thực hiện ý nguyện của người bạn thân đã mất trong trận chiến.', N'img/anime-img/gk.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (14, N'Nobunaga no Shinobi: Anegawa Ishiyama-hen (SS3)', 3, CAST(0x163E0B00 AS Date), 0, NULL, CAST(0x753E0B00 AS Date), 10, N'Nội dung: Câu chuyện kể về Chidori – một nữ ninja tài năng, với mong ước giúp đỡ Thiên tài quân sự thời Chiến quốc Oda Nobunaga thực hiện ý nguyện của ông', N'img/anime-img/nnsaih.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (15, N'Isekai Izakaya: Koto Aitheria no Izakaya Nobu', 1, CAST(0x1C3E0B00 AS Date), 0, NULL, CAST(0x753E0B00 AS Date), 12, N'Hãy tưởng tượng một quán rượu với những món ăn kì lạ như dẫn bạn đến một thế giới khác! “Nobu” là tên một quán rượu nằm phía sau một con ngõ hẻm trong thành phố cổ Aiteria. Bước vào quán, thực khách như rơi vào một thế giới mới với những món ăn kì lạ mang phong vị của một đất nước hoàn toàn khác, cùng với đó là những cốc bia tươi được làm lạnh mà họ gọi là “Toriaezu Nama” ngon tuyệt cú mèo! Hãy cũng nhau khám phá những món ăn kì lạ này nhé!', N'img/anime-img/iikanin.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (16, N'Kakuriyo no Yadomeshi', 1, CAST(0x113E0B00 AS Date), 0, 26, CAST(0x753E0B00 AS Date), 13, N'Nữ sinh viên cao học Aoi thừa hưởng khả năng nhìn thấy ayakashi của ông nội đã qua đời. Một ngày, trong khi Aoi đang nuôi ayakashi, một con quỷ xuất hiện! Ông tuyên bố rằng ông nội của Aoi nợ rất nhiều, và như là bồi thường, Aoi phải kết hôn với con quỷ! Aoi từ chối, và quyết định trả nợ bằng cách làm việc.', N'img/anime-img/kny.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (17, N'One Piece – Vua Hải Tặc', 1, CAST(0x81230B00 AS Date), 0, NULL, CAST(0x753E0B00 AS Date), 842, N'Một cậu bé tên Monkey D. Luffy, được khuyến khích bởi người anh hùng thuở nhỏ Shanks “Tóc đỏ”, giong buồm ra khơi trên chuyến hành trình tìm kho báu huyền thoại One Piece và trở thành Vua hải tặc. Để làm được điều này, cậu phải đến được tận cùng của vùng biển nguy hiểm và chết chóc nhất thế giới: Grand Line (Đại Hải Trình).Luffy đội trên đầu chiếc mũ rơm như một nhân chứng lịch sử vì chiếc mũ rơm đó đã từng thuộc về 2 hải tặc hùng mạnh là : Hải tặc vương Gol.D.Roger và tứ hòang Shank”tóc đỏ” Luffy lãnh đạo nhóm hải tặc Mũ Rơm qua East Blue (Biển Đông) và rồi tiến đến Grand Line. Cậu theo dấu chân của vị vua hải tặc quá cố, Gol D. Roger, chu du từ đảo này sang đảo khác để đến với kho báu vĩ đại One Piece. Mỗi thành viên trong nhóm đều có 1 quá khứ rất đặc biệt và đáng buồn. Ngoài khả năng đặc biệt trong công việc của mình, bất cứ thành viên nào cũng có khả năng chiến đấu rất tốt.', N'img/anime-img/op.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (18, N'Inazuma Eleven: Ares no Tenbin', 2, CAST(0x153E0B00 AS Date), 0, NULL, CAST(0x753E0B00 AS Date), 12, N'Sau khi Raimon đoạt chức vô địch Football Frontier và thua trận đấu với Tây Ban Nha, thành viên đội mỗi người một hướng, tham gia các trưởng trung học khác nhau để củng cố nền bóng đá Nhật Bản. Asuto là một cậu bé yêu bóng đá, nhưng vì đội bóng không có nhà tài trợ mà đội Inakuni của cậu phải chuyển tới Raimon và tham gia Football Frontier. Chỉ cần thắng 1 trận, họ sẽ giành lại được bóng đá của mình.', N'img/anime-img/ieant.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (19, N'Inazuma Eleven: Outer Code', 1, CAST(0x2D3C0B00 AS Date), 1, 6, CAST(0x753E0B00 AS Date), 6, N'Dây là những tập spin-off ngắn, nội dung xảy ra trước sự kiện chính trong Inazuma Eleven Ares no Tenbin.', N'img/anime-img/ieoc.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (20, N'Yuru Camp△ Specials', 2, CAST(0x0C3E0B00 AS Date), 0, 3, CAST(0x753E0B00 AS Date), 2, N'3 Tập đặc biệt của Yuru Camp△ nói về các sự kiện diễn ra trước khi Nadeshiko tham gia câu lạc bộ.', N'img/anime-img/ycs.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (21, N'Nil Admirari no Tenbin: Teito Genwaku Kitan', 1, CAST(0xE63D0B00 AS Date), 1, 12, CAST(0x753E0B00 AS Date), 12, N'Nội dung nối tiếp phần Shokugeki no Souma: San no Sara Giấc mơ của Yukihira Souma là trở thành một đầu bếp toàn thời gian tại nhà hàng của cha mình và vượt qua các kỹ năng nấu nướng của cha mình. Nhưng cũng giống như Yukihira sinh viên tốt nghiệp từ trường trung học của cha mình, Yukihira Jouichirou, đóng cửa các nhà hàng để nấu ăn ở châu Âu. Mặc dù bị áp bức, tinh thần chiến đấu của Souma được nhen nhóm bởi một thách thức từ Jouichirou mà là để tồn tại trong một trường dạy nấu ăn ưu tú nơi chỉ có 10% sinh viên tốt nghiệp. Souma có thể tồn tại qua các thử thách khắc nghiệt?', N'img/anime-img/nanttgk.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (22, N'Shokugeki no Souma: San no Sara – Toutsuki Ressha-hen', 4, CAST(0xF93D0B00 AS Date), 1, 12, CAST(0x753E0B00 AS Date), 12, N'Nội dung nối tiếp phần Shokugeki no Souma: San no Sara Giấc mơ của Yukihira Souma là trở thành một đầu bếp toàn thời gian tại nhà hàng của cha mình và vượt qua các kỹ năng nấu nướng của cha mình. Nhưng cũng giống như Yukihira sinh viên tốt nghiệp từ trường trung học của cha mình, Yukihira Jouichirou, đóng cửa các nhà hàng để nấu ăn ở châu Âu. Mặc dù bị áp bức, tinh thần chiến đấu của Souma được nhen nhóm bởi một thách thức từ Jouichirou mà là để tồn tại trong một trường dạy nấu ăn ưu tú nơi chỉ có 10% sinh viên tốt nghiệp. Souma có thể tồn tại qua các thử thách khắc nghiệt?', N'img/anime-img/snssns.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (23, N'Butlers: Chitose Momotose Monogatari', 1, CAST(0x1B3E0B00 AS Date), 0, 11, CAST(0x753E0B00 AS Date), 12, N'Anime tập trung vào hai nhân vật chính. Koma Jinguji (Jay) là chủ tịch hội đồng sinh viên thông minh và đẹp trai. Nụ cười tao nhã của anh ấy thu hút trái tim của phụ nữ. Tsubasa Hayakawa là một trợ lý cửa hàng đa tài và dịu dàng tại một quán cà phê ?. Cà phê cafe của ông với nghệ thuật latte cú là rất phổ biến với khách hàng nữ. Hai người đàn ông đi qua thời gian để chống lại kẻ thù của họ. Những Butler quyến rũ, như họ được gọi, chiến đấu với những trận chiến siêu nhiên và cũng trải nghiệm cuộc sống hài hước tại trường học của họ.', N'img/anime-img/bcmm.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (24, N'Beatless', 1, CAST(0x1C3E0B00 AS Date), 0, NULL, CAST(0x753E0B00 AS Date), 23, N'Một AI (Trí thông minh nhân tạo) siêu việt, vượt xa hẳn trí thông minh của loài người; những tồn tại mà nhân loại không thể nắm bắt được, được tạo nên từ những vật chất quá tiên tiến so với công nghệ của con người đã được ra đời. Lacia, một hIE được bao bọc trong chiếc hòm màu đen, là một trong những tồn tại như thế. Cuộc gặp gỡ định mệnh giữa Lacia và chàng trai Arato Endo 17 tuổi đã bắt đầu mọi câu chuyện. Vì sao những tồn tại nhân tạo này lại được sinh ra? Giữa vòng nghi vấn về mối quan hện giữa nhân loại và các AI này, chàng trai 17 tuổi ấy đã đưa ra một quyết định…', N'img/anime-img/b.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (25, N'Mahou Shoujo Ore', 1, CAST(0x113E0B00 AS Date), 1, 12, CAST(0x753E0B00 AS Date), 12, N'Truyện kể về một cô gái 15 tuổi là một idol mới nổi yêu một người bạn của anh trai mình. Thế nhưng người cô yêu lại bị những con quỷ với thân hình như những gã đàn ông hung tợn mang chiếc đầu giống như đầu soc bắt cóc. Sau đó, cô gặp một gã Yakuza đáng sợ và phát hiện ra rằng mẹ cô là một ma pháp thiếu nữ và gã Yakuza kia là linh vật của mẹ cô. Thế là cô lập khế ước với linh vật để trở thành ma pháp thiếu nữ giải cứu người yêu. Nhưng trong phim này thay vì biến thành những ma pháp thiếu nữ xinh đẹp thì họ lại biến thành những chàng trai đẹp mã trong bộ đồ của ma pháp thiếu nữ (Dm, mù mắt 😀 )', N'img/anime-img/mso.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (26, N'Amanchu! Advance [SS2]', 2, CAST(0x163E0B00 AS Date), 0, 12, CAST(0x753E0B00 AS Date), 10, N'Amanchu! Advance là phần 2 nối tiếp câu chuyện của anime Amanchu!.Hikari Kohinata là một cô gái 15 tuổi, luôn vui vẻ và sống ở gần biển, cô dành nhiều thời gian của mình cho việc lặn như một niềm đam mê khám phá.Vào ngày đầu tiên của trường trung học, cô gặp một giáo viên cũng thích lặn biển. cùng với người bạn cùng lớp 16 tuổi, Futaba, người bị cuốn theo cơn lốc của Hikari ngay sau khi họ gặp nhau tại trường.', N'img/anime-img/aa.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (27, N'Caligula', 1, CAST(0x173E0B00 AS Date), 1, 12, CAST(0x753E0B00 AS Date), 12, N'Tại trường trung học Kishimai, các học sinh được hưởng một môi trường giáo dục hoàn hảo đồng thời hàng ngày được thưởng thức các buổi trình diễn của ca sĩ ảo μ. Tuy nhiên, “giấy không gói được lửa”, rốt cuộc một nhóm học sinh đã phát hiện thế giới mà họ đang sống chỉ là một không gian ảo mang tên Mobius, được tạo nên và khống chế bởi chính μ. Tự gọi mình là Go-Home Club, nhóm học sinh này quyết tâm thoát khỏi nơi này để tìm về thế giới thực, dù điều đó không hề dễ dàng. Không chỉ phải đối đấu với những người bạn học đã bị tẩy não, những tay nhạc sĩ hắc ám hay nhất là μ với trí tuệ và sức mạnh gần như không giới hạn, Go-Home Club còn phải đối diện với kẻ thù lớn nhất là bản thân họ với những vấn đề tâm lý rắc rối nảy sinh khi lằn ranh thực – ảo bị xóa nhòa đến không thể nhận ra.', N'img/anime-img/c.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (28, N'Darling in the FranXX', 1, CAST(0xC23D0B00 AS Date), 0, 24, CAST(0x753E0B00 AS Date), 22, N'Câu chuyện diễn ra ở tương lai xa khi mặt đất bị phá hủy, con người phải tạo ra thành phố bay di động mang tên Plantation. Bên trong Plantation có một nơi đào tạo các phi công tên là Mistilteinn hay còn được gọi là “lòng chim”. Những đứa trẻ sống ở Mistilteinn này không biết gì về thế giới bên ngoài, cuộc sống của chúng chỉ có chiến đấu để hoàn thành nhiệm vụ. Những đứa trẻ sẽ điều khiển người máy được gọi là Franxx để chống lại những sinh vật khổng lồ bí ẩn Kyouryu. Đối với những đứa trẻ, lái Franxx chính là chứng minh cho sự tồn tại của chúng.Một cậu bé tên Hiro với mã hiệu Code:016 một người được biết đến như một thần đồng đang dần bị bỏ lại phía sau, và dường như sự tồn tại của cậu là không cần thiết nữa. Cho đến một ngày nọ, một cô gái bí ẩn tên là “Zero Two” xuất hiện đã thay đổi cuộc đời cậu.', N'img/anime-img/ditf.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (29, N'Persona 5 the Animation', 5, CAST(0x173E0B00 AS Date), 0, 24, CAST(0x753E0B00 AS Date), 12, N'Nội dung dựa theo game Persona 5.Amamiya Ren sau khi bị vu oan gây thương tích cho người khác bị đuổi học chuyển tới ngôi trường mới, thành phố mới. Tại đây một loạt các sự kiện bí ẩn xảy ra xoay quanh những vụ tai nạn bí ẩn mà thủ phạm là những người mất trí. Cũng từ đây, truyền thuyết về những tên trộm đánh cắp trái tim – Quái Đạo Đoàn đã ra đời.', N'img/anime-img/p5ta.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (30, N'Piano no Mori (TV)', 1, CAST(0x183E0B00 AS Date), 0, 12, CAST(0x753E0B00 AS Date), 4, N'Một câu chuyện yên bình về hai cậu bé từ những cuộc trò chuyện rất khác nhau. Một mặt, bạn có Kai, được sinh ra như con trai của một gái mại dâm, người đã chơi đàn piano bị bỏ rơi trong rừng gần nhà ông từ khi còn trẻ. Mặt khác, bạn có Syuhei, thực tế đã được nuôi nấng bằng dương cầm như con trai của một gia đình các nghệ sỹ dương cầm có uy tín. Tuy nhiên, đó là mối liên kết chung của họ với cây đàn piano mà cuối cùng giao thoa đường dẫn của họ trong cuộc sống.', N'img/anime-img/pnm.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (31, N'To Be Heroine', 2, CAST(0x1D3E0B00 AS Date), 0, NULL, CAST(0x753E0B00 AS Date), 5, N'Futaba là một nữ sinh trung học thông minh. Một ngày, cô đột nhiên bị hút vào một thế giới khác. Nơi đây là một thế giới không có ánh sáng và người dân là những đứa trẻ… mặc quần lót. Tại đó, Futaba là người duy nhất mặc quần áo và cô ấy sẽ trở thành nữ anh hùng của thế giới này, nơi quần áo là vũ khí mạnh nhất!', N'img/anime-img/tbh.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (32, N'Devils Line', 1, CAST(0x163E0B00 AS Date), 1, 12, CAST(0x753E0B00 AS Date), 12, N'Anzai – một nữa ma cà rồng, và Tsukasa – một cô học sinh bình thường.Ma cà rồng dường như chung sống với con người và chính quyền dường như cũng không biết đến sự tồn tại của họ vì hình dáng, ngoại hình của họ không khác con người là mấy. Họ cũng không cần uông máu để sống, thế nhưng khi tham muốn hay con tức giận trỗi dậy họ có thể trở thành một con quái vật không thể kiểm sót.', N'img/anime-img/dl.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (33, N'Gegege no Kitarou (2018)', 1, CAST(0x103E0B00 AS Date), 0, NULL, CAST(0x753E0B00 AS Date), 13, N'Cốt truyện xoay quanh một cậu bé kì lạ cùng với cuộc sống gắn kết giữa thế giới loài người và thế giới yêu ma.', N'img/anime-img/gnk.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (34, N'Grancrest Senki', 1, CAST(0xBB3D0B00 AS Date), 1, 24, CAST(0x753E0B00 AS Date), 24, N'Câu chuyện kể về Siluca – Một pháp sư rất căm ghét các lãnh chúa, và chàng kị sĩ Theo – người đang trên đường tìm cách giải phóng quê nhà mình khỏi ách thống trị bạo tàn. Siluca và Theo đã lập với nhau một lời thề nguyền vĩnh cữu. Dưới thân phận chủ nhân và hầu cận, họ du ngoạn cùng nhau để cứu rỗi vùng đất dầy dẫy phân tranh và bất ổn này.', N'img/anime-img/gs.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (35, N'Uma Musume: Pretty Derby (TV)', 1, CAST(0x113E0B00 AS Date), 1, 13, CAST(0x753E0B00 AS Date), 13, N'Dựa theo một tựa game mobile, khi mà các con ngựa đua được MOE hóa thành những cô nàng nữ sinh (xin lung linh :v ) và cùng nhau đến trường đua dạo vài vòng =))', N'img/anime-img/umpd.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (36, N'Sword Art Online Alternative: Gun Gale Online', 3, CAST(0x173E0B00 AS Date), 0, 12, CAST(0x753E0B00 AS Date), 11, N'Anime lấy bối cảnh thế giới game Gun Gale Online trong phần Sword Art Online II.Kohiruimaki Karen luôn nghĩ thế giới này không thuộc về mình khi cô không thể kết bạn với ai vì có chiều cao quá khổ so với cái bạn đồng trang lứa. Nhưng mọi thứ thay đổi khi cô biết đến VR và Gun Gale Online. Trong thế giới GGO, Karen có thể tạo hình tượng nhân vật nhỏ nhắn, đáng yêu như cô vẫn hằng mong ước. Liệu Karen có thể tìm được tình bạn nơi thế giới ảo nay không…?', N'img/anime-img/saoaggo.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (37, N'Nanatsu no Taizai: Imashime no Fukkatsu', 2, CAST(0xC23D0B00 AS Date), 0, 24, CAST(0x753E0B00 AS Date), 23, N'Phần tiếp theo của series Nanatsu no Taizai“Thất đại ác nhân”, một nhóm chiến binh có tham vọng lật đổ vương quốc Britannia, được cho là đã bị tiêu diệt bởi các “hiệp sĩ thánh chiến” mặc dù vẫn còn 1 số người cho rằng họ vẫn còn sống. 10 năm sau, Các hiệp sĩ thánh chiến đã làm 1 cuộc đảo chính và khống chế đức vua, họ trở thành người cai trị độc tài mới của vương quốc. Elizabeth, con gái duy nhất của nhà vua, đã lên đường tìm “thất đại ác nhân” để nhờ họ tái chiếm lại vương quốc.', N'img/anime-img/nntinfj.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (38, N'Toji no Miko', 1, CAST(0xBA3D0B00 AS Date), 1, 24, CAST(0x753E0B00 AS Date), 24, N'Từ thời xa xưa, những nữ kiếm khách canh giữ đền thờ đều mang trên mình một trọng trách, đó hính là thanh tẩy bọn “Aratama” – một sinh vật bí ẩn đe dọa thế giới loài người. Những cô gái trẻ vận trên người bộ đồng phục học sinh và mang theo kiếm, họ được gọi là “Toji” và làm việc trong một bộ phận cảnh sát đặc biệt. Chính phủ đã cho phép Toji mang theo kiếm và thực hiện nhiệm vụ như một nhân viên chính phủ thực thụ. Các cô gái này đã được gửi đi đến học tại 5 ngôi trường trên khắp đất nước.Những cô gái này sống một cuộc sống bình thường như bao nữ sinh trung học khác, thỉnh thoảng cũng vác kiếm đi làm nhiệm vụ chiến đấu và bảo vệ người dân. Vào mùa xuân, mỗi ngôi trường sẽ dẫn một Toji giỏi nhất của mình để tham gia trận thi đấu hàng năm. Khi ngày thi càng đến gần, tất cả các ứng cử viên đều luyện tập nhiệt tình để trở nên mạnh hơn', N'img/anime-img/tnm.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (39, N'Lostorage Conflated WIXOSS
', 3, CAST(0x163E0B00 AS Date), 0, NULL, CAST(0x753E0B00 AS Date), 8, N'Phần tiếp theo của series anime WIXOSS.
WIXOSS là một trò chơi Trading Card Game nổi tiếng, kèm theo trong mỗi bộ bài WIXOSS là một lá bài LRIG, tượng trưng cho avatar chủ lực của mỗi người chơi trong các trận đấu! Tất cả trông như một trò chơi thẻ bài bình thường… cho tới khi những lá bài LRIG sống xuất hiện, và những người sở hữu những lá bài ấy được gọi là Selector.', N'img/anime-img/lcw.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (40, N'Boku no Hero Academia 3rd Season', 3, CAST(0x163E0B00 AS Date), 0, 25, CAST(0x753E0B00 AS Date), 12, N'Phần 3 của series Boku no Hero Academia.Thế giới sẽ như thế nào nếu 80% dân số bộc phát những năng lực đặc biệt từ lúc 4 tuổi? Anh hùng và tội phạm sẽ đối đầu với nhau không ngừng nghỉ. Làm anh hùng đồng nghĩa với việc học cách sử dụng năng lực của mình, nhưng ta sẽ học ở đâu? Tất nhiên là chương trình đào tạo anh hùng của A.U rồi! Nhưng sẽ thế nào nếu bạn nằm trong 20% dân số không có năng lực?
Izuku Midoriya, một học sinh cấp 2, rất khao khát muốn trở thành anh hùng, nhưng cậu lại không hề có sức mạnh. Không có cơ hội vào được trường đào tạo anh hùng, cuộc đời cậu tưởng như đã kết thúc. Nhưng cuộc gặp gỡ với All Might, anh hùng vĩ đại nhất đã cho cậu cơ hội thay đổi số mệnh của mình…', N'img/anime-img/bnhass3.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (41, N'Boku no Hero Academia 3rd Season', 3, CAST(0x163E0B00 AS Date), 0, 25, CAST(0x753E0B00 AS Date), 12, N'Phần 3 của series Boku no Hero Academia.Thế giới sẽ như thế nào nếu 80% dân số bộc phát những năng lực đặc biệt từ lúc 4 tuổi? Anh hùng và tội phạm sẽ đối đầu với nhau không ngừng nghỉ. Làm anh hùng đồng nghĩa với việc học cách sử dụng năng lực của mình, nhưng ta sẽ học ở đâu? Tất nhiên là chương trình đào tạo anh hùng của A.U rồi! Nhưng sẽ thế nào nếu bạn nằm trong 20% dân số không có năng lực?', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (43, N'Ginga Eiyuu Densetsu', 1, CAST(0x123E0B00 AS Date), 0, 12, CAST(0x753E0B00 AS Date), 6, N'Câu chuyện của Die Neue These Kaikou sẽ tập trung khai thác vào cuộc chiến tranh giành quyền lực và danh tiếng giữa thủ lĩnh của hai bên chiến tuyến là Reinhard von Musel và Yang Wen Li trong cuộc chiến giữa Đế Quốc Thiên Hà (Galactic Empire) và Liên Minh Các Tiểu Hành Tinh Tự Do (Free Planets Alliance) kéo dài qua nhiều thế hệ.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (44, N'Last Period: Owarinaki Rasen no Monogatari', 1, CAST(0x1B3E0B00 AS Date), 1, 12, CAST(0x753E0B00 AS Date), 12, N'Anime lấy bối cảnh tại một thế giới nơi những loài huyễn thú được gọi là “Spirals” được triệu hồi từ sự cô lập. Những người có thể đánh bại chúng được gọi là “Period”. Haru là một Period tập sự thuộc Phân khu Arc End thứ 8. Tyu nhiên, sau một vụ trộm bí ẩn, sự sụp đổ kinh tế đã xảy ra, và tổng bộ Arc End quyết định bỏ mặc phân khu 8, cùng ba Periods còn lại, bao gồm cả Haru. Haru cùng với hai Period còn lại bắt đầu hành trình khôi phục lại phân khu 8.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (45, N'Megalo Box', 1, CAST(0x153E0B00 AS Date), 1, 13, CAST(0x753E0B00 AS Date), 13, N'Một anime về môn đấu quyền anh, với nhân vật chính là anh chàng JD (Junk Dog). Hôm nay, anh cũng bước lên sàn đấu và thách thức mọi đối thủ, thế nhưng…', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (46, N'Tada-kun wa Koi wo Shinai', 1, CAST(0x143E0B00 AS Date), 1, 13, CAST(0x753E0B00 AS Date), 13, N'Mitsuyoshi Tada một chàng trai chưa biết yêu, đang chụp ảnh hoa anh đào nở thì gặp Teresa Wagner, một học sinh vừa chuyển trường từ Luxembourg. Teresa bị lạc khỏi người bạn đi cùng khi vừa đến Nhật vì thế Mitsuyoshi đã giúp cô tìm đến quán cafe của ông cô.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (47, N'Dorei-ku The Animation', 1, CAST(0x1C3E0B00 AS Date), 1, 12, CAST(0x753E0B00 AS Date), 12, N'Câu chuyện xoay quanh trò chơi sinh tử giữa 24 con người và mỗi người đều sở hữu một thiết bị gọi là SCM (slave control method) có thể biến đối thủ của mình thành nô lệ và kẻ nô lệ ấy phải làm theo mọi mệnh lệnh của “chủ nhân” mình dù mệnh lệnh đó ác nghiệt đến thế nào đi chăng nữa. Trở thành nô lệ tình dục, cướp của, thậm chí giết người, nô lệ đều phải phụ tùng chủ nhân. Một trò chơi không có hồi kết, một trò chơi mà ai đã nhỡ nhúng tay vào đều ước rằng nó chưa từng tồn tại.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (48, N'Saiki Kusuo no Ψ-nan 2', 2, CAST(0xE53D0B00 AS Date), 0, 23, CAST(0x753E0B00 AS Date), 24, N'Phần 2 của anime Saiki Kusuo no Ψ-nan (TV).', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (50, N'Akkun to Kanojo', 1, CAST(0x153E0B00 AS Date), 0, NULL, CAST(0x753E0B00 AS Date), 13, N'Bộ phim hài lãng mạn này theo sau cuộc sống hàng ngày của một cậu bé tên là Katakiri của Atsuhiro Akkun Kagari và là bạn của cậu bé Non Nontan, một cậu bé cực kỳ tsundere (ban đầu đang ở ngoài và mài mòn, nhưng sau này tốt bụng). Hành vi của Akkun là khắc nghiệt đối với Nontan với lạm dụng và bỏ bê bằng lời nói, nhưng ông thực sự là head-over-heels cho cô ấy và thường xuyên hoạt động như một stalker của tailing cô hay nghe trộm. Nontan không nhận ra cách của Akkun, và nghĩ rằng hành động của anh ấy rất dễ thương.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (51, N'Steins;Gate 0', 5, CAST(0x1B3E0B00 AS Date), 0, 23, CAST(0x753E0B00 AS Date), 13, N'Sau khi phải vật lộn và trải qua nhiều bi kịch ở phần Steins;Gate mà vẫn không thể cứu được Kurisu. Okabe quyết định từ bỏ công việc nghiên cứu của mình, sống một cuốc sống bình thường để quên đi quá khứ. Khi mọi thứ đã dần ổn định, Okabe gặp một người từng quen biết với Kurisu và nói với anh rằng bọn họ đang thử nghiệm một loại thiết bị mới có thể lưu trữ kí ức con người và có thể mô phỏng lại họ thông qua đặc điểm và tính cách của họ. Okabe bắt đầu cuộc thử nghiệm với kí ức của Kurisu, và từ đây một chuỗi bi kịch mới lại bắt đầu…..', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (52, N'Omae wa Mada Gunma wo Shiranai', 1, CAST(0x1B3E0B00 AS Date), 1, 12, CAST(0x753E0B00 AS Date), 12, N'Lấy đề tài về văn hóa tỉnh Gunma, Omae wa Mada Gunma wo Shiranai xoay quanh Kamitsuki Nori, một nam sinh chuyển từ tỉnh Chiba về Gunma sinh sống. Tại đây, cậu cảm nhận được tình yêu quê hương mãnh liệt của những con người Gunma, đồng thời còn trải nghiệm nhiều điều thú vị về sự khác biệt văn hóa vùng miền. Nori đem lòng yêu mến cô gái Shinooka Kyo, song cô lại bày tỏ chỉ yêu những ai là người Gunma.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (53, N'Wotaku ni Koi wa Muzukashii', 1, CAST(0x1C3E0B00 AS Date), 1, 11, CAST(0x753E0B00 AS Date), 11, N'Sau nhiều năm không gặp nhau, một thanh niên otaku và một cô nàng hủ nữ đã vô tình gặp lại nhau khi phát hiện ra cả hai điều đang làm việc trong cùng một công ty. Sau vài buổi nhậu họ bắt đầu hẹn hò, thế nhưng đây liệu có phải là một điều tốt ?', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (54, N'Black Clover (TV)', 2, CAST(0x293D0B00 AS Date), 0, 51, CAST(0x753E0B00 AS Date), 38, N'Aster và Yuno là hai đứa trẻ bị bỏ rơi ở nhà thờ và cùng nhau lớn lên tại đó. Khi còn nhỏ, chúng đã hứa với nhau xem ai sẽ trở thành Ma pháp vương tiếp theo. Thế nhưng, khi cả hai lớn lên, mọi chuyện đã thay đổi. Yuno là thiên tài ma pháp với sức mạnh tuyệt đỉnh trong khi Aster lại không thể sử dụng ma pháp và cố gắng bù đắp bằng thể lực. Khi cả hai được nhận sách phép vào tuổi 15, Yuno đã được ban cuốn sách phép cỏ bốn bá (trong khi đa số là cỏ ba lá) mà Aster lại không có cuốn nào. Tuy nhiên, khi Yuno bị đe dọa, sự thật về sức mạnh của Aster đã được giải mã- cậu ta được ban cuốn sách phép cỏ năm lá, cuốn sách phá ma thuật màu đen. Bấy giờ, hai người bạn trẻ đang hướng ra thế giới, cùng chung mục tiêu.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (55, N'High School DxD HERO [SS4]', 2, CAST(0x203E0B00 AS Date), 0, 13, CAST(0x753E0B00 AS Date), 12, N'Phần 4 của series anime High School DxD.Nhiều ecchi và nhiều vếu hơn … 😀Nội dung: Hyoudou Issei – một thằng main dâm dê đại non nhưng vẫn chưa có bạn gái.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (57, N'Golden Kamuy', 1, CAST(0x183E0B00 AS Date), 1, 12, CAST(0x753E0B00 AS Date), 12, N'Tại Hokkaido, hòn đảo xa xôi miền cực bắc của Nhật Bản, nhân vật chính của chúng ta – Sugimoto Saichi trở về từ cuộc chiến tranh Nga-Nhật thời kì Minh Trị. Với biệt danh “Sugimoto Bất Tử” trong chiến tranh, anh lao vào chạy theo cơn sốt vàng nhằm thực hiện ý nguyện của người bạn thân đã mất trong trận chiến.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (58, N'Nobunaga no Shinobi: Anegawa Ishiyama-hen (SS3)', 3, CAST(0x163E0B00 AS Date), 0, NULL, CAST(0x753E0B00 AS Date), 10, N'Nội dung: Câu chuyện kể về Chidori – một nữ ninja tài năng, với mong ước giúp đỡ Thiên tài quân sự thời Chiến quốc Oda Nobunaga thực hiện ý nguyện của ông', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (61, N'Kakuriyo no Yadomeshi', 1, CAST(0x113E0B00 AS Date), 0, 26, CAST(0x753E0B00 AS Date), 13, N'Nữ sinh viên cao học Aoi thừa hưởng khả năng nhìn thấy ayakashi của ông nội đã qua đời. Một ngày, trong khi Aoi đang nuôi ayakashi, một con quỷ xuất hiện! Ông tuyên bố rằng ông nội của Aoi nợ rất nhiều, và như là bồi thường, Aoi phải kết hôn với con quỷ! Aoi từ chối, và quyết định trả nợ bằng cách làm việc.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (62, N'One Piece – Vua Hải Tặc', 1, CAST(0x81230B00 AS Date), 0, NULL, CAST(0x753E0B00 AS Date), 842, N'Một cậu bé tên Monkey D. Luffy, được khuyến khích bởi người anh hùng thuở nhỏ Shanks “Tóc đỏ”, giong buồm ra khơi trên chuyến hành trình tìm kho báu huyền thoại One Piece và trở thành Vua hải tặc. Để làm được điều này, cậu phải đến được tận cùng của vùng biển nguy hiểm và chết chóc nhất thế giới: Grand Line (Đại Hải Trình).Luffy đội trên đầu chiếc mũ rơm như một nhân chứng lịch sử vì chiếc mũ rơm đó đã từng thuộc về 2 hải tặc hùng mạnh là : Hải tặc vương Gol.D.Roger và tứ hòang Shank”tóc đỏ” Luffy lãnh đạo nhóm hải tặc Mũ Rơm qua East Blue (Biển Đông) và rồi tiến đến Grand Line. Cậu theo dấu chân của vị vua hải tặc quá cố, Gol D. Roger, chu du từ đảo này sang đảo khác để đến với kho báu vĩ đại One Piece. Mỗi thành viên trong nhóm đều có 1 quá khứ rất đặc biệt và đáng buồn. Ngoài khả năng đặc biệt trong công việc của mình, bất cứ thành viên nào cũng có khả năng chiến đấu rất tốt.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (63, N'Inazuma Eleven: Ares no Tenbin', 2, CAST(0x153E0B00 AS Date), 0, NULL, CAST(0x753E0B00 AS Date), 12, N'Sau khi Raimon đoạt chức vô địch Football Frontier và thua trận đấu với Tây Ban Nha, thành viên đội mỗi người một hướng, tham gia các trưởng trung học khác nhau để củng cố nền bóng đá Nhật Bản. Asuto là một cậu bé yêu bóng đá, nhưng vì đội bóng không có nhà tài trợ mà đội Inakuni của cậu phải chuyển tới Raimon và tham gia Football Frontier. Chỉ cần thắng 1 trận, họ sẽ giành lại được bóng đá của mình.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (64, N'Inazuma Eleven: Outer Code', 1, CAST(0x2D3C0B00 AS Date), 1, 6, CAST(0x753E0B00 AS Date), 6, N'Dây là những tập spin-off ngắn, nội dung xảy ra trước sự kiện chính trong Inazuma Eleven Ares no Tenbin.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (65, N'Yuru Camp△ Specials', 2, CAST(0x0C3E0B00 AS Date), 0, 3, CAST(0x753E0B00 AS Date), 2, N'3 Tập đặc biệt của Yuru Camp△ nói về các sự kiện diễn ra trước khi Nadeshiko tham gia câu lạc bộ.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (66, N'Nil Admirari no Tenbin: Teito Genwaku Kitan', 1, CAST(0xE63D0B00 AS Date), 1, 12, CAST(0x753E0B00 AS Date), 12, N'Nội dung nối tiếp phần Shokugeki no Souma: San no Sara Giấc mơ của Yukihira Souma là trở thành một đầu bếp toàn thời gian tại nhà hàng của cha mình và vượt qua các kỹ năng nấu nướng của cha mình. Nhưng cũng giống như Yukihira sinh viên tốt nghiệp từ trường trung học của cha mình, Yukihira Jouichirou, đóng cửa các nhà hàng để nấu ăn ở châu Âu. Mặc dù bị áp bức, tinh thần chiến đấu của Souma được nhen nhóm bởi một thách thức từ Jouichirou mà là để tồn tại trong một trường dạy nấu ăn ưu tú nơi chỉ có 10% sinh viên tốt nghiệp. Souma có thể tồn tại qua các thử thách khắc nghiệt?', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (67, N'Shokugeki no Souma: San no Sara – Toutsuki Ressha-hen', 4, CAST(0xF93D0B00 AS Date), 1, 12, CAST(0x753E0B00 AS Date), 12, N'Nội dung nối tiếp phần Shokugeki no Souma: San no Sara Giấc mơ của Yukihira Souma là trở thành một đầu bếp toàn thời gian tại nhà hàng của cha mình và vượt qua các kỹ năng nấu nướng của cha mình. Nhưng cũng giống như Yukihira sinh viên tốt nghiệp từ trường trung học của cha mình, Yukihira Jouichirou, đóng cửa các nhà hàng để nấu ăn ở châu Âu. Mặc dù bị áp bức, tinh thần chiến đấu của Souma được nhen nhóm bởi một thách thức từ Jouichirou mà là để tồn tại trong một trường dạy nấu ăn ưu tú nơi chỉ có 10% sinh viên tốt nghiệp. Souma có thể tồn tại qua các thử thách khắc nghiệt?', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (68, N'Butlers: Chitose Momotose Monogatari', 1, CAST(0x1B3E0B00 AS Date), 0, 11, CAST(0x753E0B00 AS Date), 12, N'Anime tập trung vào hai nhân vật chính. Koma Jinguji (Jay) là chủ tịch hội đồng sinh viên thông minh và đẹp trai. Nụ cười tao nhã của anh ấy thu hút trái tim của phụ nữ. Tsubasa Hayakawa là một trợ lý cửa hàng đa tài và dịu dàng tại một quán cà phê ?. Cà phê cafe của ông với nghệ thuật latte cú là rất phổ biến với khách hàng nữ. Hai người đàn ông đi qua thời gian để chống lại kẻ thù của họ. Những Butler quyến rũ, như họ được gọi, chiến đấu với những trận chiến siêu nhiên và cũng trải nghiệm cuộc sống hài hước tại trường học của họ.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (69, N'Beatless', 1, CAST(0x1C3E0B00 AS Date), 0, NULL, CAST(0x753E0B00 AS Date), 23, N'Một AI (Trí thông minh nhân tạo) siêu việt, vượt xa hẳn trí thông minh của loài người; những tồn tại mà nhân loại không thể nắm bắt được, được tạo nên từ những vật chất quá tiên tiến so với công nghệ của con người đã được ra đời. Lacia, một hIE được bao bọc trong chiếc hòm màu đen, là một trong những tồn tại như thế. Cuộc gặp gỡ định mệnh giữa Lacia và chàng trai Arato Endo 17 tuổi đã bắt đầu mọi câu chuyện. Vì sao những tồn tại nhân tạo này lại được sinh ra? Giữa vòng nghi vấn về mối quan hện giữa nhân loại và các AI này, chàng trai 17 tuổi ấy đã đưa ra một quyết định…', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (70, N'Mahou Shoujo Ore', 1, CAST(0x113E0B00 AS Date), 1, 12, CAST(0x753E0B00 AS Date), 12, N'Truyện kể về một cô gái 15 tuổi là một idol mới nổi yêu một người bạn của anh trai mình. Thế nhưng người cô yêu lại bị những con quỷ với thân hình như những gã đàn ông hung tợn mang chiếc đầu giống như đầu soc bắt cóc. Sau đó, cô gặp một gã Yakuza đáng sợ và phát hiện ra rằng mẹ cô là một ma pháp thiếu nữ và gã Yakuza kia là linh vật của mẹ cô. Thế là cô lập khế ước với linh vật để trở thành ma pháp thiếu nữ giải cứu người yêu. Nhưng trong phim này thay vì biến thành những ma pháp thiếu nữ xinh đẹp thì họ lại biến thành những chàng trai đẹp mã trong bộ đồ của ma pháp thiếu nữ (Dm, mù mắt 😀 )', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (71, N'Amanchu! Advance [SS2]', 2, CAST(0x163E0B00 AS Date), 0, 12, CAST(0x753E0B00 AS Date), 10, N'Amanchu! Advance là phần 2 nối tiếp câu chuyện của anime Amanchu!.Hikari Kohinata là một cô gái 15 tuổi, luôn vui vẻ và sống ở gần biển, cô dành nhiều thời gian của mình cho việc lặn như một niềm đam mê khám phá.Vào ngày đầu tiên của trường trung học, cô gặp một giáo viên cũng thích lặn biển. cùng với người bạn cùng lớp 16 tuổi, Futaba, người bị cuốn theo cơn lốc của Hikari ngay sau khi họ gặp nhau tại trường.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (72, N'Caligula', 1, CAST(0x173E0B00 AS Date), 1, 12, CAST(0x753E0B00 AS Date), 12, N'Tại trường trung học Kishimai, các học sinh được hưởng một môi trường giáo dục hoàn hảo đồng thời hàng ngày được thưởng thức các buổi trình diễn của ca sĩ ảo μ. Tuy nhiên, “giấy không gói được lửa”, rốt cuộc một nhóm học sinh đã phát hiện thế giới mà họ đang sống chỉ là một không gian ảo mang tên Mobius, được tạo nên và khống chế bởi chính μ. Tự gọi mình là Go-Home Club, nhóm học sinh này quyết tâm thoát khỏi nơi này để tìm về thế giới thực, dù điều đó không hề dễ dàng. Không chỉ phải đối đấu với những người bạn học đã bị tẩy não, những tay nhạc sĩ hắc ám hay nhất là μ với trí tuệ và sức mạnh gần như không giới hạn, Go-Home Club còn phải đối diện với kẻ thù lớn nhất là bản thân họ với những vấn đề tâm lý rắc rối nảy sinh khi lằn ranh thực – ảo bị xóa nhòa đến không thể nhận ra.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (73, N'Darling in the FranXX', 1, CAST(0xC23D0B00 AS Date), 0, 24, CAST(0x753E0B00 AS Date), 22, N'Câu chuyện diễn ra ở tương lai xa khi mặt đất bị phá hủy, con người phải tạo ra thành phố bay di động mang tên Plantation. Bên trong Plantation có một nơi đào tạo các phi công tên là Mistilteinn hay còn được gọi là “lòng chim”. Những đứa trẻ sống ở Mistilteinn này không biết gì về thế giới bên ngoài, cuộc sống của chúng chỉ có chiến đấu để hoàn thành nhiệm vụ. Những đứa trẻ sẽ điều khiển người máy được gọi là Franxx để chống lại những sinh vật khổng lồ bí ẩn Kyouryu. Đối với những đứa trẻ, lái Franxx chính là chứng minh cho sự tồn tại của chúng.Một cậu bé tên Hiro với mã hiệu Code:016 một người được biết đến như một thần đồng đang dần bị bỏ lại phía sau, và dường như sự tồn tại của cậu là không cần thiết nữa. Cho đến một ngày nọ, một cô gái bí ẩn tên là “Zero Two” xuất hiện đã thay đổi cuộc đời cậu.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (74, N'Persona 5 the Animation', 5, CAST(0x173E0B00 AS Date), 0, 24, CAST(0x753E0B00 AS Date), 12, N'Nội dung dựa theo game Persona 5.Amamiya Ren sau khi bị vu oan gây thương tích cho người khác bị đuổi học chuyển tới ngôi trường mới, thành phố mới. Tại đây một loạt các sự kiện bí ẩn xảy ra xoay quanh những vụ tai nạn bí ẩn mà thủ phạm là những người mất trí. Cũng từ đây, truyền thuyết về những tên trộm đánh cắp trái tim – Quái Đạo Đoàn đã ra đời.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (75, N'Piano no Mori (TV)', 1, CAST(0x183E0B00 AS Date), 0, 12, CAST(0x753E0B00 AS Date), 4, N'Một câu chuyện yên bình về hai cậu bé từ những cuộc trò chuyện rất khác nhau. Một mặt, bạn có Kai, được sinh ra như con trai của một gái mại dâm, người đã chơi đàn piano bị bỏ rơi trong rừng gần nhà ông từ khi còn trẻ. Mặt khác, bạn có Syuhei, thực tế đã được nuôi nấng bằng dương cầm như con trai của một gia đình các nghệ sỹ dương cầm có uy tín. Tuy nhiên, đó là mối liên kết chung của họ với cây đàn piano mà cuối cùng giao thoa đường dẫn của họ trong cuộc sống.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (76, N'To Be Heroine', 2, CAST(0x1D3E0B00 AS Date), 0, NULL, CAST(0x753E0B00 AS Date), 5, N'Futaba là một nữ sinh trung học thông minh. Một ngày, cô đột nhiên bị hút vào một thế giới khác. Nơi đây là một thế giới không có ánh sáng và người dân là những đứa trẻ… mặc quần lót. Tại đó, Futaba là người duy nhất mặc quần áo và cô ấy sẽ trở thành nữ anh hùng của thế giới này, nơi quần áo là vũ khí mạnh nhất!', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (77, N'Devils Line', 1, CAST(0x163E0B00 AS Date), 1, 12, CAST(0x753E0B00 AS Date), 12, N'Anzai – một nữa ma cà rồng, và Tsukasa – một cô học sinh bình thường.Ma cà rồng dường như chung sống với con người và chính quyền dường như cũng không biết đến sự tồn tại của họ vì hình dáng, ngoại hình của họ không khác con người là mấy. Họ cũng không cần uông máu để sống, thế nhưng khi tham muốn hay con tức giận trỗi dậy họ có thể trở thành một con quái vật không thể kiểm sót.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (78, N'Gegege no Kitarou (2018)', 1, CAST(0x103E0B00 AS Date), 0, NULL, CAST(0x753E0B00 AS Date), 13, N'Cốt truyện xoay quanh một cậu bé kì lạ cùng với cuộc sống gắn kết giữa thế giới loài người và thế giới yêu ma.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (79, N'Grancrest Senki', 1, CAST(0xBB3D0B00 AS Date), 1, 24, CAST(0x753E0B00 AS Date), 24, N'Câu chuyện kể về Siluca – Một pháp sư rất căm ghét các lãnh chúa, và chàng kị sĩ Theo – người đang trên đường tìm cách giải phóng quê nhà mình khỏi ách thống trị bạo tàn. Siluca và Theo đã lập với nhau một lời thề nguyền vĩnh cữu. Dưới thân phận chủ nhân và hầu cận, họ du ngoạn cùng nhau để cứu rỗi vùng đất dầy dẫy phân tranh và bất ổn này.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (80, N'Uma Musume: Pretty Derby (TV)', 1, CAST(0x113E0B00 AS Date), 1, 13, CAST(0x753E0B00 AS Date), 13, N'Dựa theo một tựa game mobile, khi mà các con ngựa đua được MOE hóa thành những cô nàng nữ sinh (xin lung linh :v ) và cùng nhau đến trường đua dạo vài vòng =))', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (81, N'Sword Art Online Alternative: Gun Gale Online', 3, CAST(0x173E0B00 AS Date), 0, 12, CAST(0x753E0B00 AS Date), 11, N'Anime lấy bối cảnh thế giới game Gun Gale Online trong phần Sword Art Online II.Kohiruimaki Karen luôn nghĩ thế giới này không thuộc về mình khi cô không thể kết bạn với ai vì có chiều cao quá khổ so với cái bạn đồng trang lứa. Nhưng mọi thứ thay đổi khi cô biết đến VR và Gun Gale Online. Trong thế giới GGO, Karen có thể tạo hình tượng nhân vật nhỏ nhắn, đáng yêu như cô vẫn hằng mong ước. Liệu Karen có thể tìm được tình bạn nơi thế giới ảo nay không…?', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (82, N'Nanatsu no Taizai: Imashime no Fukkatsu', 2, CAST(0xC23D0B00 AS Date), 0, 24, CAST(0x753E0B00 AS Date), 23, N'Phần tiếp theo của series Nanatsu no Taizai“Thất đại ác nhân”, một nhóm chiến binh có tham vọng lật đổ vương quốc Britannia, được cho là đã bị tiêu diệt bởi các “hiệp sĩ thánh chiến” mặc dù vẫn còn 1 số người cho rằng họ vẫn còn sống. 10 năm sau, Các hiệp sĩ thánh chiến đã làm 1 cuộc đảo chính và khống chế đức vua, họ trở thành người cai trị độc tài mới của vương quốc. Elizabeth, con gái duy nhất của nhà vua, đã lên đường tìm “thất đại ác nhân” để nhờ họ tái chiếm lại vương quốc.', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (83, N'Toji no Miko', 1, CAST(0xBA3D0B00 AS Date), 1, 24, CAST(0x753E0B00 AS Date), 24, N'Từ thời xa xưa, những nữ kiếm khách canh giữ đền thờ đều mang trên mình một trọng trách, đó hính là thanh tẩy bọn “Aratama” – một sinh vật bí ẩn đe dọa thế giới loài người. Những cô gái trẻ vận trên người bộ đồng phục học sinh và mang theo kiếm, họ được gọi là “Toji” và làm việc trong một bộ phận cảnh sát đặc biệt. Chính phủ đã cho phép Toji mang theo kiếm và thực hiện nhiệm vụ như một nhân viên chính phủ thực thụ. Các cô gái này đã được gửi đi đến học tại 5 ngôi trường trên khắp đất nước.Những cô gái này sống một cuộc sống bình thường như bao nữ sinh trung học khác, thỉnh thoảng cũng vác kiếm đi làm nhiệm vụ chiến đấu và bảo vệ người dân. Vào mùa xuân, mỗi ngôi trường sẽ dẫn một Toji giỏi nhất của mình để tham gia trận thi đấu hàng năm. Khi ngày thi càng đến gần, tất cả các ứng cử viên đều luyện tập nhiệt tình để trở nên mạnh hơn', N'img/anime-img/demo_img.jpg', NULL, 2)
INSERT [dbo].[Anime] ([AniID], [AniName], [AniSeason], [ReleaseTime], [AniStatus], [EpsMax], [UpdateTime], [EpsReleased], [Desc], [Picture], [Trailer], [TypeID]) VALUES (87, N'Boku no Hero Academia 3rd Season', 3, CAST(0x163E0B00 AS Date), 0, 25, CAST(0x6A3E0B00 AS Date), 12, N'Phần 3 của series Boku no Hero Academia.Thế giới sẽ như thế nào nếu 80% dân số bộc phát những năng lực đặc biệt từ lúc 4 tuổi? Anh hùng và tội phạm sẽ đối đầu với nhau không ngừng nghỉ. Làm anh hùng đồng nghĩa với việc học cách sử dụng năng lực của mình, nhưng ta sẽ học ở đâu? Tất nhiên là chương trình đào tạo anh hùng của A.U rồi! Nhưng sẽ thế nào nếu bạn nằm trong 20% dân số không có năng lực?', N'img/anime-img/demo_img.jpg', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Anime] OFF
SET IDENTITY_INSERT [dbo].[AnimeEpisodes] ON 

INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpNumber], [SourceID], [Url]) VALUES (1, 3, 1, 1, N'https://www.youtube.com/watch?v=7hUU0PMsBUc')
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpNumber], [SourceID], [Url]) VALUES (2, 3, 2, 1, N'https://www.youtube.com/watch?v=7hUU0PMsBUc')
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpNumber], [SourceID], [Url]) VALUES (3, 3, 3, 1, N'https://www.youtube.com/watch?v=7hUU0PMsBUc')
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpNumber], [SourceID], [Url]) VALUES (4, 3, 4, 1, N'https://www.youtube.com/watch?v=7hUU0PMsBUc')
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpNumber], [SourceID], [Url]) VALUES (5, 3, 5, 1, N'https://www.youtube.com/watch?v=7hUU0PMsBUc')
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpNumber], [SourceID], [Url]) VALUES (133, 3, 1, 3, N'https://www.facebook.com/2027409394253651/videos/2029425834052007/')
INSERT [dbo].[AnimeEpisodes] ([EpID], [AniID], [EpNumber], [SourceID], [Url]) VALUES (134, 3, 1, 4, N'https://drive.google.com/file/d/0B9ca3VITgs0bQy1FdDVNbXpGUEk/view?usp=sharing')
SET IDENTITY_INSERT [dbo].[AnimeEpisodes] OFF
INSERT [dbo].[CategorieDetails] ([CatID], [AniID]) VALUES (4, 3)
INSERT [dbo].[CategorieDetails] ([CatID], [AniID]) VALUES (5, 1)
INSERT [dbo].[CategorieDetails] ([CatID], [AniID]) VALUES (5, 2)
INSERT [dbo].[CategorieDetails] ([CatID], [AniID]) VALUES (5, 3)
INSERT [dbo].[CategorieDetails] ([CatID], [AniID]) VALUES (10, 1)
INSERT [dbo].[CategorieDetails] ([CatID], [AniID]) VALUES (10, 3)
INSERT [dbo].[CategorieDetails] ([CatID], [AniID]) VALUES (15, 1)
INSERT [dbo].[CategorieDetails] ([CatID], [AniID]) VALUES (16, 1)
INSERT [dbo].[CategorieDetails] ([CatID], [AniID]) VALUES (25, 1)
INSERT [dbo].[CategorieDetails] ([CatID], [AniID]) VALUES (30, 3)
INSERT [dbo].[CategorieDetails] ([CatID], [AniID]) VALUES (35, 3)
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
INSERT [dbo].[EpisodeSource] ([SourceID], [SourceName]) VALUES (2, N'Anime Online Server')
INSERT [dbo].[EpisodeSource] ([SourceID], [SourceName]) VALUES (3, N'Facebook')
INSERT [dbo].[EpisodeSource] ([SourceID], [SourceName]) VALUES (4, N'GG Drive')
SET IDENTITY_INSERT [dbo].[EpisodeSource] OFF
SET IDENTITY_INSERT [dbo].[ErrorReport] ON 

INSERT [dbo].[ErrorReport] ([AniID], [EpID], [AddedDate], [SourceID], [ReportContent], [ErrID]) VALUES (3, 133, CAST(0x713E0B00 AS Date), 3, N'Lỗi link film', 1)
INSERT [dbo].[ErrorReport] ([AniID], [EpID], [AddedDate], [SourceID], [ReportContent], [ErrID]) VALUES (3, 5, CAST(0x723E0B00 AS Date), 1, N'Lỗi link film', 2)
SET IDENTITY_INSERT [dbo].[ErrorReport] OFF
INSERT [dbo].[Favorite] ([AccID], [AniID], [AddedDate]) VALUES (1, 1, CAST(0x6F3E0B00 AS Date))
INSERT [dbo].[Favorite] ([AccID], [AniID], [AddedDate]) VALUES (1, 2, CAST(0x6F3E0B00 AS Date))
INSERT [dbo].[Favorite] ([AccID], [AniID], [AddedDate]) VALUES (1, 3, CAST(0x6F3E0B00 AS Date))
INSERT [dbo].[Favorite] ([AccID], [AniID], [AddedDate]) VALUES (1, 4, CAST(0x703E0B00 AS Date))
INSERT [dbo].[Favorite] ([AccID], [AniID], [AddedDate]) VALUES (2, 1, CAST(0x6F3E0B00 AS Date))
INSERT [dbo].[Favorite] ([AccID], [AniID], [AddedDate]) VALUES (2, 2, CAST(0x6F3E0B00 AS Date))
INSERT [dbo].[Favorite] ([AccID], [AniID], [AddedDate]) VALUES (4, 2, CAST(0x703E0B00 AS Date))
INSERT [dbo].[Favorite] ([AccID], [AniID], [AddedDate]) VALUES (4, 4, CAST(0x703E0B00 AS Date))
INSERT [dbo].[Favorite] ([AccID], [AniID], [AddedDate]) VALUES (4, 7, CAST(0x703E0B00 AS Date))
INSERT [dbo].[Type] ([TypeID], [TypeName], [TypeNameShort]) VALUES (1, N'Blu-ray', N'Blu-ray   ')
INSERT [dbo].[Type] ([TypeID], [TypeName], [TypeNameShort]) VALUES (2, N'TV Series', N'TV Series ')
INSERT [dbo].[Type] ([TypeID], [TypeName], [TypeNameShort]) VALUES (3, N'Movie', N'Movie     ')
SET IDENTITY_INSERT [dbo].[Wallpaper] ON 

INSERT [dbo].[Wallpaper] ([AniID], [WpID], [Link]) VALUES (3, 1, N'img/anime-img/wallpaper/megalobox001.png')
INSERT [dbo].[Wallpaper] ([AniID], [WpID], [Link]) VALUES (3, 2, N'img/anime-img/wallpaper/megalobox002.jpg')
INSERT [dbo].[Wallpaper] ([AniID], [WpID], [Link]) VALUES (3, 3, N'img/anime-img/wallpaper/megalobox003.jpg')
SET IDENTITY_INSERT [dbo].[Wallpaper] OFF
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (1, CAST(0x6C3E0B00 AS Date), 268)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (1, CAST(0x6D3E0B00 AS Date), 268)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (1, CAST(0x6E3E0B00 AS Date), 268)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (1, CAST(0x6F3E0B00 AS Date), 276)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (1, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (1, CAST(0x753E0B00 AS Date), 29)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (1, CAST(0x763E0B00 AS Date), 7)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (2, CAST(0x6B3E0B00 AS Date), 2)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (2, CAST(0x6D3E0B00 AS Date), 2)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (2, CAST(0x6F3E0B00 AS Date), 7)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (2, CAST(0x703E0B00 AS Date), 3)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (2, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (2, CAST(0x753E0B00 AS Date), 11)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (2, CAST(0x763E0B00 AS Date), 4)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (3, CAST(0x6A3E0B00 AS Date), 214)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (3, CAST(0x6B3E0B00 AS Date), 214)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (3, CAST(0x6C3E0B00 AS Date), 214)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (3, CAST(0x6D3E0B00 AS Date), 214)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (3, CAST(0x6F3E0B00 AS Date), 245)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (3, CAST(0x703E0B00 AS Date), 382)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (3, CAST(0x713E0B00 AS Date), 525)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (3, CAST(0x723E0B00 AS Date), 214)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (3, CAST(0x733E0B00 AS Date), 159)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (3, CAST(0x743E0B00 AS Date), 4)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (3, CAST(0x753E0B00 AS Date), 40)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (3, CAST(0x763E0B00 AS Date), 31)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (4, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (4, CAST(0x6B3E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (4, CAST(0x6D3E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (4, CAST(0x6F3E0B00 AS Date), 65)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (4, CAST(0x703E0B00 AS Date), 23)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (4, CAST(0x733E0B00 AS Date), 4)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (4, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (4, CAST(0x763E0B00 AS Date), 2)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (5, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (5, CAST(0x713E0B00 AS Date), 2)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (5, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (6, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (6, CAST(0x713E0B00 AS Date), 3)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (6, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (6, CAST(0x753E0B00 AS Date), 4)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (7, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (7, CAST(0x703E0B00 AS Date), 4)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (7, CAST(0x733E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (7, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (7, CAST(0x753E0B00 AS Date), 4)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (7, CAST(0x763E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (8, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (8, CAST(0x6D3E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (8, CAST(0x703E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (8, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (9, CAST(0x6A3E0B00 AS Date), 2)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (9, CAST(0x6B3E0B00 AS Date), 2)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (9, CAST(0x703E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (9, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (9, CAST(0x753E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (10, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (10, CAST(0x6D3E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (10, CAST(0x703E0B00 AS Date), 5)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (10, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (11, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (11, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (12, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (12, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (13, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (13, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (14, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (14, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (15, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (15, CAST(0x6D3E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (15, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (16, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (17, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (17, CAST(0x733E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (17, CAST(0x743E0B00 AS Date), 2)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (18, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (19, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (20, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (20, CAST(0x713E0B00 AS Date), 2)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (20, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (21, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (21, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (22, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (22, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (23, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (24, CAST(0x6A3E0B00 AS Date), 4)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (24, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (25, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (26, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (27, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (28, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (29, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (29, CAST(0x753E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (30, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (31, CAST(0x6A3E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (32, CAST(0x6A3E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (33, CAST(0x6A3E0B00 AS Date), 2)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (34, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (34, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (35, CAST(0x6A3E0B00 AS Date), 0)
GO
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (35, CAST(0x743E0B00 AS Date), 2)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (36, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (37, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (37, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (38, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (38, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (39, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (40, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (41, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (43, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (43, CAST(0x6F3E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (44, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (45, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (46, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (47, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (48, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (48, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (50, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (51, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (52, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (53, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (54, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (54, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (55, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (57, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (58, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (61, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (62, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (62, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (63, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (64, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (65, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (66, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (66, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (67, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (67, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (68, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (69, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (69, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (70, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (71, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (72, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (73, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (73, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (74, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (75, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (76, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (77, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (78, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (79, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (79, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (80, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (81, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (82, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (83, CAST(0x6A3E0B00 AS Date), 0)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (83, CAST(0x743E0B00 AS Date), 1)
INSERT [dbo].[WatchStatisticByDay] ([AniID], [Date], [TimeClicked]) VALUES (87, CAST(0x6A3E0B00 AS Date), 0)
ALTER TABLE [dbo].[Anime]  WITH CHECK ADD  CONSTRAINT [FK_Anime_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Type] ([TypeID])
GO
ALTER TABLE [dbo].[Anime] CHECK CONSTRAINT [FK_Anime_Type]
GO
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
ALTER TABLE [dbo].[ErrorReport]  WITH CHECK ADD  CONSTRAINT [FK_ErrorReport_Anime] FOREIGN KEY([AniID])
REFERENCES [dbo].[Anime] ([AniID])
GO
ALTER TABLE [dbo].[ErrorReport] CHECK CONSTRAINT [FK_ErrorReport_Anime]
GO
ALTER TABLE [dbo].[ErrorReport]  WITH CHECK ADD  CONSTRAINT [FK_ErrorReport_AnimeEpisodes] FOREIGN KEY([EpID])
REFERENCES [dbo].[AnimeEpisodes] ([EpID])
GO
ALTER TABLE [dbo].[ErrorReport] CHECK CONSTRAINT [FK_ErrorReport_AnimeEpisodes]
GO
ALTER TABLE [dbo].[ErrorReport]  WITH CHECK ADD  CONSTRAINT [FK_ErrorReport_EpisodeSource] FOREIGN KEY([SourceID])
REFERENCES [dbo].[EpisodeSource] ([SourceID])
GO
ALTER TABLE [dbo].[ErrorReport] CHECK CONSTRAINT [FK_ErrorReport_EpisodeSource]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_Account] FOREIGN KEY([AccID])
REFERENCES [dbo].[Account] ([AccID])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_Account]
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_Favorite_Anime] FOREIGN KEY([AniID])
REFERENCES [dbo].[Anime] ([AniID])
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_Favorite_Anime]
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
ALTER TABLE [dbo].[Wallpaper]  WITH CHECK ADD  CONSTRAINT [FK_Wallpaper_Anime] FOREIGN KEY([AniID])
REFERENCES [dbo].[Anime] ([AniID])
GO
ALTER TABLE [dbo].[Wallpaper] CHECK CONSTRAINT [FK_Wallpaper_Anime]
GO
ALTER TABLE [dbo].[WatchStatisticByDay]  WITH CHECK ADD  CONSTRAINT [FK_WatchStatisticByDay_Anime] FOREIGN KEY([AniID])
REFERENCES [dbo].[Anime] ([AniID])
GO
ALTER TABLE [dbo].[WatchStatisticByDay] CHECK CONSTRAINT [FK_WatchStatisticByDay_Anime]
GO
