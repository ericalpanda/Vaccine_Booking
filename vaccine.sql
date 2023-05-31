USE [master]
GO
/****** Object:  Database [vaccine]    Script Date: 5/31/2023 3:22:03 PM ******/
CREATE DATABASE [vaccine]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'vaccine', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\vaccine.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'vaccine_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\vaccine_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [vaccine] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [vaccine].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [vaccine] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [vaccine] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [vaccine] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [vaccine] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [vaccine] SET ARITHABORT OFF 
GO
ALTER DATABASE [vaccine] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [vaccine] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [vaccine] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [vaccine] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [vaccine] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [vaccine] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [vaccine] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [vaccine] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [vaccine] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [vaccine] SET  ENABLE_BROKER 
GO
ALTER DATABASE [vaccine] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [vaccine] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [vaccine] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [vaccine] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [vaccine] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [vaccine] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [vaccine] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [vaccine] SET RECOVERY FULL 
GO
ALTER DATABASE [vaccine] SET  MULTI_USER 
GO
ALTER DATABASE [vaccine] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [vaccine] SET DB_CHAINING OFF 
GO
ALTER DATABASE [vaccine] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [vaccine] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [vaccine] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [vaccine] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'vaccine', N'ON'
GO
ALTER DATABASE [vaccine] SET QUERY_STORE = OFF
GO
USE [vaccine]
GO
/****** Object:  Table [dbo].[appointment]    Script Date: 5/31/2023 3:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointment](
	[idAppointment] [int] IDENTITY(1,1) NOT NULL,
	[idUserVaccineA] [nvarchar](45) NOT NULL,
	[idUserBookedA] [nvarchar](45) NOT NULL,
	[idAppoinmentProvisionA] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
	[price] [real] NOT NULL,
 CONSTRAINT [PK_appointment] PRIMARY KEY CLUSTERED 
(
	[idAppointment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[appointment_provision]    Script Date: 5/31/2023 3:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointment_provision](
	[idHAP] [int] NOT NULL,
	[idVaccineAP] [int] NOT NULL,
	[appointmentDateAt] [date] NOT NULL,
	[quantity] [int] NOT NULL,
	[idTimeRangeAP] [int] NOT NULL,
	[idAppointmentProvision] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_appointment_provision] PRIMARY KEY CLUSTERED 
(
	[idAppointmentProvision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hospital]    Script Date: 5/31/2023 3:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hospital](
	[idH] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](45) NOT NULL,
	[address] [varchar](45) NOT NULL,
	[email] [varchar](45) NOT NULL,
	[hotline] [varchar](45) NOT NULL,
	[username] [varchar](45) NOT NULL,
	[password] [varchar](45) NOT NULL,
 CONSTRAINT [PK_hospital] PRIMARY KEY CLUSTERED 
(
	[idH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[time_range]    Script Date: 5/31/2023 3:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[time_range](
	[idTimeRange] [int] IDENTITY(1,1) NOT NULL,
	[startAt] [time](7) NULL,
	[endAt] [time](7) NULL,
 CONSTRAINT [PK_time_range] PRIMARY KEY CLUSTERED 
(
	[idTimeRange] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 5/31/2023 3:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[idUser] [nvarchar](45) NOT NULL,
	[username] [nvarchar](45) NULL,
	[password] [nvarchar](45) NULL,
	[identification] [nvarchar](20) NOT NULL,
	[dob] [date] NOT NULL,
	[gender] [bit] NOT NULL,
	[phone] [nvarchar](12) NOT NULL,
	[email] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vaccine]    Script Date: 5/31/2023 3:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vaccine](
	[idVaccine] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[detail] [varchar](10) NOT NULL,
 CONSTRAINT [PK_vaccine] PRIMARY KEY CLUSTERED 
(
	[idVaccine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vaccine_history]    Script Date: 5/31/2023 3:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vaccine_history](
	[idUserVH] [nvarchar](45) NOT NULL,
	[idVaccineVH] [int] NOT NULL,
	[vaccineAt] [date] NOT NULL,
	[price] [int] NULL,
	[idHVH] [int] NOT NULL,
 CONSTRAINT [PK_vaccine_history] PRIMARY KEY CLUSTERED 
(
	[idUserVH] ASC,
	[idVaccineVH] ASC,
	[vaccineAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vaccine_provision]    Script Date: 5/31/2023 3:22:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vaccine_provision](
	[pricePerService] [real] NOT NULL,
	[idHVP] [int] NOT NULL,
	[idVaccineVP] [int] NOT NULL,
 CONSTRAINT [PK_vaccine_provision] PRIMARY KEY CLUSTERED 
(
	[idHVP] ASC,
	[idVaccineVP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[appointment] ON 

INSERT [dbo].[appointment] ([idAppointment], [idUserVaccineA], [idUserBookedA], [idAppoinmentProvisionA], [status], [price]) VALUES (1, N'123', N'123', 2, N'not come', 90000)
INSERT [dbo].[appointment] ([idAppointment], [idUserVaccineA], [idUserBookedA], [idAppoinmentProvisionA], [status], [price]) VALUES (5, N'999', N'999', 2, N'not come', 90000)
SET IDENTITY_INSERT [dbo].[appointment] OFF
GO
SET IDENTITY_INSERT [dbo].[appointment_provision] ON 

INSERT [dbo].[appointment_provision] ([idHAP], [idVaccineAP], [appointmentDateAt], [quantity], [idTimeRangeAP], [idAppointmentProvision]) VALUES (1, 6, CAST(N'2023-05-28' AS Date), 20, 1, 2)
INSERT [dbo].[appointment_provision] ([idHAP], [idVaccineAP], [appointmentDateAt], [quantity], [idTimeRangeAP], [idAppointmentProvision]) VALUES (1, 6, CAST(N'2023-06-15' AS Date), 30, 1, 3)
SET IDENTITY_INSERT [dbo].[appointment_provision] OFF
GO
SET IDENTITY_INSERT [dbo].[hospital] ON 

INSERT [dbo].[hospital] ([idH], [name], [address], [email], [hotline], [username], [password]) VALUES (1, N'Thang Long', N'Hai Chau ', N'asabitaGmail.com', N'0909909090', N'bvthanglong', N'thanglong1')
SET IDENTITY_INSERT [dbo].[hospital] OFF
GO
SET IDENTITY_INSERT [dbo].[time_range] ON 

INSERT [dbo].[time_range] ([idTimeRange], [startAt], [endAt]) VALUES (1, CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[time_range] OFF
GO
INSERT [dbo].[user] ([idUser], [username], [password], [identification], [dob], [gender], [phone], [email]) VALUES (N'1', N'vu', N'123456', N'123', CAST(N'2002-08-08' AS Date), 1, N'090923810', N'gnsdg@gmail.com')
INSERT [dbo].[user] ([idUser], [username], [password], [identification], [dob], [gender], [phone], [email]) VALUES (N'123', N'123', N'123', N'123', CAST(N'2002-03-20' AS Date), 1, N'0856820345', N'nguyen@gmail.com')
INSERT [dbo].[user] ([idUser], [username], [password], [identification], [dob], [gender], [phone], [email]) VALUES (N'999', N'999', N'999', N'999', CAST(N'2002-03-20' AS Date), 1, N'0856820345', N'nguyendiep@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[vaccine] ON 

INSERT [dbo].[vaccine] ([idVaccine], [name], [detail]) VALUES (2, N'vaccin hasdja', N'sadasdasd')
INSERT [dbo].[vaccine] ([idVaccine], [name], [detail]) VALUES (6, N'vaccin ajksd', N'askdlj a')
INSERT [dbo].[vaccine] ([idVaccine], [name], [detail]) VALUES (7, N'asdkj asjkdn', N'asjdknasn')
INSERT [dbo].[vaccine] ([idVaccine], [name], [detail]) VALUES (9, N'asdasdkl', N'asjkd')
INSERT [dbo].[vaccine] ([idVaccine], [name], [detail]) VALUES (10, N'asda', N'asdklaj')
INSERT [dbo].[vaccine] ([idVaccine], [name], [detail]) VALUES (11, N'asdk', N'asd')
INSERT [dbo].[vaccine] ([idVaccine], [name], [detail]) VALUES (12, N'asd', N'asda')
INSERT [dbo].[vaccine] ([idVaccine], [name], [detail]) VALUES (13, N'ad', N'asd')
SET IDENTITY_INSERT [dbo].[vaccine] OFF
GO
INSERT [dbo].[vaccine_history] ([idUserVH], [idVaccineVH], [vaccineAt], [price], [idHVH]) VALUES (N'1', 6, CAST(N'2023-06-15' AS Date), 129328, 1)
GO
INSERT [dbo].[vaccine_provision] ([pricePerService], [idHVP], [idVaccineVP]) VALUES (900000, 1, 6)
GO
ALTER TABLE [dbo].[appointment]  WITH CHECK ADD  CONSTRAINT [FK_idAppointmentProvisionA] FOREIGN KEY([idAppoinmentProvisionA])
REFERENCES [dbo].[appointment_provision] ([idAppointmentProvision])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[appointment] CHECK CONSTRAINT [FK_idAppointmentProvisionA]
GO
ALTER TABLE [dbo].[appointment]  WITH CHECK ADD  CONSTRAINT [FK_idUserBooked] FOREIGN KEY([idUserBookedA])
REFERENCES [dbo].[user] ([idUser])
GO
ALTER TABLE [dbo].[appointment] CHECK CONSTRAINT [FK_idUserBooked]
GO
ALTER TABLE [dbo].[appointment]  WITH CHECK ADD  CONSTRAINT [FK_idUserVaccineA] FOREIGN KEY([idUserVaccineA])
REFERENCES [dbo].[user] ([idUser])
GO
ALTER TABLE [dbo].[appointment] CHECK CONSTRAINT [FK_idUserVaccineA]
GO
ALTER TABLE [dbo].[appointment_provision]  WITH CHECK ADD  CONSTRAINT [FK_appointment_provision_hospital] FOREIGN KEY([idHAP])
REFERENCES [dbo].[hospital] ([idH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[appointment_provision] CHECK CONSTRAINT [FK_appointment_provision_hospital]
GO
ALTER TABLE [dbo].[appointment_provision]  WITH CHECK ADD  CONSTRAINT [FK_appointment_provision_time_range] FOREIGN KEY([idTimeRangeAP])
REFERENCES [dbo].[time_range] ([idTimeRange])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[appointment_provision] CHECK CONSTRAINT [FK_appointment_provision_time_range]
GO
ALTER TABLE [dbo].[appointment_provision]  WITH CHECK ADD  CONSTRAINT [FK_appointment_provision_vaccine] FOREIGN KEY([idVaccineAP])
REFERENCES [dbo].[vaccine] ([idVaccine])
GO
ALTER TABLE [dbo].[appointment_provision] CHECK CONSTRAINT [FK_appointment_provision_vaccine]
GO
ALTER TABLE [dbo].[vaccine_history]  WITH CHECK ADD  CONSTRAINT [FK_BVVH] FOREIGN KEY([idHVH])
REFERENCES [dbo].[hospital] ([idH])
GO
ALTER TABLE [dbo].[vaccine_history] CHECK CONSTRAINT [FK_BVVH]
GO
ALTER TABLE [dbo].[vaccine_history]  WITH CHECK ADD  CONSTRAINT [FK_idUserVH] FOREIGN KEY([idUserVH])
REFERENCES [dbo].[user] ([idUser])
GO
ALTER TABLE [dbo].[vaccine_history] CHECK CONSTRAINT [FK_idUserVH]
GO
ALTER TABLE [dbo].[vaccine_history]  WITH CHECK ADD  CONSTRAINT [FK_idVaccineVH] FOREIGN KEY([idVaccineVH])
REFERENCES [dbo].[vaccine] ([idVaccine])
GO
ALTER TABLE [dbo].[vaccine_history] CHECK CONSTRAINT [FK_idVaccineVH]
GO
ALTER TABLE [dbo].[vaccine_provision]  WITH CHECK ADD  CONSTRAINT [FK_vaccine_provision_hospital] FOREIGN KEY([idHVP])
REFERENCES [dbo].[hospital] ([idH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[vaccine_provision] CHECK CONSTRAINT [FK_vaccine_provision_hospital]
GO
ALTER TABLE [dbo].[vaccine_provision]  WITH CHECK ADD  CONSTRAINT [FK_vaccine_provision_vaccine] FOREIGN KEY([idVaccineVP])
REFERENCES [dbo].[vaccine] ([idVaccine])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[vaccine_provision] CHECK CONSTRAINT [FK_vaccine_provision_vaccine]
GO
USE [master]
GO
ALTER DATABASE [vaccine] SET  READ_WRITE 
GO
