USE [EticaretDb]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 25.08.2023 16:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25.08.2023 16:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK__Users__B9BE370F58C6A1E2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Admins]    Script Date: 25.08.2023 16:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[V_Admins] As

select u.Id, u.username, u.email From Users u
left join Role r ON u.role_id = r.Id
where role_id=1
GO
/****** Object:  Table [dbo].[Category]    Script Date: 25.08.2023 16:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 25.08.2023 16:21:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[product_description] [varchar](250) NOT NULL,
	[price] [decimal](6, 2) NOT NULL,
	[quantity] [int] NOT NULL,
	[in_stock] [bit] NULL,
	[category_id] [int] NOT NULL,
	[img] [varchar](50) NULL,
 CONSTRAINT [PK__Products__47027DF59F3C6DDF] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [category_name]) VALUES (1, N'saat')
INSERT [dbo].[Category] ([Id], [category_name]) VALUES (2, N't-shirt')
INSERT [dbo].[Category] ([Id], [category_name]) VALUES (3, N'bot')
INSERT [dbo].[Category] ([Id], [category_name]) VALUES (4, N'gömlek')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [title], [product_description], [price], [quantity], [in_stock], [category_id], [img]) VALUES (1, N'nike', N'nike bunny shoe', CAST(200.00 AS Decimal(6, 2)), 15, 1, 1, N'asdasd')
INSERT [dbo].[Products] ([Id], [title], [product_description], [price], [quantity], [in_stock], [category_id], [img]) VALUES (2, N't-shirt', N'wranglerrr', CAST(15.00 AS Decimal(6, 2)), 2, 1, 2, N'qweqweqweqwe')
INSERT [dbo].[Products] ([Id], [title], [product_description], [price], [quantity], [in_stock], [category_id], [img]) VALUES (4, N'saat', N'Watch', CAST(1200.50 AS Decimal(6, 2)), 15, 1, 4, N'ertertertert')
INSERT [dbo].[Products] ([Id], [title], [product_description], [price], [quantity], [in_stock], [category_id], [img]) VALUES (6, N'ayakkabı', N'ıoerutıofgh', CAST(1000.00 AS Decimal(6, 2)), 25, 1, 1, N'lkerjtlkert')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [role]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([Id], [role]) VALUES (2, N'person')
INSERT [dbo].[Role] ([Id], [role]) VALUES (3, N'üye')
INSERT [dbo].[Role] ([Id], [role]) VALUES (4, N'ziyaretci')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [username], [email], [first_name], [password], [role_id]) VALUES (1, N'admin', N'admin@gmail.com', N'ad', N'admin123', 1)
INSERT [dbo].[Users] ([Id], [username], [email], [first_name], [password], [role_id]) VALUES (2, N'utku', N'reis@hotmail.com', N'utku reis', N'123456', 3)
INSERT [dbo].[Users] ([Id], [username], [email], [first_name], [password], [role_id]) VALUES (4, N'utkudeniz', N'utku@gmail.com', N'utku', N'123412121', 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__in_sto__412EB0B6]  DEFAULT ((1)) FOR [in_stock]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__catego__4222D4EF] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__catego__4222D4EF]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
