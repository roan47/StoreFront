ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_Orders_User]
GO
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[AspNetUserTokens] DROP CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims] DROP CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/9/2022 3:47:59 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 6/9/2022 3:47:59 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suppliers]') AND type in (N'U'))
DROP TABLE [dbo].[Suppliers]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/9/2022 3:47:59 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
DROP TABLE [dbo].[Products]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/9/2022 3:47:59 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
DROP TABLE [dbo].[Orders]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/9/2022 3:47:59 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetails]') AND type in (N'U'))
DROP TABLE [dbo].[OrderDetails]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/9/2022 3:47:59 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
DROP TABLE [dbo].[Categories]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 6/9/2022 3:47:59 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserTokens]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserTokens]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/9/2022 3:47:59 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/9/2022 3:47:59 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/9/2022 3:47:59 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/9/2022 3:47:59 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/9/2022 3:47:59 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 6/9/2022 3:47:59 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoleClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoleClaims]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 6/9/2022 3:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/9/2022 3:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/9/2022 3:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/9/2022 3:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/9/2022 3:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/9/2022 3:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 6/9/2022 3:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/9/2022 3:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[CategoryDescript] [varchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/9/2022 3:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Pprice] [money] NULL,
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/9/2022 3:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[state] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[zip] [nchar](10) NOT NULL,
	[Price] [money] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/9/2022 3:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Pname] [varchar](200) NOT NULL,
	[Pprice] [money] NOT NULL,
	[Pdescript] [varchar](500) NULL,
	[InStock] [smallint] NOT NULL,
	[OutStock] [smallint] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[img] [varchar](200) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 6/9/2022 3:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupID] [int] IDENTITY(1,1) NOT NULL,
	[SupName] [varchar](50) NOT NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](10) NULL,
	[State] [varchar](5) NULL,
	[Country] [varchar](50) NOT NULL,
	[Phone] [nchar](10) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/9/2022 3:47:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [nvarchar](128) NOT NULL,
	[EmployeeId] [int] NULL,
	[UserType] [varchar](50) NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Adress] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Zip] [nchar](10) NULL,
	[Phone] [nchar](10) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2544c960-fcff-42b4-bb90-e88414f41076', N'Admin', N'ADMIN', N'79e99869-49a8-4b9b-a72e-ed5116ff225a')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'04721bce-e515-4b0c-b0d0-55e6defde2a1', N'2544c960-fcff-42b4-bb90-e88414f41076')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'04721bce-e515-4b0c-b0d0-55e6defde2a1', N'roan.leffew@gmail.com', N'ROAN.LEFFEW@GMAIL.COM', N'roan.leffew@gmail.com', N'ROAN.LEFFEW@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEH4KZJZu1SYVvyd85F8Gfz8GFyHSR0I4DVcUbc1m6BaGIrrt5BkgQR87Ly9sWhmrgg==', N'6NZTVIV2LXM3V6F3NY3FE26NQTXC2YLB', N'fa983f1f-9357-41eb-a008-f4324d903b22', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'05e7859c-4713-4451-8fa5-28abfe9da590', N'test2@gmail.com', N'TEST2@GMAIL.COM', N'test2@gmail.com', N'TEST2@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEM1pJLjwfvTYBg4jEl27JAOmJ7wJ5obBf06/TbQ1gw3LoF0CXk+75L/x0d5fjOjCjw==', N'PVTMOCLY2KGGNRG4OXIDTQHYG5EMTFMG', N'c9e8b21b-0e15-4725-80b2-422b416d82dc', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'54b3167d-de09-4d45-9d9f-856f9d2c0e5b', N'danielreynolds.@hotmail.com', N'DANIELREYNOLDS.@HOTMAIL.COM', N'danielreynolds.@hotmail.com', N'DANIELREYNOLDS.@HOTMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOBdJwrL6c0haTqRhVnJWMOIsM99vtuLLd1MaABpN4Xzy6MZNOZSLlkVwM2aFBYHvQ==', N'PAVQFGPDTHBXBZH4MUGX2XCVOZP77OJ4', N'21b164fe-3f67-456c-99c0-464ca8acdb8d', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'57354e18-87ee-4d60-a942-80403f5e2160', N'jimbo@gmail.com', N'JIMBO@GMAIL.COM', N'jimbo@gmail.com', N'JIMBO@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEC1mbqCGkbywdcpN5gx5CMemuF1+dbhJzH0rG4o1dTuFIib+xIPC2K0kcz9ZYDuPCg==', N'QZEUJRMILPQZKLJ2DP3O6TUVSXPJ7BIW', N'04b122f8-0c02-485d-a5d7-f40f64e471d0', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'63caf118-cc03-4262-9d4b-f8d12c9813f8', N'test@gmail.com', N'TEST@GMAIL.COM', N'test@gmail.com', N'TEST@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEA04eAzrx0rwQ4of+28yf7SsCX1iW33+ytIiUuVEChmsMfPEgza05KdTdnDZwETYnQ==', N'SYJ5QWNTJ7J5M5XWH4U5CVCEN5HSPAA6', N'4e68f4f8-98ff-4231-9f5c-b1034a530176', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b7f3644e-c851-472a-8e37-35f637ebe519', N'danielreynolds.@gmail.com', N'DANIELREYNOLDS.@GMAIL.COM', N'danielreynolds.@gmail.com', N'DANIELREYNOLDS.@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBpuaFTIL3FeXhGvM67URQlXSrZ1W/xxJ/dOa5jdZcB9QOr+NbUR0t4UA3wY92RKrQ==', N'Y3E43PAMVAU6TXZM5UUBSTF5AFCH75OH', N'481205f2-3231-42e6-b452-5455c0fef2a7', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ca196414-d878-418d-8d74-262a0e9eae45', N'johnny2strangs@hotmail.com', N'JOHNNY2STRANGS@HOTMAIL.COM', N'johnny2strangs@hotmail.com', N'JOHNNY2STRANGS@HOTMAIL.COM', 1, N'AQAAAAEAACcQAAAAEJK1jDKDCR+MALiMS3j6DWfs0m56Meup6CCNFbEsdILXJK9EqBQrXSh2lLas6D+l7A==', N'LS2ONM5VSMLCRN6HKOUTVQZ35AUPCBCQ', N'4812b03a-12da-4185-8b12-bc51771d3cc2', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ed206b4a-5bbb-4e01-8307-323056285b58', N'danielreynolds.@gmnail.com', N'DANIELREYNOLDS.@GMNAIL.COM', N'danielreynolds.@gmnail.com', N'DANIELREYNOLDS.@GMNAIL.COM', 0, N'AQAAAAEAACcQAAAAEBZEl6ivfjynHNcR4KmGNL44oTdp7drqVFJ+Y7zMc/cKAuC/9BIwcyvYFG7OuAzz7w==', N'Z4GVZGGKIUTA6IRZBSJDBU3OYDKN7EOI', N'62682fb0-466f-4d56-9ed9-2c9f506c3983', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescript]) VALUES (1, N'Soy Sawse', N'A hundred percent read made soy')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescript]) VALUES (2, N'Skateboard Decks', N'skateboard decks, and completes')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescript]) VALUES (3, N'Trucks.wheels,etc', N'Trucks,wheels,bearings,hardware, and griptape')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescript]) VALUES (4, N'Shoes', N'skate shoes, and casual wears')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CategoryDescript]) VALUES (5, N'Clothing', N'Skatebrand clothing and fashion')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [Quantity], [Pprice], [OrderDetailsId]) VALUES (0, 3, 1, 50.0000, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [UserID], [Address], [City], [state], [Country], [zip], [Price], [quantity]) VALUES (0, N'63caf118-cc03-4262-9d4b-f8d12c9813f8', N'test', N'test', N'mo', N'usa', N'64077     ', 0.0000, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Pname], [Pprice], [Pdescript], [InStock], [OutStock], [CategoryID], [SupplierID], [img]) VALUES (1, N'Soy Sawse 5 oz', 5.0000, N'5 oz bottle of a hundred percent soy', 100, 0, 1, 1, N'41d562a5-8ddf-4000-ad3f-13d38409ca0d.png')
INSERT [dbo].[Products] ([ProductID], [Pname], [Pprice], [Pdescript], [InStock], [OutStock], [CategoryID], [SupplierID], [img]) VALUES (2, N'Soy Sawse 20 oz', 12.0000, N'20 oz bottle of a hundred percent soy', 100, 0, 1, 1, N'740cb36b-8554-4525-9cda-908707c1fe53.png')
INSERT [dbo].[Products] ([ProductID], [Pname], [Pprice], [Pdescript], [InStock], [OutStock], [CategoryID], [SupplierID], [img]) VALUES (3, N'Lovely Skateboard 8.125', 50.0000, N'20 oz bottle of a hundred percent soy', 20, 0, 2, 2, N'dc04b541-33cf-4d97-8a91-0befce830e1a.png')
INSERT [dbo].[Products] ([ProductID], [Pname], [Pprice], [Pdescript], [InStock], [OutStock], [CategoryID], [SupplierID], [img]) VALUES (4, N'Nike sb Dunk high pandas', 150.0000, N'white/black limited quantity, size 10 only', 5, 0, 4, 2, N'a0063158-c6e2-4cba-80a1-0872986c0185.png')
INSERT [dbo].[Products] ([ProductID], [Pname], [Pprice], [Pdescript], [InStock], [OutStock], [CategoryID], [SupplierID], [img]) VALUES (5, N'Independent trucks 149ers', 25.0000, N'Durable all purpose truck for any type of skateboarding.  55mm tall for optimal performance and wheel clearance with wheels 56mm and under.  A356 T6 Aluminum Hanger & Baseplate The best lightweight aluminum alloy heat treated to T6 condition for strength, durability, and grind feel.  SCM435 Chromoly Steel Axle Highest quality and durability available.  Grade 8 Kingpin Never break, never bend.  159 and 169 models feature 6 hole universal baseplate with old and new school mounting pattern.  I', 15, 0, 3, 3, N'5f156e14-61c1-442b-bb2b-e8b9b03af5bc.png')
INSERT [dbo].[Products] ([ProductID], [Pname], [Pprice], [Pdescript], [InStock], [OutStock], [CategoryID], [SupplierID], [img]) VALUES (20, N'AN1MAL MFG wheels 53mm ', 35.0000, N'skateboard wheels crafted by local kc brand AN1MAL MFG, great for powerslides, locking in on rails, and have a long lasting durability so you get your money worth', 10, 0, 3, 2, N'c0b49ffa-3420-45ed-85d2-72df219c37ad.png')
INSERT [dbo].[Products] ([ProductID], [Pname], [Pprice], [Pdescript], [InStock], [OutStock], [CategoryID], [SupplierID], [img]) VALUES (21, N'Bones red bearings 8 pack', 18.0000, N'Reds:  Bones® REDS® are manufactured in China to our Bones Skate Rated™ specifications in a manufacturing facility dedicated to producing the highest quality skate bearings in China. They are inspected twice before being shipped to skaters and offer the greatest combination of performance, durability and low cost in the industry. Because they offer near Bones Swiss performance at a fraction of the cost, they have become the best selling bearings.', 8, 0, 3, 2, N'434b662f-8721-41e8-8c01-7384f83d6845.png')
INSERT [dbo].[Products] ([ProductID], [Pname], [Pprice], [Pdescript], [InStock], [OutStock], [CategoryID], [SupplierID], [img]) VALUES (22, N'Steez Greez 1 of 1 Vest', 80.0000, N'Local kc brand Steez Greez 1 of 1 winter time vest ', 1, 0, 5, 2, N'86c8a150-4375-4a53-95c5-56d7568571c1.png')
INSERT [dbo].[Products] ([ProductID], [Pname], [Pprice], [Pdescript], [InStock], [OutStock], [CategoryID], [SupplierID], [img]) VALUES (23, N'Steez Greez 1 of 1 Vest', 80.0000, N'Local kc brand Steez Greez 1 of 1 winter time vest ', 1, 0, 5, 1, N'05a777d6-6212-4c0e-a935-ba9265a5b0e5.png')
INSERT [dbo].[Products] ([ProductID], [Pname], [Pprice], [Pdescript], [InStock], [OutStock], [CategoryID], [SupplierID], [img]) VALUES (24, N'Steez Greez 1 of 1 Patch Pants Lrg', 80.0000, N'Local kc brand Steez Greez 1 of 1 patch work jean pants size lrg', 1, 0, 5, 2, N'566ef59b-9cca-4f2d-b99a-54dd74c22aaa.png')
INSERT [dbo].[Products] ([ProductID], [Pname], [Pprice], [Pdescript], [InStock], [OutStock], [CategoryID], [SupplierID], [img]) VALUES (25, N'TO_ALL_THE_ENEMIES 10oz Heavy weight hoodie', 80.0000, N'TO_ALL_THE_ENEMIES 10oz Heavy weight hoodie, Local made, XL size only', 15, 0, 5, 2, N'e5332ab5-83d2-44dd-bbe9-7946d5093f24.png')
INSERT [dbo].[Products] ([ProductID], [Pname], [Pprice], [Pdescript], [InStock], [OutStock], [CategoryID], [SupplierID], [img]) VALUES (26, N'TO_ALL_THE_ENEMIES signature beanie', 30.0000, N'TO_ALL_THE_ENEMIES signature beanie custom design ', 20, 0, 5, 3, N'7befb176-8031-4517-96f7-420f5276822a.png')
INSERT [dbo].[Products] ([ProductID], [Pname], [Pprice], [Pdescript], [InStock], [OutStock], [CategoryID], [SupplierID], [img]) VALUES (27, N'LAKAI CAMBRIDGE SKATE SHOES', 35.0000, N'Lakai Cambridge Skate Shoes - The perfect blend of classic and modern, the Lakai Cambridge brings on a modern silhouette mixed with premium materials. The perfectly padded collar and tongue at comfort while the upper sits on  Lakais'' Para-Mount vulcanized sole for all the grip you need.  PARA-MOUNT Vulcanized outsole technology DELUX-LITE premium foam sock liner Hex Tread Padded Collar Padded Tongue  ', 6, 0, 4, 3, N'1e1042cd-55a5-4f02-9d13-cb0db2647f13.png')
INSERT [dbo].[Products] ([ProductID], [Pname], [Pprice], [Pdescript], [InStock], [OutStock], [CategoryID], [SupplierID], [img]) VALUES (28, N'Lovely Skateboards - I LOVELY KC LIMITED EDITION DECKS', 55.0000, N'Lovely Skateboards-We brought back this OG KC LOVE graphic for a 50 run of decks. Great wall hanger or grip it and rip it KC style... Our POPular mellow concave made in the USA', 20, 0, 2, 2, N'1a353a8e-aa1d-4fb9-b17f-79b4304b0451.png')
INSERT [dbo].[Products] ([ProductID], [Pname], [Pprice], [Pdescript], [InStock], [OutStock], [CategoryID], [SupplierID], [img]) VALUES (29, N'Mob Grip Perforated Black Griptape - 9" x 33"', 12.0000, N'Exclusive silicon-carbide grit binding process for grip that will not wear out Mob Grip has been producing one of the industry’s leading skateboard grip tapes since 2000 ...', 30, 0, 3, 3, N'0e109b6c-0c2e-4617-b8b6-9dd9e705744a.png')
INSERT [dbo].[Products] ([ProductID], [Pname], [Pprice], [Pdescript], [InStock], [OutStock], [CategoryID], [SupplierID], [img]) VALUES (30, N'1" Allen Shorty''s Silverados Hardware', 5.0000, N'Shortys Silverados Hardware - 1" AllenContents Include:8 1" Allen Head Bolts8 NutsIncludes Tool1 Shorty''s Sticker', 25, 0, 3, 2, N'73ff4a6e-846f-40da-afc7-18ff53de1006.png')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupID], [SupName], [Address], [City], [State], [Country], [Phone]) VALUES (1, N'Kikkoman', N'1365 Six Corners Road', N'Walworth', N'WI', N'USA', N'2622756181')
INSERT [dbo].[Suppliers] ([SupID], [SupName], [Address], [City], [State], [Country], [Phone]) VALUES (2, N'Escapist', N'405 Southwest Blvd #100', N'KansasCity', N'MO', N'USA', N'8168422504')
INSERT [dbo].[Suppliers] ([SupID], [SupName], [Address], [City], [State], [Country], [Phone]) VALUES (3, N'AWH', N'6001 W Gross Point Rd', N'Niles', N'IL', N'USA', N'8168690950')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
INSERT [dbo].[User] ([UserID], [EmployeeId], [UserType], [FirstName], [LastName], [Adress], [City], [State], [Country], [Zip], [Phone]) VALUES (N'05e7859c-4713-4451-8fa5-28abfe9da590', NULL, NULL, N'test', N'test', N'test', N'test', N'mo', N'usa', N'64015     ', N'1111111111')
INSERT [dbo].[User] ([UserID], [EmployeeId], [UserType], [FirstName], [LastName], [Adress], [City], [State], [Country], [Zip], [Phone]) VALUES (N'55e6defde2a1', NULL, NULL, N'Roan', N'Leffew', N'211 locust', N'kansas city', N'mo', N'usa', N'64015     ', N'2285256643')
INSERT [dbo].[User] ([UserID], [EmployeeId], [UserType], [FirstName], [LastName], [Adress], [City], [State], [Country], [Zip], [Phone]) VALUES (N'57354e18-87ee-4d60-a942-80403f5e2160', NULL, NULL, N'yuh', N'yuh', N'yujh', N'yuh', N'yu', N'yu', N'55555     ', N'11111111  ')
INSERT [dbo].[User] ([UserID], [EmployeeId], [UserType], [FirstName], [LastName], [Adress], [City], [State], [Country], [Zip], [Phone]) VALUES (N'63caf118-cc03-4262-9d4b-f8d12c9813f8', NULL, NULL, N'test', N'test', N'test', N'test', N'mo', N'usa', N'64077     ', N'1111111111')
INSERT [dbo].[User] ([UserID], [EmployeeId], [UserType], [FirstName], [LastName], [Adress], [City], [State], [Country], [Zip], [Phone]) VALUES (N'b7f3644e-c851-472a-8e37-35f637ebe519', NULL, NULL, N'danny', N'rey', N'666 satan lane', N'blue', N'mo', N'usa', N'64015     ', N'8162256627')
INSERT [dbo].[User] ([UserID], [EmployeeId], [UserType], [FirstName], [LastName], [Adress], [City], [State], [Country], [Zip], [Phone]) VALUES (N'ca196414-d878-418d-8d74-262a0e9eae45', NULL, NULL, N'johnny', N'2strang', N'2115 iq dr', N'indepe', N'mo', N'usa', N'64014     ', N'8162256636')
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_User]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
