USE [master]
GO
/****** Object:  Database [SocialNetworkDB]    Script Date: 5.06.2022 03:04:29 ******/
CREATE DATABASE [SocialNetworkDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SocialNetworkDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SocialNetworkDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SocialNetworkDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SocialNetworkDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SocialNetworkDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SocialNetworkDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SocialNetworkDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SocialNetworkDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SocialNetworkDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SocialNetworkDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SocialNetworkDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SocialNetworkDB] SET  MULTI_USER 
GO
ALTER DATABASE [SocialNetworkDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SocialNetworkDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SocialNetworkDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SocialNetworkDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SocialNetworkDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SocialNetworkDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SocialNetworkDB] SET QUERY_STORE = OFF
GO
USE [SocialNetworkDB]
GO
/****** Object:  Table [dbo].[group_profile]    Script Date: 5.06.2022 03:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_profile](
	[id] [bigint] NOT NULL,
	[group_name] [nvarchar](70) NOT NULL,
	[created_datetime] [datetime] NOT NULL,
 CONSTRAINT [PK_group_profile] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post_comment]    Script Date: 5.06.2022 03:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post_comment](
	[id] [bigint] NOT NULL,
	[post_id] [bigint] NOT NULL,
	[source_id] [bigint] NOT NULL,
	[comment_text] [varchar](255) NOT NULL,
	[created_datetime] [datetime] NOT NULL,
 CONSTRAINT [PK_post_comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[private_message]    Script Date: 5.06.2022 03:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[private_message](
	[id] [bigint] NOT NULL,
	[source_id] [bigint] NOT NULL,
	[target_id] [bigint] NOT NULL,
	[writtent_text] [text] NOT NULL,
	[media_location] [varchar](max) NULL,
	[created_datetime] [datetime] NOT NULL,
 CONSTRAINT [PK_private_message] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[public_message]    Script Date: 5.06.2022 03:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[public_message](
	[id] [bigint] NOT NULL,
	[source_id] [bigint] NOT NULL,
	[written_text] [text] NOT NULL,
	[media_location] [varchar](max) NULL,
	[created_datetime] [datetime] NOT NULL,
 CONSTRAINT [PK_user_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_profile]    Script Date: 5.06.2022 03:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_profile](
	[id] [bigint] NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[user_surname] [nvarchar](50) NOT NULL,
	[email_address] [varchar](50) NOT NULL,
	[date_of_birth] [smalldatetime] NULL,
	[country] [nvarchar](50) NULL,
	[date_of_register] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_user_profile] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[post_comment]  WITH CHECK ADD  CONSTRAINT [FK_post_comment_private_message] FOREIGN KEY([post_id])
REFERENCES [dbo].[private_message] ([id])
GO
ALTER TABLE [dbo].[post_comment] CHECK CONSTRAINT [FK_post_comment_private_message]
GO
ALTER TABLE [dbo].[post_comment]  WITH CHECK ADD  CONSTRAINT [FK_post_comment_public_message] FOREIGN KEY([post_id])
REFERENCES [dbo].[public_message] ([id])
GO
ALTER TABLE [dbo].[post_comment] CHECK CONSTRAINT [FK_post_comment_public_message]
GO
ALTER TABLE [dbo].[post_comment]  WITH CHECK ADD  CONSTRAINT [FK_post_comment_user_profile] FOREIGN KEY([source_id])
REFERENCES [dbo].[user_profile] ([id])
GO
ALTER TABLE [dbo].[post_comment] CHECK CONSTRAINT [FK_post_comment_user_profile]
GO
ALTER TABLE [dbo].[private_message]  WITH CHECK ADD  CONSTRAINT [FK_private_message_group_profile] FOREIGN KEY([target_id])
REFERENCES [dbo].[group_profile] ([id])
GO
ALTER TABLE [dbo].[private_message] CHECK CONSTRAINT [FK_private_message_group_profile]
GO
ALTER TABLE [dbo].[private_message]  WITH CHECK ADD  CONSTRAINT [FK_private_message_user_profile] FOREIGN KEY([source_id])
REFERENCES [dbo].[user_profile] ([id])
GO
ALTER TABLE [dbo].[private_message] CHECK CONSTRAINT [FK_private_message_user_profile]
GO
ALTER TABLE [dbo].[private_message]  WITH CHECK ADD  CONSTRAINT [FK_private_message_user_profile1] FOREIGN KEY([target_id])
REFERENCES [dbo].[user_profile] ([id])
GO
ALTER TABLE [dbo].[private_message] CHECK CONSTRAINT [FK_private_message_user_profile1]
GO
ALTER TABLE [dbo].[public_message]  WITH CHECK ADD  CONSTRAINT [FK_public_message_user_profile] FOREIGN KEY([source_id])
REFERENCES [dbo].[user_profile] ([id])
GO
ALTER TABLE [dbo].[public_message] CHECK CONSTRAINT [FK_public_message_user_profile]
GO
USE [master]
GO
ALTER DATABASE [SocialNetworkDB] SET  READ_WRITE 
GO
