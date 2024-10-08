USE [master]
GO
/****** Object:  Database [FinalProject]    Script Date: 6/28/2024 11:09:11 PM ******/
CREATE DATABASE [FinalProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinalProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HOAQUANG\MSSQL\DATA\FinalProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FinalProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HOAQUANG\MSSQL\DATA\FinalProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FinalProject] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinalProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinalProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinalProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinalProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinalProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinalProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinalProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinalProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinalProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinalProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FinalProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinalProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinalProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinalProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinalProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinalProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FinalProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinalProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FinalProject] SET  MULTI_USER 
GO
ALTER DATABASE [FinalProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinalProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinalProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinalProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FinalProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FinalProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FinalProject] SET QUERY_STORE = ON
GO
ALTER DATABASE [FinalProject] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FinalProject]
GO
/****** Object:  Table [dbo].[carts]    Script Date: 6/28/2024 11:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carts](
	[prod_id] [varchar](30) NULL,
	[quantity] [int] NULL,
	[user_id] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 6/28/2024 11:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [varchar](30) NULL,
	[prod_id] [varchar](30) NULL,
	[quantity] [int] NULL,
	[order_time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 6/28/2024 11:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[prod_id] [varchar](30) NOT NULL,
	[prod_name] [varchar](70) NULL,
	[category] [varchar](10) NULL,
	[price] [decimal](10, 2) NULL,
	[stock] [int] NULL,
	[description] [text] NULL,
	[discount] [float] NULL,
	[brand] [varchar](30) NULL,
	[image] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[prod_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 6/28/2024 11:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [varchar](30) NOT NULL,
	[user_name] [varchar](50) NOT NULL,
	[role] [varchar](10) NULL,
	[password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishLists]    Script Date: 6/28/2024 11:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishLists](
	[user_id] [varchar](30) NULL,
	[prod_id] [varchar](30) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[carts] ([prod_id], [quantity], [user_id]) VALUES (N'lap_acerprehelios300', 4, N'hoa')
INSERT [dbo].[carts] ([prod_id], [quantity], [user_id]) VALUES (N'PC_001', 1, N'hoa')
INSERT [dbo].[carts] ([prod_id], [quantity], [user_id]) VALUES (N'lap_asusrogzephyg15', 1, N'hoa')
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([order_id], [user_id], [prod_id], [quantity], [order_time]) VALUES (19, N'duy', N'hp_xiaoredbuds5', 2, CAST(N'2024-06-26T07:18:49.400' AS DateTime))
INSERT [dbo].[orders] ([order_id], [user_id], [prod_id], [quantity], [order_time]) VALUES (20, N'duy', N'kb_edraek3287', 10, CAST(N'2024-06-28T11:09:06.900' AS DateTime))
INSERT [dbo].[orders] ([order_id], [user_id], [prod_id], [quantity], [order_time]) VALUES (21, N'duy', N'kb_edraek3287', 1, CAST(N'2024-06-28T11:10:04.200' AS DateTime))
INSERT [dbo].[orders] ([order_id], [user_id], [prod_id], [quantity], [order_time]) VALUES (22, N'duy', N'kb_edraek3287', 21, CAST(N'2024-06-28T11:11:02.667' AS DateTime))
INSERT [dbo].[orders] ([order_id], [user_id], [prod_id], [quantity], [order_time]) VALUES (23, N'duy', N'lap_asusrogzephyg15', 1, CAST(N'2024-06-28T23:02:58.070' AS DateTime))
INSERT [dbo].[orders] ([order_id], [user_id], [prod_id], [quantity], [order_time]) VALUES (24, N'duy', N'm_logig502', 1, CAST(N'2024-06-28T23:02:58.070' AS DateTime))
INSERT [dbo].[orders] ([order_id], [user_id], [prod_id], [quantity], [order_time]) VALUES (25, N'duy', N'phone_iphone15promax', 1, CAST(N'2024-06-28T23:02:58.070' AS DateTime))
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
INSERT [dbo].[products] ([prod_id], [prod_name], [category], [price], [stock], [description], [discount], [brand], [image]) VALUES (N'hp_xiaoredbuds5', N'Headphones Xiaomi Redmi Buds 5', N'Laptop', CAST(599.99 AS Decimal(10, 2)), 38, N'very good', 0.02, N'Xiaomi', N'hp_xiaoredbuds5.jpg')
INSERT [dbo].[products] ([prod_id], [prod_name], [category], [price], [stock], [description], [discount], [brand], [image]) VALUES (N'kb_edraek3287', N'Keyboard Edra EK3287', N'Keyboard', CAST(26.30 AS Decimal(10, 2)), 65, N'good', 0, N'Edra', N'kb_edraek3287.jpg')
INSERT [dbo].[products] ([prod_id], [prod_name], [category], [price], [stock], [description], [discount], [brand], [image]) VALUES (N'lap_acernitro5', N'Acer Nitro 5', N'Laptop', CAST(1000.99 AS Decimal(10, 2)), 97, N'Good', 0.05, N'Acer', N'lap_acernitro5.jpg')
INSERT [dbo].[products] ([prod_id], [prod_name], [category], [price], [stock], [description], [discount], [brand], [image]) VALUES (N'lap_acerprehelios300', N'Acer Predator Helios 300', N'Laptop', CAST(4999.00 AS Decimal(10, 2)), 48, N'Good', 0.02, N'Acer', N'lap_acerprehelios300.jpg')
INSERT [dbo].[products] ([prod_id], [prod_name], [category], [price], [stock], [description], [discount], [brand], [image]) VALUES (N'lap_asusrogzephyg15', N'Asus Rog Zephyrus G15', N'Laptop', CAST(3999.99 AS Decimal(10, 2)), 49, N'Good', 0.02, N'Asus', N'lap_asusrogzephyg15.jpg')
INSERT [dbo].[products] ([prod_id], [prod_name], [category], [price], [stock], [description], [discount], [brand], [image]) VALUES (N'lap_asuszenduo14', N'Asus ZenBook Duo 14', N'Laptop', CAST(6999.99 AS Decimal(10, 2)), 50, N'good', 0.03, N'Asus', N'lap_asuszenduo14.jpg')
INSERT [dbo].[products] ([prod_id], [prod_name], [category], [price], [stock], [description], [discount], [brand], [image]) VALUES (N'lap_macbookprom1', N'MacBook Pro M1', N'Laptop', CAST(2999.99 AS Decimal(10, 2)), 4, N'Good', 0.05, N'Apple', N'lap_macprom1_2.jpg')
INSERT [dbo].[products] ([prod_id], [prod_name], [category], [price], [stock], [description], [discount], [brand], [image]) VALUES (N'm_logig502', N'Logitech G502', N'Mouse', CAST(29.99 AS Decimal(10, 2)), 99, N'good', 0.5, N'Logitech', N'm_logig502.jpg')
INSERT [dbo].[products] ([prod_id], [prod_name], [category], [price], [stock], [description], [discount], [brand], [image]) VALUES (N'PC_001', N'PC Asus Ultimate', N'PC', CAST(10000.99 AS Decimal(10, 2)), 20, N'good
', 0.03, N'Asus', N'PC_001.jpg')
INSERT [dbo].[products] ([prod_id], [prod_name], [category], [price], [stock], [description], [discount], [brand], [image]) VALUES (N'phone_iphone15promax', N'IPhone 15 Pro Max', N'Phone', CAST(1999.89 AS Decimal(10, 2)), 98, N'Good', 0.05, N'Apple', N'phone_iphone15promax_2.jpg')
GO
INSERT [dbo].[users] ([user_id], [user_name], [role], [password]) VALUES (N'duy', N'Van DUY', N'user', N'1')
INSERT [dbo].[users] ([user_id], [user_name], [role], [password]) VALUES (N'hoa', N'Quang Hoa', N'manager', N'1')
INSERT [dbo].[users] ([user_id], [user_name], [role], [password]) VALUES (N'thien', N'Minh Thien', N'staff', N'1')
GO
INSERT [dbo].[WishLists] ([user_id], [prod_id]) VALUES (N'duy', N'hp_xiaoredbuds5')
INSERT [dbo].[WishLists] ([user_id], [prod_id]) VALUES (N'duy', N'kb_edraek3287')
INSERT [dbo].[WishLists] ([user_id], [prod_id]) VALUES (N'duy', N'lap_acerprehelios300')
GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD FOREIGN KEY([prod_id])
REFERENCES [dbo].[products] ([prod_id])
GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([prod_id])
REFERENCES [dbo].[products] ([prod_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[WishLists]  WITH CHECK ADD FOREIGN KEY([prod_id])
REFERENCES [dbo].[products] ([prod_id])
GO
ALTER TABLE [dbo].[WishLists]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
USE [master]
GO
ALTER DATABASE [FinalProject] SET  READ_WRITE 
GO
