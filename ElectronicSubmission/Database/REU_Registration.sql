USE [master]
GO
/****** Object:  Database [REU_Registration]    Script Date: 5/22/2020 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[Collage]    Script Date: 5/22/2020 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 5/22/2020 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[Files]    Script Date: 5/22/2020 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 5/22/2020 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[Group_Status]    Script Date: 5/22/2020 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[LanguageMaster]    Script Date: 5/22/2020 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[Lanuage_Detials]    Script Date: 5/22/2020 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[Log_File]    Script Date: 5/22/2020 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[Nationality]    Script Date: 5/22/2020 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[Notification_Employee]    Script Date: 5/22/2020 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[Notification_Master]    Script Date: 5/22/2020 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[Notification_Show]    Script Date: 5/22/2020 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[Permission]    Script Date: 5/22/2020 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[Permission_Group]    Script Date: 5/22/2020 12:02:33 AM ******/
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
/****** Object:  Table [dbo].[Specialization]    Script Date: 5/22/2020 12:02:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialization](
	[Specialization_Id] [int] IDENTITY(1,1) NOT NULL,
	[Specialization_Name_Ar] [nvarchar](max) NULL,
	[Specialization_Name_En] [nvarchar](max) NULL,
	[Collage_Id] [int] NULL,
	[Condition] [nvarchar](max) NULL,
	[High_School_Percent] [nvarchar](50) NULL,
	[Capabilities_Percent] [nvarchar](50) NULL,
	[My_Achievement_Percent] [nvarchar](50) NULL,
	[Weighted_Ratio_Percent] [nvarchar](50) NULL,
 CONSTRAINT [PK_Specialization] PRIMARY KEY CLUSTERED 
(
	[Specialization_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 5/22/2020 12:02:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Status_Id] [int] IDENTITY(1,1) NOT NULL,
	[Status_Name_Ar] [nvarchar](max) NULL,
	[Status_Name_En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/22/2020 12:02:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_Id] [int] IDENTITY(1,1) NOT NULL,
	[Student_SSN] [nvarchar](50) NULL,
	[Student_Name] [nvarchar](max) NULL,
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
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (1, N'أيمن امين', N'Ayman Amin', N'ayman@softwarecornerit.com', N'0550932548', 1, N'Profile.JPG', N'7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2', 1, 2)
GO
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (2, N'عمر احمد', N'Omer Ahmed', N'ayman1793@gmail.com', N'09246548451', 1, N'Profile.JPG', N'7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2', 1, 2)
GO
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (3, N'مازن عوض', N'Mazin Awad', N'mazinawad2015@gmail.com', N'0550932518', 1, N'Profile.JPG', N'7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2', 1, 2)
GO
INSERT [dbo].[Employee] ([Employee_Id], [Employee_Name_Ar], [Employee_Name_En], [Employee_Email], [Employee_Phone], [Group_Id], [Employee_Profile], [Employee_Password], [Employee_Active], [Language_id]) VALUES (4, N'مدير النظام', N'Admin System', N'ayman1793@hotmail.com', N'0550932548', 1, N'Profile.JPG', N'7zHsEN5ijbTa6zIiYHyYxwCnINSYe/GOKK0PeXSm/P63Md9Cre3S/TCuJbikt8zEKwXJjODPPyWzdjgUiPgxAXMLRUJcGC8wV2A8gmPOP/ds7Uz0J2X0oIKiHtoz1sM2', 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

GO
INSERT [dbo].[Group] ([Group_Id], [Group_Name_Ar], [Group_Name_En]) VALUES (1, N'المجموعة الاولي', N'First Group')
GO
SET IDENTITY_INSERT [dbo].[Group] OFF
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
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission_Group] ON 

GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (3, 1, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (4, 2, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (5, 3, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (6, 4, 1)
GO
INSERT [dbo].[Permission_Group] ([Permission_Group_Id], [Permission_Id], [Group_Id]) VALUES (7, 5, 1)
GO
SET IDENTITY_INSERT [dbo].[Permission_Group] OFF
GO
SET IDENTITY_INSERT [dbo].[Specialization] ON 

GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent]) VALUES (1, N'بكالوريوس طب و جراحه الفم و الأسنان', N'Bachelor of Medicine and Oral and Dental Surgery', 1, N'1- The male / female student must have a high school diploma or equivalent from within
The Kingdom or from outside it, and aptitude and achievement test according to the following percentages:
  The weighted percentage should not be less than (80%) distributed as follows:
- (30%) of high school.
- (30%) capabilities.
-) 40% (achievement), provided that the achievement test score is not less than (70).
2- To be of good conduct and behavior.
3- He has successfully passed the entrance exams, which include English and a personal interview
And the practical exam.
4- To be medically fit
5- He must not be dismissed from any other university or college for disciplinary reasons', N'30', N'30', N'40', N'80')
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent]) VALUES (2, N'بكالوريوس علوم الصيدلة', N'Bachelor of Pharmacy Science', 2, N'1- The male / female student must have a high school diploma or equivalent from within', N'30', N'30', N'40', N'70')
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent]) VALUES (3, N'بكالوريوس التمريض', N'Bachelor of Nursing', 3, N'1- The male / female student must have a high school diploma or equivalent from within', N'30', N'30', N'40', N'65')
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent]) VALUES (4, N'بكالوريوس مساعد طبيب الأسنان', N'Bachelor’s Assistant Dentist', 4, N'1- The male / female student must have a high school diploma or equivalent from within', N'30', N'30', N'40', N'65')
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent]) VALUES (14, N'بكالوريوس تقنية الأسنان', N'Bachelor of Dental Technology', 4, N'1- The male / female student must have a high school diploma or equivalent from within', N'30', N'30', N'40', N'65')
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent]) VALUES (15, N'بكالوريوس صحة الفم والأسنان', N'Bachelor in Oral and Dental Health', 4, N'1- The male / female student must have a high school diploma or equivalent from within', N'30', N'30', N'40', N'65')
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent]) VALUES (16, N'بكالوريوس المختبرات الإكلينيكية', N'Bachelor of Clinical Laboratory', 4, N'1- The male / female student must have a high school diploma or equivalent from within', N'30', N'30', N'40', N'65')
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent]) VALUES (17, N'إدارة الخدمات الصحية والمستشفيات', N'Health Services and Hospitals Department', 4, N'1- The male / female student must have a high school diploma or equivalent from within', N'30', N'30', N'40', N'65')
GO
INSERT [dbo].[Specialization] ([Specialization_Id], [Specialization_Name_Ar], [Specialization_Name_En], [Collage_Id], [Condition], [High_School_Percent], [Capabilities_Percent], [My_Achievement_Percent], [Weighted_Ratio_Percent]) VALUES (18, N'بكالوريوس الحاسب الآلي', N'Bachelor of Computer', 4, N'1- The male / female student must have a high school diploma or equivalent from within', N'30', N'30', N'40', N'70')
GO
SET IDENTITY_INSERT [dbo].[Specialization] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

GO
INSERT [dbo].[Status] ([Status_Id], [Status_Name_Ar], [Status_Name_En]) VALUES (1, N'جديدة', N'New')
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Name_Ar], [Status_Name_En]) VALUES (2, N'قيد الانتظار', N'Pending')
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Name_Ar], [Status_Name_En]) VALUES (3, N'مخصصة', N'Assigned')
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Name_Ar], [Status_Name_En]) VALUES (4, N'غير مكتملة', N'Not Complete')
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Name_Ar], [Status_Name_En]) VALUES (5, N'مكتملة البيانات', N'Data Completed')
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Name_Ar], [Status_Name_En]) VALUES (6, N'سداد رسوم التسجيل', N'Pay the Registration Fees')
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Name_Ar], [Status_Name_En]) VALUES (7, N'تم سداد رسوم التسجيل', N'Registration Fee Paid')
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Name_Ar], [Status_Name_En]) VALUES (8, N'حجز موعد اختبار', N'Book a Test Date')
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Name_Ar], [Status_Name_En]) VALUES (9, N'رسوب في الاختبار', N'Failure in the Test')
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Name_Ar], [Status_Name_En]) VALUES (10, N'نجاح في الاختبار', N'Success in the Test')
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Name_Ar], [Status_Name_En]) VALUES (11, N'سداد الرسوم الدراسية', N'Pay the Tuition Fees')
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Name_Ar], [Status_Name_En]) VALUES (12, N'تم سداد الرسوم الدراسية', N'Tuition Fees Paid')
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Name_Ar], [Status_Name_En]) VALUES (13, N'اصدار الرقم الجامعي', N'Issuance University ID')
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Name_Ar], [Status_Name_En]) VALUES (14, N'اكتمال الملف بنجاح', N'File Completed Successfully')
GO
INSERT [dbo].[Status] ([Status_Id], [Status_Name_Ar], [Status_Name_En]) VALUES (15, N'اكتمال الملف بالفشل', N'File Complete with Failure')
GO
SET IDENTITY_INSERT [dbo].[Status] OFF
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
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_Student] FOREIGN KEY([File_Id])
REFERENCES [dbo].[Student] ([Student_Id])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Files_Student]
GO
ALTER TABLE [dbo].[Group_Status]  WITH CHECK ADD  CONSTRAINT [FK_Group_Status_Group] FOREIGN KEY([Group_Status_Id])
REFERENCES [dbo].[Group] ([Group_Id])
GO
ALTER TABLE [dbo].[Group_Status] CHECK CONSTRAINT [FK_Group_Status_Group]
GO
ALTER TABLE [dbo].[Group_Status]  WITH CHECK ADD  CONSTRAINT [FK_Group_Status_Status] FOREIGN KEY([Group_Status_Id])
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
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Specialization] FOREIGN KEY([Student_Specialization_Id])
REFERENCES [dbo].[Specialization] ([Specialization_Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Specialization]
GO
USE [master]
GO
ALTER DATABASE [REU_Registration] SET  READ_WRITE 
GO
