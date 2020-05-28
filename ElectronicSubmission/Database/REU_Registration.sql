USE [master]
GO
/****** Object:  Database [REU_Registration]    Script Date: 5/28/2020 3:15:27 PM ******/
CREATE DATABASE [REU_Registration]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'REU_Registration', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\REU_Registration.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'REU_Registration_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\REU_Registration_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [REU_Registration] SET DELAYED_DURABILITY = DISABLED 
GO
USE [REU_Registration]
GO
/****** Object:  Table [dbo].[Collage]    Script Date: 5/28/2020 3:15:27 PM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 5/28/2020 3:15:27 PM ******/
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
/****** Object:  Table [dbo].[Files]    Script Date: 5/28/2020 3:15:27 PM ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 5/28/2020 3:15:27 PM ******/
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
/****** Object:  Table [dbo].[Group_Status]    Script Date: 5/28/2020 3:15:27 PM ******/
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
/****** Object:  Table [dbo].[LanguageMaster]    Script Date: 5/28/2020 3:15:27 PM ******/
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
/****** Object:  Table [dbo].[Lanuage_Detials]    Script Date: 5/28/2020 3:15:27 PM ******/
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
/****** Object:  Table [dbo].[Log_File]    Script Date: 5/28/2020 3:15:27 PM ******/
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
/****** Object:  Table [dbo].[Nationality]    Script Date: 5/28/2020 3:15:27 PM ******/
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
/****** Object:  Table [dbo].[Notification_Employee]    Script Date: 5/28/2020 3:15:27 PM ******/
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
/****** Object:  Table [dbo].[Notification_Master]    Script Date: 5/28/2020 3:15:27 PM ******/
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
/****** Object:  Table [dbo].[Notification_Show]    Script Date: 5/28/2020 3:15:27 PM ******/
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
/****** Object:  Table [dbo].[Permission]    Script Date: 5/28/2020 3:15:27 PM ******/
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
/****** Object:  Table [dbo].[Permission_Group]    Script Date: 5/28/2020 3:15:27 PM ******/
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
/****** Object:  Table [dbo].[Resource]    Script Date: 5/28/2020 3:15:27 PM ******/
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
/****** Object:  Table [dbo].[Sequence]    Script Date: 5/28/2020 3:15:27 PM ******/
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
/****** Object:  Table [dbo].[Specialization]    Script Date: 5/28/2020 3:15:27 PM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 5/28/2020 3:15:27 PM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 5/28/2020 3:15:27 PM ******/
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
	[Student_Image_Profile_Id] [int] NULL,
	[Student_Specialization_Id] [int] NULL,
	[Student_Nationality_Id] [int] NULL,
	[Student_Resource_Id] [int] NULL,
	[Student_Status_Id] [int] NULL,
	[Student_Total] [nvarchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Student_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Collage] ON 

INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (1, N'كلية طب الأسنان', N'Faculty of Dentistry')
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (2, N'كلية الصيدلة', N'Faculty of Pharmacy')
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (3, N'كلية التمريض', N'Faculty of Nursing')
INSERT [dbo].[Collage] ([Collage_ID], [Collage_Name_Ar], [Collage_Name_En]) VALUES (4, N'كلية العلوم الطبية التطبيقية', N'Faculty of Applied Medical Sciences')
SET IDENTITY_INSERT [dbo].[Collage] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (1, N'أيمن امين', N'Ayman Amin', N'ayman@softwarecornerit.com', N'0550932548', 1, N'Profile.JPG', N'7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2', 1, 2)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (2, N'عمر احمد', N'Omer Ahmed', N'ayman1793@gmail.com', N'09246548451', 1, N'Profile.JPG', N'7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2', 1, 2)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (3, N'مازن عوض', N'Mazin Awad', N'mazinawad2015@gmail.com', N'0550932518', 1, N'Profile.JPG', N'7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2', 1, 2)
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (4, N'مدير النظام', N'Admin System', N'ayman1793@hotmail.com', N'0550932548', 1, N'Profile.JPG', N'7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2', 1, 2)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Files] ON 

INSERT [dbo].[Files] ([File_Id], [File_Name], [File_Path], [DateCreation], [Student_Id], [Type]) VALUES (1, N'My Profile', N'https://thumbs.dreamstime.com/b/profile-picture-vector-perfect-social-media-other-web-use-125320944.jpg', CAST(N'2020-05-26 00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Files] ([File_Id], [File_Name], [File_Path], [DateCreation], [Student_Id], [Type]) VALUES (6, N'Capabilities', N'https://www.sdeem.org/img/app_3/certificates/3460kksn6924.jpg', CAST(N'2020-05-26 00:00:00.000' AS DateTime), 1, 3)
INSERT [dbo].[Files] ([File_Id], [File_Name], [File_Path], [DateCreation], [Student_Id], [Type]) VALUES (7, N'High School', N'https://khamsat.hsoubcdn.com/images/services/482512/f31b0d79ed9d03d2f2dfe89deded3871.jpg', CAST(N'2020-05-26 00:00:00.000' AS DateTime), 1, 4)
SET IDENTITY_INSERT [dbo].[Files] OFF
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (1, N'المجموعة الاولي', N'First Group')
SET IDENTITY_INSERT [dbo].[Group] OFF
SET IDENTITY_INSERT [dbo].[Group_Status] ON 

INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (31, 1, 1)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (32, 1, 2)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (33, 1, 3)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (34, 1, 4)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (35, 1, 5)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (36, 1, 6)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (37, 1, 7)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (38, 1, 8)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (39, 1, 9)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (40, 1, 10)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (41, 1, 11)
INSERT [dbo].[Group_Status] ([Group_Status_Id], [Group_Id], [Status_Id]) VALUES (42, 1, 12)
SET IDENTITY_INSERT [dbo].[Group_Status] OFF
SET IDENTITY_INSERT [dbo].[LanguageMaster] ON 

INSERT [dbo].[LanguageMaster] ([ID], [Language_Name]) VALUES (1, N'Arabic')
INSERT [dbo].[LanguageMaster] ([ID], [Language_Name]) VALUES (2, N'English')
SET IDENTITY_INSERT [dbo].[LanguageMaster] OFF
SET IDENTITY_INSERT [dbo].[Log_File] ON 

INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1, CAST(N'2020-05-21 17:12:32.877' AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":1,"Permission_Name_Ar":"ادارة ملفات الطلاب","Permission_Name_En":"Manage student files","Parent":0,"Url_Path":"","Permission_Icon":"","System_Id":1}', 1, 1, N'إضافة صلاحية جديدة', N'add new permission')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2, CAST(N'2020-05-21 17:13:18.527' AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":2,"Permission_Name_Ar":"عرض الملف","Permission_Name_En":"View Student File","Parent":1,"Url_Path":"","Permission_Icon":"","System_Id":1}', 1, 1, N'إضافة صلاحية جديدة', N'add new permission')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3, CAST(N'2020-05-21 17:13:36.167' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (4, CAST(N'2020-05-21 17:14:31.717' AS DateTime), N'data:1', 1, 1, N'تعديل صلاحيات المجموعة', N'update group permissions')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (5, CAST(N'2020-05-21 17:15:20.277' AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":3,"Permission_Name_Ar":"ادارة النظام","Permission_Name_En":"System Management","Parent":0,"Url_Path":"","Permission_Icon":"","System_Id":1}', 1, 1, N'إضافة صلاحية جديدة', N'add new permission')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (6, CAST(N'2020-05-21 17:16:09.903' AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":4,"Permission_Name_Ar":"الصلاحيات","Permission_Name_En":"Permissions","Parent":3,"Url_Path":"Pages/UserManagment/PermissionGroups.aspx","Permission_Icon":"","System_Id":1}', 1, 1, N'إضافة صلاحية جديدة', N'add new permission')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (7, CAST(N'2020-05-21 17:16:40.457' AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":5,"Permission_Name_Ar":"المجموعات","Permission_Name_En":"Groups","Parent":3,"Url_Path":"Pages/UserManagment/PermissionGroups.aspx","Permission_Icon":"","System_Id":1}', 1, 1, N'إضافة صلاحية جديدة', N'add new permission')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (8, CAST(N'2020-05-21 17:17:00.067' AS DateTime), N'data:1', 1, 4, N'تعديل صلاحيات المجموعة', N'update group permissions')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (9, CAST(N'2020-05-21 17:17:15.597' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (10, CAST(N'2020-05-21 17:21:36.067' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (11, CAST(N'2020-05-21 17:36:28.227' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (12, CAST(N'2020-05-21 17:38:16.213' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (13, CAST(N'2020-05-21 17:50:21.603' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (14, CAST(N'2020-05-21 17:52:58.843' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (15, CAST(N'2020-05-21 17:54:29.347' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (16, CAST(N'2020-05-21 23:15:31.507' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1016, CAST(N'2020-05-25 15:28:24.073' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1017, CAST(N'2020-05-25 17:46:56.113' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1018, CAST(N'2020-05-25 18:04:40.420' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1019, CAST(N'2020-05-26 16:49:44.037' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1020, CAST(N'2020-05-26 16:53:19.883' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1021, CAST(N'2020-05-26 16:59:52.573' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1022, CAST(N'2020-05-26 17:02:03.007' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1023, CAST(N'2020-05-26 17:11:42.763' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1024, CAST(N'2020-05-26 17:36:44.290' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1025, CAST(N'2020-05-26 17:39:15.370' AS DateTime), N'data:{"Log_File":[],"Permission_Group":[],"Permission_Id":6,"Permission_Name_Ar":"قائمة الطلاب","Permission_Name_En":"Students List","Parent":1,"Url_Path":"Pages/RegistrationProcess/ListView.aspx","Permission_Icon":"icofont icofont-group-students","System_Id":1}', 1, 4, N'إضافة صلاحية جديدة', N'add new permission')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1026, CAST(N'2020-05-26 17:39:34.627' AS DateTime), N'data:1', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1027, CAST(N'2020-05-26 17:40:00.827' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1028, CAST(N'2020-05-26 17:57:45.683' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (1029, CAST(N'2020-05-26 18:03:30.583' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2019, CAST(N'2020-05-26 18:37:29.573' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2020, CAST(N'2020-05-26 18:47:06.993' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2021, CAST(N'2020-05-26 18:52:21.423' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2022, CAST(N'2020-05-26 19:44:00.267' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2023, CAST(N'2020-05-26 19:49:40.540' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2024, CAST(N'2020-05-26 19:51:35.717' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2025, CAST(N'2020-05-26 20:02:05.220' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2026, CAST(N'2020-05-26 20:04:22.773' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2027, CAST(N'2020-05-27 12:25:52.303' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2028, CAST(N'2020-05-27 12:38:21.343' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2029, CAST(N'2020-05-27 12:44:41.900' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2030, CAST(N'2020-05-27 13:25:08.840' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2031, CAST(N'2020-05-27 13:27:37.627' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2032, CAST(N'2020-05-27 13:40:03.457' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2033, CAST(N'2020-05-27 13:56:48.160' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2034, CAST(N'2020-05-27 14:00:30.197' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2035, CAST(N'2020-05-27 14:05:00.420' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2036, CAST(N'2020-05-27 14:11:23.800' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2037, CAST(N'2020-05-27 14:20:53.593' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2038, CAST(N'2020-05-27 14:56:48.937' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2039, CAST(N'2020-05-27 14:59:39.457' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2040, CAST(N'2020-05-27 15:01:42.290' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2041, CAST(N'2020-05-27 15:03:05.780' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2042, CAST(N'2020-05-27 15:06:05.730' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2043, CAST(N'2020-05-27 15:08:20.377' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2044, CAST(N'2020-05-27 15:10:25.013' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2045, CAST(N'2020-05-27 15:13:03.353' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2046, CAST(N'2020-05-27 15:19:27.930' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2047, CAST(N'2020-05-27 15:37:30.237' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2048, CAST(N'2020-05-27 15:41:34.040' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2049, CAST(N'2020-05-27 15:43:35.983' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (2050, CAST(N'2020-05-27 15:52:18.713' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3045, CAST(N'2020-05-27 18:06:20.297' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3046, CAST(N'2020-05-27 18:20:58.760' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3047, CAST(N'2020-05-27 18:28:12.190' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3048, CAST(N'2020-05-27 18:34:05.393' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Students":[],"Sequences":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3049, CAST(N'2020-05-27 18:38:29.503' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3050, CAST(N'2020-05-27 18:39:04.573' AS DateTime), N'data:1', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3051, CAST(N'2020-05-27 18:41:21.553' AS DateTime), N'data:1', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3052, CAST(N'2020-05-27 18:42:01.117' AS DateTime), N'data:1', 1, 5, N'تعديل صلاحيات المجموعة', N'update group permissions')
INSERT [dbo].[Log_File] ([Log_Id], [Log_Date], [Log_Note], [Login_Id], [Form_Id], [Log_Name], [Log_Description]) VALUES (3053, CAST(N'2020-05-28 12:42:55.300' AS DateTime), N'data:{"Employee_Id":1,"Employee_Name_Ar":"أيمن امين","Employee_Name_En":"Ayman Amin","Employee_Email":"ayman@softwarecornerit.com","Employee_Phone":"0550932548","Group_Id":null,"Employee_Profile":null,"Employee_Password":null,"Employee_Active":null,"Language_id":null,"Group":null,"LanguageMaster":null,"Log_File":[],"Notification_Employee":[],"Sequences":[],"Students":[]}', 1, 1, N'تسجيل دخول', N'login to system')
SET IDENTITY_INSERT [dbo].[Log_File] OFF
SET IDENTITY_INSERT [dbo].[Nationality] ON 

INSERT [dbo].[Nationality] ([Nationality_Id], [Nationality_Name_Ar], [Nationality_Name_En]) VALUES (1, N'سوداني', N'Sudanese')
INSERT [dbo].[Nationality] ([Nationality_Id], [Nationality_Name_Ar], [Nationality_Name_En]) VALUES (2, N'سعودي', N'Saudi')
INSERT [dbo].[Nationality] ([Nationality_Id], [Nationality_Name_Ar], [Nationality_Name_En]) VALUES (3, N'مصري', N'Egyptian')
SET IDENTITY_INSERT [dbo].[Nationality] OFF
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (1, N'ادارة ملفات الطلاب', N'Manage student files', 0, NULL, N'icofont icofont-group-students', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (2, N'عرض الملف', N'View Student File', 1, N'Pages/RegistrationProcess/view.aspx', N'icofont icofont-listing-box', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (3, N'ادارة النظام', N'System Management', 0, NULL, N'icofont icofont-ui-settings', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (4, N'الصلاحيات', N'Permissions', 3, N'Pages/UserManagment/Permissions.aspx', NULL, 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (5, N'المجموعات', N'Groups', 3, N'Pages/UserManagment/PermissionGroups.aspx', N'', 1)
INSERT [dbo].[Permission] ([Permission_Id], [Permission_Name_Ar], [Permission_Name_En], [Parent], [Url_Path], [Permission_Icon], [System_Id]) VALUES (6, N'قائمة الطلاب', N'Students List', 1, N'Pages/RegistrationProcess/ListView.aspx', N'icofont icofont-group-students', 1)
SET IDENTITY_INSERT [dbo].[Permission] OFF
SET IDENTITY_INSERT [dbo].[Permission_Group] ON 

INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1086, 1, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1087, 2, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1088, 3, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1089, 4, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1090, 5, 1)
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (1091, 6, 1)
SET IDENTITY_INSERT [dbo].[Permission_Group] OFF
SET IDENTITY_INSERT [dbo].[Resource] ON 

INSERT [dbo].[Resource] ([ResourceID], [Resource_Name_Ar], [Resource_Name_En]) VALUES (1, N'فيس بوك   ', N'Facebook')
INSERT [dbo].[Resource] ([ResourceID], [Resource_Name_Ar], [Resource_Name_En]) VALUES (2, N'تويتر     ', N'Tiweter')
INSERT [dbo].[Resource] ([ResourceID], [Resource_Name_Ar], [Resource_Name_En]) VALUES (3, N'انستقرام  ', N'Instegram')
INSERT [dbo].[Resource] ([ResourceID], [Resource_Name_Ar], [Resource_Name_En]) VALUES (4, N'صديق      ', N'Friends')
SET IDENTITY_INSERT [dbo].[Resource] OFF
SET IDENTITY_INSERT [dbo].[Sequence] ON 

INSERT [dbo].[Sequence] ([Sequence_Id], [Emp_Id], [Status_Id], [Student_Id], [DateCreation]) VALUES (1, 1, 1, 1, CAST(N'2020-05-25 17:52:00.000' AS DateTime))
INSERT [dbo].[Sequence] ([Sequence_Id], [Emp_Id], [Status_Id], [Student_Id], [DateCreation]) VALUES (2, 2, 2, 1, CAST(N'2020-05-25 17:59:00.000' AS DateTime))
INSERT [dbo].[Sequence] ([Sequence_Id], [Emp_Id], [Status_Id], [Student_Id], [DateCreation]) VALUES (3, 1, 3, 1, CAST(N'2020-05-26 18:38:39.950' AS DateTime))
INSERT [dbo].[Sequence] ([Sequence_Id], [Emp_Id], [Status_Id], [Student_Id], [DateCreation]) VALUES (4, 1, 4, 1, CAST(N'2020-05-27 12:47:28.650' AS DateTime))
SET IDENTITY_INSERT [dbo].[Sequence] OFF
SET IDENTITY_INSERT [dbo].[Specialization] ON 

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
SET IDENTITY_INSERT [dbo].[Specialization] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (1, 1, N'جديدة', N'New', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (2, 2, N'قيد الانتظار', N'Pending', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (3, 3, N'مخصصة', N'Assigned', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (4, 4, N'غير مكتملة', N'Not Complete', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (5, 5, N'مكتملة البيانات', N'Data Completed', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (6, 6, N'سداد رسوم التسجيل', N'Pay the Registration Fees', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (7, 7, N'تم سداد رسوم التسجيل', N'Registration Fee Paid', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (8, 8, N'حجز موعد اختبار', N'Book a Test Date', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (9, 9, N'رسوب في الاختبار', N'Failure in the Test', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (10, 10, N'نجاح في الاختبار', N'Success in the Test', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (11, 11, N'سداد الرسوم الدراسية', N'Pay the Tuition Fees', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (12, 12, N'تم سداد الرسوم الدراسية', N'Tuition Fees Paid', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (13, 13, N'اصدار الرقم الجامعي', N'Issuance University ID', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (14, 14, N'اكتمال الملف بنجاح', N'File Completed Successfully', NULL, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Code], [Status_Name_Ar], [Status_Name_En], [Status_Color], [Status_Icon]) VALUES (15, 15, N'اكتمال الملف بالفشل', N'File Complete with Failure', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Student_Id], [Student_SSN], [Student_Name_En], [Student_Name_Ar], [Student_Address], [Student_Phone], [Student_Email], [Student_High_School_Degree], [Student_Capabilities_Degree], [Student_My_Achievement_Degree], [Student_CreationDate], [Student_Employee_Id], [Student_Assign_Date], [Student_Image_Profile_Id], [Student_Specialization_Id], [Student_Nationality_Id], [Student_Resource_Id], [Student_Status_Id], [Student_Total]) VALUES (1, N'2453629996', N'Ayman Amin Ali Amin', N'ايمن امين علي امين', N'Saudi Arabia, Riyadh, Al-Malaz, 60 Street', N'0550932548', N'Ayman@softwarecornerit.com', N'30', N'30', N'40', CAST(N'2020-02-02 12:25:00.000' AS DateTime), 1, CAST(N'2020-02-02 12:42:00.000' AS DateTime), NULL, 1, 1, 1, 4, N'70')
SET IDENTITY_INSERT [dbo].[Student] OFF
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
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Nationality] FOREIGN KEY([Student_Id])
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
