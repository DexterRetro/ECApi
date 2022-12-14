USE [master]
GO
/****** Object:  Database [musikadb]    Script Date: 27/7/2022 15:54:05 ******/
CREATE DATABASE [musikadb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'musikadb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\musikadb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'musikadb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\musikadb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [musikadb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [musikadb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [musikadb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [musikadb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [musikadb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [musikadb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [musikadb] SET ARITHABORT OFF 
GO
ALTER DATABASE [musikadb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [musikadb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [musikadb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [musikadb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [musikadb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [musikadb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [musikadb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [musikadb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [musikadb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [musikadb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [musikadb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [musikadb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [musikadb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [musikadb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [musikadb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [musikadb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [musikadb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [musikadb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [musikadb] SET  MULTI_USER 
GO
ALTER DATABASE [musikadb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [musikadb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [musikadb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [musikadb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [musikadb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [musikadb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [musikadb] SET QUERY_STORE = OFF
GO
USE [musikadb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 27/7/2022 15:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemImages]    Script Date: 27/7/2022 15:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [nvarchar](max) NOT NULL,
	[ImageURL] [nvarchar](max) NOT NULL,
	[MusikaItemId] [int] NULL,
 CONSTRAINT [PK_ItemImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemOrderhistories]    Script Date: 27/7/2022 15:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemOrderhistories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[AmountPaid] [real] NOT NULL,
	[MusikaUserId] [int] NULL,
 CONSTRAINT [PK_ItemOrderhistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemQues]    Script Date: 27/7/2022 15:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemQues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddedDate] [datetime2](7) NOT NULL,
	[MusikaUserId] [int] NULL,
	[ItemId] [int] NOT NULL,
	[State] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ItemQues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemReviews]    Script Date: 27/7/2022 15:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemReviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[Rating] [int] NOT NULL,
	[CommentDate] [datetime2](7) NOT NULL,
	[MusikaItemId] [int] NULL,
	[Commentor] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ItemReviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MusikaItems]    Script Date: 27/7/2022 15:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusikaItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](max) NOT NULL,
	[SupplierName] [nvarchar](max) NOT NULL,
	[ItemPrice] [real] NOT NULL,
	[ItemQuantity] [int] NOT NULL,
	[ItemDescription] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MusikaItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MusikaUsers]    Script Date: 27/7/2022 15:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusikaUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[FirstNames] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Password] [varbinary](max) NOT NULL,
	[PasswordSalt] [varbinary](max) NOT NULL,
	[Telephone] [int] NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MusikaUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220722204730_CreateInitial', N'6.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220722210821_CreateInitial', N'6.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220723115142_MusikaUsers', N'6.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220726075825_MusikaStructuredDb', N'6.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220726084158_MusikaStructuredDbTypos', N'6.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220726090058_MusikaRelationships', N'6.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220726114240_MusikaMods', N'6.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220726123527_QueMigration', N'6.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220727074535_DBReordering', N'6.0.7')
GO
SET IDENTITY_INSERT [dbo].[ItemImages] ON 

INSERT [dbo].[ItemImages] ([Id], [ImageName], [ImageURL], [MusikaItemId]) VALUES (1, N'applePods.jpg', N'assets/images/applePods.jpg', 6)
INSERT [dbo].[ItemImages] ([Id], [ImageName], [ImageURL], [MusikaItemId]) VALUES (2, N'woodenSpoons.jpg', N'assets/images/woodenSpoons.jpg', 4)
INSERT [dbo].[ItemImages] ([Id], [ImageName], [ImageURL], [MusikaItemId]) VALUES (3, N'Drone.jpg', N'assets/images/Drone.jpg', 2)
INSERT [dbo].[ItemImages] ([Id], [ImageName], [ImageURL], [MusikaItemId]) VALUES (4, N'cupd.jpg', N'assets/images/cups.jpg', 1)
INSERT [dbo].[ItemImages] ([Id], [ImageName], [ImageURL], [MusikaItemId]) VALUES (5, N'tShirts.jpg', N'assets/images/tShirts.jpg', 3)
INSERT [dbo].[ItemImages] ([Id], [ImageName], [ImageURL], [MusikaItemId]) VALUES (6, N'knittedTop.jpg', N'assets/images/knittedTop.jpg', 5)
SET IDENTITY_INSERT [dbo].[ItemImages] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemReviews] ON 

INSERT [dbo].[ItemReviews] ([Id], [Comment], [Rating], [CommentDate], [MusikaItemId], [Commentor]) VALUES (3, N'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 4, CAST(N'2011-10-05T16:48:00.0000000' AS DateTime2), 1, N'Susan Ann')
INSERT [dbo].[ItemReviews] ([Id], [Comment], [Rating], [CommentDate], [MusikaItemId], [Commentor]) VALUES (4, N'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 3, CAST(N'2011-10-05T16:48:00.0000000' AS DateTime2), 2, N'Goho Joro')
INSERT [dbo].[ItemReviews] ([Id], [Comment], [Rating], [CommentDate], [MusikaItemId], [Commentor]) VALUES (5, N'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 2, CAST(N'2011-10-05T16:48:00.0000000' AS DateTime2), 3, N'loro goho')
INSERT [dbo].[ItemReviews] ([Id], [Comment], [Rating], [CommentDate], [MusikaItemId], [Commentor]) VALUES (6, N'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 1, CAST(N'2011-10-05T16:48:00.0000000' AS DateTime2), 4, N'John Doe')
INSERT [dbo].[ItemReviews] ([Id], [Comment], [Rating], [CommentDate], [MusikaItemId], [Commentor]) VALUES (7, N'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 3, CAST(N'2011-10-05T16:48:00.0000000' AS DateTime2), 5, N'Dexter')
INSERT [dbo].[ItemReviews] ([Id], [Comment], [Rating], [CommentDate], [MusikaItemId], [Commentor]) VALUES (8, N'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 5, CAST(N'2011-10-05T16:48:00.0000000' AS DateTime2), 6, N'Royce')
SET IDENTITY_INSERT [dbo].[ItemReviews] OFF
GO
SET IDENTITY_INSERT [dbo].[MusikaItems] ON 

INSERT [dbo].[MusikaItems] ([Id], [ItemName], [SupplierName], [ItemPrice], [ItemQuantity], [ItemDescription]) VALUES (1, N'China Ware', N'GuZhong', 2.5, 300, N'Chinese ceramics show a continuous development since pre-dynastic times and are one of the most significant forms of Chinese art and ceramics globally. The first pottery was made during the Palaeolithic era. Chinese ceramics range from construction materials such as bricks and tiles, to hand-built pottery vessels fired in bonfires or kilns, to the sophisticated Chinese porcelain wares made for the imperial court and for export. Porcelain was a Chinese invention and is so identified with China that it is still called "china" in everyday English usage.
A Ming-dynasty blue-and-white porcelain dish with a dragon

Most later Chinese ceramics, even of the finest quality, were made on an industrial scale, thus few names of individual potters were recorded. Many of the most important kiln workshops were owned by or reserved for the emperor, and large quantities of Chinese export porcelain were exported as diplomatic gifts or for trade from an early date, initially to East Asia and the Islamic world, and then from around the 16th century to Europe. Chinese ceramics have had an enormous influence on other ceramic traditions in these areas. ')
INSERT [dbo].[MusikaItems] ([Id], [ItemName], [SupplierName], [ItemPrice], [ItemQuantity], [ItemDescription]) VALUES (2, N'Drone', N'3ZFlight', 399, 20, N'An unmanned aerial vehicle (UAV), commonly known as a drone, is an aircraft without any human pilot, crew, or passengers on board. UAVs are a component of an unmanned aircraft system (UAS), which includes adding a ground-based controller and a system of communications with the UAV.[1] The flight of UAVs may operate under remote control by a human operator, as remotely-piloted aircraft (RPA), or with various degrees of autonomy, such as autopilot assistance, up to fully autonomous aircraft that have no provision for human intervention')
INSERT [dbo].[MusikaItems] ([Id], [ItemName], [SupplierName], [ItemPrice], [ItemQuantity], [ItemDescription]) VALUES (3, N'Tshirts', N'HatipfekiJunk', 2.5, 3000, N'A T-shirt, or tee, is a style of fabric shirt named after the T shape of its body and sleeves. Traditionally, it has short sleeves and a round neckline, known as a crew neck, which lacks a collar. T-shirts are generally made of a stretchy, light, and inexpensive fabric and are easy to clean. The T-shirt evolved from undergarments used in the 19th century and, in the mid-20th century, transitioned from undergarment to general-use casual clothing.

They are typically made of cotton textile in a stockinette or jersey knit, which has a distinctively pliable texture compared to shirts made of woven cloth. Some modern versions have a body made from a continuously knitted tube, produced on a circular knitting machine, such that the torso has no side seams. The manufacture of T-shirts has become highly automated and may include cutting fabric with a laser or a water jet. ')
INSERT [dbo].[MusikaItems] ([Id], [ItemName], [SupplierName], [ItemPrice], [ItemQuantity], [ItemDescription]) VALUES (4, N'Kitchen Utensils', N'Tupperware', 5, 400, N'A kitchen utensil is a hand-held, typically small tool that is designed for food-related functions. Food preparation utensils are a specific type of kitchen utensil, designed for use in the preparation of food. Some utensils are both food preparation utensils and eating utensils; for instance some implements of cutlery – especially knives – can be used for both food preparation in a kitchen and as eating utensils when dining (though most types of knives used in kitchens are unsuitable for use on the dining table).

In the Western world, utensil invention accelerated in the 19th and 20th centuries. It was fuelled in part by the emergence of technologies such as the kitchen stove and refrigerator, but also by a desire to save time in the kitchen, in response to the demands of modern lifestyles.[1] ')
INSERT [dbo].[MusikaItems] ([Id], [ItemName], [SupplierName], [ItemPrice], [ItemQuantity], [ItemDescription]) VALUES (5, N'Knited Top', N'OneWorld', 7, 26, N'In weaving, threads are always straight, running parallel either lengthwise (warp threads) or crosswise (weft threads). By contrast, the yarn in knitted fabrics follows a meandering path (a course), forming symmetric loops (also called bights) symmetrically above and below the mean path of the yarn. These meandering loops can be easily stretched in different directions giving knit fabrics much more elasticity than woven fabrics. Depending on the yarn and knitting pattern, knitted garments can stretch as much as 500%. For this reason, knitting is believed to have been developed for garments that must be elastic or stretch in response to the wearer''s motions, such as socks and hosiery. For comparison, woven garments stretch mainly along one or other of a related pair of directions that lie roughly diagonally between the warp and the weft, while contracting in the other direction of the pair (stretching and contracting with the bias), and are not very elastic, unless they are woven from stretchable material such as spandex.')
INSERT [dbo].[MusikaItems] ([Id], [ItemName], [SupplierName], [ItemPrice], [ItemQuantity], [ItemDescription]) VALUES (6, N'Apple Products', N'Apple', 159, 16, N'Apple Inc. is an American multinational technology company that specializes in consumer electronics, software and online services headquartered in Cupertino, California, United States. Apple is the largest technology company by revenue (totaling US$365.8 billion in 2021) and as of June 2022, it is the world''s biggest company by market capitalization, the fourth-largest personal computer vendor by unit sales and second-largest mobile phone manufacturer. It is one of the Big Five American information technology companies, alongside Alphabet, Amazon, Meta, and Microsoft. ')
SET IDENTITY_INSERT [dbo].[MusikaItems] OFF
GO
SET IDENTITY_INSERT [dbo].[MusikaUsers] ON 

INSERT [dbo].[MusikaUsers] ([Id], [Username], [FirstNames], [Surname], [Password], [PasswordSalt], [Telephone], [Email], [Address], [City], [Country]) VALUES (5, N'string', N'string', N'string', 0x291241EFDC8DC2BFF6D3CC27F8EEBF459D297B1A29C13AC5248FC4119B4E4F3E1505C7C8DC9E5C810068F236B357BF86D0CC8134228E5E5255F66D15BE64B4EE, 0x99B8CBD13D89F0E8BD9B8D71F3485A9BAA490217602C47176957098E6DC654522CF1B534E1FBF44348DE2AC85D76910ABAE6A63244A07192273364C464BD3A2D16AFF0326D153BD55EB38FF2BC553C9A617D1AA260A92ECA41B25C28B180AF26122A91F0A94E77D942C0C28877FF83C5645051620CAB16DDD169293FE186F591, 0, N'string', N'string', N'string', N'string')
SET IDENTITY_INSERT [dbo].[MusikaUsers] OFF
GO
/****** Object:  Index [IX_ItemImages_MusikaItemId]    Script Date: 27/7/2022 15:54:05 ******/
CREATE NONCLUSTERED INDEX [IX_ItemImages_MusikaItemId] ON [dbo].[ItemImages]
(
	[MusikaItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemOrderhistories_ItemId]    Script Date: 27/7/2022 15:54:05 ******/
CREATE NONCLUSTERED INDEX [IX_ItemOrderhistories_ItemId] ON [dbo].[ItemOrderhistories]
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemOrderhistories_MusikaUserId]    Script Date: 27/7/2022 15:54:05 ******/
CREATE NONCLUSTERED INDEX [IX_ItemOrderhistories_MusikaUserId] ON [dbo].[ItemOrderhistories]
(
	[MusikaUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemQues_ItemId]    Script Date: 27/7/2022 15:54:05 ******/
CREATE NONCLUSTERED INDEX [IX_ItemQues_ItemId] ON [dbo].[ItemQues]
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemQues_MusikaUserId]    Script Date: 27/7/2022 15:54:05 ******/
CREATE NONCLUSTERED INDEX [IX_ItemQues_MusikaUserId] ON [dbo].[ItemQues]
(
	[MusikaUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemReviews_MusikaItemId]    Script Date: 27/7/2022 15:54:05 ******/
CREATE NONCLUSTERED INDEX [IX_ItemReviews_MusikaItemId] ON [dbo].[ItemReviews]
(
	[MusikaItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ItemQues] ADD  DEFAULT ((0)) FOR [ItemId]
GO
ALTER TABLE [dbo].[ItemQues] ADD  DEFAULT (N'') FOR [State]
GO
ALTER TABLE [dbo].[ItemReviews] ADD  DEFAULT (N'') FOR [Commentor]
GO
ALTER TABLE [dbo].[MusikaItems] ADD  DEFAULT (N'') FOR [ItemDescription]
GO
ALTER TABLE [dbo].[MusikaUsers] ADD  DEFAULT (N'') FOR [Address]
GO
ALTER TABLE [dbo].[MusikaUsers] ADD  DEFAULT (N'') FOR [City]
GO
ALTER TABLE [dbo].[MusikaUsers] ADD  DEFAULT (N'') FOR [Country]
GO
ALTER TABLE [dbo].[ItemImages]  WITH CHECK ADD  CONSTRAINT [FK_ItemImages_MusikaItems_MusikaItemId] FOREIGN KEY([MusikaItemId])
REFERENCES [dbo].[MusikaItems] ([Id])
GO
ALTER TABLE [dbo].[ItemImages] CHECK CONSTRAINT [FK_ItemImages_MusikaItems_MusikaItemId]
GO
ALTER TABLE [dbo].[ItemOrderhistories]  WITH CHECK ADD  CONSTRAINT [FK_ItemOrderhistories_MusikaItems_ItemId] FOREIGN KEY([ItemId])
REFERENCES [dbo].[MusikaItems] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemOrderhistories] CHECK CONSTRAINT [FK_ItemOrderhistories_MusikaItems_ItemId]
GO
ALTER TABLE [dbo].[ItemOrderhistories]  WITH CHECK ADD  CONSTRAINT [FK_ItemOrderhistories_MusikaUsers_MusikaUserId] FOREIGN KEY([MusikaUserId])
REFERENCES [dbo].[MusikaUsers] ([Id])
GO
ALTER TABLE [dbo].[ItemOrderhistories] CHECK CONSTRAINT [FK_ItemOrderhistories_MusikaUsers_MusikaUserId]
GO
ALTER TABLE [dbo].[ItemQues]  WITH CHECK ADD  CONSTRAINT [FK_ItemQues_MusikaItems_ItemId] FOREIGN KEY([ItemId])
REFERENCES [dbo].[MusikaItems] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemQues] CHECK CONSTRAINT [FK_ItemQues_MusikaItems_ItemId]
GO
ALTER TABLE [dbo].[ItemQues]  WITH CHECK ADD  CONSTRAINT [FK_ItemQues_MusikaUsers_MusikaUserId] FOREIGN KEY([MusikaUserId])
REFERENCES [dbo].[MusikaUsers] ([Id])
GO
ALTER TABLE [dbo].[ItemQues] CHECK CONSTRAINT [FK_ItemQues_MusikaUsers_MusikaUserId]
GO
ALTER TABLE [dbo].[ItemReviews]  WITH CHECK ADD  CONSTRAINT [FK_ItemReviews_MusikaItems_MusikaItemId] FOREIGN KEY([MusikaItemId])
REFERENCES [dbo].[MusikaItems] ([Id])
GO
ALTER TABLE [dbo].[ItemReviews] CHECK CONSTRAINT [FK_ItemReviews_MusikaItems_MusikaItemId]
GO
USE [master]
GO
ALTER DATABASE [musikadb] SET  READ_WRITE 
GO
