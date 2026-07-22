USE [master]
GO
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'DormitoryManagement')
BEGIN
    ALTER DATABASE [DormitoryManagement] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [DormitoryManagement];
END
GO
CREATE DATABASE [DormitoryManagement];
GO
USE [DormitoryManagement];
GO
CREATE TABLE [dbo].[addresses](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ward_id] [bigint] NOT NULL,
	[specific_address] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[beds]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[beds](
	[bed_number] [int] NOT NULL,
	[created_at] [datetimeoffset](6) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[room_id] [bigint] NOT NULL,
	[updated_at] [datetimeoffset](6) NULL,
	[status] [varchar](20) NOT NULL,
	[created_by] [varchar](255) NULL,
	[updated_by] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bills]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bills](
	[amount] [numeric](38, 2) NOT NULL,
	[issue_date] [date] NOT NULL,
	[payment_deadline] [date] NOT NULL,
	[created_at] [datetimeoffset](6) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[semester_id] [bigint] NOT NULL,
	[student_id] [bigint] NOT NULL,
	[updated_at] [datetimeoffset](6) NULL,
	[bill_type] [varchar](20) NOT NULL,
	[status] [varchar](20) NOT NULL,
	[bill_code] [varchar](50) NOT NULL,
	[created_by] [varchar](255) NULL,
	[description] [nvarchar](500) NULL,
	[updated_by] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cities](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contracts]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contracts](
	[price] [numeric](38, 2) NOT NULL,
	[bed_id] [bigint] NOT NULL,
	[checked_out_at] [datetime2](6) NULL,
	[checked_out_by] [bigint] NULL,
	[created_at] [datetimeoffset](6) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[semester_id] [bigint] NOT NULL,
	[student_id] [bigint] NOT NULL,
	[updated_at] [datetimeoffset](6) NULL,
	[status] [varchar](30) NOT NULL,
	[contract_code] [varchar](50) NOT NULL,
	[created_by] [varchar](255) NULL,
	[updated_by] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dormitory_buildings]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dormitory_buildings](
	[created_at] [datetimeoffset](6) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[manager_id] [bigint] NULL,
	[updated_at] [datetimeoffset](6) NULL,
	[gender_type] [varchar](20) NOT NULL,
	[status] [varchar](20) NOT NULL,
	[created_by] [varchar](255) NULL,
	[name] [nvarchar](100) NULL,
	[updated_by] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[floors]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[floors](
	[floor_number] [int] NOT NULL,
	[building_id] [bigint] NOT NULL,
	[created_at] [datetimeoffset](6) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[updated_at] [datetimeoffset](6) NULL,
	[status] [varchar](20) NOT NULL,
	[created_by] [varchar](255) NULL,
	[updated_by] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[issue_reports]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[issue_reports](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[created_at] [datetimeoffset](6) NULL,
	[created_by] [varchar](255) NULL,
	[updated_at] [datetimeoffset](6) NULL,
	[updated_by] [varchar](255) NULL,
	[category] [varchar](50) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[staff_note] [nvarchar](1000) NULL,
	[status] [varchar](20) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[room_id] [bigint] NOT NULL,
	[student_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notifications]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notifications](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[created_at] [datetimeoffset](6) NULL,
	[created_by] [varchar](255) NULL,
	[updated_at] [datetimeoffset](6) NULL,
	[updated_by] [varchar](255) NULL,
	[category] [varchar](30) NOT NULL,
	[content] [nvarchar](4000) NULL,
	[target_type] [varchar](20) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[sender_id] [bigint] NOT NULL,
	[target_building_id] [bigint] NULL,
	[target_student_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_transactions]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_transactions](
	[amount] [numeric](38, 2) NOT NULL,
	[bill_id] [bigint] NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[payment_date] [datetime2](6) NOT NULL,
	[status] [varchar](20) NOT NULL,
	[payment_method] [varchar](30) NOT NULL,
	[txn_ref] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permissions]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[permission_key] [varchar](100) NOT NULL,
	[description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role_permissions]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_permissions](
	[created_at] [datetimeoffset](6) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[permission_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL,
	[updated_at] [datetimeoffset](6) NULL,
	[created_by] [varchar](255) NULL,
	[updated_by] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](50) NOT NULL,
	[description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room_types]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room_types](
	[price] [numeric](38, 2) NOT NULL,
	[created_at] [datetimeoffset](6) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[updated_at] [datetimeoffset](6) NULL,
	[created_by] [varchar](255) NULL,
	[description] [nvarchar](500) NULL,
	[type_name] [nvarchar](100) NULL,
	[updated_by] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rooms]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rooms](
	[current_occupancy] [int] NOT NULL,
	[max_beds] [int] NOT NULL,
	[created_at] [datetimeoffset](6) NULL,
	[floor_id] [bigint] NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[room_type_id] [bigint] NOT NULL,
	[updated_at] [datetimeoffset](6) NULL,
	[room_number] [varchar](10) NOT NULL,
	[status] [varchar](20) NOT NULL,
	[created_by] [varchar](255) NULL,
	[updated_by] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[semesters]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[semesters](
	[end_date] [date] NOT NULL,
	[is_active] [bit] NOT NULL,
	[start_date] [date] NOT NULL,
	[created_at] [datetimeoffset](6) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[updated_at] [datetimeoffset](6) NULL,
	[created_by] [varchar](255) NULL,
	[name] [nvarchar](50) NULL,
	[updated_by] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_profiles]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_profiles](
	[created_at] [datetimeoffset](6) NULL,
	[updated_at] [datetimeoffset](6) NULL,
	[user_id] [bigint] NOT NULL,
	[academic_year] [varchar](10) NULL,
	[student_code] [varchar](20) NOT NULL,
	[created_by] [varchar](255) NULL,
	[major] [nvarchar](200) NULL,
	[updated_by] [varchar](255) NULL,
	[parent_phone] [varchar](15) NULL,
	[student_status] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_whitelists]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_whitelists](
	[is_registered] [bit] NOT NULL,
	[created_at] [datetimeoffset](6) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[semester_id] [bigint] NOT NULL,
	[updated_at] [datetimeoffset](6) NULL,
	[gender] [varchar](10) NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[student_code] [varchar](20) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[created_by] [varchar](255) NULL,
	[full_name] [nvarchar](200) NULL,
	[major] [nvarchar](200) NULL,
	[updated_by] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_roles]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_roles](
	[created_at] [datetimeoffset](6) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[role_id] [bigint] NOT NULL,
	[updated_at] [datetimeoffset](6) NULL,
	[user_id] [bigint] NOT NULL,
	[created_by] [varchar](255) NULL,
	[updated_by] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[dob] [date] NULL,
	[is_active] [bit] NOT NULL,
	[address_id] [bigint] NULL,
	[created_at] [datetimeoffset](6) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[updated_at] [datetimeoffset](6) NULL,
	[gender] [varchar](10) NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[avatar] [varchar](500) NULL,
	[created_by] [varchar](255) NULL,
	[email] [varchar](255) NOT NULL,
	[first_name] [nvarchar](255) NOT NULL,
	[last_name] [nvarchar](255) NOT NULL,
	[middle_name] [nvarchar](255) NULL,
	[password_hash] [varchar](255) NOT NULL,
	[updated_by] [varchar](255) NULL,
	[building_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[utility_usages]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[utility_usages](
	[end_electricity] [int] NOT NULL,
	[end_water] [int] NOT NULL,
	[recorded_month] [int] NOT NULL,
	[recorded_year] [int] NOT NULL,
	[start_electricity] [int] NOT NULL,
	[start_water] [int] NOT NULL,
	[created_at] [datetimeoffset](6) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[recorded_at] [datetime2](6) NULL,
	[recorded_by] [bigint] NULL,
	[room_id] [bigint] NOT NULL,
	[semester_id] [bigint] NOT NULL,
	[updated_at] [datetimeoffset](6) NULL,
	[created_by] [varchar](255) NULL,
	[updated_by] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wards]    Script Date: 22/07/2026 9:04:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wards](
	[city_id] [bigint] NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[addresses] ON
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (1, 1, N'Khu CNC Hoa Lac, Thach That (Address 1)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (2, 2, N'Khu CNC Hoa Lac, Thach That (Address 2)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (3, 1, N'Khu CNC Hoa Lac, Thach That (Address 3)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (4, 2, N'Khu CNC Hoa Lac, Thach That (Address 4)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (5, 1, N'Khu CNC Hoa Lac, Thach That (Address 5)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (6, 2, N'Khu CNC Hoa Lac, Thach That (Address 6)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (7, 1, N'Khu CNC Hoa Lac, Thach That (Address 7)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (8, 2, N'Khu CNC Hoa Lac, Thach That (Address 8)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (9, 1, N'Khu CNC Hoa Lac, Thach That (Address 9)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (10, 2, N'Khu CNC Hoa Lac, Thach That (Address 10)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (11, 1, N'Khu CNC Hoa Lac, Thach That (Address 11)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (12, 2, N'Khu CNC Hoa Lac, Thach That (Address 12)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (13, 1, N'Khu CNC Hoa Lac, Thach That (Address 13)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (14, 2, N'Khu CNC Hoa Lac, Thach That (Address 14)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (15, 1, N'Khu CNC Hoa Lac, Thach That (Address 15)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (16, 2, N'Khu CNC Hoa Lac, Thach That (Address 16)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (17, 1, N'Khu CNC Hoa Lac, Thach That (Address 17)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (18, 2, N'Khu CNC Hoa Lac, Thach That (Address 18)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (19, 1, N'Khu CNC Hoa Lac, Thach That (Address 19)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (20, 2, N'Khu CNC Hoa Lac, Thach That (Address 20)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (21, 1, N'Khu CNC Hoa Lac, Thach That (Address 21)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (22, 2, N'Khu CNC Hoa Lac, Thach That (Address 22)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (23, 1, N'Khu CNC Hoa Lac, Thach That (Address 23)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (24, 2, N'Khu CNC Hoa Lac, Thach That (Address 24)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (25, 1, N'Khu CNC Hoa Lac, Thach That (Address 25)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (26, 2, N'Khu CNC Hoa Lac, Thach That (Address 26)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (27, 1, N'Khu CNC Hoa Lac, Thach That (Address 27)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (28, 2, N'Khu CNC Hoa Lac, Thach That (Address 28)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (29, 1, N'Khu CNC Hoa Lac, Thach That (Address 29)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (30, 2, N'Khu CNC Hoa Lac, Thach That (Address 30)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (31, 1, N'Khu CNC Hoa Lac, Thach That (Address 31)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (32, 2, N'Khu CNC Hoa Lac, Thach That (Address 32)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (33, 1, N'Khu CNC Hoa Lac, Thach That (Address 33)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (34, 2, N'Khu CNC Hoa Lac, Thach That (Address 34)')
INSERT [dbo].[addresses] ([id], [ward_id], [specific_address]) VALUES (35, 1, N'Khu CNC Hoa Lac, Thach That (Address 35)')
SET IDENTITY_INSERT [dbo].[addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[cities] ON 
INSERT [dbo].[cities] ([id], [name]) VALUES (8, N'Bắc Giang')
INSERT [dbo].[cities] ([id], [name]) VALUES (9, N'Bắc Kạn')
INSERT [dbo].[cities] ([id], [name]) VALUES (18, N'Bắc Ninh')
INSERT [dbo].[cities] ([id], [name]) VALUES (32, N'Bình Định')
INSERT [dbo].[cities] ([id], [name]) VALUES (5, N'Cần Thơ')
INSERT [dbo].[cities] ([id], [name]) VALUES (10, N'Cao Bằng')
INSERT [dbo].[cities] ([id], [name]) VALUES (4, N'Đà Nẵng')
INSERT [dbo].[cities] ([id], [name]) VALUES (11, N'Điện Biên')
INSERT [dbo].[cities] ([id], [name]) VALUES (22, N'Hà Nam')
INSERT [dbo].[cities] ([id], [name]) VALUES (1, N'Hà Nội')
INSERT [dbo].[cities] ([id], [name]) VALUES (27, N'Hà Tĩnh')
INSERT [dbo].[cities] ([id], [name]) VALUES (19, N'Hải Dương')
INSERT [dbo].[cities] ([id], [name]) VALUES (3, N'Hải Phòng')
INSERT [dbo].[cities] ([id], [name]) VALUES (2, N'Hồ Chí Minh')
INSERT [dbo].[cities] ([id], [name]) VALUES (21, N'Hòa Bình')
INSERT [dbo].[cities] ([id], [name]) VALUES (20, N'Hưng Yên')
INSERT [dbo].[cities] ([id], [name]) VALUES (34, N'Khánh Hòa')
INSERT [dbo].[cities] ([id], [name]) VALUES (12, N'Lai Châu')
INSERT [dbo].[cities] ([id], [name]) VALUES (17, N'Lạng Sơn')
INSERT [dbo].[cities] ([id], [name]) VALUES (13, N'Lào Cai')
INSERT [dbo].[cities] ([id], [name]) VALUES (23, N'Nam Định')
INSERT [dbo].[cities] ([id], [name]) VALUES (26, N'Nghệ An')
INSERT [dbo].[cities] ([id], [name]) VALUES (24, N'Ninh Bình')
INSERT [dbo].[cities] ([id], [name]) VALUES (33, N'Phú Yên')
INSERT [dbo].[cities] ([id], [name]) VALUES (28, N'Quảng Bình')
INSERT [dbo].[cities] ([id], [name]) VALUES (30, N'Quảng Nam')
INSERT [dbo].[cities] ([id], [name]) VALUES (31, N'Quảng Ngãi')
INSERT [dbo].[cities] ([id], [name]) VALUES (7, N'Quảng Ninh')
INSERT [dbo].[cities] ([id], [name]) VALUES (29, N'Quảng Trị')
INSERT [dbo].[cities] ([id], [name]) VALUES (16, N'Thái Nguyên')
INSERT [dbo].[cities] ([id], [name]) VALUES (25, N'Thanh Hóa')
INSERT [dbo].[cities] ([id], [name]) VALUES (6, N'Thừa Thiên Huế')
INSERT [dbo].[cities] ([id], [name]) VALUES (14, N'Tuyên Quang')
INSERT [dbo].[cities] ([id], [name]) VALUES (15, N'Yên Bái')
SET IDENTITY_INSERT [dbo].[cities] OFF
GO
SET IDENTITY_INSERT [dbo].[wards] ON 
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 1, N'Phúc Xá')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 2, N'Trúc Bạch')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 3, N'Vĩnh Phúc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 4, N'Cống Vị')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 5, N'Liễu Giai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 6, N'Nguyễn Trung Trực')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 7, N'Quán Thánh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 8, N'Ngọc Hà')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 9, N'Đội Cấn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 10, N'Kim Mã')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 11, N'Giảng Võ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 12, N'Thành Công')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 13, N'Điện Biên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 14, N'Hàng Bạc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 15, N'Hàng Đào')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 16, N'Hàng Ngang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 17, N'Hàng Đường')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 18, N'Hàng Đồng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 19, N'Hàng Hòm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 20, N'Hàng Trống')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 21, N'Hàng Bông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 22, N'Hàng Gai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 23, N'Cửa Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 24, N'Hàng Mã')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 25, N'Hàng Bồ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 26, N'Cửa Nam')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 27, N'Trần Hưng Đạo')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 28, N'Phan Chu Trinh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 29, N'Lý Thái Tổ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 30, N'Đồng Xuân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 31, N'Hàng Buồm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 32, N'Hàng Chiếu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 33, N'Hàng Khay')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 34, N'Tràng Tiền')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 35, N'Nguyễn Du')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 36, N'Bùi Thị Xuân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 37, N'Ngô Thì Nhậm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 38, N'Phạm Đình Hổ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 39, N'Đồng Nhân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 40, N'Đống Mác')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 41, N'Bạch Đằng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 42, N'Thanh Lương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 43, N'Thanh Nhàn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 44, N'Cầu Dền')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 45, N'Bách Khoa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 46, N'Đồng Tâm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 47, N'Quỳnh Lôi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 48, N'Quỳnh Mai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 49, N'Minh Khai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 50, N'Trương Định')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 51, N'Vĩnh Tuy')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 52, N'Thượng Đình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 53, N'Kim Giang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 54, N'Khương Đình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 55, N'Khương Mai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 56, N'Khương Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 57, N'Hạ Đình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 58, N'Nhân Chính')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 59, N'Thanh Xuân Nam')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 60, N'Thanh Xuân Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 61, N'Thanh Xuân Bắc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 62, N'Phương Liệt')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 63, N'Dịch Vọng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 64, N'Dịch Vọng Hậu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 65, N'Quan Hoa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 66, N'Nghĩa Đô')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 67, N'Nghĩa Tân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 68, N'Mai Dịch')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 69, N'Yên Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 70, N'Trung Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 71, N'Cát Linh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 72, N'Văn Miếu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 73, N'Quốc Tử Giám')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 74, N'Hàng Bột')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 75, N'Nam Đồng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 76, N'Trung Phụng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 77, N'Khâm Thiên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 78, N'Phương Liên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 79, N'Phương Mai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 80, N'Khương Thượng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 81, N'Ngã Tư Sở')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 82, N'Thịnh Quang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 83, N'Trung Liệt')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 84, N'Ô Chợ Dừa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 85, N'Quang Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 86, N'Láng Hạ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 87, N'Láng Thượng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 88, N'Thổ Quan')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 89, N'Trung Tự')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 90, N'Kim Liên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 91, N'Hoàng Liệt')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 92, N'Yên Sở')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 93, N'Vĩnh Hưng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 94, N'Định Công')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 95, N'Đại Kim')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 96, N'Thịnh Liệt')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 97, N'Thanh Trì')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 98, N'Lĩnh Nam')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 99, N'Trần Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 100, N'Tân Mai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 101, N'Tương Mai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 102, N'Giáp Bát')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 103, N'Hoàng Văn Thụ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 104, N'Mai Động')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 105, N'Thượng Thanh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 106, N'Đức Giang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 107, N'Giang Biên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 108, N'Ngọc Thụy')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 109, N'Ngọc Lâm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 110, N'Gia Thụy')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 111, N'Bồ Đề')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 112, N'Long Biên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 113, N'Thạch Bàn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 114, N'Phúc Lợi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 115, N'Sài Đồng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 116, N'Phúc Đồng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 117, N'Cự Khối')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 118, N'Quảng An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 119, N'Tứ Liên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 120, N'Nhật Tân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 121, N'Phú Thượng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 122, N'Xuân La')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 123, N'Bưởi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 124, N'Thụy Khuê')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 125, N'Yên Phụ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 126, N'Mộ Lao')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 127, N'Văn Quán')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 128, N'Vạn Phúc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 129, N'Yết Kiêu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 130, N'Nguyễn Trãi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 131, N'Hà Cầu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 132, N'Phúc La')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 133, N'Phú La')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 134, N'Phú Lãm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 135, N'Phú Lương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 136, N'Kiến Hưng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 137, N'Yên Nghĩa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 138, N'Đồng Mai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 139, N'Biên Giang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 140, N'Dương Nội')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 141, N'La Khê')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 142, N'Xuân Phương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 143, N'Phương Canh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 144, N'Mỹ Đình 1')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 145, N'Mỹ Đình 2')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 146, N'Cầu Diễn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 147, N'Tây Mỗ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 148, N'Đại Mỗ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 149, N'Trung Văn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 150, N'Thượng Cát')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 151, N'Liên Mạc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 152, N'Thụy Phương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 153, N'Đức Thắng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 154, N'Đông Ngạc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 155, N'Xuân Đỉnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 156, N'Xuân Tảo')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 157, N'Cổ Nhuế 1')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 158, N'Cổ Nhuế 2')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 159, N'Phúc Diễn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 160, N'Phú Diễn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 161, N'Minh Khai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 162, N'Tây Tựu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 163, N'Bến Nghé')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 164, N'Bến Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 165, N'Cô Giang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 166, N'Cầu Kho')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 167, N'Cầu Ông Lãnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 168, N'Đa Kao')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 169, N'Nguyễn Thái Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 170, N'Nguyễn Cư Trinh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 171, N'Phạm Ngũ Lão')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 172, N'Tân Định')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 173, N'Phường 1 (Q3)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 174, N'Phường 2 (Q3)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 175, N'Phường 3 (Q3)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 176, N'Phường 4 (Q3)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 177, N'Phường 5 (Q3)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 178, N'Võ Thị Sáu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 179, N'Phường 9 (Q3)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 180, N'Phường 10 (Q3)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 181, N'Phường 11 (Q3)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 182, N'Phường 12 (Q3)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 183, N'Phường 13 (Q3)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 184, N'Phường 14 (Q3)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 185, N'Phường 1 (Q4)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 186, N'Phường 2 (Q4)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 187, N'Phường 3 (Q4)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 188, N'Phường 4 (Q4)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 189, N'Phường 6 (Q4)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 190, N'Phường 8 (Q4)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 191, N'Phường 9 (Q4)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 192, N'Phường 10 (Q4)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 193, N'Phường 13 (Q4)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 194, N'Phường 14 (Q4)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 195, N'Phường 15 (Q4)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 196, N'Phường 16 (Q4)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 197, N'Phường 1 (Q5)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 198, N'Phường 2 (Q5)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 199, N'Phường 3 (Q5)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 200, N'Phường 4 (Q5)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 201, N'Phường 5 (Q5)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 202, N'Phường 6 (Q5)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 203, N'Phường 7 (Q5)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 204, N'Phường 8 (Q5)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 205, N'Phường 9 (Q5)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 206, N'Phường 10 (Q5)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 207, N'Phường 11 (Q5)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 208, N'Phường 12 (Q5)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 209, N'Phường 13 (Q5)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 210, N'Phường 14 (Q5)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 211, N'Phường 1 (Q6)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 212, N'Phường 2 (Q6)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 213, N'Phường 3 (Q6)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 214, N'Phường 4 (Q6)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 215, N'Phường 5 (Q6)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 216, N'Phường 6 (Q6)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 217, N'Phường 7 (Q6)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 218, N'Phường 8 (Q6)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 219, N'Phường 9 (Q6)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 220, N'Phường 10 (Q6)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 221, N'Phường 11 (Q6)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 222, N'Phường 12 (Q6)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 223, N'Phường 13 (Q6)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 224, N'Phường 14 (Q6)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 225, N'Tân Thuận Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 226, N'Tân Thuận Tây')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 227, N'Tân Kiểng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 228, N'Tân Hưng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 229, N'Tân Quy')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 230, N'Tân Phong')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 231, N'Tân Phú (Q7)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 232, N'Bình Thuận')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 233, N'Phú Thuận')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 234, N'Phú Mỹ (Q7)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 235, N'Phường 1 (Q8)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 236, N'Phường 2 (Q8)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 237, N'Phường 3 (Q8)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 238, N'Phường 4 (Q8)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 239, N'Phường 5 (Q8)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 240, N'Phường 6 (Q8)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 241, N'Phường 7 (Q8)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 242, N'Phường 8 (Q8)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 243, N'Phường 9 (Q8)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 244, N'Phường 10 (Q8)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 245, N'Phường 11 (Q8)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 246, N'Phường 12 (Q8)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 247, N'Phường 13 (Q8)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 248, N'Phường 14 (Q8)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 249, N'Phường 15 (Q8)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 250, N'Phường 16 (Q8)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 251, N'Phường 1 (Q10)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 252, N'Phường 2 (Q10)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 253, N'Phường 4 (Q10)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 254, N'Phường 5 (Q10)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 255, N'Phường 6 (Q10)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 256, N'Phường 7 (Q10)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 257, N'Phường 8 (Q10)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 258, N'Phường 9 (Q10)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 259, N'Phường 10 (Q10)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 260, N'Phường 11 (Q10)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 261, N'Phường 12 (Q10)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 262, N'Phường 13 (Q10)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 263, N'Phường 14 (Q10)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 264, N'Phường 15 (Q10)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 265, N'Phường 1 (Q11)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 266, N'Phường 2 (Q11)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 267, N'Phường 3 (Q11)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 268, N'Phường 4 (Q11)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 269, N'Phường 5 (Q11)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 270, N'Phường 6 (Q11)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 271, N'Phường 7 (Q11)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 272, N'Phường 8 (Q11)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 273, N'Phường 9 (Q11)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 274, N'Phường 10 (Q11)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 275, N'Phường 11 (Q11)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 276, N'Phường 12 (Q11)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 277, N'Phường 13 (Q11)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 278, N'Phường 14 (Q11)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 279, N'Phường 15 (Q11)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 280, N'Phường 16 (Q11)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 281, N'Thạnh Xuân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 282, N'Thạnh Lộc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 283, N'Hiệp Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 284, N'Thới An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 285, N'Tân Chánh Hiệp')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 286, N'Tân Thới Hiệp')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 287, N'Tân Thới Nhất')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 288, N'Tân Hưng Thuận')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 289, N'Đông Hưng Thuận')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 290, N'Trung Mỹ Tây')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 291, N'An Phú Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 292, N'Bình Hưng Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 293, N'Bình Hưng Hòa A')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 294, N'Bình Hưng Hòa B')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 295, N'Bình Trị Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 296, N'Bình Trị Đông A')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 297, N'Bình Trị Đông B')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 298, N'Tân Tạo')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 299, N'Tân Tạo A')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 300, N'An Lạc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 301, N'An Lạc A')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 302, N'Phường 1 (Bình Thạnh)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 303, N'Phường 2 (Bình Thạnh)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 304, N'Phường 3 (Bình Thạnh)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 305, N'Phường 5 (Bình Thạnh)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 306, N'Phường 6 (Bình Thạnh)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 307, N'Phường 12 (Bình Thạnh)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 308, N'Phường 13 (Bình Thạnh)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 309, N'Phường 14 (Bình Thạnh)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 310, N'Phường 15 (Bình Thạnh)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 311, N'Phường 17 (Bình Thạnh)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 312, N'Phường 19 (Bình Thạnh)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 313, N'Phường 21 (Bình Thạnh)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 314, N'Phường 22 (Bình Thạnh)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 315, N'Phường 24 (Bình Thạnh)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 316, N'Phường 25 (Bình Thạnh)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 317, N'Phường 26 (Bình Thạnh)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 318, N'Phường 27 (Bình Thạnh)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 319, N'Phường 1 (Gò Vấp)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 320, N'Phường 3 (Gò Vấp)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 321, N'Phường 4 (Gò Vấp)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 322, N'Phường 5 (Gò Vấp)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 323, N'Phường 6 (Gò Vấp)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 324, N'Phường 7 (Gò Vấp)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 325, N'Phường 8 (Gò Vấp)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 326, N'Phường 9 (Gò Vấp)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 327, N'Phường 10 (Gò Vấp)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 328, N'Phường 11 (Gò Vấp)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 329, N'Phường 12 (Gò Vấp)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 330, N'Phường 13 (Gò Vấp)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 331, N'Phường 14 (Gò Vấp)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 332, N'Phường 15 (Gò Vấp)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 333, N'Phường 16 (Gò Vấp)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 334, N'Phường 1 (Phú Nhuận)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 335, N'Phường 2 (Phú Nhuận)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 336, N'Phường 3 (Phú Nhuận)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 337, N'Phường 4 (Phú Nhuận)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 338, N'Phường 5 (Phú Nhuận)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 339, N'Phường 7 (Phú Nhuận)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 340, N'Phường 8 (Phú Nhuận)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 341, N'Phường 9 (Phú Nhuận)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 342, N'Phường 10 (Phú Nhuận)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 343, N'Phường 11 (Phú Nhuận)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 344, N'Phường 13 (Phú Nhuận)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 345, N'Phường 15 (Phú Nhuận)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 346, N'Phường 17 (Phú Nhuận)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 347, N'Phường 1 (Tân Bình)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 348, N'Phường 2 (Tân Bình)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 349, N'Phường 3 (Tân Bình)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 350, N'Phường 4 (Tân Bình)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 351, N'Phường 5 (Tân Bình)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 352, N'Phường 6 (Tân Bình)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 353, N'Phường 7 (Tân Bình)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 354, N'Phường 8 (Tân Bình)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 355, N'Phường 9 (Tân Bình)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 356, N'Phường 10 (Tân Bình)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 357, N'Phường 11 (Tân Bình)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 358, N'Phường 12 (Tân Bình)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 359, N'Phường 13 (Tân Bình)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 360, N'Phường 14 (Tân Bình)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 361, N'Phường 15 (Tân Bình)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 362, N'Tân Sơn Nhì')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 363, N'Tân Quý')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 364, N'Tân Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 365, N'Tân Thới Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 366, N'Hiệp Tân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 367, N'Phú Thọ Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 368, N'Phú Thạnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 369, N'Phú Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 370, N'Hòa Thạnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 371, N'Sơn Kỳ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 372, N'Linh Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 373, N'Linh Tây')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 374, N'Linh Chiểu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 375, N'Linh Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 376, N'Linh Xuân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 377, N'Hiệp Bình Chánh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 378, N'Hiệp Bình Phước')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 379, N'Tam Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 380, N'Tam Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 381, N'Bình Chiểu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 382, N'Trường Thọ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 383, N'Sở Dầu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 384, N'Hoàng Văn Thụ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 385, N'An Biên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 386, N'Minh Khai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 387, N'Phan Bội Châu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 388, N'Thượng Lý')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 389, N'Hạ Lý')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 390, N'Trại Chuối')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 391, N'Quán Toan')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 392, N'Hùng Vương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 393, N'Cát Dài')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 394, N'An Dương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 395, N'Trần Nguyên Hãn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 396, N'Hồ Nam')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 397, N'Trại Cau')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 398, N'Dư Hàng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 399, N'Dư Hàng Kênh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 400, N'Kênh Dương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 401, N'Vĩnh Niệm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 402, N'Nghĩa Xá')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 403, N'Cầu Đất')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 404, N'Vạn Mỹ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 405, N'Cầu Tre')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 406, N'Lạc Viên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 407, N'Máy Chai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 408, N'Máy Tơ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 409, N'Gia Viên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 410, N'Đông Khê')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 411, N'Đằng Giang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 412, N'Lạch Tray')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 413, N'Đằng Lâm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 414, N'Đằng Hải')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 415, N'Đông Hải 1')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 416, N'Đông Hải 2')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 417, N'Thành Tô')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 418, N'Tràng Cát')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 419, N'Nam Hải')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 420, N'Cát Bi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 421, N'Quán Trữ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 422, N'Đồng Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 423, N'Lãm Hà')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 424, N'Bắc Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 425, N'Ngọc Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 426, N'Trần Thành Ngọ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 427, N'Văn Đẩu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 428, N'Phù Liễn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 429, N'Tràng Minh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 430, N'Vạn Hương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 431, N'Vạn Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 432, N'Hải Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 433, N'Ngọc Xuyên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 434, N'Bàng La')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 435, N'Anh Dũng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 436, N'Hưng Đạo')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 437, N'Đa Phúc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 438, N'Hòa Nghĩa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 439, N'Tân Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (3, 440, N'Hải Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 441, N'Hải Châu I')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 442, N'Hải Châu II')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 443, N'Phước Ninh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 444, N'Hòa Phước')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 445, N'Nam Dương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 446, N'Thạch Thang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 447, N'Thanh Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 448, N'Thuận Phước')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 449, N'Hòa Thuận Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 450, N'Hòa Thuận Tây')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 451, N'Hòa Cường Bắc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 452, N'Hòa Cường Nam')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 453, N'Thanh Khê Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 454, N'Thanh Khê Tây')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 455, N'Xuân Hà')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 456, N'Tam Thuận')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 457, N'Chính Gián')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 458, N'Thạc Gián')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 459, N'An Khê')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 460, N'Hòa Khê')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 461, N'Tân Chính')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 462, N'Vĩnh Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 463, N'Thọ Quang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 464, N'Mân Thái')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 465, N'Phước Mỹ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 466, N'An Hải Bắc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 467, N'An Hải Tây')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 468, N'An Hải Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 469, N'Nại Hiên Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 470, N'Khuê Mỹ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 471, N'Mỹ An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 472, N'Hòa Quý')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 473, N'Hòa Hải')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 474, N'Hòa Hiệp Bắc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 475, N'Hòa Hiệp Nam')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 476, N'Hòa Khánh Bắc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 477, N'Hòa Khánh Nam')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 478, N'Hòa Minh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 479, N'Khuê Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 480, N'Hòa Phát')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 481, N'Hòa An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 482, N'Hòa Thọ Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 483, N'Hòa Thọ Tây')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 484, N'Hòa Xuân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (4, 485, N'Hòa Tiến')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 486, N'An Cư')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 487, N'An Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 488, N'An Khánh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 489, N'An Lạc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 490, N'An Nghiệp')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 491, N'An Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 492, N'An Thới')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 493, N'Cái Khế')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 494, N'Hưng Lợi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 495, N'Thới Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 496, N'Xuân Khánh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 497, N'Bình Thủy')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 498, N'Trà An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 499, N'Trà Nóc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 500, N'Long Tuyền')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 501, N'Long Tuyền')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 502, N'Thới An Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 503, N'Lê Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 504, N'Hưng Thạnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 505, N'Hưng Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 506, N'Ba Láng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 507, N'Thường Thạnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 508, N'Tân Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 509, N'Phước Thới')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 510, N'Trường Lạc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 511, N'Thới Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 512, N'Thới Long')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 513, N'Thốt Nốt')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 514, N'Thuận An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 515, N'Thuận Hưng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 516, N'Trung Kiên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 517, N'Trung Nhất')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 518, N'Tân Lộc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 519, N'Thới Thạnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (5, 520, N'Đông Thuận')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 521, N'An Cựu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 522, N'An Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 523, N'An Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 524, N'An Tây')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 525, N'Hương Sơ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 526, N'Kim Long')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 527, N'Phú Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 528, N'Phú Cát')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 529, N'Phú Hậu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 530, N'Phú Hiệp')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 531, N'Phú Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 532, N'Phú Hội')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 533, N'Phú Nhuận')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 534, N'Phú Thuận')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 535, N'Phước Vĩnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 536, N'Phường Đúc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 537, N'Tây Lộc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 538, N'Thuận Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 539, N'Thuận Lộc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 540, N'Thuận Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 541, N'Vĩnh Ninh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 542, N'Vỹ Dạ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 543, N'Xân Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 544, N'Hương Long')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 545, N'Thủy Vân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 546, N'Thủy Bằng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 547, N'Hương Hồ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 548, N'Hương An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 549, N'Hương Vinh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 550, N'Phú Thượng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 551, N'Thuận An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 552, N'Phú Hải')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 553, N'Lăng Cô')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 554, N'Sịa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (6, 555, N'Phong Điền')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 556, N'Bạch Đằng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 557, N'Cao Thắng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 558, N'Cao Xanh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 559, N'Giếng Đáy')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 560, N'Hà Khánh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 561, N'Hà Lầm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 562, N'Hà Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 563, N'Hà Tu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 564, N'Hồng Gai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 565, N'Hồng Hà')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 566, N'Hồng Hải')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 567, N'Hùng Thắng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 568, N'Bãi Cháy')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 569, N'Yết Kiêu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 570, N'Trần Hưng Đạo')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 571, N'Thanh Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 572, N'Xuân Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 573, N'Quang Hanh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 574, N'Cẩm Thủy')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 575, N'Cẩm Thạch')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 576, N'Cẩm Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 577, N'Cẩm Tây')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 578, N'Cẩm Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 579, N'Cẩm Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 580, N'Cẩm Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 581, N'Cẩm Thịnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 582, N'Cửa Ông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 583, N'Mông Dương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 584, N'Vàng Danh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 585, N'Nam Khê')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 586, N'Bắc Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 587, N'Trưng Vương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 588, N'Quang Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 589, N'Yên Thanh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 590, N'Phương Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 591, N'Phương Nam')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 592, N'Ka Long')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 593, N'Trần Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 594, N'Ninh Dương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 595, N'Trà Cổ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 596, N'Hải Yên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 597, N'Hải Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 598, N'Bình Ngọc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 599, N'Đông Triều')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 600, N'Mạo Khê')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 601, N'Quảng Yên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 602, N'Minh Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 603, N'Cộng Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 604, N'Đông Mai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (7, 605, N'Tân An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 606, N'Trần Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 607, N'Ngô Quyền')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 608, N'Lê Lợi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 609, N'Hoàng Văn Thụ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 610, N'Mỹ Độ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 611, N'Đa Mai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 612, N'Thọ Xương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 613, N'Trần Nguyên Hãn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 614, N'Xương Giang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 615, N'Dĩnh Kế')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 616, N'Thắng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 617, N'Vôi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 618, N'Đồi Ngô')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 619, N'Chũ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 620, N'An Châu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 621, N'Bích Động')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 622, N'Nếnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 623, N'Tân An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 624, N'Nhã Nam')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 625, N'Phồn Xương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 626, N'Tân Yên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 627, N'Lạng Giang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 628, N'Hiệp Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 629, N'Yên Dũng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (8, 630, N'Lục Nam')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (9, 631, N'Nguyễn Thị Minh Khai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (9, 632, N'Sông Cầu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (9, 633, N'Đức Xuân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (9, 634, N'Phùng Chí Kiên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (9, 635, N'Huyền Tụng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (9, 636, N'Xuất Hóa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (9, 637, N'Chợ Rã')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (9, 638, N'Phủ Thông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (9, 639, N'Bằng Lũng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (9, 640, N'Đồng Tâm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (9, 641, N'Yến Lạc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (9, 642, N'Bộc Bố')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (9, 643, N'Nà Phặc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (9, 644, N'Vân Tùng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (9, 645, N'Ba Bể')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 646, N'Hợp Giang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 647, N'Sông Hiến')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 648, N'Sông Bằng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 649, N'Ngọc Xuân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 650, N'Đề Thám')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 651, N'Duy Duyệt')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 652, N'Hòa Chung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 653, N'Tân Giang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 654, N'Bảo Lạc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 655, N'Pác Miều')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 656, N'Thanh Nhật')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 657, N'Quảng Uyên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 658, N'Trùng Khánh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 659, N'Trà Lĩnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 660, N'Nguyên Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 661, N'Tĩnh Túc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 662, N'Đông Khê')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 663, N'Nước Hai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 664, N'Thông Nông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (10, 665, N'Hà Quảng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (11, 666, N'Mường Thanh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (11, 667, N'Tân Thanh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (11, 668, N'Him Lam')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (11, 669, N'Thanh Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (11, 670, N'Nam Thanh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (11, 671, N'Thanh Trường')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (11, 672, N'Noong Bua')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (11, 673, N'Sông Đà')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (11, 674, N'Na Lay')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (11, 675, N'Tuần Giáo')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (11, 676, N'Tủa Chùa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (11, 677, N'Mường Ảng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (11, 678, N'Mường Chà')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (11, 679, N'Điện Biên Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (11, 680, N'Mường Nhé')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (12, 681, N'Quyết Thắng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (12, 682, N'Tân Phong')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (12, 683, N'Đoàn Kết')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (12, 684, N'Đông Phong')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (12, 685, N'Tam Đường')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (12, 686, N'Phong Thổ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (12, 687, N'Sìn Hồ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (12, 688, N'Mường Tè')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (12, 689, N'Than Uyên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (12, 690, N'Tân Uyên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (12, 691, N'Nậm Nhùn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (12, 692, N'Bản Giang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (12, 693, N'Bản Hon')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (12, 694, N'Nà Tăm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (12, 695, N'Khun Há')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 696, N'Lào Cai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 697, N'Cốc Lếu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 698, N'Kim Tân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 699, N'Bắc Cường')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 700, N'Nam Cường')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 701, N'Bình Minh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 702, N'Duyên Hải')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 703, N'Phố Mới')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 704, N'Xuân Tăng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 705, N'Thống Nhất')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 706, N'Sa Pa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 707, N'Cầu Mây')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 708, N'Hàm Rồng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 709, N'Ô Quý Hồ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 710, N'Phan Si Păng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 711, N'Bắc Hà')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 712, N'Phố Lu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 713, N'Tằng Loỏng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 714, N'Khánh Yên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 715, N'Si Ma Cai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 716, N'Mường Khương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 717, N'Bát Xát')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 718, N'Bảo Yên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 719, N'Văn Bàn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (13, 720, N'Bảo Thắng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (14, 721, N'Phan Thiết')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (14, 722, N'Minh Xuân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (14, 723, N'Tân Quang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (14, 724, N'Ỷ La')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (14, 725, N'Hưng Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (14, 726, N'Nông Tiến')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (14, 727, N'Tân Hà')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (14, 728, N'Đội Cấn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (14, 729, N'An Tường')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (14, 730, N'Mỹ Lâm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (14, 731, N'Vĩnh Lộc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (14, 732, N'Sơn Dương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (14, 733, N'Tân Yên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (14, 734, N'Na Hang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (14, 735, N'Lâm Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 736, N'Yên Thịnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 737, N'Yên Ninh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 738, N'Minh Tân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 739, N'Nguyễn Thái Học')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 740, N'Nguyễn Phúc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 741, N'Hồng Hà')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 742, N'Đồng Tâm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 743, N'Nam Cường')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 744, N'Hợp Minh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 745, N'Trung Tâm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 746, N'Tân An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 747, N'Pú Trạng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 748, N'Cầu Thia')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 749, N'Yên Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 750, N'Thác Bà')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 751, N'Mậu A')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 752, N'Cổ Phúc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 753, N'Trạm Tấu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 754, N'Mù Cang Chải')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (15, 755, N'Yên Thế')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 756, N'Trưng Vương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 757, N'Hoàng Văn Thụ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 758, N'Quang Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 759, N'Phan Đình Phùng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 760, N'Tân Long')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 761, N'Quan Triều')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 762, N'Gia Sàng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 763, N'Đồng Quang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 764, N'Quang Vinh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 765, N'Túc Duyên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 766, N'Chùa Hang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 767, N'Thịnh Đán')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 768, N'Tân Thịnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 769, N'Hương Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 770, N'Trung Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 771, N'Tân Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 772, N'Cam Giá')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 773, N'Phú Xá')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 774, N'Tích Lương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 775, N'Cải Đan')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 776, N'Mỏ Chè')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 777, N'Bách Quang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 778, N'Thắng Lợi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 779, N'Phố Cò')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 780, N'Châu Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 781, N'Ba Hàng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 782, N'Bãi Bông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 783, N'Đắc Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 784, N'Đồng Tiến')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 785, N'Hồng Tiến')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 786, N'Hùng Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 787, N'Đu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 788, N'Giang Tiên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 789, N'Chợ Chu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (16, 790, N'Hương Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 791, N'Hoàng Văn Thụ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 792, N'Tam Thanh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 793, N'Vĩnh Trại')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 794, N'Đông Kinh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 795, N'Chi Lăng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 796, N'Đồng Đăng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 797, N'Cao Lộc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 798, N'Thất Khê')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 799, N'Na Sầm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 800, N'Đồng Mỏ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 801, N'Hữu Lũng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 802, N'Bắc Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 803, N'Bình Gia')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 804, N'Văn Quan')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 805, N'Lộc Bính')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 806, N'Na Dương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 807, N'Đình Lập')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 808, N'Bản Chắt')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 809, N'Tân Thanh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (17, 810, N'Mẫu Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 811, N'Tiền An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 812, N'Đại Phúc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 813, N'Ninh Xá')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 814, N'Suối Hoa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 815, N'Vũ Ninh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 816, N'Đáp Cầu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 817, N'Thị Cầu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 818, N'Kinh Bắc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 819, N'Vạn An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 820, N'Hòa Long')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 821, N'Võ Cường')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 822, N'Hạp Lĩnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 823, N'Khắc Niệm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 824, N'Khúc Xuyên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 825, N'Phong Khê')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 826, N'Đông Ngàn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 827, N'Đồng Nguyên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 828, N'Tân Hồng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 829, N'Đồng Kỵ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 830, N'Trang Hạ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 831, N'Chờ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 832, N'Lim')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 833, N'Hồ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 834, N'Gia Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 835, N'Thứa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 836, N'Phố Mới')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 837, N'Quế Võ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 838, N'Thuận Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 839, N'Tiên Du')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (18, 840, N'Yên Phong')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 841, N'Trần Hưng Đạo')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 842, N'Quang Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 843, N'Nguyễn Trãi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 844, N'Phạm Ngũ Lão')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 845, N'Trần Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 846, N'Thanh Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 847, N'Tân Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 848, N'Lê Thanh Nghị')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 849, N'Hải Tân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 850, N'Ngọc Châu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 851, N'Nhị Châu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 852, N'Bình Hàn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 853, N'Cẩm Thượng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 854, N'Sao Đỏ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 855, N'Bến Tắm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 856, N'Phả Lại')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 857, N'Cộng Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 858, N'Chí Minh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 859, N'Thái Học')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 860, N'An Lạc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 861, N'Kinh Môn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 862, N'Phú Thứ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 863, N'Minh Tân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 864, N'Hiệp An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 865, N'Hiệp Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 866, N'An Sinh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 867, N'Phan Đình Phùng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 868, N'Kẻ Sặt')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 869, N'Lai Cách')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 870, N'Gia Lộc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 871, N'Ninh Giang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 872, N'Thanh Hà')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 873, N'Thanh Miện')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 874, N'Tứ Kỳ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (19, 875, N'Nam Sách')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 876, N'Lê Lợi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 877, N'Quang Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 878, N'Minh Khai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 879, N'Hiến Nam')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 880, N'Lam Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 881, N'An Tảo')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 882, N'Nhân Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 883, N'Bần Yên Nhân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 884, N'Phan Đình Phùng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 885, N'Bạch Sam')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 886, N'Như Quỳnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 887, N'Văn Lâm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 888, N'Yên Mỹ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 889, N'Khoái Châu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 890, N'Kim Động')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 891, N'Ân Thi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 892, N'Phù Cừ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 893, N'Tiên Lữ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 894, N'Trần Cao')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (20, 895, N'Văn Giang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 896, N'Phương Lâm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 897, N'Đồng Tiến')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 898, N'Chăm Mát')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 899, N'Thái Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 900, N'Tân Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 901, N'Tân Thịnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 902, N'Hữu Nghị')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 903, N'Sông Đà')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 904, N'Mãn Đức')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 905, N'Vụ Bản')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 906, N'Lương Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 907, N'Kỳ Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 908, N'Đà Bắc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 909, N'Cao Phong')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 910, N'Hàng Trạm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 911, N'Chi Nê')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 912, N'Bo')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 913, N'Mai Châu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 914, N'Ba Hàng Đồi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (21, 915, N'Tân Lạc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 916, N'Minh Khai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 917, N'Hai Bà Trưng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 918, N'Lương Khánh Thiện')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 919, N'Trần Hưng Đạo')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 920, N'Lê Hồng Phong')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 921, N'Quang Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 922, N'Liêm Chính')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 923, N'Trần Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 924, N'Lam Hạ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 925, N'Thanh Châu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 926, N'Hòa Mạc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 927, N'Đồng Văn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 928, N'Duy Minh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 929, N'Bạch Thượng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 930, N'Châu Giang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 931, N'Vĩnh Trụ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 932, N'Lý Nhân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 933, N'Kiện Khê')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 934, N'Thanh Liêm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 935, N'Quế')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 936, N'Kim Bảng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 937, N'Ba Sao')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 938, N'Bình Mỹ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 939, N'Bình Lục')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (22, 940, N'Thanh Tuyền')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 941, N'Vị Xuyên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 942, N'Vị Hoàng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 943, N'Năng Tĩnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 944, N'Trần Hưng Đạo')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 945, N'Quang Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 946, N'Nguyễn Du')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 947, N'Bà Triệu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 948, N'Trần Đăng Ninh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 949, N'Cửa Bắc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 950, N'Năng Tĩnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 951, N'Hạ Long')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 952, N'Trần Tế Xương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 953, N'Vị Xuyên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 954, N'Cửa Nam')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 955, N'Thống Nhất')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 956, N'Lộc Hạ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 957, N'Lộc Vượng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 958, N'Mỹ Lộc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 959, N'Giao Thủy')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 960, N'Quất Lâm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 961, N'Ngô Đồng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 962, N'Hải Hậu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 963, N'Yên Định')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 964, N'Cồn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 965, N'Thịnh Long')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 966, N'Xuân Trường')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 967, N'Nghĩa Hưng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 968, N'Liễu Đề')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 969, N'Rạng Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 970, N'Cổ Lễ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 971, N'Trực Ninh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 972, N'Nam Trực')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 973, N'Gạo')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 974, N'Lâm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (23, 975, N'Ý Yên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 976, N'Vân Giang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 977, N'Thanh Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 978, N'Tân Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 979, N'Đông Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 980, N'Nam Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 981, N'Phúc Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 982, N'Bích Đào')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 983, N'Ninh Phong')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 984, N'Ninh Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 985, N'Ninh Khánh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 986, N'Bắc Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 987, N'Trung Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 988, N'Nam Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 989, N'Tây Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 990, N'Yên Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 991, N'Ninh Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 992, N'Thiên Tôn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 993, N'Hoa Lư')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 994, N'Phát Diệm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 995, N'Kim Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 996, N'Nho Quan')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 997, N'Me')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 998, N'Gia Viễn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 999, N'Yên Thịnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (24, 1000, N'Yên Mô')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1001, N'Ba Đình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1002, N'Lam Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1003, N'Đông Thọ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1004, N'Ngọc Trạo')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1005, N'Phú Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1006, N'Trường Thi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1007, N'Điện Biên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1008, N'Hàm Rồng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1009, N'Đông Hải')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1010, N'Đông Cương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1011, N'Nam Ngạn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1012, N'Tân Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1013, N'Quảng Thắng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1014, N'Quảng Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1015, N'Quảng Hưng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1016, N'Tào Xuyên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1017, N'Long Anh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1018, N'Bắc Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1019, N'Trung Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1020, N'Trường Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1021, N'Quảng Tiến')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1022, N'Quảng Cư')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1023, N'Quảng Châu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1024, N'Quảng Thọ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1025, N'Bình Minh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1026, N'Hải Thanh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1027, N'Hải Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1028, N'Hải Ninh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1029, N'Ninh Hải')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1030, N'Nguyên Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1031, N'Bỉm Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1032, N'Ngọc Trạo')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1033, N'Lam Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1034, N'Ba Đình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1035, N'Đông Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1036, N'Bút Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1037, N'Hoằng Hóa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1038, N'Hậu Lộc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1039, N'Hà Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1040, N'Vĩnh Lộc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1041, N'Yên Định')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1042, N'Quán Lào')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1043, N'Thiệu Hóa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1044, N'Triệu Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1045, N'Nông Cống')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1046, N'Lê Mao')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1047, N'Lê Lợi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1048, N'Hà Huy Tập')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1049, N'Hưng Dũng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1050, N'Trường Thi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1051, N'Quang Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1052, N'Đội Cung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1053, N'Cửa Nam')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1054, N'Thạch Linh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1055, N'Bến Thủy')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1056, N'Đông Vĩnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1057, N'Hưng Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1058, N'Hưng Phúc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1059, N'Quán Bàu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1060, N'Trung Đô')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1061, N'Nghi Thu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1062, N'Nghi Hương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1063, N'Thu Thủy')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1064, N'Nghi Thủy')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1065, N'Nghi Hải')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1066, N'Hòa Hiếu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1067, N'Quang Tiến')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1068, N'Quang Phong')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1069, N'Long Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1070, N'Thái Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1071, N'Hoàng Mai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1072, N'Quỳnh Thiện')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1073, N'Mai Hùng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1074, N'Quỳnh Dị')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1075, N'Quỳnh Phương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1076, N'Diễn Châu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1077, N'Quỳnh Lưu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1078, N'Cầu Giát')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1079, N'Yên Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (26, 1080, N'Đô Lương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1081, N'Bắc Hà')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1082, N'Nam Hà')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1083, N'Nguyễn Du')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1084, N'Trần Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1085, N'Hà Huy Tập')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1086, N'Tân Giang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1087, N'Đại Nài')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1088, N'Thạch Linh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1089, N'Sông Trí')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1090, N'Kỳ Anh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1091, N'Hồng Lĩnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1092, N'Bắc Hồng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1093, N'Nam Hồng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1094, N'Đức Thọ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1095, N'Hương Khê')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1096, N'Cẩm Xuyên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1097, N'Nghèn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1098, N'Can Lộc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1099, N'Nghi Xuân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (27, 1100, N'Xuân An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1101, N'Đồng Mỹ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1102, N'Hải Đình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1103, N'Đồng Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1104, N'Hải Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1105, N'Nam Lý')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1106, N'Bắc Lý')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1107, N'Đức Ninh Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1108, N'Phú Hải')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1109, N'Đồng Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1110, N'Ba Đồn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1111, N'Quảng Thọ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1112, N'Quảng Thuận')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1113, N'Quảng Phúc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1114, N'Hoàn Lão')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1115, N'Bố Trạch')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1116, N'Kiến Giang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1117, N'Lệ Thủy')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1118, N'Quán Hàu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1119, N'Quảng Ninh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (28, 1120, N'Quy Đạt')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1121, N'Phường 1 (Đông Hà)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1122, N'Phường 2 (Đông Hà)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1123, N'Phường 3 (Đông Hà)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1124, N'Phường 4 (Đông Hà)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1125, N'Phường 5 (Đông Hà)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1126, N'An Đôn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1127, N'Quảng Trị')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1128, N'Phường 1 (Quảng Trị)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1129, N'Phường 2 (Quảng Trị)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1130, N'Khe Sanh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1131, N'Lao Bảo')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1132, N'Hướng Hóa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1133, N'Krông Klang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1134, N'Đakrông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1135, N'Gio Linh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1136, N'Cửa Việt')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1137, N'Vĩnh Linh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1138, N'Hồ Xá')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1139, N'Cam Lộ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (29, 1140, N'Ái Tử')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1141, N'An Mỹ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1142, N'An Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1143, N'An Xuân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1144, N'Hòa Hương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1145, N'Phước Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1146, N'Tân Thạnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1147, N'Trường Xuân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1148, N'Cẩm Phô')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1149, N'Minh An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1150, N'Sơn Phong')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1151, N'Tân An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1152, N'Thanh Hà')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1153, N'Cửa Đại')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1154, N'Cẩm Châu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1155, N'Vĩnh Điện')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1156, N'Điện An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1157, N'Điện Ngọc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1158, N'Điện Nam Bắc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1159, N'Điện Nam Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1160, N'Điện Nam Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1161, N'Núi Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1162, N'Phú Thịnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1163, N'Phú Ninh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1164, N'Hà Lam')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1165, N'Thăng Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1166, N'Ái Nghĩa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1167, N'Đại Lộc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1168, N'Đông Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1169, N'Quế Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (30, 1170, N'Khâm Đức')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1171, N'Chánh Lộ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1172, N'Nghĩa Chánh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1173, N'Nghĩa Lộ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1174, N'Nguyễn Nghiêm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1175, N'Trần Hưng Đạo')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1176, N'Trần Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1177, N'Quảng Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1178, N'Lê Hồng Phong')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1179, N'Nghĩa Lộ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1180, N'Nguyễn Nghiêm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1181, N'Nguyễn Trãi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1182, N'Trần Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1183, N'Đức Tân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1184, N'Mộ Đức')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1185, N'Chợ Chùa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1186, N'Nghĩa Hành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1187, N'Sông Vệ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1188, N'Tư Nghĩa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1189, N'La Hà')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1190, N'Di Lăng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1191, N'Sơn Hà')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1192, N'Trà Xuân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1193, N'Trà Bồng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1194, N'Ba Tơ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (31, 1195, N'Châu Ổ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1196, N'Trần Hưng Đạo')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1197, N'Lê Lợi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1198, N'Lê Hồng Phong')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1199, N'Trần Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1200, N'Lý Thường Kiệt')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1201, N'Nguyễn Văn Cừ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1202, N'Đống Đa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1203, N'Thị Nại')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1204, N'Hải Cảng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1205, N'Ngô Mây')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1206, N'Ghềnh Ráng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1207, N'Quang Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1208, N'Nhơn Bình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1209, N'Nhơn Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1210, N'Bình Định')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1211, N'Nhơn Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1212, N'Đập Đá')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1213, N'Bồng Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1214, N'Tam Quan')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1215, N'Hoài Thanh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1216, N'Tuy Phước')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1217, N'Diêu Trì')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1218, N'Ngô Mây')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1219, N'Phù Cát')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1220, N'Phù Mỹ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1221, N'Bình Dương')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1222, N'Tăng Bạt Hổ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1223, N'Hoài Ân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1224, N'An Lão')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (32, 1225, N'Phú Phong')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1226, N'Phường 1 (Tuy Hòa)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1227, N'Phường 2 (Tuy Hòa)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1228, N'Phường 3 (Tuy Hòa)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1229, N'Phường 4 (Tuy Hòa)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1230, N'Phường 5 (Tuy Hòa)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1231, N'Phường 6 (Tuy Hòa)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1232, N'Phường 7 (Tuy Hòa)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1233, N'Phường 8 (Tuy Hòa)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1234, N'Phường 9 (Tuy Hòa)')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1235, N'Phú Lâm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1236, N'Phú Thạnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1237, N'Phú Đông')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1238, N'Xuân Yên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1239, N'Xuân Thành')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1240, N'Xuân Đài')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1241, N'Xuân Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1242, N'Sông Cầu')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1243, N'Hòa Vinh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1244, N'Hòa Hiệp Trung')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1245, N'Hòa Hiệp Bắc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1246, N'Đông Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1247, N'Phú Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1248, N'Chí Thạnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1249, N'Tuy An')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (33, 1250, N'Củng Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1251, N'Lộc Thọ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1252, N'Tân Lập')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1253, N'Phước Tiến')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1254, N'Phước Tân')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1255, N'Phước Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1256, N'Vạn Thạnh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1257, N'Vạn Thắng')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1258, N'Phương Sài')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1259, N'Phương Sơn')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1260, N'Ngọc Hiệp')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1261, N'Phước Hải')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1262, N'Vĩnh Nguyên')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1263, N'Vĩnh Trường')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1264, N'Vĩnh Phước')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1265, N'Vĩnh Hải')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1266, N'Vĩnh Hòa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1267, N'Vĩnh Thọ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1268, N'Ba Ngòi')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1269, N'Cam Lộc')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1270, N'Cam Thuận')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1271, N'Cam Phú')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1272, N'Cam Linh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1273, N'Cam Nghĩa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1274, N'Cam Thành Nam')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1275, N'Ninh Hiệp')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1276, N'Ninh Giang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1277, N'Ninh Đa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1278, N'Ninh Hà')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1279, N'Ninh Diêm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1280, N'Ninh Thủy')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1281, N'Ninh Hải')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1282, N'Vạn Giã')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1283, N'Vạn Ninh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1284, N'Diên Khánh')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1285, N'Cam Đức')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 1286, N'Hoàn Kiếm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 1287, N'Nam Từ Liêm')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 1288, N'Ba Đình')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 1289, N'Tây Hồ')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 1290, N'Đống Đa')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (1, 1291, N'Hoàng Mai')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 1292, N'Quận 1')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (2, 1293, N'Thủ Đức')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (34, 1294, N'Nha Trang')
INSERT [dbo].[wards] ([city_id], [id], [name]) VALUES (25, 1295, N'Sầm Sơn')
SET IDENTITY_INSERT [dbo].[wards] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON
INSERT [dbo].[roles] ([id], [role_name], [description]) VALUES (1, 'ROLE_ADMIN', N'Quan tri vien he thong')
INSERT [dbo].[roles] ([id], [role_name], [description]) VALUES (2, 'ROLE_MANAGER', N'Quan ly toa nha KTX')
INSERT [dbo].[roles] ([id], [role_name], [description]) VALUES (3, 'ROLE_STAFF', N'Nhan vien truc toa nha KTX')
INSERT [dbo].[roles] ([id], [role_name], [description]) VALUES (4, 'ROLE_STUDENT', N'Sinh vien noi tru KTX')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[permissions] ON
INSERT [dbo].[permissions] ([id], [permission_key], [description]) VALUES (1, 'CAN_MANAGE_BUILDINGS', N'Quyen cau hinh toa nha, tang, phong, giuong')
INSERT [dbo].[permissions] ([id], [permission_key], [description]) VALUES (2, 'CAN_MANAGE_STUDENTS', N'Quyen duyet danh sach whitelist sinh vien')
INSERT [dbo].[permissions] ([id], [permission_key], [description]) VALUES (3, 'CAN_BOOK_ROOM', N'Quyen dang ky phong ky tuc xa')
INSERT [dbo].[permissions] ([id], [permission_key], [description]) VALUES (4, 'CAN_MANAGE_MAINTENANCE', N'Quyen tiep nhan va xu ly yeu cau bao hong')
SET IDENTITY_INSERT [dbo].[permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[role_permissions] ON
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id], [created_at], [created_by]) VALUES (1, 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id], [created_at], [created_by]) VALUES (2, 1, 2, GETDATE(), 'SYSTEM')
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id], [created_at], [created_by]) VALUES (3, 1, 3, GETDATE(), 'SYSTEM')
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id], [created_at], [created_by]) VALUES (4, 1, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id], [created_at], [created_by]) VALUES (5, 2, 2, GETDATE(), 'SYSTEM')
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id], [created_at], [created_by]) VALUES (6, 2, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id], [created_at], [created_by]) VALUES (7, 3, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[role_permissions] ([id], [role_id], [permission_id], [created_at], [created_by]) VALUES (8, 4, 3, GETDATE(), 'SYSTEM')
SET IDENTITY_INSERT [dbo].[role_permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[dormitory_buildings] ON
INSERT [dbo].[dormitory_buildings] ([id], [name], [gender_type], [status], [created_at], [created_by]) VALUES (1, N'Building A', 'MALE', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[dormitory_buildings] ([id], [name], [gender_type], [status], [created_at], [created_by]) VALUES (2, N'Building B', 'FEMALE', 'ACTIVE', GETDATE(), 'SYSTEM')
SET IDENTITY_INSERT [dbo].[dormitory_buildings] OFF
GO
SET IDENTITY_INSERT [dbo].[semesters] ON
INSERT [dbo].[semesters] ([id], [name], [start_date], [end_date], [is_active], [created_at], [created_by]) VALUES (1, 'SUMMER2026', '2026-05-01', '2026-08-31', 1, GETDATE(), 'SYSTEM')
SET IDENTITY_INSERT [dbo].[semesters] OFF
GO
SET IDENTITY_INSERT [dbo].[floors] ON
INSERT [dbo].[floors] ([id], [building_id], [floor_number], [status], [created_at], [created_by]) VALUES (1, 1, 1, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[floors] ([id], [building_id], [floor_number], [status], [created_at], [created_by]) VALUES (2, 1, 2, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[floors] ([id], [building_id], [floor_number], [status], [created_at], [created_by]) VALUES (3, 2, 1, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[floors] ([id], [building_id], [floor_number], [status], [created_at], [created_by]) VALUES (4, 2, 2, 'ACTIVE', GETDATE(), 'SYSTEM')
SET IDENTITY_INSERT [dbo].[floors] OFF
GO
SET IDENTITY_INSERT [dbo].[room_types] ON
INSERT [dbo].[room_types] ([id], [type_name], [price], [description], [created_at], [created_by]) VALUES (1, N'ROOM_4_AC', 1500000.00, N'Phong 4 nguoi co dieu hoa', GETDATE(), 'SYSTEM')
INSERT [dbo].[room_types] ([id], [type_name], [price], [description], [created_at], [created_by]) VALUES (2, N'ROOM_6_FAN', 1000000.00, N'Phong 6 nguoi co quat tran', GETDATE(), 'SYSTEM')
INSERT [dbo].[room_types] ([id], [type_name], [price], [description], [created_at], [created_by]) VALUES (3, N'ROOM_8_FAN', 800000.00, N'Phong 8 nguoi co quáº¡t tran', GETDATE(), 'SYSTEM')
SET IDENTITY_INSERT [dbo].[room_types] OFF
GO
SET IDENTITY_INSERT [dbo].[rooms] ON
INSERT [dbo].[rooms] ([id], [floor_id], [room_type_id], [room_number], [max_beds], [current_occupancy], [status], [created_at], [created_by]) VALUES (1, 1, 2, '101', 6, 5, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[rooms] ([id], [floor_id], [room_type_id], [room_number], [max_beds], [current_occupancy], [status], [created_at], [created_by]) VALUES (2, 1, 3, '102', 8, 5, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[rooms] ([id], [floor_id], [room_type_id], [room_number], [max_beds], [current_occupancy], [status], [created_at], [created_by]) VALUES (3, 3, 2, '101', 6, 5, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[rooms] ([id], [floor_id], [room_type_id], [room_number], [max_beds], [current_occupancy], [status], [created_at], [created_by]) VALUES (4, 3, 3, '102', 8, 5, 'ACTIVE', GETDATE(), 'SYSTEM')
SET IDENTITY_INSERT [dbo].[rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[beds] ON
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (1, 1, 1, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (2, 1, 2, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (3, 1, 3, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (4, 1, 4, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (5, 1, 5, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (6, 1, 6, 'AVAILABLE', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (7, 2, 1, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (8, 2, 2, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (9, 2, 3, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (10, 2, 4, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (11, 2, 5, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (12, 2, 6, 'AVAILABLE', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (13, 2, 7, 'AVAILABLE', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (14, 2, 8, 'AVAILABLE', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (15, 3, 1, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (16, 3, 2, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (17, 3, 3, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (18, 3, 4, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (19, 3, 5, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (20, 3, 6, 'AVAILABLE', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (21, 4, 1, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (22, 4, 2, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (23, 4, 3, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (24, 4, 4, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (25, 4, 5, 'OCCUPIED', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (26, 4, 6, 'AVAILABLE', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (27, 4, 7, 'AVAILABLE', GETDATE(), 'SYSTEM')
INSERT [dbo].[beds] ([id], [room_id], [bed_number], [status], [created_at], [created_by]) VALUES (28, 4, 8, 'AVAILABLE', GETDATE(), 'SYSTEM')
SET IDENTITY_INSERT [dbo].[beds] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (8, 'admin@fpt.edu.vn', '12345678', N'Van', N'Minh', N'Nguyen', '0981111111', 'MALE', '1985-05-15', 1, 1, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (12, 'admin2@fpt.edu.vn', '12345678', N'Hong', N'Anh', N'Vu', '0981111112', 'FEMALE', '1987-03-24', 1, 5, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (9, 'manager@fpt.edu.vn', '12345678', N'Quang', N'Duc', N'Tran', '0982222222', 'MALE', '1990-08-20', 1, 3, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (13, 'manager2@fpt.edu.vn', '12345678', N'Thu', N'Huong', N'Le', '0982222223', 'FEMALE', '1992-06-18', 1, 6, 2, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (10, 'staff@fpt.edu.vn', '12345678', N'Thi', N'Lan', N'Pham', '0983333333', 'FEMALE', '1995-12-05', 1, 4, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (14, 'staff2@fpt.edu.vn', '12345678', N'Quoc', N'Anh', N'Nguyen', '0983333334', 'MALE', '1996-09-12', 1, 7, 2, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (15, 'student15@fpt.edu.vn', '12345678', N'Student15', N'Van', N'Tran', '0984444415', 'MALE', '2005-03-10', 1, 15, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (16, 'student16@fpt.edu.vn', '12345678', N'Student16', N'Van', N'Nguyen', '0984444416', 'MALE', '2005-03-10', 1, 16, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (17, 'student17@fpt.edu.vn', '12345678', N'Student17', N'Van', N'Tran', '0984444417', 'MALE', '2005-03-10', 1, 17, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (18, 'student18@fpt.edu.vn', '12345678', N'Student18', N'Van', N'Nguyen', '0984444418', 'MALE', '2005-03-10', 1, 18, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (19, 'student19@fpt.edu.vn', '12345678', N'Student19', N'Van', N'Tran', '0984444419', 'MALE', '2005-03-10', 1, 19, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (20, 'student20@fpt.edu.vn', '12345678', N'Student20', N'Van', N'Nguyen', '0984444420', 'MALE', '2005-03-10', 1, 20, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (21, 'student21@fpt.edu.vn', '12345678', N'Student21', N'Van', N'Tran', '0984444421', 'MALE', '2005-03-10', 1, 21, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (22, 'student22@fpt.edu.vn', '12345678', N'Student22', N'Van', N'Nguyen', '0984444422', 'MALE', '2005-03-10', 1, 22, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (23, 'student23@fpt.edu.vn', '12345678', N'Student23', N'Van', N'Tran', '0984444423', 'MALE', '2005-03-10', 1, 23, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (24, 'student24@fpt.edu.vn', '12345678', N'Student24', N'Van', N'Nguyen', '0984444424', 'MALE', '2005-03-10', 1, 24, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (25, 'student25@fpt.edu.vn', '12345678', N'Student25', N'Van', N'Tran', '0984444425', 'FEMALE', '2005-03-10', 1, 25, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (26, 'student26@fpt.edu.vn', '12345678', N'Student26', N'Van', N'Nguyen', '0984444426', 'FEMALE', '2005-03-10', 1, 26, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (27, 'student27@fpt.edu.vn', '12345678', N'Student27', N'Van', N'Tran', '0984444427', 'FEMALE', '2005-03-10', 1, 27, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (28, 'student28@fpt.edu.vn', '12345678', N'Student28', N'Van', N'Nguyen', '0984444428', 'FEMALE', '2005-03-10', 1, 28, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (29, 'student29@fpt.edu.vn', '12345678', N'Student29', N'Van', N'Tran', '0984444429', 'FEMALE', '2005-03-10', 1, 29, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (30, 'student30@fpt.edu.vn', '12345678', N'Student30', N'Van', N'Nguyen', '0984444430', 'FEMALE', '2005-03-10', 1, 30, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (31, 'student31@fpt.edu.vn', '12345678', N'Student31', N'Van', N'Tran', '0984444431', 'FEMALE', '2005-03-10', 1, 31, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (32, 'student32@fpt.edu.vn', '12345678', N'Student32', N'Van', N'Nguyen', '0984444432', 'FEMALE', '2005-03-10', 1, 32, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (33, 'student33@fpt.edu.vn', '12345678', N'Student33', N'Van', N'Tran', '0984444433', 'FEMALE', '2005-03-10', 1, 33, NULL, GETDATE(), 'SYSTEM')
INSERT [dbo].[users] ([id], [email], [password_hash], [first_name], [middle_name], [last_name], [phone], [gender], [dob], [is_active], [address_id], [building_id], [created_at], [created_by]) VALUES (34, 'student34@fpt.edu.vn', '12345678', N'Student34', N'Van', N'Nguyen', '0984444434', 'FEMALE', '2005-03-10', 1, 34, NULL, GETDATE(), 'SYSTEM')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[user_roles] ON
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (9, 8, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (10, 12, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (11, 9, 2, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (12, 13, 2, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (13, 10, 3, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (14, 14, 3, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (25, 15, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (26, 16, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (27, 17, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (28, 18, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (29, 19, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (30, 20, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (31, 21, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (32, 22, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (33, 23, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (34, 24, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (35, 25, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (36, 26, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (37, 27, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (38, 28, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (39, 29, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (40, 30, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (41, 31, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (42, 32, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (43, 33, 4, GETDATE(), 'SYSTEM')
INSERT [dbo].[user_roles] ([id], [user_id], [role_id], [created_at], [created_by]) VALUES (44, 34, 4, GETDATE(), 'SYSTEM')
SET IDENTITY_INSERT [dbo].[user_roles] OFF
GO
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (15, 'HE190615', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (16, 'HE190616', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (17, 'HE190617', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (18, 'HE190618', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (19, 'HE190619', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (20, 'HE190620', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (21, 'HE190621', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (22, 'HE190622', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (23, 'HE190623', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (24, 'HE190624', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (25, 'HE190625', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (26, 'HE190626', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (27, 'HE190627', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (28, 'HE190628', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (29, 'HE190629', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (30, 'HE190630', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (31, 'HE190631', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (32, 'HE190632', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (33, 'HE190633', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[student_profiles] ([user_id], [student_code], [academic_year], [major], [parent_phone], [student_status], [created_at], [created_by]) VALUES (34, 'HE190634', 'K20', N'Software Engineering', '0912345678', 'ACTIVE', GETDATE(), 'SYSTEM')
GO
SET IDENTITY_INSERT [dbo].[student_whitelists] ON
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (15, 'HE190615', 'student15@fpt.edu.vn', N'Student 15', '0984444415', 'MALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (16, 'HE190616', 'student16@fpt.edu.vn', N'Student 16', '0984444416', 'MALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (17, 'HE190617', 'student17@fpt.edu.vn', N'Student 17', '0984444417', 'MALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (18, 'HE190618', 'student18@fpt.edu.vn', N'Student 18', '0984444418', 'MALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (19, 'HE190619', 'student19@fpt.edu.vn', N'Student 19', '0984444419', 'MALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (20, 'HE190620', 'student20@fpt.edu.vn', N'Student 20', '0984444420', 'MALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (21, 'HE190621', 'student21@fpt.edu.vn', N'Student 21', '0984444421', 'MALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (22, 'HE190622', 'student22@fpt.edu.vn', N'Student 22', '0984444422', 'MALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (23, 'HE190623', 'student23@fpt.edu.vn', N'Student 23', '0984444423', 'MALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (24, 'HE190624', 'student24@fpt.edu.vn', N'Student 24', '0984444424', 'MALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (25, 'HE190625', 'student25@fpt.edu.vn', N'Student 25', '0984444425', 'FEMALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (26, 'HE190626', 'student26@fpt.edu.vn', N'Student 26', '0984444426', 'FEMALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (27, 'HE190627', 'student27@fpt.edu.vn', N'Student 27', '0984444427', 'FEMALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (28, 'HE190628', 'student28@fpt.edu.vn', N'Student 28', '0984444428', 'FEMALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (29, 'HE190629', 'student29@fpt.edu.vn', N'Student 29', '0984444429', 'FEMALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (30, 'HE190630', 'student30@fpt.edu.vn', N'Student 30', '0984444430', 'FEMALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (31, 'HE190631', 'student31@fpt.edu.vn', N'Student 31', '0984444431', 'FEMALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (32, 'HE190632', 'student32@fpt.edu.vn', N'Student 32', '0984444432', 'FEMALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (33, 'HE190633', 'student33@fpt.edu.vn', N'Student 33', '0984444433', 'FEMALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
INSERT [dbo].[student_whitelists] ([id], [student_code], [email], [full_name], [phone], [gender], [major], [semester_id], [is_registered], [created_at], [created_by]) VALUES (34, 'HE190634', 'student34@fpt.edu.vn', N'Student 34', '0984444434', 'FEMALE', N'Software Engineering', 1, 1, GETDATE(), 'SYSTEM')
SET IDENTITY_INSERT [dbo].[student_whitelists] OFF
GO
SET IDENTITY_INSERT [dbo].[contracts] ON
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (15, 'HD-2026-015', 15, 1, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (16, 'HD-2026-016', 16, 2, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (17, 'HD-2026-017', 17, 3, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (18, 'HD-2026-018', 18, 4, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (19, 'HD-2026-019', 19, 5, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (20, 'HD-2026-020', 20, 7, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (21, 'HD-2026-021', 21, 8, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (22, 'HD-2026-022', 22, 9, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (23, 'HD-2026-023', 23, 10, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (24, 'HD-2026-024', 24, 11, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (25, 'HD-2026-025', 25, 15, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (26, 'HD-2026-026', 26, 16, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (27, 'HD-2026-027', 27, 17, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (28, 'HD-2026-028', 28, 18, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (29, 'HD-2026-029', 29, 19, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (30, 'HD-2026-030', 30, 21, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (31, 'HD-2026-031', 31, 22, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (32, 'HD-2026-032', 32, 23, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (33, 'HD-2026-033', 33, 24, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
INSERT [dbo].[contracts] ([id], [contract_code], [student_id], [bed_id], [semester_id], [price], [status], [created_at], [created_by]) VALUES (34, 'HD-2026-034', 34, 25, 1, 1500000.00, 'ACTIVE', GETDATE(), 'SYSTEM')
SET IDENTITY_INSERT [dbo].[contracts] OFF
GO
SET IDENTITY_INSERT [dbo].[utility_usages] ON
INSERT [dbo].[utility_usages] ([id], [room_id], [semester_id], [recorded_month], [recorded_year], [start_electricity], [end_electricity], [start_water], [end_water], [recorded_by], [recorded_at], [created_at], [created_by]) VALUES (1, 1, 1, 5, 2026, 1000, 1250, 500, 530, 10, GETDATE(), GETDATE(), 'SYSTEM')
INSERT [dbo].[utility_usages] ([id], [room_id], [semester_id], [recorded_month], [recorded_year], [start_electricity], [end_electricity], [start_water], [end_water], [recorded_by], [recorded_at], [created_at], [created_by]) VALUES (2, 2, 1, 5, 2026, 1000, 1310, 500, 540, 10, GETDATE(), GETDATE(), 'SYSTEM')
INSERT [dbo].[utility_usages] ([id], [room_id], [semester_id], [recorded_month], [recorded_year], [start_electricity], [end_electricity], [start_water], [end_water], [recorded_by], [recorded_at], [created_at], [created_by]) VALUES (3, 3, 1, 5, 2026, 1000, 1220, 500, 525, 10, GETDATE(), GETDATE(), 'SYSTEM')
INSERT [dbo].[utility_usages] ([id], [room_id], [semester_id], [recorded_month], [recorded_year], [start_electricity], [end_electricity], [start_water], [end_water], [recorded_by], [recorded_at], [created_at], [created_by]) VALUES (4, 4, 1, 5, 2026, 1000, 1280, 500, 535, 10, GETDATE(), GETDATE(), 'SYSTEM')
SET IDENTITY_INSERT [dbo].[utility_usages] OFF
GO
SET IDENTITY_INSERT [dbo].[bills] ON
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (1, 'HD-R2026-015', 15, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (2, 'HD-U2026-015', 15, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (3, 'HD-R2026-016', 16, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (4, 'HD-U2026-016', 16, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (5, 'HD-R2026-017', 17, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (6, 'HD-U2026-017', 17, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (7, 'HD-R2026-018', 18, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (8, 'HD-U2026-018', 18, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (9, 'HD-R2026-019', 19, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (10, 'HD-U2026-019', 19, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (11, 'HD-R2026-020', 20, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (12, 'HD-U2026-020', 20, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (13, 'HD-R2026-021', 21, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (14, 'HD-U2026-021', 21, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (15, 'HD-R2026-022', 22, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (16, 'HD-U2026-022', 22, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (17, 'HD-R2026-023', 23, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (18, 'HD-U2026-023', 23, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (19, 'HD-R2026-024', 24, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (20, 'HD-U2026-024', 24, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (21, 'HD-R2026-025', 25, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (22, 'HD-U2026-025', 25, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (23, 'HD-R2026-026', 26, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (24, 'HD-U2026-026', 26, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (25, 'HD-R2026-027', 27, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (26, 'HD-U2026-027', 27, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (27, 'HD-R2026-028', 28, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (28, 'HD-U2026-028', 28, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (29, 'HD-R2026-029', 29, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (30, 'HD-U2026-029', 29, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (31, 'HD-R2026-030', 30, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (32, 'HD-U2026-030', 30, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (33, 'HD-R2026-031', 31, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (34, 'HD-U2026-031', 31, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (35, 'HD-R2026-032', 32, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (36, 'HD-U2026-032', 32, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (37, 'HD-R2026-033', 33, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (38, 'HD-U2026-033', 33, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (39, 'HD-R2026-034', 34, 1, 'ROOM_BILL', 1500000.00, 'PAID', '2026-05-01', '2026-05-10', N'Hoa don tien phong thang 5', GETDATE(), 'SYSTEM')
INSERT [dbo].[bills] ([id], [bill_code], [student_id], [semester_id], [bill_type], [amount], [status], [issue_date], [payment_deadline], [description], [created_at], [created_by]) VALUES (40, 'HD-U2026-034', 34, 1, 'UTILITY_BILL', 350000.00, 'UNPAID', '2026-06-01', '2026-06-10', N'Hoa don tien dien nuoc thang 5', GETDATE(), 'SYSTEM')
SET IDENTITY_INSERT [dbo].[bills] OFF
GO
SET IDENTITY_INSERT [dbo].[payment_transactions] ON
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (15, 1, 'VNPAY', 'TXN202605010015', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (16, 3, 'VNPAY', 'TXN202605010016', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (17, 5, 'VNPAY', 'TXN202605010017', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (18, 7, 'VNPAY', 'TXN202605010018', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (19, 9, 'VNPAY', 'TXN202605010019', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (20, 11, 'VNPAY', 'TXN202605010020', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (21, 13, 'VNPAY', 'TXN202605010021', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (22, 15, 'VNPAY', 'TXN202605010022', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (23, 17, 'VNPAY', 'TXN202605010023', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (24, 19, 'VNPAY', 'TXN202605010024', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (25, 21, 'VNPAY', 'TXN202605010025', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (26, 23, 'VNPAY', 'TXN202605010026', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (27, 25, 'VNPAY', 'TXN202605010027', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (28, 27, 'VNPAY', 'TXN202605010028', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (29, 29, 'VNPAY', 'TXN202605010029', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (30, 31, 'VNPAY', 'TXN202605010030', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (31, 33, 'VNPAY', 'TXN202605010031', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (32, 35, 'VNPAY', 'TXN202605010032', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (33, 37, 'VNPAY', 'TXN202605010033', 1500000.00, 'SUCCESS', GETDATE())
INSERT [dbo].[payment_transactions] ([id], [bill_id], [payment_method], [txn_ref], [amount], [status], [payment_date]) VALUES (34, 39, 'VNPAY', 'TXN202605010034', 1500000.00, 'SUCCESS', GETDATE())
SET IDENTITY_INSERT [dbo].[payment_transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[issue_reports] ON
INSERT [dbo].[issue_reports] ([id], [title], [description], [category], [status], [staff_note], [student_id], [room_id], [created_at], [created_by]) VALUES (1, N'Bong den nhap nhay', N'Bong den hoc goc trai bi nhap nhay lien tuc', 'ELECTRICITY', 'PENDING', NULL, 15, 1, GETDATE(), 'student15@fpt.edu.vn')
INSERT [dbo].[issue_reports] ([id], [title], [description], [category], [status], [staff_note], [student_id], [room_id], [created_at], [created_by]) VALUES (2, N'Vo duong ong nuoc', N'Voi sen bi ro ri nuoc lam am tuong', 'WATER', 'PENDING', NULL, 20, 2, GETDATE(), 'student20@fpt.edu.vn')
INSERT [dbo].[issue_reports] ([id], [title], [description], [category], [status], [staff_note], [student_id], [room_id], [created_at], [created_by]) VALUES (3, N'Kinh cua so bi nut', N'Kinh cua so gan giuong so 3 bi nut nho', 'FACILITY', 'PENDING', NULL, 25, 3, GETDATE(), 'student25@fpt.edu.vn')
INSERT [dbo].[issue_reports] ([id], [title], [description], [category], [status], [staff_note], [student_id], [room_id], [created_at], [created_by]) VALUES (4, N'Dieu hoa keu to', N'Dieu hoa phat ra tieng on lon khi bat che do Cool', 'ELECTRICITY', 'PENDING', NULL, 30, 4, GETDATE(), 'student30@fpt.edu.vn')
SET IDENTITY_INSERT [dbo].[issue_reports] OFF
GO
SET IDENTITY_INSERT [dbo].[notifications] ON
INSERT [dbo].[notifications] ([id], [title], [content], [category], [target_type], [target_building_id], [target_student_id], [sender_id], [created_at], [created_by]) VALUES (1, N'Lich chot dien nuoc thang 7', N'Nhac nho chot dien nuoc truoc ngay 25.', 'GENERAL', 'ALL', NULL, NULL, 8, GETDATE(), 'admin@fpt.edu.vn')
INSERT [dbo].[notifications] ([id], [title], [content], [category], [target_type], [target_building_id], [target_student_id], [sender_id], [created_at], [created_by]) VALUES (2, N'Bao tri thang may Toa A', N'Thang may so 2 se tam ngung de kiem tra tu 9h-11h ngay mai.', 'GENERAL', 'BUILDING', 1, NULL, 9, GETDATE(), 'manager@fpt.edu.vn')
INSERT [dbo].[notifications] ([id], [title], [content], [category], [target_type], [target_building_id], [target_student_id], [sender_id], [created_at], [created_by]) VALUES (3, N'Hoc bong noi tru HK2026', N'Cong bo danh sach sinh vien nhan hoc bong ho tro ky tuc xa.', 'GENERAL', 'ALL', NULL, NULL, 8, GETDATE(), 'admin@fpt.edu.vn')
INSERT [dbo].[notifications] ([id], [title], [content], [category], [target_type], [target_building_id], [target_student_id], [sender_id], [created_at], [created_by]) VALUES (4, N'Thu tien phong HK SUMMER2026', N'Yeu cau hoan thanh dong phi truoc ngay 10/05/2026.', 'GENERAL', 'ALL', NULL, NULL, 8, GETDATE(), 'admin@fpt.edu.vn')
SET IDENTITY_INSERT [dbo].[notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[wards] OFF
GO
/****** Object:  Index [UKnwjyg3u7b9v863i0mp6gcwbin]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[beds] ADD  CONSTRAINT [UKnwjyg3u7b9v863i0mp6gcwbin] UNIQUE NONCLUSTERED 
(
	[room_id] ASC,
	[bed_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK8li8r7cktrea79tpv6ewf9oc9]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[bills] ADD  CONSTRAINT [UK8li8r7cktrea79tpv6ewf9oc9] UNIQUE NONCLUSTERED 
(
	[bill_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKl61tawv0e2a93es77jkyvi7qa]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[cities] ADD  CONSTRAINT [UKl61tawv0e2a93es77jkyvi7qa] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKcumggxjbttojw3k8b7fgleib6]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[contracts] ADD  CONSTRAINT [UKcumggxjbttojw3k8b7fgleib6] UNIQUE NONCLUSTERED 
(
	[contract_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKs1kiilovn3yjsxurj2kbd8kbl]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[dormitory_buildings] ADD  CONSTRAINT [UKs1kiilovn3yjsxurj2kbd8kbl] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UKf3koj8icj2ik1sy33kqy7hlkw]    Script Date: 22/07/2026 9:04:37 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [UKf3koj8icj2ik1sy33kqy7hlkw] ON [dbo].[dormitory_buildings]
(
	[manager_id] ASC
)
WHERE ([manager_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UKrpm0r7fqgkiqnwjufx85bqt1k]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[floors] ADD  CONSTRAINT [UKrpm0r7fqgkiqnwjufx85bqt1k] UNIQUE NONCLUSTERED 
(
	[building_id] ASC,
	[floor_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK4kqb40gqwn1nim0p5hgqdf2pf]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[payment_transactions] ADD  CONSTRAINT [UK4kqb40gqwn1nim0p5hgqdf2pf] UNIQUE NONCLUSTERED 
(
	[txn_ref] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKh1ss8mmscopr690vkcj25uj9a]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[permissions] ADD  CONSTRAINT [UKh1ss8mmscopr690vkcj25uj9a] UNIQUE NONCLUSTERED 
(
	[permission_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UKt43p6aampim70fxxnkid1mibj]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[role_permissions] ADD  CONSTRAINT [UKt43p6aampim70fxxnkid1mibj] UNIQUE NONCLUSTERED 
(
	[role_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK716hgxp60ym1lifrdgp67xt5k]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[roles] ADD  CONSTRAINT [UK716hgxp60ym1lifrdgp67xt5k] UNIQUE NONCLUSTERED 
(
	[role_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK8dl6d7sxdgv423mluydhtmlyf]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[room_types] ADD  CONSTRAINT [UK8dl6d7sxdgv423mluydhtmlyf] UNIQUE NONCLUSTERED 
(
	[type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKhck015t6e1l454whcvh96mskd]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[rooms] ADD  CONSTRAINT [UKhck015t6e1l454whcvh96mskd] UNIQUE NONCLUSTERED 
(
	[floor_id] ASC,
	[room_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKci1s5s8npb7j044md3s0wdhsh]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[semesters] ADD  CONSTRAINT [UKci1s5s8npb7j044md3s0wdhsh] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK18jiqjra9dkkbn0d2d51plp0o]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[student_profiles] ADD  CONSTRAINT [UK18jiqjra9dkkbn0d2d51plp0o] UNIQUE NONCLUSTERED 
(
	[student_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK3by0vnnyaudp2mgl0y0a9730]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[student_whitelists] ADD  CONSTRAINT [UK3by0vnnyaudp2mgl0y0a9730] UNIQUE NONCLUSTERED 
(
	[email] ASC,
	[semester_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKm8f2nbspl47ueb0e5pnpm841c]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[student_whitelists] ADD  CONSTRAINT [UKm8f2nbspl47ueb0e5pnpm841c] UNIQUE NONCLUSTERED 
(
	[student_code] ASC,
	[semester_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UKa9dydk3dj4qb8cvmjijqnrg5t]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[user_roles] ADD  CONSTRAINT [UKa9dydk3dj4qb8cvmjijqnrg5t] UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK6dotkott2kjsp8vw4d0m25fb7]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [UK6dotkott2kjsp8vw4d0m25fb7] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UKhbvhqvjgmhd5omxyo67ynvbyp]    Script Date: 22/07/2026 9:04:37 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [UKhbvhqvjgmhd5omxyo67ynvbyp] ON [dbo].[users]
(
	[address_id] ASC
)
WHERE ([address_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UKdirl1y2cwmx152li20vt3jgq9]    Script Date: 22/07/2026 9:04:37 CH ******/
ALTER TABLE [dbo].[utility_usages] ADD  CONSTRAINT [UKdirl1y2cwmx152li20vt3jgq9] UNIQUE NONCLUSTERED 
(
	[room_id] ASC,
	[semester_id] ASC,
	[recorded_month] ASC,
	[recorded_year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[addresses]  WITH CHECK ADD  CONSTRAINT [FKgafq5o69m5p2rq5q5egx2sfm] FOREIGN KEY([ward_id])
REFERENCES [dbo].[wards] ([id])
GO
ALTER TABLE [dbo].[addresses] CHECK CONSTRAINT [FKgafq5o69m5p2rq5q5egx2sfm]
GO
ALTER TABLE [dbo].[beds]  WITH CHECK ADD  CONSTRAINT [FK2tg7eb23xlsy3mkhcqlp15aha] FOREIGN KEY([room_id])
REFERENCES [dbo].[rooms] ([id])
GO
ALTER TABLE [dbo].[beds] CHECK CONSTRAINT [FK2tg7eb23xlsy3mkhcqlp15aha]
GO
ALTER TABLE [dbo].[bills]  WITH CHECK ADD  CONSTRAINT [FK41m9kr1o92cv7q88op398202o] FOREIGN KEY([semester_id])
REFERENCES [dbo].[semesters] ([id])
GO
ALTER TABLE [dbo].[bills] CHECK CONSTRAINT [FK41m9kr1o92cv7q88op398202o]
GO
ALTER TABLE [dbo].[bills]  WITH CHECK ADD  CONSTRAINT [FKek37lide2h67ldqcwhr1n4bev] FOREIGN KEY([student_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[bills] CHECK CONSTRAINT [FKek37lide2h67ldqcwhr1n4bev]
GO
ALTER TABLE [dbo].[contracts]  WITH CHECK ADD  CONSTRAINT [FK1afl7ooynx3cjlb8ninid2ipk] FOREIGN KEY([student_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[contracts] CHECK CONSTRAINT [FK1afl7ooynx3cjlb8ninid2ipk]
GO
ALTER TABLE [dbo].[contracts]  WITH CHECK ADD  CONSTRAINT [FK4q48srmr4qtmof80tcivu1iq4] FOREIGN KEY([bed_id])
REFERENCES [dbo].[beds] ([id])
GO
ALTER TABLE [dbo].[contracts] CHECK CONSTRAINT [FK4q48srmr4qtmof80tcivu1iq4]
GO
ALTER TABLE [dbo].[contracts]  WITH CHECK ADD  CONSTRAINT [FK8qifmkmb3wihwt8dvs4xokp2c] FOREIGN KEY([checked_out_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[contracts] CHECK CONSTRAINT [FK8qifmkmb3wihwt8dvs4xokp2c]
GO
ALTER TABLE [dbo].[contracts]  WITH CHECK ADD  CONSTRAINT [FKi2imvwurafxbe2bbfnmnqlj51] FOREIGN KEY([semester_id])
REFERENCES [dbo].[semesters] ([id])
GO
ALTER TABLE [dbo].[contracts] CHECK CONSTRAINT [FKi2imvwurafxbe2bbfnmnqlj51]
GO
ALTER TABLE [dbo].[dormitory_buildings]  WITH CHECK ADD  CONSTRAINT [FKayk6eku1hauox12lwcx2ho4bh] FOREIGN KEY([manager_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[dormitory_buildings] CHECK CONSTRAINT [FKayk6eku1hauox12lwcx2ho4bh]
GO
ALTER TABLE [dbo].[floors]  WITH CHECK ADD  CONSTRAINT [FKdre95l7gbd24mjyr75jx6oj56] FOREIGN KEY([building_id])
REFERENCES [dbo].[dormitory_buildings] ([id])
GO
ALTER TABLE [dbo].[floors] CHECK CONSTRAINT [FKdre95l7gbd24mjyr75jx6oj56]
GO
ALTER TABLE [dbo].[issue_reports]  WITH CHECK ADD  CONSTRAINT [FK2d05j9ftdbpnkg6ykkw4f61pl] FOREIGN KEY([student_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[issue_reports] CHECK CONSTRAINT [FK2d05j9ftdbpnkg6ykkw4f61pl]
GO
ALTER TABLE [dbo].[issue_reports]  WITH CHECK ADD  CONSTRAINT [FKlqdc78hk9pn7anwo1d2t3derr] FOREIGN KEY([room_id])
REFERENCES [dbo].[rooms] ([id])
GO
ALTER TABLE [dbo].[issue_reports] CHECK CONSTRAINT [FKlqdc78hk9pn7anwo1d2t3derr]
GO
ALTER TABLE [dbo].[notifications]  WITH CHECK ADD  CONSTRAINT [FK13vcnq3ukas06ho1yrbc5lrb5] FOREIGN KEY([sender_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[notifications] CHECK CONSTRAINT [FK13vcnq3ukas06ho1yrbc5lrb5]
GO
ALTER TABLE [dbo].[notifications]  WITH CHECK ADD  CONSTRAINT [FKdehrfc8i9s7bu0rb2nh32n3hn] FOREIGN KEY([target_building_id])
REFERENCES [dbo].[dormitory_buildings] ([id])
GO
ALTER TABLE [dbo].[notifications] CHECK CONSTRAINT [FKdehrfc8i9s7bu0rb2nh32n3hn]
GO
ALTER TABLE [dbo].[notifications]  WITH CHECK ADD  CONSTRAINT [FKn6g6fg317xi593d8xovryrp2g] FOREIGN KEY([target_student_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[notifications] CHECK CONSTRAINT [FKn6g6fg317xi593d8xovryrp2g]
GO
ALTER TABLE [dbo].[payment_transactions]  WITH CHECK ADD  CONSTRAINT [FKi2ec4crri6xs92y09gqkom80e] FOREIGN KEY([bill_id])
REFERENCES [dbo].[bills] ([id])
GO
ALTER TABLE [dbo].[payment_transactions] CHECK CONSTRAINT [FKi2ec4crri6xs92y09gqkom80e]
GO
ALTER TABLE [dbo].[role_permissions]  WITH CHECK ADD  CONSTRAINT [FKegdk29eiy7mdtefy5c7eirr6e] FOREIGN KEY([permission_id])
REFERENCES [dbo].[permissions] ([id])
GO
ALTER TABLE [dbo].[role_permissions] CHECK CONSTRAINT [FKegdk29eiy7mdtefy5c7eirr6e]
GO
ALTER TABLE [dbo].[role_permissions]  WITH CHECK ADD  CONSTRAINT [FKn5fotdgk8d1xvo8nav9uv3muc] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[role_permissions] CHECK CONSTRAINT [FKn5fotdgk8d1xvo8nav9uv3muc]
GO
ALTER TABLE [dbo].[rooms]  WITH CHECK ADD  CONSTRAINT [FK71tvfklk03awky6oydmacgcoo] FOREIGN KEY([floor_id])
REFERENCES [dbo].[floors] ([id])
GO
ALTER TABLE [dbo].[rooms] CHECK CONSTRAINT [FK71tvfklk03awky6oydmacgcoo]
GO
ALTER TABLE [dbo].[rooms]  WITH CHECK ADD  CONSTRAINT [FKh9m2n1paq5hmd3u0klfl7wsfv] FOREIGN KEY([room_type_id])
REFERENCES [dbo].[room_types] ([id])
GO
ALTER TABLE [dbo].[rooms] CHECK CONSTRAINT [FKh9m2n1paq5hmd3u0klfl7wsfv]
GO
ALTER TABLE [dbo].[student_profiles]  WITH CHECK ADD  CONSTRAINT [FK32koy3tgqtaujxhfsn0b9pel2] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[student_profiles] CHECK CONSTRAINT [FK32koy3tgqtaujxhfsn0b9pel2]
GO
ALTER TABLE [dbo].[student_whitelists]  WITH CHECK ADD  CONSTRAINT [FK65cjk6xaun3q9q6oqxk5idtbw] FOREIGN KEY([semester_id])
REFERENCES [dbo].[semesters] ([id])
GO
ALTER TABLE [dbo].[student_whitelists] CHECK CONSTRAINT [FK65cjk6xaun3q9q6oqxk5idtbw]
GO
ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD  CONSTRAINT [FKh8ciramu9cc9q3qcqiv4ue8a6] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[user_roles] CHECK CONSTRAINT [FKh8ciramu9cc9q3qcqiv4ue8a6]
GO
ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD  CONSTRAINT [FKhfh9dx7w3ubf1co1vdev94g3f] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_roles] CHECK CONSTRAINT [FKhfh9dx7w3ubf1co1vdev94g3f]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FKaioa21he0ygjlsp2fckan4gda] FOREIGN KEY([building_id])
REFERENCES [dbo].[dormitory_buildings] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FKaioa21he0ygjlsp2fckan4gda]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FKe8vydtk7hf0y16bfm558sywbb] FOREIGN KEY([address_id])
REFERENCES [dbo].[addresses] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FKe8vydtk7hf0y16bfm558sywbb]
GO
ALTER TABLE [dbo].[utility_usages]  WITH CHECK ADD  CONSTRAINT [FK1pfa4i2qbc2qlbsas4m5bmnsg] FOREIGN KEY([room_id])
REFERENCES [dbo].[rooms] ([id])
GO
ALTER TABLE [dbo].[utility_usages] CHECK CONSTRAINT [FK1pfa4i2qbc2qlbsas4m5bmnsg]
GO
ALTER TABLE [dbo].[utility_usages]  WITH CHECK ADD  CONSTRAINT [FK2r9j9c8ljb7ut9mya70a64ybg] FOREIGN KEY([recorded_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[utility_usages] CHECK CONSTRAINT [FK2r9j9c8ljb7ut9mya70a64ybg]
GO
ALTER TABLE [dbo].[utility_usages]  WITH CHECK ADD  CONSTRAINT [FKfd02jt71gbls4i63mtccqctr4] FOREIGN KEY([semester_id])
REFERENCES [dbo].[semesters] ([id])
GO
ALTER TABLE [dbo].[utility_usages] CHECK CONSTRAINT [FKfd02jt71gbls4i63mtccqctr4]
GO
ALTER TABLE [dbo].[wards]  WITH CHECK ADD  CONSTRAINT [FK73y7rtdjdym0o5leip5oh2j0g] FOREIGN KEY([city_id])
REFERENCES [dbo].[cities] ([id])
GO
ALTER TABLE [dbo].[wards] CHECK CONSTRAINT [FK73y7rtdjdym0o5leip5oh2j0g]
GO
ALTER TABLE [dbo].[beds]  WITH CHECK ADD CHECK  (([status]='MAINTENANCE' OR [status]='OCCUPIED' OR [status]='AVAILABLE'))
GO
ALTER TABLE [dbo].[bills]  WITH CHECK ADD CHECK  (([bill_type]='PUNISH_BILL' OR [bill_type]='UTILITY_BILL' OR [bill_type]='ROOM_BILL'))
GO
ALTER TABLE [dbo].[bills]  WITH CHECK ADD CHECK  (([status]='REFUNDED' OR [status]='OVERDUE' OR [status]='PAID' OR [status]='UNPAID'))
GO
ALTER TABLE [dbo].[contracts]  WITH CHECK ADD CHECK  (([status]='CANCELED' OR [status]='CHECKED_OUT' OR [status]='ACTIVE' OR [status]='PENDING_APPROVAL'))
GO
ALTER TABLE [dbo].[dormitory_buildings]  WITH CHECK ADD CHECK  (([gender_type]='MIXED' OR [gender_type]='FEMALE' OR [gender_type]='MALE'))
GO
ALTER TABLE [dbo].[dormitory_buildings]  WITH CHECK ADD CHECK  (([status]='INACTIVE' OR [status]='ACTIVE'))
GO
ALTER TABLE [dbo].[floors]  WITH CHECK ADD CHECK  (([status]='INACTIVE' OR [status]='ACTIVE'))
GO
ALTER TABLE [dbo].[issue_reports]  WITH CHECK ADD CHECK  (([category]='OTHER' OR [category]='SECURITY' OR [category]='CLEANLINESS' OR [category]='FACILITY' OR [category]='WATER' OR [category]='ELECTRICITY'))
GO
ALTER TABLE [dbo].[issue_reports]  WITH CHECK ADD CHECK  (([status]='REJECTED' OR [status]='RESOLVED' OR [status]='IN_PROGRESS' OR [status]='PENDING'))
GO
ALTER TABLE [dbo].[notifications]  WITH CHECK ADD CHECK  (([category]='DISCIPLINE' OR [category]='MAINTENANCE' OR [category]='BILLING' OR [category]='GENERAL'))
GO
ALTER TABLE [dbo].[notifications]  WITH CHECK ADD CHECK  (([target_type]='STUDENT' OR [target_type]='BUILDING' OR [target_type]='ALL'))
GO
ALTER TABLE [dbo].[roles]  WITH CHECK ADD CHECK  (([role_name]='ROLE_STUDENT' OR [role_name]='ROLE_STAFF' OR [role_name]='ROLE_MANAGER' OR [role_name]='ROLE_ADMIN'))
GO
ALTER TABLE [dbo].[rooms]  WITH CHECK ADD CHECK  (([status]='MAINTENANCE' OR [status]='FULL' OR [status]='ACTIVE'))
GO
ALTER TABLE [dbo].[student_profiles]  WITH CHECK ADD CHECK  (([student_status]='EVICTED' OR [student_status]='EXPIRED' OR [student_status]='ACTIVE'))
GO
ALTER TABLE [dbo].[student_whitelists]  WITH CHECK ADD CHECK  (([gender]='MIXED' OR [gender]='FEMALE' OR [gender]='MALE'))
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD CHECK  (([gender]='MIXED' OR [gender]='FEMALE' OR [gender]='MALE'))
GO
USE [master]
GO
ALTER DATABASE [DormitoryManagement] SET  READ_WRITE 
GO
