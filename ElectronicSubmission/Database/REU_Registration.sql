USE [master]
GO
/****** Object:  Database [REU_Registration]    Script Date: 5/28/2020 10:00:07 PM ******/
CREATE DATABASE [REU_Registration]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'REU_Registration', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SOFTWARECORNERIT\MSSQL\DATA\REU_Registration.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'REU_Registration_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SOFTWARECORNERIT\MSSQL\DATA\REU_Registration_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [REU_Registration] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [REU_Registration].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [REU_Registration] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [REU_Registration] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [REU_Registration] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [REU_Registration] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [REU_Registration] SET ARITHABORT OFF 
GO
ALTER DATABASE [REU_Registration] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [REU_Registration] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [REU_Registration] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [REU_Registration] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [REU_Registration] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [REU_Registration] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [REU_Registration] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [REU_Registration] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [REU_Registration] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [REU_Registration] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [REU_Registration] SET  DISABLE_BROKER 
GO
ALTER DATABASE [REU_Registration] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [REU_Registration] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [REU_Registration] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [REU_Registration] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [REU_Registration] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [REU_Registration] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [REU_Registration] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [REU_Registration] SET RECOVERY FULL 
GO
ALTER DATABASE [REU_Registration] SET  MULTI_USER 
GO
ALTER DATABASE [REU_Registration] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [REU_Registration] SET DB_CHAINING OFF 
GO
ALTER DATABASE [REU_Registration] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [REU_Registration] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [REU_Registration]
GO
/****** Object:  Table [dbo].[Collage]    Script Date: 5/28/2020 10:00:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collage](
	[Collage_ID] [int] IDENTITY(1,1) NOT NULL,
	[Collage_Name_Ar] [nvarchar](max) NULL,
	[Collage_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Collage] PRIMARY KEY CLUSTERED 
(
	[Collage_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5/28/2020 10:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_Id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Name_Ar] [nvarchar](max) NULL,
	[Employee_Name_En] [nvarchar](max) NULL,
	[Employee_Email] [nvarchar](max) NULL,
	[Employee_Phone] [nvarchar](max) NULL,
	[Group_Id] [int] NULL,
	[Employee_Profile] [nvarchar](max) NULL,
	[Employee_Password] [nvarchar](max) NULL,
	[Employee_Active] [bit] NULL,
	[Language_id] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Files]    Script Date: 5/28/2020 10:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[File_Id] [int] IDENTITY(1,1) NOT NULL,
	[File_Name] [nvarchar](max) NULL,
	[File_Path] [nvarchar](max) NULL,
	[DateCreation] [datetime] NULL,
	[Student_Id] [int] NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[File_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group]    Script Date: 5/28/2020 10:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Group_Id] [int] IDENTITY(1,1) NOT NULL,
	[Group_Name_Ar] [nvarchar](max) NULL,
	[Group_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Group_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Group_Status]    Script Date: 5/28/2020 10:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Status](
	[Group_Status_Id] [int] IDENTITY(1,1) NOT NULL,
	[Group_Id] [int] NULL,
	[Status_Id] [int] NULL,
 CONSTRAINT [PK_Group_Status] PRIMARY KEY CLUSTERED 
(
	[Group_Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LanguageMaster]    Script Date: 5/28/2020 10:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Language_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LanguageMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lanuage_Detials]    Script Date: 5/28/2020 10:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lanuage_Detials](
	[Language_Detial_Id] [int] IDENTITY(1,1) NOT NULL,
	[Language_Master_Id] [int] NULL,
	[Language_Detial_FieldName] [nvarchar](150) NULL,
	[Language_Detial_Value] [nvarchar](150) NULL,
 CONSTRAINT [PK_Lanuage_Detials] PRIMARY KEY CLUSTERED 
(
	[Language_Detial_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log_File]    Script Date: 5/28/2020 10:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_File](
	[Log_Id] [int] IDENTITY(1,1) NOT NULL,
	[Log_Date] [datetime] NULL,
	[Log_Note] [ntext] NULL,
	[Login_Id] [int] NULL,
	[Form_Id] [int] NULL,
	[Log_Name] [nvarchar](max) NULL,
	[Log_Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Log_File] PRIMARY KEY CLUSTERED 
(
	[Log_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nationality]    Script Date: 5/28/2020 10:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationality](
	[Nationality_Id] [int] IDENTITY(1,1) NOT NULL,
	[Nationality_Name_Ar] [nvarchar](100) NULL,
	[Nationality_Name_En] [nvarchar](100) NULL,
 CONSTRAINT [PK_Nationality] PRIMARY KEY CLUSTERED 
(
	[Nationality_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification_Employee]    Script Date: 5/28/2020 10:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification_Employee](
	[NotificationShow_Employee_Id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Id] [int] NULL,
	[NotificationShow_Id] [int] NULL,
 CONSTRAINT [PK_Notification_Employee] PRIMARY KEY CLUSTERED 
(
	[NotificationShow_Employee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification_Master]    Script Date: 5/28/2020 10:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification_Master](
	[Notification_Id] [int] IDENTITY(1,1) NOT NULL,
	[Notification_Date] [datetime] NULL,
	[Notification_Description_Ar] [nvarchar](max) NULL,
	[Notification_Description_En] [nvarchar](max) NULL,
	[Is_Read] [bit] NULL,
	[Date_Read] [datetime] NULL,
	[From_Employee_Structure_Id] [int] NULL,
	[To_Employee_Structure_Id] [int] NULL,
	[Master_Id] [int] NULL,
	[Notification_Link] [nvarchar](max) NULL,
	[Is_Show_Reply] [bit] NULL,
	[Date_Show_Reply] [datetime] NULL,
	[Notification_Show_Id] [int] NULL,
 CONSTRAINT [PK_Notification_Master] PRIMARY KEY CLUSTERED 
(
	[Notification_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification_Show]    Script Date: 5/28/2020 10:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification_Show](
	[Notification_Show_Id] [int] NOT NULL,
	[Notification_Show_Name_Ar] [nvarchar](max) NULL,
	[Notification_Show_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Notification_Show] PRIMARY KEY CLUSTERED 
(
	[Notification_Show_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission]    Script Date: 5/28/2020 10:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Permission_Id] [int] IDENTITY(1,1) NOT NULL,
	[Permission_Name_Ar] [nvarchar](max) NULL,
	[Permission_Name_En] [nvarchar](max) NULL,
	[Parent] [int] NULL,
	[Url_Path] [nvarchar](max) NULL,
	[Permission_Icon] [nvarchar](max) NULL,
	[System_Id] [int] NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[Permission_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission_Group]    Script Date: 5/28/2020 10:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission_Group](
	[Permission_Group_Id] [int] IDENTITY(1,1) NOT NULL,
	[Permission_Id] [int] NULL,
	[Group_Id] [int] NULL,
 CONSTRAINT [PK_Permission_Group] PRIMARY KEY CLUSTERED 
(
	[Permission_Group_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resource]    Script Date: 5/28/2020 10:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[ResourceID] [int] IDENTITY(1,1) NOT NULL,
	[Resource_Name_Ar] [nchar](10) NULL,
	[Resource_Name_En] [nvarchar](50) NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[ResourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sequence]    Script Date: 5/28/2020 10:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sequence](
	[Sequence_Id] [int] IDENTITY(1,1) NOT NULL,
	[Emp_Id] [int] NULL,
	[Status_Id] [int] NULL,
	[Student_Id] [int] NULL,
	[DateCreation] [datetime] NULL,
 CONSTRAINT [PK_Sequence] PRIMARY KEY CLUSTERED 
(
	[Sequence_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Specialization]    Script Date: 5/28/2020 10:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialization](
	[Specialization_Id] [int] IDENTITY(1,1) NOT NULL,
	[Specialization_Name_Ar] [nvarchar](max) NULL,
	[Specialization_Name_En] [nvarchar](max) NULL,
	[Collage_Id] [int] NULL,
	[Condition_Ar] [nvarchar](max) NULL,
	[High_School_Percent] [nvarchar](50) NULL,
	[Capabilities_Percent] [nvarchar](50) NULL,
	[My_Achievement_Percent] [nvarchar](50) NULL,
	[Weighted_Ratio_Percent] [nvarchar](50) NULL,
	[Specialization_Icon] [nvarchar](max) NULL,
	[Specialization_Image] [nvarchar](max) NULL,
	[Condition_En] [nvarchar](max) NULL,
	[Specialization_Description_Ar] [nvarchar](max) NULL,
	[Specialization_Description_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Specialization] PRIMARY KEY CLUSTERED 
(
	[Specialization_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 5/28/2020 10:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Status_Id] [int] IDENTITY(1,1) NOT NULL,
	[Status_Code] [int] NULL,
	[Status_Name_Ar] [nvarchar](max) NULL,
	[Status_Name_En] [nvarchar](max) NULL,
	[Status_Color] [nvarchar](max) NULL,
	[Status_Icon] [nvarchar](max) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/28/2020 10:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_Id] [int] IDENTITY(1,1) NOT NULL,
	[Student_SSN] [nvarchar](50) NULL,
	[Student_Name_En] [nvarchar](max) NULL,
	[Student_Name_Ar] [nvarchar](max) NULL,
	[Student_Address] [nvarchar](max) NULL,
	[Student_Phone] [nvarchar](50) NULL,
	[Student_Email] [nvarchar](max) NULL,
	[Student_High_School_Degree] [nvarchar](50) NULL,
	[Student_Capabilities_Degree] [nvarchar](50) NULL,
	[Student_My_Achievement_Degree] [nvarchar](50) NULL,
	[Student_CreationDate] [datetime] NULL,
	[Student_Employee_Id] [int] NULL,
	[Student_Assign_Date] [datetime] NULL,
	[Student_Image_Profile] [nvarchar](max) NULL,
	[Student_Specialization_Id] [int] NULL,
	[Student_Nationality_Id] [int] NULL,
	[Student_Resource_Id] [int] NULL,
	[Student_Status_Id] [int] NULL,
	[Student_Total] [nvarchar](50) NULL,
	[Suspended] [int] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Student_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Collage] ON 

GO
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (1, N'كلية طب الأسنان', N'Faculty of Dentistry')
GO
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (2, N'كلية الصيدلة', N'Faculty of Pharmacy')
GO
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (3, N'كلية التمريض', N'Faculty of Nursing')
GO
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (4, N'كلية العلوم الطبية التطبيقية', N'Faculty of Applied Medical Sciences')
GO
SET IDENTITY_INSERT [dbo].[Collage] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

GO
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (1, N'أيمن امين', N'Ayman Amin', N'ayman@softwarecornerit.com', N'0550932549', 1, N'd4e03fc6-5057-41ec-b622-06450eb8b424.jpg', N'7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2', 1, 2)
GO
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (2, N'عمر احمد', N'Omer Ahmed', N'ayman1793@gmail.com', N'09246548451', 1, N'Profile.JPG', N'7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2', 1, 2)
GO
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (3, N'مازن عوض', N'Mazin Awad', N'mazinawad2015@gmail.com', N'0550932518', 1, N'Profile.JPG', N'7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2', 1, 2)
GO
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (4, N'مدير النظام', N'Admin System', N'ayman1793@hotmail.com', N'0550932548', 1, N'Profile.JPG', N'7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2', 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Files] ON 

GO
INSERT [dbo].[Files] ([File_Id], [File_Name], [File_Path], [DateCreation], [Student_Id], [Type]) VALUES (1, N'My Profile', N'https://thumbs.dreamstime.com/b/profile-picture-vector-perfect-social-media-other-web-use-125320944.jpg', CAST(0x0000ABC700000000 AS DateTime), 1, 1)
GO
INSERT [dbo].[Files] ([File_Id], [File_Name], [File_Path], [DateCreation], [Student_Id], [Type]) VALUES (6, N'Capabilities', N'https://www.sdeem.org/img/app_3/certificates/3460kksn6924.jpg', CAST(0x0000ABC700000000 AS DateTime), 1, 3)
GO
INSERT [dbo].[Files] ([File_Id], [File_Name], [File_Path], [DateCreation], [Student_Id], [Type]) VALUES (7, N'High School', N'https://khamsat.hsoubcdn.com/images/services/482512/f31b0d79ed9d03d2f2dfe89deded3871.jpg', CAST(0x0000ABC700000000 AS DateTime), 1, 4)
GO
INSERT [dbo].[Files] ([File_Id], [File_Name], [File_Path], [DateCreation], [Student_Id], [Type]) VALUES (8, N'ae7f04e4-e0a7-4433-8a44-55ea5bfa050a.png', N'ae7f04e4-e0a7-4433-8a44-55ea5bfa050a.png', CAST(0x0000ABC90163BB10 AS DateTime), 2, 4)
GO
INSERT [dbo].[Files] ([File_Id], [File_Name], [File_Path], [DateCreation], [Student_Id], [Type]) VALUES (9, N'7f95d07a-f7f8-4596-89b7-a63265fc230c.jpg', N'7f95d07a-f7f8-4596-89b7-a63265fc230c.jpg', CAST(0x0000ABC90163BB2F AS DateTime), 2, 3)
GO
INSERT [dbo].[Files] ([File_Id], [File_Name], [File_Path], [DateCreation], [Student_Id], [Type]) VALUES (10, N'86e6f27f-9fb3-4d5b-ae51-5132e7d41e4a.png', N'86e6f27f-9fb3-4d5b-ae51-5132e7d41e4a.png', CAST(0x0000ABC90163BB36 AS DateTime), 2, 5)
GO
SET IDENTITY_INSERT [dbo].[Files] OFF
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

GO
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (1, N'المجموعة الاولي', N'First Group')
GO
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
SET IDENTITY_INSERT [dbo].[Group_Status] ON 

GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (79, 1, 1)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (80, 1, 2)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (81, 1, 3)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (82, 1, 4)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (83, 1, 5)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (84, 1, 6)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (85, 1, 7)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (86, 1, 8)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (87, 1, 9)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (88, 1, 10)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (89, 1, 11)
GO
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (90, 1, 12)
GO
SET IDENTITY_INSERT [dbo].[Group_Status] OFF
GO
SET IDENTITY_INSERT [dbo].[LanguageMaster] ON 

GO
INSERT [dbo].[LanguageMaster] ([ID], [Language_Name]) VALUES (1, N'Arabic')
GO
INSERT [dbo].[LanguageMaster] ([ID], [Language_Name]) VALUES (2, N'English')
GO
SET IDENTITY_INSERT [dbo].[LanguageMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[Log_File] ON 

GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1, CAST(0x0000ABC2011B9907 AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":1,"Permission_Name_Ar":"ادارة ملفات الطلاب","Permission_Name_En":"Manage student files","Parent":0,"Url_Path":"","Permission_Icon":"","System_Id":1}', 1, 1, N'إضافة صلاحية جديدة', N'add new permission')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2, CAST(0x0000ABC2011BCE86 AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":2,"Permission_Name_Ar":"عرض الملف","Permission_Name_En":"View Student File","Parent":1,"Url_Path":"","Permission_Icon":"","System_Id":1}', 1, 1, N'إضافة صلاحية جديدة', N'add new permission')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3, CAST(0x0000ABC2011BE332 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (4, CAST(0x0000ABC2011C244B AS DateTime), N'data:1', 1, 1, N'تعديل صلاحيات المجموعة', N'update group permissions')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (5, CAST(0x0000ABC2011C5D33 AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":3,"Permission_Name_Ar":"ادارة النظام","Permission_Name_En":"System Management","Parent":0,"Url_Path":"","Permission_Icon":"","System_Id":1}', 1, 1, N'إضافة صلاحية جديدة', N'add new permission')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (6, CAST(0x0000ABC2011C975B AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":4,"Permission_Name_Ar":"الصلاحيات","Permission_Name_En":"Permissions","Parent":3,"Url_Path":"Pages/UserManagment/PermissionGroups.aspx","Permission_Icon":"","System_Id":1}', 1, 1, N'إضافة صلاحية جديدة', N'add new permission')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7, CAST(0x0000ABC2011CBB29 AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":5,"Permission_Name_Ar":"المجموعات","Permission_Name_En":"Groups","Parent":3,"Url_Path":"Pages/UserManagment/PermissionGroups.aspx","Permission_Icon":"","System_Id":1}', 1, 1, N'إضافة صلاحية جديدة', N'add new permission')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (8, CAST(0x0000ABC2011CD224 AS DateTime), N'data:1', 1, 4, N'تعديل صلاحيات المجموعة', N'update group permissions')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9, CAST(0x0000ABC2011CE457 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (10, CAST(0x0000ABC2011E1594 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (11, CAST(0x0000ABC201222B14 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (12, CAST(0x0000ABC20122A9A0 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (13, CAST(0x0000ABC20125FBB1 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (14, CAST(0x0000ABC20126B3F5 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (15, CAST(0x0000ABC201271E04 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (16, CAST(0x0000ABC2017F4ADC AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1016, CAST(0x0000ABC600FEFE36 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1017, CAST(0x0000ABC601250AE2 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1018, CAST(0x0000ABC60129EA1E AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1019, CAST(0x0000ABC7011554EB AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1020, CAST(0x0000ABC7011651DD AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1021, CAST(0x0000ABC701181E0C AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1022, CAST(0x0000ABC70118B6E6 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1023, CAST(0x0000ABC7011B5E4D AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1024, CAST(0x0000ABC701223DE7 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1025, CAST(0x0000ABC70122EEF3 AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":6,"Permission_Name_Ar":"قائمة الطلاب","Permission_Name_En":"Students List","Parent":1,"Url_Path":"Pages/RegistrationProcess/ListView.aspx","Permission_Icon":"icofont icofont-group-students","System_Id":1}', 1, 4, N'إضافة صلاحية جديدة', N'add new permission')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1026, CAST(0x0000ABC701230584 AS DateTime), N'data:1', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1027, CAST(0x0000ABC701232438 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1028, CAST(0x0000ABC701280419 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1029, CAST(0x0000ABC701299847 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2019, CAST(0x0000ABC70132EDB8 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2020, CAST(0x0000ABC701359262 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2021, CAST(0x0000ABC7013702DB AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2022, CAST(0x0000ABC701453250 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2023, CAST(0x0000ABC70146C112 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2024, CAST(0x0000ABC70147480B AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2025, CAST(0x0000ABC7014A29BE AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2026, CAST(0x0000ABC7014ACAF0 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2027, CAST(0x0000ABC800CCDC1B AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2028, CAST(0x0000ABC800D049E3 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2029, CAST(0x0000ABC800D207DA AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2030, CAST(0x0000ABC800DD23EC AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2031, CAST(0x0000ABC800DDD248 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2032, CAST(0x0000ABC800E13C4D AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2033, CAST(0x0000ABC800E5D5B0 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2034, CAST(0x0000ABC800E6D9E3 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2035, CAST(0x0000ABC800E8168E AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2036, CAST(0x0000ABC800E9D7D4 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2037, CAST(0x0000ABC800EC738E AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2038, CAST(0x0000ABC800F65159 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2039, CAST(0x0000ABC800F7192D AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2040, CAST(0x0000ABC800F7A91F AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2041, CAST(0x0000ABC800F80AF6 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2042, CAST(0x0000ABC800F8DDD7 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2043, CAST(0x0000ABC800F97BA1 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2044, CAST(0x0000ABC800FA0DB0 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2045, CAST(0x0000ABC800FAC73E AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2046, CAST(0x0000ABC800FC89EB AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2047, CAST(0x0000ABC801017E3F AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2048, CAST(0x0000ABC801029BF4 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2049, CAST(0x0000ABC801032ADB AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2050, CAST(0x0000ABC801058F6E AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3045, CAST(0x0000ABC8012A5F29 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3046, CAST(0x0000ABC8012E649C AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3047, CAST(0x0000ABC801306089 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3048, CAST(0x0000ABC80131FE72 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3049, CAST(0x0000ABC8013333F3 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3050, CAST(0x0000ABC801335D0C AS DateTime), N'data:1', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3051, CAST(0x0000ABC80133FD92 AS DateTime), N'data:1', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3052, CAST(0x0000ABC801342BEF AS DateTime), N'data:1', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3053, CAST(0x0000ABC900D18AEE AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3054, CAST(0x0000ABC901556BF3 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3055, CAST(0x0000ABC90155F56A AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":7,"Permission_Name_Ar":"اعدادات القوائم","Permission_Name_En":"Lookup Forms","Parent":1,"Url_Path":"Pages/Setting/","Permission_Icon":"","System_Id":1}', 1, 4, N'إضافة صلاحية جديدة', N'add new permission')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3056, CAST(0x0000ABC9015697EB AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3057, CAST(0x0000ABC90156C2CF AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":8,"Permission_Name_Ar":"الكليات","Permission_Name_En":"Collage","Parent":1,"Url_Path":"Pages/Setting/FormCollege.aspx","Permission_Icon":"","System_Id":1}', 1, 4, N'إضافة صلاحية جديدة', N'add new permission')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3058, CAST(0x0000ABC90157332D AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":9,"Permission_Name_Ar":"المصادر","Permission_Name_En":"Resource","Parent":7,"Url_Path":"Pages/Setting/FormResource.aspx","Permission_Icon":"","System_Id":1}', 1, 4, N'إضافة صلاحية جديدة', N'add new permission')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3059, CAST(0x0000ABC9015761D2 AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":10,"Permission_Name_Ar":"التخصصات","Permission_Name_En":"Specialization","Parent":7,"Url_Path":"Pages/Setting/FormSpecialization.aspx","Permission_Icon":"","System_Id":1}', 1, 4, N'إضافة صلاحية جديدة', N'add new permission')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3060, CAST(0x0000ABC90157F61B AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3061, CAST(0x0000ABC9015820DC AS DateTime), N'data:1', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3062, CAST(0x0000ABC901582E55 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3063, CAST(0x0000ABC9015D006C AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3064, CAST(0x0000ABC9015E352B AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":11,"Permission_Name_Ar":"بعض الصفحات","Permission_Name_En":"SomePage","Parent":3,"Url_Path":"","Permission_Icon":"","System_Id":1}', 1, 4, N'إضافة صلاحية جديدة', N'add new permission')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3065, CAST(0x0000ABC9015EB462 AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":12,"Permission_Name_Ar":"بيانات الطالب","Permission_Name_En":"Students Data","Parent":11,"Url_Path":"Pages/RegistrationProcess/StudentInfo.aspx","Permission_Icon":"","System_Id":1}', 1, 4, N'إضافة صلاحية جديدة', N'add new permission')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3066, CAST(0x0000ABC9015F136C AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":13,"Permission_Name_Ar":"حذف طالب","Permission_Name_En":"Delete Student","Parent":11,"Url_Path":"Pages/RegistrationProcess/DeleteStudent.ashx","Permission_Icon":"","System_Id":1}', 1, 4, N'إضافة صلاحية جديدة', N'add new permission')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3067, CAST(0x0000ABC9015F3C5B AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":14,"Permission_Name_Ar":"الموظفين","Permission_Name_En":"Employees","Parent":0,"Url_Path":"","Permission_Icon":"","System_Id":1}', 1, 4, N'إضافة صلاحية جديدة', N'add new permission')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3068, CAST(0x0000ABC9015FA2DE AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":15,"Permission_Name_Ar":"الصفحة الشخصية","Permission_Name_En":"My Profile","Parent":14,"Url_Path":"Pages/UserManagment/Profile.aspx","Permission_Icon":"icofont icofont-group-students","System_Id":1}', 1, 4, N'إضافة صلاحية جديدة', N'add new permission')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3069, CAST(0x0000ABC9015FF50C AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":16,"Permission_Name_Ar":"الموظفين","Permission_Name_En":"Employees","Parent":14,"Url_Path":"Pages/UserManagment/Employees.aspx","Permission_Icon":"icofont icofont-ui-contact-list","System_Id":1}', 1, 4, N'إضافة صلاحية جديدة', N'add new permission')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3070, CAST(0x0000ABC901605B2E AS DateTime), N'data:1', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3071, CAST(0x0000ABC9016067A8 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3072, CAST(0x0000ABC901608BF9 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":1,"Employee_Profile":"d4e03fc6-5057-41ec-b622-06450eb8b424.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":2}', 1, 16, N'تعديل بيانات موظف', N'update Employee')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3073, CAST(0x0000ABC90160A03C AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3074, CAST(0x0000ABC90160C830 AS DateTime), N'data:{"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[],"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932549","Group_Id":1,"Employee_Profile":"d4e03fc6-5057-41ec-b622-06450eb8b424.jpg","Employee_Password":"7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2","Employee_Active":true,"Language_id":2}', 1, 15, N'تعديل بيانات الموظف', N'Update Employee Info')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3075, CAST(0x0000ABC901610A9E AS DateTime), N'data:1', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3076, CAST(0x0000ABC9016117EE AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932549","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3077, CAST(0x0000ABC901635B63 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932549","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3078, CAST(0x0000ABC90163BB4A AS DateTime), N'data:{"Employee":null,"Files":[{"File_Id":8,"File_Name":"ae7f04e4-e0a7-4433-8a44-55ea5bfa050a.png","File_Path":"ae7f04e4-e0a7-4433-8a44-55ea5bfa050a.png","DateCreation":"2020-05-28T21:35:10.5585919+03:00","Student_Id":2,"Type":4},{"File_Id":9,"File_Name":"7f95d07a-f7f8-4596-89b7-a63265fc230c.jpg","File_Path":"7f95d07a-f7f8-4596-89b7-a63265fc230c.jpg","DateCreation":"2020-05-28T21:35:10.6633114+03:00","Student_Id":2,"Type":3},{"File_Id":10,"File_Name":"86e6f27f-9fb3-4d5b-ae51-5132e7d41e4a.png","File_Path":"86e6f27f-9fb3-4d5b-ae51-5132e7d41e4a.png","DateCreation":"2020-05-28T21:35:10.6882452+03:00","Student_Id":2,"Type":5}],"Nationality":null,"Resource":null,"Sequences":[],"Specialization":null,"Status":null,"Student_Id":2,"Student_SSN":"12354646846","Student_Name_En":"Mazin Awad Omer","Student_Name_Ar":"مازن عوض عمر","Student_Address":"Aysdfkhskj , SDFA, Ysdfhnlsd, sdsdfa","Student_Phone":"0055505480","Student_Email":"Mazin@omer.com","Student_High_School_Degree":"50","Student_Capabilities_Degree":"30","Student_My_Achievement_Degree":"20","Student_CreationDate":"2020-05-28T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":null,"Student_Specialization_Id":3,"Student_Nationality_Id":1,"Student_Resource_Id":null,"Student_Status_Id":1,"Student_Total":null,"Suspended":null,"Notes":"Note"}', 1, 12, N'إضافة طالب', N'Add Student')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3079, CAST(0x0000ABC901647B63 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932549","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3080, CAST(0x0000ABC90164DA5E AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932549","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3081, CAST(0x0000ABC901655D52 AS DateTime), N'data:{"Employee":null,"Files":[],"Nationality":null,"Resource":null,"Sequences":[],"Specialization":null,"Status":null,"Student_Id":2,"Student_SSN":"12354646846","Student_Name_En":"Mazin Awad Omer","Student_Name_Ar":"مازن عوض عمر","Student_Address":"Aysdfkhskj , SDFA, Ysdfhnlsd, sdsdfa","Student_Phone":"0055505480","Student_Email":"Mazin@omer.com","Student_High_School_Degree":"50","Student_Capabilities_Degree":"30","Student_My_Achievement_Degree":"20","Student_CreationDate":"2020-05-28T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"146cf137-30dd-44c0-907d-02656b08a343.jpg","Student_Specialization_Id":3,"Student_Nationality_Id":1,"Student_Resource_Id":null,"Student_Status_Id":1,"Student_Total":null,"Suspended":null,"Notes":"Note"}', 1, 12, N'تعديل بيانات الطالب', N'Update Student')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3082, CAST(0x0000ABC901659B59 AS DateTime), N'data:{"Employee":null,"Files":[],"Nationality":null,"Resource":null,"Sequences":[],"Specialization":null,"Status":null,"Student_Id":2,"Student_SSN":"12354646846","Student_Name_En":"Mazin Awad Omer","Student_Name_Ar":"مازن عوض عمر","Student_Address":"Aysdfkhskj , SDFA, Ysdfhnlsd, sdsdfa","Student_Phone":"0055505480","Student_Email":"Mazin@omer.com","Student_High_School_Degree":"50","Student_Capabilities_Degree":"30","Student_My_Achievement_Degree":"20","Student_CreationDate":"2020-05-28T00:00:00","Student_Employee_Id":1,"Student_Assign_Date":null,"Student_Image_Profile":"146cf137-30dd-44c0-907d-02656b08a343.jpg","Student_Specialization_Id":3,"Student_Nationality_Id":1,"Student_Resource_Id":null,"Student_Status_Id":2,"Student_Total":null,"Suspended":null,"Notes":"Note"}', 1, 12, N'تعديل بيانات الطالب', N'Update Student')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3083, CAST(0x0000ABC9016880F4 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932549","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3084, CAST(0x0000ABC901690D23 AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":17,"Permission_Name_Ar":"الجنسيات","Permission_Name_En":"Nationality","Parent":7,"Url_Path":"Pages/Setting/FormNationality.aspx","Permission_Icon":"icofont icofont-search-document","System_Id":1}', 1, 4, N'إضافة صلاحية جديدة', N'add new permission')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3085, CAST(0x0000ABC901692715 AS DateTime), N'data:1', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3086, CAST(0x0000ABC901694236 AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932549","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
GO
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3087, CAST(0x0000ABC9016A0967 AS DateTime), N'data:{"Students":[],"Nationality_Id":4,"Nationality_Name_Ar":"فلبيني","Nationality_Name_En":"Filipeno"}', 1, 17, N'إنشاء جنسية جديدة', N'create new Nationalitys')
GO
SET IDENTITY_INSERT [dbo].[Log_File] OFF
GO
SET IDENTITY_INSERT [dbo].[Nationality] ON 

GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Nationality_Name_Ar], [Nationality_Name_En]) VALUES (1, N'سوداني', N'Sudanese')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Nationality_Name_Ar], [Nationality_Name_En]) VALUES (2, N'سعودي', N'Saudi')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Nationality_Name_Ar], [Nationality_Name_En]) VALUES (3, N'مصري', N'Egyptian')
GO
INSERT [dbo].[Nationality] ([Nationality_Id], [Nationality_Name_Ar], [Nationality_Name_En]) VALUES (4, N'فلبيني', N'Filipeno')
GO
SET IDENTITY_INSERT [dbo].[Nationality] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 

GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (1, N'ادارة ملفات الطلاب', N'Manage student files', 0, NULL, N'icofont icofont-group-students', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (2, N'عرض الملف', N'View Student File', 1, N'Pages/RegistrationProcess/view.aspx', N'icofont icofont-listing-box', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (3, N'ادارة النظام', N'System Management', 0, NULL, N'icofont icofont-ui-settings', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (4, N'الصلاحيات', N'Permissions', 3, N'Pages/UserManagment/Permissions.aspx', NULL, 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (5, N'المجموعات', N'Groups', 3, N'Pages/UserManagment/PermissionGroups.aspx', N'', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (6, N'قائمة الطلاب', N'Students List', 1, N'Pages/RegistrationProcess/ListView.aspx', N'icofont icofont-group-students', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (7, N'اعدادات القوائم', N'Lookup Forms', 3, N'Pages/Setting/', N'', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (8, N'الكليات', N'Collage', 7, N'Pages/Setting/FormCollege.aspx', N'', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (9, N'المصادر', N'Resource', 7, N'Pages/Setting/FormResource.aspx', N'', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (10, N'التخصصات', N'Specialization', 7, N'Pages/Setting/FormSpecialization.aspx', N'', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (11, N'بعض الصفحات', N'SomePage', 3, N'', N'', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (12, N'بيانات الطالب', N'Students Data', 11, N'Pages/RegistrationProcess/StudentInfo.aspx', N'', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (13, N'حذف طالب', N'Delete Student', 11, N'Pages/RegistrationProcess/DeleteStudent.ashx', N'', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (14, N'ادارة الموظفين', N'Employees Managment', 0, NULL, N'icofont icofont-ui-settings', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (15, N'الصفحة الشخصية', N'My Profile', 14, N'Pages/UserManagment/Profile.aspx', N'icofont icofont-group-students', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (16, N'الموظفين', N'Employees', 14, N'Pages/UserManagment/Employees.aspx', N'icofont icofont-ui-contact-list', 1)
GO
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (17, N'الجنسيات', N'Nationality', 7, N'Pages/Setting/FormNationality.aspx', N'icofont icofont-search-document', 1)
GO
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission_Group] ON 

GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1133, 1, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1134, 2, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1135, 3, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1136, 4, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1137, 5, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1138, 6, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1139, 7, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1140, 8, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1141, 9, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1142, 10, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1143, 12, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1144, 13, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1145, 14, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1146, 15, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1147, 16, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1148, 11, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1149, 17, 1)
GO
SET IDENTITY_INSERT [dbo].[Permission_Group] OFF
GO
SET IDENTITY_INSERT [dbo].[Resource] ON 

GO
INSERT [dbo].[Resource] ([ResourceID], [Resource_Name_Ar], [Resource_Name_En]) VALUES (1, N'فيس بوك   ', N'Facebook')
GO
INSERT [dbo].[Resource] ([ResourceID], [Resource_Name_Ar], [Resource_Name_En]) VALUES (2, N'تويتر     ', N'Tiweter')
GO
INSERT [dbo].[Resource] ([ResourceID], [Resource_Name_Ar], [Resource_Name_En]) VALUES (3, N'انستقرام  ', N'Instegram')
GO
INSERT [dbo].[Resource] ([ResourceID], [Resource_Name_Ar], [Resource_Name_En]) VALUES (4, N'صديق      ', N'Friends')
GO
SET IDENTITY_INSERT [dbo].[Resource] OFF
GO
SET IDENTITY_INSERT [dbo].[Sequence] ON 

GO
INSERT [dbo].[Sequence] ([Sequence_Id], [Emp_Id], [Status_Id], [Student_Id], [DateCreation]) VALUES (1, 1, 1, 1, CAST(0x0000ABC601266F00 AS DateTime))
GO
INSERT [dbo].[Sequence] ([Sequence_Id], [Emp_Id], [Status_Id], [Student_Id], [DateCreation]) VALUES (2, 2, 2, 1, CAST(0x0000ABC601285B30 AS DateTime))
GO
INSERT [dbo].[Sequence] ([Sequence_Id], [Emp_Id], [Status_Id], [Student_Id], [DateCreation]) VALUES (3, 1, 3, 1, CAST(0x0000ABC701334031 AS DateTime))
GO
INSERT [dbo].[Sequence] ([Sequence_Id], [Emp_Id], [Status_Id], [Student_Id], [DateCreation]) VALUES (4, 1, 4, 1, CAST(0x0000ABC800D2CB43 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Sequence] OFF
GO
SET IDENTITY_INSERT [dbo].[Specialization] ON 

GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En]) VALUES (1, N'بكالوريوس طب و جراحه الفم و الأسنان', N'Bachelor of Medicine and Oral and Dental Surgery', 1, N'1- The male / female student must have a high school diploma or equivalent from within
The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:
  The weighted percentage should not be less than (80%) distributed as follows:
- (30%) of high school.
- (30%) capabilities.
-) 40% (achievement), provided that the achievement test score is not less than (70).
2- To be of good conduct and behavior.
3- He has successfully passed the entrance exams, which include English and a personal interview
And the practical exam.
4- To be medically fit
5- He must not be dismissed from any other university or college for disciplinary reasons', N'30', N'30', N'40', N'80', N'fa fa-university', N'Template/extra-images/dental-surgery.jpg', N'1- The male / female student must have a high school diploma or equivalent from within
The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:
  The weighted percentage should not be less than (80%) distributed as follows:
- (30%) of high school.
- (30%) capabilities.
-) 40% (achievement), provided that the achievement test score is not less than (70).
2- To be of good conduct and behavior.
3- He has successfully passed the entrance exams, which include English and a personal interview
And the practical exam.
4- To be medically fit
5- He must not be dismissed from any other university or college for disciplinary reasons', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.')
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En]) VALUES (2, N'بكالوريوس علوم الصيدلة', N'Bachelor of Pharmacy Science', 2, N'1- The male / female student must have a high school diploma or equivalent from within', N'30', N'30', N'40', N'70', N'fa fa-university', N'Template/extra-images/Pharmaceutical-Chemistry-1024x630.jpg', N'1- The male / female student must have a high school diploma or equivalent from within
The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:
  The weighted percentage should not be less than (80%) distributed as follows:
- (30%) of high school.
- (30%) capabilities.
-) 40% (achievement), provided that the achievement test score is not less than (70).
2- To be of good conduct and behavior.
3- He has successfully passed the entrance exams, which include English and a personal interview
And the practical exam.
4- To be medically fit
5- He must not be dismissed from any other university or college for disciplinary reasons', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.')
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En]) VALUES (3, N'بكالوريوس التمريض', N'Bachelor of Nursing', 3, N'1- The male / female student must have a high school diploma or equivalent from within', N'30', N'30', N'40', N'65', N'fa fa-university', N'Template/extra-images/Nursing-Stethoscope-1.jpg', N'1- The male / female student must have a high school diploma or equivalent from within
The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:
  The weighted percentage should not be less than (80%) distributed as follows:
- (30%) of high school.
- (30%) capabilities.
-) 40% (achievement), provided that the achievement test score is not less than (70).
2- To be of good conduct and behavior.
3- He has successfully passed the entrance exams, which include English and a personal interview
And the practical exam.
4- To be medically fit
5- He must not be dismissed from any other university or college for disciplinary reasons', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.')
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En]) VALUES (4, N'بكالوريوس مساعد طبيب الأسنان', N'Bachelor’s Assistant Dentist', 4, N'1- The male / female student must have a high school diploma or equivalent from within', N'30', N'30', N'40', N'65', N'fa fa-university', N'Template/extra-images/dental-assistant.png', N'1- The male / female student must have a high school diploma or equivalent from within
The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:
  The weighted percentage should not be less than (80%) distributed as follows:
- (30%) of high school.
- (30%) capabilities.
-) 40% (achievement), provided that the achievement test score is not less than (70).
2- To be of good conduct and behavior.
3- He has successfully passed the entrance exams, which include English and a personal interview
And the practical exam.
4- To be medically fit
5- He must not be dismissed from any other university or college for disciplinary reasons', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.')
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En]) VALUES (14, N'بكالوريوس تقنية الأسنان', N'Bachelor of Dental Technology', 4, N'1- The male / female student must have a high school diploma or equivalent from within', N'30', N'30', N'40', N'65', N'fa fa-university', N'Template/extra-images/iStock.jpg', N'1- The male / female student must have a high school diploma or equivalent from within
The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:
  The weighted percentage should not be less than (80%) distributed as follows:
- (30%) of high school.
- (30%) capabilities.
-) 40% (achievement), provided that the achievement test score is not less than (70).
2- To be of good conduct and behavior.
3- He has successfully passed the entrance exams, which include English and a personal interview
And the practical exam.
4- To be medically fit
5- He must not be dismissed from any other university or college for disciplinary reasons', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.')
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En]) VALUES (15, N'بكالوريوس صحة الفم والأسنان', N'Bachelor in Oral and Dental Health', 4, N'1- The male / female student must have a high school diploma or equivalent from within', N'30', N'30', N'40', N'65', N'fa fa-university', N'Template/extra-images/dentalhygiene.jpg', N'1- The male / female student must have a high school diploma or equivalent from within
The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:
  The weighted percentage should not be less than (80%) distributed as follows:
- (30%) of high school.
- (30%) capabilities.
-) 40% (achievement), provided that the achievement test score is not less than (70).
2- To be of good conduct and behavior.
3- He has successfully passed the entrance exams, which include English and a personal interview
And the practical exam.
4- To be medically fit
5- He must not be dismissed from any other university or college for disciplinary reasons', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.')
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En]) VALUES (16, N'بكالوريوس المختبرات الإكلينيكية', N'Bachelor of Clinical Laboratory', 4, N'1- The male / female student must have a high school diploma or equivalent from within', N'30', N'30', N'40', N'65', N'fa fa-university', N'Template/extra-images/biotech.jpeg', N'1- The male / female student must have a high school diploma or equivalent from within
The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:
  The weighted percentage should not be less than (80%) distributed as follows:
- (30%) of high school.
- (30%) capabilities.
-) 40% (achievement), provided that the achievement test score is not less than (70).
2- To be of good conduct and behavior.
3- He has successfully passed the entrance exams, which include English and a personal interview
And the practical exam.
4- To be medically fit
5- He must not be dismissed from any other university or college for disciplinary reasons', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.')
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En]) VALUES (17, N'إدارة الخدمات الصحية والمستشفيات', N'Health Services and Hospitals Department', 4, N'1- The male / female student must have a high school diploma or equivalent from within', N'30', N'30', N'40', N'65', N'fa fa-university', N'Template/extra-images/blue-and-silver.jpg', N'1- The male / female student must have a high school diploma or equivalent from within
The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:
  The weighted percentage should not be less than (80%) distributed as follows:
- (30%) of high school.
- (30%) capabilities.
-) 40% (achievement), provided that the achievement test score is not less than (70).
2- To be of good conduct and behavior.
3- He has successfully passed the entrance exams, which include English and a personal interview
And the practical exam.
4- To be medically fit
5- He must not be dismissed from any other university or college for disciplinary reasons', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.')
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition_Ar], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent], [Specialization_Icon], [Specialization_Image], [Condition_En], [Specialization_Description_Ar], [Specialization_Description_En]) VALUES (18, N'بكالوريوس الحاسب الآلي', N'Bachelor of Computer', 4, N'1- The male / female student must have a high school diploma or equivalent from within', N'30', N'30', N'40', N'70', N'fa fa-university', N'Template/extra-images/christopher-gower.jpg', N'1- The male / female student must have a high school diploma or equivalent from within
The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:
  The weighted percentage should not be less than (80%) distributed as follows:
- (30%) of high school.
- (30%) capabilities.
-) 40% (achievement), provided that the achievement test score is not less than (70).
2- To be of good conduct and behavior.
3- He has successfully passed the entrance exams, which include English and a personal interview
And the practical exam.
4- To be medically fit
5- He must not be dismissed from any other university or college for disciplinary reasons', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.', N'Becoming a student requires more than a test score. To “be student” requires persistence. And passion. And a desire to give back. It doesn’t matter whether you’re the first in your family to attend college or you’re the latest in a long tradition of educational excellence: You stand up and you stand out.')
GO
SET IDENTITY_INSERT [dbo].[Specialization] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (1, 1, N'جديدة', N'New', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (2, 2, N'قيد الانتظار', N'Pending', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (3, 3, N'مخصصة', N'Assigned', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (4, 4, N'غير مكتملة', N'Not Complete', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (5, 5, N'مكتملة البيانات', N'Data Completed', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (6, 6, N'سداد رسوم التسجيل', N'Pay the Registration Fees', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (7, 7, N'تم سداد رسوم التسجيل', N'Registration Fee Paid', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (8, 8, N'حجز موعد اختبار', N'Book a Test Date', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (9, 9, N'رسوب في الاختبار', N'Failure in the Test', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (10, 10, N'نجاح في الاختبار', N'Success in the Test', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (11, 11, N'سداد الرسوم الدراسية', N'Pay the Tuition Fees', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (12, 12, N'تم سداد الرسوم الدراسية', N'Tuition Fees Paid', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (13, 13, N'اصدار الرقم الجامعي', N'Issuance University ID', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (14, 14, N'اكتمال الملف بنجاح', N'File Completed Successfully', NULL, NULL)
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (15, 15, N'اكتمال الملف بالفشل', N'File Complete with Failure', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

GO
INSERT [dbo].[Student] ([Student_Id], [Student_SSN], [Student_Name_En], [Student_Name_Ar], [Student_Address], [Student_Phone], [Student_Email], [Student_High_School_Degree], [Student_Capabilities_Degree], [Student_My_Achievement_Degree], [Student_CreationDate], [Student_Employee_Id], [Student_Assign_Date], [Student_Image_Profile], [Student_Specialization_Id], [Student_Nationality_Id], [Student_Resource_Id], [Student_Status_Id], [Student_Total], [Suspended], [Notes]) VALUES (1, N'2453629996', N'Ayman Amin Ali Amin', N'ايمن امين علي امين', N'Saudi Arabia, Riyadh, Al-Malaz, 60 Street', N'0550932548', N'Ayman@softwarecornerit.com', N'30', N'30', N'40', CAST(0x0000AB5500CC9ED0 AS DateTime), 1, CAST(0x0000AB5500D14A20 AS DateTime), NULL, 1, 1, 1, 4, N'70', NULL, NULL)
GO
INSERT [dbo].[Student] ([Student_Id], [Student_SSN], [Student_Name_En], [Student_Name_Ar], [Student_Address], [Student_Phone], [Student_Email], [Student_High_School_Degree], [Student_Capabilities_Degree], [Student_My_Achievement_Degree], [Student_CreationDate], [Student_Employee_Id], [Student_Assign_Date], [Student_Image_Profile], [Student_Specialization_Id], [Student_Nationality_Id], [Student_Resource_Id], [Student_Status_Id], [Student_Total], [Suspended], [Notes]) VALUES (2, N'12354646846', N'Mazin Awad Omer', N'مازن عوض عمر', N'Aysdfkhskj , SDFA, Ysdfhnlsd, sdsdfa', N'0055505480', N'Mazin@omer.com', N'50', N'30', N'20', CAST(0x0000ABC900000000 AS DateTime), 1, NULL, N'146cf137-30dd-44c0-907d-02656b08a343.jpg', 3, 1, NULL, 2, NULL, NULL, N'Note')
GO
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Group] FOREIGN KEY([Group_Id])
REFERENCES [dbo].[Group] ([Group_Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Group]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_LanguageMaster] FOREIGN KEY([Language_id])
REFERENCES [dbo].[LanguageMaster] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_LanguageMaster]
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_Student] FOREIGN KEY([Student_Id])
REFERENCES [dbo].[Student] ([Student_Id])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Files_Student]
GO
ALTER TABLE [dbo].[Group_Status]  WITH CHECK ADD  CONSTRAINT [FK_Group_Status_Group] FOREIGN KEY([Group_Id])
REFERENCES [dbo].[Group] ([Group_Id])
GO
ALTER TABLE [dbo].[Group_Status] CHECK CONSTRAINT [FK_Group_Status_Group]
GO
ALTER TABLE [dbo].[Group_Status]  WITH CHECK ADD  CONSTRAINT [FK_Group_Status_Status] FOREIGN KEY([Status_Id])
REFERENCES [dbo].[Status] ([Status_Id])
GO
ALTER TABLE [dbo].[Group_Status] CHECK CONSTRAINT [FK_Group_Status_Status]
GO
ALTER TABLE [dbo].[Lanuage_Detials]  WITH CHECK ADD  CONSTRAINT [FK_Lanuage_Detials_LanguageMaster] FOREIGN KEY([Language_Master_Id])
REFERENCES [dbo].[LanguageMaster] ([ID])
GO
ALTER TABLE [dbo].[Lanuage_Detials] CHECK CONSTRAINT [FK_Lanuage_Detials_LanguageMaster]
GO
ALTER TABLE [dbo].[Log_File]  WITH CHECK ADD  CONSTRAINT [FK_Log_File_Employee] FOREIGN KEY([Login_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Log_File] CHECK CONSTRAINT [FK_Log_File_Employee]
GO
ALTER TABLE [dbo].[Log_File]  WITH CHECK ADD  CONSTRAINT [FK_Log_File_Permission] FOREIGN KEY([Form_Id])
REFERENCES [dbo].[Permission] ([Permission_Id])
GO
ALTER TABLE [dbo].[Log_File] CHECK CONSTRAINT [FK_Log_File_Permission]
GO
ALTER TABLE [dbo].[Nationality]  WITH CHECK ADD  CONSTRAINT [FK_Nationality_Nationality] FOREIGN KEY([Nationality_Id])
REFERENCES [dbo].[Nationality] ([Nationality_Id])
GO
ALTER TABLE [dbo].[Nationality] CHECK CONSTRAINT [FK_Nationality_Nationality]
GO
ALTER TABLE [dbo].[Notification_Employee]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Employee_Employee] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Notification_Employee] CHECK CONSTRAINT [FK_Notification_Employee_Employee]
GO
ALTER TABLE [dbo].[Notification_Employee]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Employee_Notification_Show] FOREIGN KEY([NotificationShow_Id])
REFERENCES [dbo].[Notification_Show] ([Notification_Show_Id])
GO
ALTER TABLE [dbo].[Notification_Employee] CHECK CONSTRAINT [FK_Notification_Employee_Notification_Show]
GO
ALTER TABLE [dbo].[Notification_Master]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Master_Notification_Show] FOREIGN KEY([Notification_Show_Id])
REFERENCES [dbo].[Notification_Show] ([Notification_Show_Id])
GO
ALTER TABLE [dbo].[Notification_Master] CHECK CONSTRAINT [FK_Notification_Master_Notification_Show]
GO
ALTER TABLE [dbo].[Permission_Group]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Group_Group] FOREIGN KEY([Group_Id])
REFERENCES [dbo].[Group] ([Group_Id])
GO
ALTER TABLE [dbo].[Permission_Group] CHECK CONSTRAINT [FK_Permission_Group_Group]
GO
ALTER TABLE [dbo].[Permission_Group]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Group_Permission] FOREIGN KEY([Permission_Id])
REFERENCES [dbo].[Permission] ([Permission_Id])
GO
ALTER TABLE [dbo].[Permission_Group] CHECK CONSTRAINT [FK_Permission_Group_Permission]
GO
ALTER TABLE [dbo].[Sequence]  WITH CHECK ADD  CONSTRAINT [FK_Sequence_Employee] FOREIGN KEY([Emp_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Sequence] CHECK CONSTRAINT [FK_Sequence_Employee]
GO
ALTER TABLE [dbo].[Sequence]  WITH CHECK ADD  CONSTRAINT [FK_Sequence_Status] FOREIGN KEY([Status_Id])
REFERENCES [dbo].[Status] ([Status_Id])
GO
ALTER TABLE [dbo].[Sequence] CHECK CONSTRAINT [FK_Sequence_Status]
GO
ALTER TABLE [dbo].[Sequence]  WITH CHECK ADD  CONSTRAINT [FK_Sequence_Student] FOREIGN KEY([Student_Id])
REFERENCES [dbo].[Student] ([Student_Id])
GO
ALTER TABLE [dbo].[Sequence] CHECK CONSTRAINT [FK_Sequence_Student]
GO
ALTER TABLE [dbo].[Specialization]  WITH CHECK ADD  CONSTRAINT [FK_Specialization_Collage] FOREIGN KEY([Collage_Id])
REFERENCES [dbo].[Collage] ([Collage_ID])
GO
ALTER TABLE [dbo].[Specialization] CHECK CONSTRAINT [FK_Specialization_Collage]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Employee] FOREIGN KEY([Student_Employee_Id])
REFERENCES [dbo].[Employee] ([Employee_Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Employee]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Nationality] FOREIGN KEY([Student_Nationality_Id])
REFERENCES [dbo].[Nationality] ([Nationality_Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Nationality]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Resource] FOREIGN KEY([Student_Resource_Id])
REFERENCES [dbo].[Resource] ([ResourceID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Resource]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Specialization] FOREIGN KEY([Student_Specialization_Id])
REFERENCES [dbo].[Specialization] ([Specialization_Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Specialization]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Status] FOREIGN KEY([Student_Status_Id])
REFERENCES [dbo].[Status] ([Status_Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Status]
GO
USE [master]
GO
ALTER DATABASE [REU_Registration] SET  READ_WRITE 
GO
