USE [master]
GO
/****** Object:  Database [InternetCafe2]    Script Date: 4.07.2024 22:07:20 ******/
CREATE DATABASE [InternetCafe2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InternetCafe2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\InternetCafe2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InternetCafe2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\InternetCafe2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [InternetCafe2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InternetCafe2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InternetCafe2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InternetCafe2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InternetCafe2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InternetCafe2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InternetCafe2] SET ARITHABORT OFF 
GO
ALTER DATABASE [InternetCafe2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InternetCafe2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InternetCafe2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InternetCafe2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InternetCafe2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InternetCafe2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InternetCafe2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InternetCafe2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InternetCafe2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InternetCafe2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [InternetCafe2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InternetCafe2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InternetCafe2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InternetCafe2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InternetCafe2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InternetCafe2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InternetCafe2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InternetCafe2] SET RECOVERY FULL 
GO
ALTER DATABASE [InternetCafe2] SET  MULTI_USER 
GO
ALTER DATABASE [InternetCafe2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InternetCafe2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InternetCafe2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InternetCafe2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InternetCafe2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InternetCafe2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [InternetCafe2] SET QUERY_STORE = ON
GO
ALTER DATABASE [InternetCafe2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [InternetCafe2]
GO
/****** Object:  Table [dbo].[TBLHareketler]    Script Date: 4.07.2024 22:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLHareketler](
	[HareketID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciID] [int] NOT NULL,
	[MasaID] [int] NOT NULL,
	[Masa] [varchar](50) NOT NULL,
	[İstekTuru] [varchar](150) NOT NULL,
	[Aciklama] [varchar](500) NULL,
	[Tarih] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HareketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLKullanici]    Script Date: 4.07.2024 22:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLKullanici](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[AdiSoyadi] [varchar](50) NOT NULL,
	[Telefon] [varchar](50) NULL,
	[Adres] [varchar](500) NULL,
	[Email] [varchar](50) NULL,
	[KullaniciAdi] [varchar](50) NOT NULL,
	[Sifre] [varchar](50) NOT NULL,
	[Gorevi] [varchar](50) NOT NULL,
	[Tarih] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLMasalar]    Script Date: 4.07.2024 22:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMasalar](
	[MasaID] [int] IDENTITY(1,1) NOT NULL,
	[Masalar] [varchar](50) NOT NULL,
	[Durumu] [varchar](50) NOT NULL,
	[Aciklama] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[MasaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLSaatUcreti]    Script Date: 4.07.2024 22:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLSaatUcreti](
	[SaatUcretiID] [int] IDENTITY(1,1) NOT NULL,
	[SaatUcreti] [decimal](18, 2) NOT NULL,
	[UcretTuru] [varchar](500) NULL,
	[Aciklama] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[SaatUcretiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLSatis]    Script Date: 4.07.2024 22:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLSatis](
	[SatisID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciID] [int] NOT NULL,
	[MasaID] [int] NOT NULL,
	[BaslangicSaati] [datetime] NOT NULL,
	[BitisSaati] [datetime] NOT NULL,
	[Sure] [decimal](18, 2) NOT NULL,
	[Tutar] [decimal](18, 2) NULL,
	[Aciklama] [varchar](500) NOT NULL,
	[Tarih] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SatisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLSepet]    Script Date: 4.07.2024 22:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLSepet](
	[SepetID] [int] IDENTITY(1,1) NOT NULL,
	[MasaID] [int] NOT NULL,
	[Masa] [varchar](50) NOT NULL,
	[AcilisTuru] [varchar](50) NOT NULL,
	[Baslangic] [datetime] NOT NULL,
	[Tarih] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SepetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBLKullanici] ON 

INSERT [dbo].[TBLKullanici] ([KullaniciID], [AdiSoyadi], [Telefon], [Adres], [Email], [KullaniciAdi], [Sifre], [Gorevi], [Tarih]) VALUES (1, N'Yusuf Çakır', N'5358770469', N'of', N'cakiry200@gmail.com', N'admin', N'123', N'Yönetici', CAST(N'2024-05-20T00:00:00.000' AS DateTime))
INSERT [dbo].[TBLKullanici] ([KullaniciID], [AdiSoyadi], [Telefon], [Adres], [Email], [KullaniciAdi], [Sifre], [Gorevi], [Tarih]) VALUES (2, N'Kerem yıldırım', N'231231312', N'samsun', N'yıldırım@gmail.com', N'kullanici', N'456', N'Kullanıcı', CAST(N'2020-02-04T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[TBLKullanici] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLMasalar] ON 

INSERT [dbo].[TBLMasalar] ([MasaID], [Masalar], [Durumu], [Aciklama]) VALUES (1, N'Masa-1', N'BOŞ', N'Açıklama Yapılmadı')
INSERT [dbo].[TBLMasalar] ([MasaID], [Masalar], [Durumu], [Aciklama]) VALUES (2, N'Masa-2', N'DOLU', N'Açıklama Yapılmadı')
INSERT [dbo].[TBLMasalar] ([MasaID], [Masalar], [Durumu], [Aciklama]) VALUES (3, N'Masa-3', N'BOŞ', N'Açıklama Yapılmadı')
INSERT [dbo].[TBLMasalar] ([MasaID], [Masalar], [Durumu], [Aciklama]) VALUES (4, N'Masa-4', N'DOLU', N'Açıklama Yapılmadı')
INSERT [dbo].[TBLMasalar] ([MasaID], [Masalar], [Durumu], [Aciklama]) VALUES (5, N'Masa-5', N'BOŞ', N'Açıklama Yapılmadı')
INSERT [dbo].[TBLMasalar] ([MasaID], [Masalar], [Durumu], [Aciklama]) VALUES (6, N'Masa-6', N'DOLU', N'Açıklama Yapılmadı')
INSERT [dbo].[TBLMasalar] ([MasaID], [Masalar], [Durumu], [Aciklama]) VALUES (7, N'Masa-7', N'DOLU', N'Açıklama Yapılmadı')
INSERT [dbo].[TBLMasalar] ([MasaID], [Masalar], [Durumu], [Aciklama]) VALUES (8, N'Masa-8', N'BOŞ', N'Açıklama Yapılmadı')
INSERT [dbo].[TBLMasalar] ([MasaID], [Masalar], [Durumu], [Aciklama]) VALUES (9, N'Masa-9', N'DOLU', N'Açıklama Yapılmadı')
INSERT [dbo].[TBLMasalar] ([MasaID], [Masalar], [Durumu], [Aciklama]) VALUES (10, N'Masa-10', N'DOLU', N'Açıklama Yapılmadı')
INSERT [dbo].[TBLMasalar] ([MasaID], [Masalar], [Durumu], [Aciklama]) VALUES (11, N'Masa-11', N'BOŞ', N'Açıklama Yapılmadı')
INSERT [dbo].[TBLMasalar] ([MasaID], [Masalar], [Durumu], [Aciklama]) VALUES (12, N'Masa-12', N'BOŞ', N'Açıklama Yapılmadı')
INSERT [dbo].[TBLMasalar] ([MasaID], [Masalar], [Durumu], [Aciklama]) VALUES (13, N'Masa-13', N'DOLU', N'Açıklama Yapılmadı')
INSERT [dbo].[TBLMasalar] ([MasaID], [Masalar], [Durumu], [Aciklama]) VALUES (14, N'Masa-14', N'DOLU', N'Açıklama Yapılmadı')
INSERT [dbo].[TBLMasalar] ([MasaID], [Masalar], [Durumu], [Aciklama]) VALUES (15, N'Masa-15', N'DOLU', N'Açıklama Yapılmadı')
INSERT [dbo].[TBLMasalar] ([MasaID], [Masalar], [Durumu], [Aciklama]) VALUES (16, N'Masa-16', N'BOŞ', N'Açıklama Yapılmadı')
SET IDENTITY_INSERT [dbo].[TBLMasalar] OFF
GO
SET IDENTITY_INSERT [dbo].[TBLSaatUcreti] ON 

INSERT [dbo].[TBLSaatUcreti] ([SaatUcretiID], [SaatUcreti], [UcretTuru], [Aciklama]) VALUES (1, CAST(2.00 AS Decimal(18, 2)), N'Normal', N'Yapılmadı')
INSERT [dbo].[TBLSaatUcreti] ([SaatUcretiID], [SaatUcreti], [UcretTuru], [Aciklama]) VALUES (2, CAST(1.50 AS Decimal(18, 2)), N'İndirimli', N'Yapılmadı')
SET IDENTITY_INSERT [dbo].[TBLSaatUcreti] OFF
GO
USE [master]
GO
ALTER DATABASE [InternetCafe2] SET  READ_WRITE 
GO
