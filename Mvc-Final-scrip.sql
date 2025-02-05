USE [master]
GO
/****** Object:  Database [KlinikDatabase]    Script Date: 22/05/2024 18:18:32 ******/
CREATE DATABASE [KlinikDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KlinikDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\KlinikDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KlinikDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\KlinikDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [KlinikDatabase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KlinikDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KlinikDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KlinikDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KlinikDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KlinikDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KlinikDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [KlinikDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KlinikDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KlinikDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KlinikDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KlinikDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KlinikDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KlinikDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KlinikDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KlinikDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KlinikDatabase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KlinikDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KlinikDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KlinikDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KlinikDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KlinikDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KlinikDatabase] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [KlinikDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KlinikDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [KlinikDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [KlinikDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KlinikDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KlinikDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KlinikDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KlinikDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KlinikDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'KlinikDatabase', N'ON'
GO
ALTER DATABASE [KlinikDatabase] SET QUERY_STORE = ON
GO
ALTER DATABASE [KlinikDatabase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [KlinikDatabase]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 22/05/2024 18:18:32 ******/
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
/****** Object:  Table [dbo].[Hasta]    Script Date: 22/05/2024 18:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hasta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](max) NOT NULL,
	[Soyad] [nvarchar](max) NOT NULL,
	[IlacAdi] [nvarchar](max) NOT NULL,
	[KullaniciAdi] [nvarchar](max) NOT NULL,
	[Sifre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Hasta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ilaclar]    Script Date: 22/05/2024 18:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ilaclar](
	[IlacId] [int] IDENTITY(1,1) NOT NULL,
	[IlacAdi] [nvarchar](max) NOT NULL,
	[Hastaid] [int] NULL,
 CONSTRAINT [PK_Ilaclar] PRIMARY KEY CLUSTERED 
(
	[IlacId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240519112319_InitialCreate', N'8.0.5')
GO
SET IDENTITY_INSERT [dbo].[Hasta] ON 

INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (1, N'Ahmet', N'Yilmaz', N'Parol', N'ahmet_yilmaz', N'123456')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (2, N'Ayse', N'Demir', N'Aspirin', N'ayse_demir', N'abcdef')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (3, N'Mehmet', N'Kaya', N'Ibuprofen', N'mehmet_kaya', N'qwerty')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (4, N'Fatma', N'Çelik', N'Panadol', N'fatma_celik', N'654321')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (5, N'Mustafa', N'Arslan', N'Voltaren', N'mustafa_arslan', N'password')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (6, N'Zeynep', N'Yildiz', N'Bisolvon', N'zeynep_yildiz', N'pass123')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (7, N'Emre', N'Koç', N'Strepsils', N'emre_koc', N'securepass')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (8, N'Sevgi', N'Aydin', N'Fluimucil', N'sevgi_aydin', N'p@ssw0rd')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (9, N'Berk', N'Günes', N'Neurofen', N'berk_gunes', N'strongpass')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (10, N'Deniz', N'Erdogan', N'Talcid', N'deniz_erdogan', N'passw0rd')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (11, N'Cem', N'Sahin', N'Algofren', N'cem_sahin', N'password123')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (12, N'Gizem', N'Can', N'Eldor', N'gizem_can', N'myp@ss')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (13, N'Selin', N'Kurt', N'Advil', N'selin_kurt', N'p@ssword')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (14, N'Murat', N'Koçak', N'Rexidol', N'murat_kocak', N'p@ssw0rd')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (15, N'Elif', N'Sahin', N'Novalgin', N'elif_sahin', N'mysecret')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (16, N'Bilge', N'Yilmaz', N'Vitamix', N'bilge_yilmaz', N'password!')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (17, N'Kaan', N'Kaya', N'Apaurin', N'kaan_kaya', N'passw0rd!')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (18, N'Pinar', N'Arslan', N'Ketober', N'pinar_arslan', N'PaSsWoRd!')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (19, N'Ahmet', N'Yildiz', N'Delsym', N'ahmet_yildiz', N'P@ssw0rd!')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (20, N'Ayse', N'Koç', N'Sedatif', N'ayse_koc', N'P@SSw0rd!')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (21, N'Ali', N'Yilmaz', N'Parol', N'ali_yilmaz', N'password!')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (22, N'Ayse', N'Sahin', N'Aspirin', N'ayse_sahin', N'P@ssw0rd!')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (23, N'Mehmet', N'Kurt', N'Ibuprofen', N'mehmet_kurt', N'P@SSw0rd!')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (24, N'Fatma', N'Can', N'Panadol', N'fatma_can', N'pass@123')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (25, N'Mustafa', N'Koç', N'Voltaren', N'mustafa_koc', N'p@ssw0rd123')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (26, N'Zeynep', N'Arslan', N'Bisolvon', N'zeynep_arslan', N'secure123')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (27, N'Emre', N'Yildiz', N'Strepsils', N'emre_yildiz', N'mypassword')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (28, N'Sevgi', N'Kaya', N'Fluimucil', N'sevgi_kaya', N'mysecretpass')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (29, N'Berk', N'Sahin', N'Neurofen', N'berk_sahin', N'strongpassword')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (30, N'Deniz', N'Günes', N'Talcid', N'deniz_gunes', N'mypass!')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (31, N'Cem', N'Yilmaz', N'Algofren', N'cem_yilmaz', N'p@ssw0rd!')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (32, N'Gizem', N'Kurt', N'Eldor', N'gizem_kurt', N'password123!')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (33, N'Selin', N'Koçak', N'Advil', N'selin_kocak', N'p@ssword123')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (34, N'Murat', N'Arslan', N'Rexidol', N'murat_arslan', N'PaSsW0rd!')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (35, N'Elif', N'Yildiz', N'Novalgin', N'elif_yildiz', N'myp@ssw0rd')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (36, N'Bilge', N'Sahin', N'Vitamix', N'bilge_sahin', N'securepass123')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (37, N'Kaan', N'Can', N'Apaurin', N'kaan_can', N'p@ssw0rd123!')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (38, N'Pinar', N'Kurt', N'Ketober', N'pinar_kurt', N'P@ssword!123')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (39, N'Ahmet', N'Sahin', N'Delsym', N'ahmet_sahin', N'P@ssw0rd!123')
INSERT [dbo].[Hasta] ([id], [Ad], [Soyad], [IlacAdi], [KullaniciAdi], [Sifre]) VALUES (40, N'Ayse', N'Günes', N'Sedatif', N'ayse_gunes', N'PaSsW0rd!123')
SET IDENTITY_INSERT [dbo].[Hasta] OFF
GO
SET IDENTITY_INSERT [dbo].[Ilaclar] ON 

INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (1, N'Parol', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (2, N'Aspirin', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (3, N'Ibuprofen', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (4, N'Panadol', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (5, N'Voltaren', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (6, N'Bisolvon', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (7, N'Strepsils', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (8, N'Fluimucil', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (9, N'Neurofen', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (10, N'Talcid', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (11, N'Algofren', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (12, N'Eldor', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (13, N'Advil', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (14, N'Rexidol', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (15, N'Novalgin', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (16, N'Vitamix', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (17, N'Apaurin', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (18, N'Ketober', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (19, N'Delsym', NULL)
INSERT [dbo].[Ilaclar] ([IlacId], [IlacAdi], [Hastaid]) VALUES (20, N'Sedatif', NULL)
SET IDENTITY_INSERT [dbo].[Ilaclar] OFF
GO
/****** Object:  Index [IX_Ilaclar_Hastaid]    Script Date: 22/05/2024 18:18:32 ******/
CREATE NONCLUSTERED INDEX [IX_Ilaclar_Hastaid] ON [dbo].[Ilaclar]
(
	[Hastaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ilaclar]  WITH CHECK ADD  CONSTRAINT [FK_Ilaclar_Hasta_Hastaid] FOREIGN KEY([Hastaid])
REFERENCES [dbo].[Hasta] ([id])
GO
ALTER TABLE [dbo].[Ilaclar] CHECK CONSTRAINT [FK_Ilaclar_Hasta_Hastaid]
GO
USE [master]
GO
ALTER DATABASE [KlinikDatabase] SET  READ_WRITE 
GO
