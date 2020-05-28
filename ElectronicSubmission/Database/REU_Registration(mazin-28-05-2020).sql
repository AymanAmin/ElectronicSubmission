USE [master]
GO
/****** Object:  Database [REU_Registration]    Script Date: 5/28/2020 7:18:44 PM ******/
CREATE DATABASE [REU_Registration]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'REU_Registration', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\REU_Registration.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'REU_Registration_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\REU_Registration_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [REU_Registration] SET COMPATIBILITY_LEVEL = 140
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
EXEC sys.sp_db_vardecimal_storage_format N'REU_Registration', N'ON'
GO
ALTER DATABASE [REU_Registration] SET QUERY_STORE = OFF
GO
USE [REU_Registration]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [REU_Registration]
GO
/****** Object:  Table [dbo].[Collage]    Script Date: 5/28/2020 7:18:44 PM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 5/28/2020 7:18:45 PM ******/
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
/****** Object:  Table [dbo].[Files]    Script Date: 5/28/2020 7:18:45 PM ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 5/28/2020 7:18:45 PM ******/
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
/****** Object:  Table [dbo].[Group_Status]    Script Date: 5/28/2020 7:18:45 PM ******/
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
/****** Object:  Table [dbo].[LanguageMaster]    Script Date: 5/28/2020 7:18:45 PM ******/
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
/****** Object:  Table [dbo].[Lanuage_Detials]    Script Date: 5/28/2020 7:18:45 PM ******/
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
/****** Object:  Table [dbo].[Log_File]    Script Date: 5/28/2020 7:18:45 PM ******/
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
/****** Object:  Table [dbo].[Nationality]    Script Date: 5/28/2020 7:18:45 PM ******/
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
/****** Object:  Table [dbo].[Notification_Employee]    Script Date: 5/28/2020 7:18:45 PM ******/
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
/****** Object:  Table [dbo].[Notification_Master]    Script Date: 5/28/2020 7:18:45 PM ******/
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
/****** Object:  Table [dbo].[Notification_Show]    Script Date: 5/28/2020 7:18:45 PM ******/
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
/****** Object:  Table [dbo].[Permission]    Script Date: 5/28/2020 7:18:45 PM ******/
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
/****** Object:  Table [dbo].[Permission_Group]    Script Date: 5/28/2020 7:18:45 PM ******/
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
/****** Object:  Table [dbo].[Resource]    Script Date: 5/28/2020 7:18:46 PM ******/
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
/****** Object:  Table [dbo].[Sequence]    Script Date: 5/28/2020 7:18:46 PM ******/
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
/****** Object:  Table [dbo].[Specialization]    Script Date: 5/28/2020 7:18:46 PM ******/
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
 CONSTRAINT [PK_Specialization] PRIMARY KEY CLUSTERED 
(
	[Specialization_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 5/28/2020 7:18:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Status_Id] [int] IDENTITY(1,1) NOT NULL,
	[Status_Code] [int] NULL,
	[Status_Name_Ar] [nvarchar](max) NULL,
	[Status_Name_En] [nvarchar](max) NULL,
	[Suspended] [int] NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/28/2020 7:18:46 PM ******/
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
	[Student_Image_Profile] [nvarchar](50) NULL,
	[Student_Specialization_Id] [int] NULL,
	[Student_Nationality_Id] [int] NULL,
	[Student_Resource_Id] [int] NULL,
	[Student_Status_Id] [int] NULL,
	[Student_Total] [nvarchar](50) NULL,
	[Notes] [nvarchar](50) NULL,
	[Suspended] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Student_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
