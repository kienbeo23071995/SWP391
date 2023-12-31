USE [SWP391_HouseRentalSystem]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [nchar](16) NOT NULL,
	[Phone_Number] [nchar](10) NULL,
	[Role_ID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Secure_Question_ID] [int] NULL,
	[Secure_Answer_ID] [int] NULL,
	[Profile_Picture] [text] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Role]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Role](
	[Id] [int] NOT NULL,
	[Role] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Account_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[house_id] [int] NOT NULL,
	[tenant] [int] NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
	[createdDate] [date] NOT NULL,
	[updatedDate] [date] NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog_Posts]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog_Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Poster_ID] [int] NOT NULL,
	[Post_Time] [date] NULL,
	[Topic] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[Like_Count] [int] NOT NULL,
	[Image] [text] NULL,
 CONSTRAINT [PK_Blog_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Districts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[District] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Districts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favourite_Blogs]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favourite_Blogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [int] NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favourite_House]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favourite_House](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[House_ID] [int] NOT NULL,
 CONSTRAINT [PK_Favourite_House] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sender_ID] [int] NOT NULL,
	[Receiver_ID] [int] NOT NULL,
	[House_ID] [int] NOT NULL,
	[Feedback_Date] [date] NULL,
	[Content] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback_System]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback_System](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Account_ID] [int] NULL,
	[Content] [nvarchar](1000) NULL,
	[AddDate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History_House]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_House](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Account_ID] [int] NOT NULL,
	[House_ID] [int] NOT NULL,
 CONSTRAINT [PK_History_House] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[House_Owner_ID] [int] NULL,
	[Category_ID] [int] NOT NULL,
	[Price] [float] NULL,
	[District_ID] [int] NOT NULL,
	[Full_Address] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Rating] [float] NOT NULL,
	[Added_Date] [date] NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_House] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House_Category]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House_Category](
	[Id] [int] NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_House_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House_Details]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House_Details](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[House_ID] [int] NOT NULL,
	[Number_Of_Bedrooms] [int] NOT NULL,
	[Number_Of_Bathrooms] [int] NOT NULL,
	[Area] [int] NOT NULL,
	[Pool] [int] NOT NULL,
	[House_Direction_ID] [int] NULL,
 CONSTRAINT [PK_House_Details] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House_Directions]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House_Directions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Direction] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_House_Directions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House_Images]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House_Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[House_ID] [int] NOT NULL,
	[Image] [varchar](50) NOT NULL,
 CONSTRAINT [PK_House_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House_Ratings]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House_Ratings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[House_ID] [int] NOT NULL,
	[Voter_ID] [int] NOT NULL,
	[Rating] [float] NOT NULL,
 CONSTRAINT [PK_House_Ratings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sender_ID] [int] NOT NULL,
	[Receiver_ID] [int] NOT NULL,
	[Sent_Date] [date] NULL,
	[Content] [nvarchar](200) NOT NULL,
	[Status] [bit] NOT NULL,
	[Deleted_By_Sender] [bit] NOT NULL,
	[Deleted_By_Receiver] [bit] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_Comments]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Post_ID] [int] NOT NULL,
	[Commenter_ID] [int] NOT NULL,
	[Comment_Date] [date] NULL,
	[Content] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Post_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Secure_Answers]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Secure_Answers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Secure_Question_ID] [int] NOT NULL,
	[Answer] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Secure_Answers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Secure_Questions]    Script Date: 8/24/2023 9:38:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Secure_Questions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Secure_Questions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Account_Role] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Account_Role] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Account_Role]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Secure_Answers] FOREIGN KEY([Secure_Answer_ID])
REFERENCES [dbo].[Secure_Answers] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Secure_Answers]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Secure_Questions] FOREIGN KEY([Secure_Question_ID])
REFERENCES [dbo].[Secure_Questions] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Secure_Questions]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Account] FOREIGN KEY([tenant])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Account]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_House] FOREIGN KEY([house_id])
REFERENCES [dbo].[House] ([Id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_House]
GO
ALTER TABLE [dbo].[Blog_Posts]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Posts_Account] FOREIGN KEY([Poster_ID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Blog_Posts] CHECK CONSTRAINT [FK_Blog_Posts_Account]
GO
ALTER TABLE [dbo].[Favourite_Blogs]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteBlog_Blog_Posts] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blog_Posts] ([Id])
GO
ALTER TABLE [dbo].[Favourite_Blogs] CHECK CONSTRAINT [FK_FavoriteBlog_Blog_Posts]
GO
ALTER TABLE [dbo].[Favourite_Blogs]  WITH CHECK ADD  CONSTRAINT [FK_FavoritePosts_Account] FOREIGN KEY([UserID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Favourite_Blogs] CHECK CONSTRAINT [FK_FavoritePosts_Account]
GO
ALTER TABLE [dbo].[Favourite_House]  WITH CHECK ADD  CONSTRAINT [FK_Favourite_House_Account] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Favourite_House] CHECK CONSTRAINT [FK_Favourite_House_Account]
GO
ALTER TABLE [dbo].[Favourite_House]  WITH CHECK ADD  CONSTRAINT [FK_Favourite_House_House] FOREIGN KEY([House_ID])
REFERENCES [dbo].[House] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favourite_House] CHECK CONSTRAINT [FK_Favourite_House_House]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Account_Receiver] FOREIGN KEY([Receiver_ID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Account_Receiver]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Account_Sender] FOREIGN KEY([Sender_ID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Account_Sender]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_House] FOREIGN KEY([House_ID])
REFERENCES [dbo].[House] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_House]
GO
ALTER TABLE [dbo].[Feedback_System]  WITH CHECK ADD  CONSTRAINT [FK_Feebback_System_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Feedback_System] CHECK CONSTRAINT [FK_Feebback_System_Account]
GO
ALTER TABLE [dbo].[History_House]  WITH CHECK ADD  CONSTRAINT [FK_AccountHouse_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[History_House] CHECK CONSTRAINT [FK_AccountHouse_Account]
GO
ALTER TABLE [dbo].[History_House]  WITH CHECK ADD  CONSTRAINT [FK_AccountHouse_House] FOREIGN KEY([House_ID])
REFERENCES [dbo].[House] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[History_House] CHECK CONSTRAINT [FK_AccountHouse_House]
GO
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_House_Account] FOREIGN KEY([House_Owner_ID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_House_Account]
GO
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_House_Districts] FOREIGN KEY([District_ID])
REFERENCES [dbo].[Districts] ([Id])
GO
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_House_Districts]
GO
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_House_House_Category] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[House_Category] ([Id])
GO
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_House_House_Category]
GO
ALTER TABLE [dbo].[House_Details]  WITH CHECK ADD  CONSTRAINT [FK_House_Details_House] FOREIGN KEY([House_ID])
REFERENCES [dbo].[House] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[House_Details] CHECK CONSTRAINT [FK_House_Details_House]
GO
ALTER TABLE [dbo].[House_Details]  WITH CHECK ADD  CONSTRAINT [FK_House_Details_House_Directions] FOREIGN KEY([House_Direction_ID])
REFERENCES [dbo].[House_Directions] ([Id])
GO
ALTER TABLE [dbo].[House_Details] CHECK CONSTRAINT [FK_House_Details_House_Directions]
GO
ALTER TABLE [dbo].[House_Images]  WITH CHECK ADD  CONSTRAINT [FK_House_Images_House] FOREIGN KEY([House_ID])
REFERENCES [dbo].[House] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[House_Images] CHECK CONSTRAINT [FK_House_Images_House]
GO
ALTER TABLE [dbo].[House_Ratings]  WITH CHECK ADD  CONSTRAINT [FK_House_Ratings_Account] FOREIGN KEY([Voter_ID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[House_Ratings] CHECK CONSTRAINT [FK_House_Ratings_Account]
GO
ALTER TABLE [dbo].[House_Ratings]  WITH CHECK ADD  CONSTRAINT [FK_House_Ratings_House] FOREIGN KEY([House_ID])
REFERENCES [dbo].[House] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[House_Ratings] CHECK CONSTRAINT [FK_House_Ratings_House]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Account] FOREIGN KEY([Sender_ID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Account]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Account1] FOREIGN KEY([Receiver_ID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Account1]
GO
ALTER TABLE [dbo].[Post_Comments]  WITH CHECK ADD  CONSTRAINT [FK_Post_Comments_Account3] FOREIGN KEY([Commenter_ID])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Post_Comments] CHECK CONSTRAINT [FK_Post_Comments_Account3]
GO
ALTER TABLE [dbo].[Post_Comments]  WITH CHECK ADD  CONSTRAINT [FK_Post_Comments_Blog_Posts] FOREIGN KEY([Post_ID])
REFERENCES [dbo].[Blog_Posts] ([Id])
GO
ALTER TABLE [dbo].[Post_Comments] CHECK CONSTRAINT [FK_Post_Comments_Blog_Posts]
GO
ALTER TABLE [dbo].[Secure_Answers]  WITH CHECK ADD  CONSTRAINT [FK_Secure_Answers_Secure_Questions] FOREIGN KEY([Secure_Question_ID])
REFERENCES [dbo].[Secure_Questions] ([Id])
GO
ALTER TABLE [dbo].[Secure_Answers] CHECK CONSTRAINT [FK_Secure_Answers_Secure_Questions]
GO
