/****** Object:  Table [dbo].[tblAdmin]    Script Date: 6/6/2021 11:12:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdmin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [varchar](50) NULL,
	[role] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[status] [int] NULL,
	[date_created] [nvarchar](50) NULL,
	[created_by] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 6/6/2021 11:12:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_fname] [varchar](50) NULL,
	[employee_lname] [varchar](50) NULL,
	[employee_gender] [varchar](6) NULL,
	[employee_role] [nvarchar](50) NULL,
	[employee_email] [nvarchar](50) NULL,
	[employee_phone] [nvarchar](50) NULL,
	[employee_image] [nvarchar](max) NULL,
	[employee_password] [nvarchar](max) NULL,
	[account_status] [int] NULL,
	[employee_registered] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProject]    Script Date: 6/6/2021 11:12:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProject](
	[project_id] [int] IDENTITY(1,1) NOT NULL,
	[project_name] [nvarchar](70) NULL,
	[project_supervisor] [int] NULL,
	[project_created] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTask]    Script Date: 6/6/2021 11:12:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTask](
	[task_id] [int] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NULL,
	[supervisor_id] [int] NULL,
	[employee_id] [int] NULL,
	[task_name] [nvarchar](250) NULL,
	[task_desc] [nvarchar](max) NULL,
	[task_startdate] [nvarchar](50) NULL,
	[task_enddate] [nvarchar](50) NULL,
	[task_completedate] [nvarchar](50) NULL,
	[task_status] [nvarchar](11) NULL,
	[task_delete] [int] NULL,
	[created_by] [nvarchar](50) NULL,
	[date_created] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblWork]    Script Date: 6/6/2021 11:12:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWork](
	[work_id] [int] IDENTITY(1,1) NOT NULL,
	[task_id] [int] NULL,
	[project_id] [int] NULL,
	[supervisor_id] [int] NULL,
	[employee_id] [int] NULL,
	[work_date] [nvarchar](50) NULL,
	[work_location] [nvarchar](50) NULL,
	[work_desc] [nvarchar](max) NULL,
	[work_status] [nvarchar](11) NULL,
	[work_hrs] [nvarchar](5) NULL,
	[work_mins] [nvarchar](5) NULL,
	[work_time] [nvarchar](10) NULL,
	[worklog_desc] [nvarchar](max) NULL,
	[work_delete] [int] NULL,
	[log_hrs] [nvarchar](5) NULL,
	[log_mins] [nvarchar](5) NULL,
	[log_time] [nvarchar](5) NULL,
	[time_diff] [nvarchar](50) NULL,
	[date_created] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblAdmin] ON 

INSERT [dbo].[tblAdmin] ([admin_id], [fullname], [role], [username], [email], [password], [status], [date_created], [created_by]) VALUES (1, N'Okechukwu Emmanuel', N'ICT', N'Admin', N'admin@worklog.com', N'admin', 1, N'10-May-2021', N'System')
INSERT [dbo].[tblAdmin] ([admin_id], [fullname], [role], [username], [email], [password], [status], [date_created], [created_by]) VALUES (2, N'Dr. Jacob Ikenna ', N'Manager', N'ikenna', N'chatwithdrikenna@hotmail.com', N'admin', 1, N'05-Jun-2021', N'Okechulwu Emmanuel')
SET IDENTITY_INSERT [dbo].[tblAdmin] OFF
SET IDENTITY_INSERT [dbo].[tblEmployee] ON 

INSERT [dbo].[tblEmployee] ([employee_id], [employee_fname], [employee_lname], [employee_gender], [employee_role], [employee_email], [employee_phone], [employee_image], [employee_password], [account_status], [employee_registered]) VALUES (1, N'JOSHUA', N'NNADI', N'Male', N'Operations', N'nnadijoshua@gmail.com', N'+2349034567811', N'~/images/profile/decisionmake.jpg', N'demo', 1, N'11-May-2021')
INSERT [dbo].[tblEmployee] ([employee_id], [employee_fname], [employee_lname], [employee_gender], [employee_role], [employee_email], [employee_phone], [employee_image], [employee_password], [account_status], [employee_registered]) VALUES (2, N'EMMANUEL', N'NDUKA', N'Male', N'Executive', N'ndukaemmanuel@gmail.com', N'08123456789', N'~/images/profile/keyunlock.png', N'demo', 1, N'26-May-2021')
SET IDENTITY_INSERT [dbo].[tblEmployee] OFF
SET IDENTITY_INSERT [dbo].[tblProject] ON 

INSERT [dbo].[tblProject] ([project_id], [project_name], [project_supervisor], [project_created]) VALUES (2, N'WEALTH CREATION', 1, N'13-May-2021')
INSERT [dbo].[tblProject] ([project_id], [project_name], [project_supervisor], [project_created]) VALUES (3, N'CONNECTU', 2, N'13-May-2021')
INSERT [dbo].[tblProject] ([project_id], [project_name], [project_supervisor], [project_created]) VALUES (4, N'FACEBOOK MARKETING', 1, N'26-May-2021')
SET IDENTITY_INSERT [dbo].[tblProject] OFF
SET IDENTITY_INSERT [dbo].[tblTask] ON 

INSERT [dbo].[tblTask] ([task_id], [project_id], [supervisor_id], [employee_id], [task_name], [task_desc], [task_startdate], [task_enddate], [task_completedate], [task_status], [task_delete], [created_by], [date_created]) VALUES (1, 2, 1, 1, N'Digital Marketing', N'Create & Promote Wealth Creation social media posts & boost page to reach 50,000 likes/followers', N'17-May-2021', N'01-Jun-2021', NULL, N'Completed', 0, N'NNADI JOSHUA', N'14-May-2021')
INSERT [dbo].[tblTask] ([task_id], [project_id], [supervisor_id], [employee_id], [task_name], [task_desc], [task_startdate], [task_enddate], [task_completedate], [task_status], [task_delete], [created_by], [date_created]) VALUES (2, 3, 1, 1, N'Invitations', N'Sending Booklet Invitations', N'18-May-2021', N'31-May-2021', NULL, N'Active', 0, N'NNADI JOSHUA', N'15-May-2021')
INSERT [dbo].[tblTask] ([task_id], [project_id], [supervisor_id], [employee_id], [task_name], [task_desc], [task_startdate], [task_enddate], [task_completedate], [task_status], [task_delete], [created_by], [date_created]) VALUES (3, 2, 1, 2, N'Roll Call', N'Employee Roll Call', N'31-May-2021', N'10-Jun-2021', NULL, N'Active', 0, N'NDUKA EMMANUEL', N'21-May-2021')
INSERT [dbo].[tblTask] ([task_id], [project_id], [supervisor_id], [employee_id], [task_name], [task_desc], [task_startdate], [task_enddate], [task_completedate], [task_status], [task_delete], [created_by], [date_created]) VALUES (1003, 4, 1, 2, N'Content Writing', N'I will be responsible for writing contents for Facebook Marketing ', N'31-May-2021', N'14-Jun-2021', NULL, N'Active', 0, N'NDUKA EMMANUEL', N'26-May-2021')
INSERT [dbo].[tblTask] ([task_id], [project_id], [supervisor_id], [employee_id], [task_name], [task_desc], [task_startdate], [task_enddate], [task_completedate], [task_status], [task_delete], [created_by], [date_created]) VALUES (1004, 2, 1, 2, N'Business Coaching', N'You''ll be responsible for coaching all Employees of Wealth Creation Organization for 3 weeks starting from 14th June, 2021. Your duty will involve both oral & practical training for all staffs. Training days are only Monday-Wednesday.', N'14-Jun-2021', N'30-Jun-2021', NULL, N'Pending', 0, N'OKECHULWU EMMANUEL (ADMIN)', N'05-Jun-2021')
SET IDENTITY_INSERT [dbo].[tblTask] OFF
SET IDENTITY_INSERT [dbo].[tblWork] ON 

INSERT [dbo].[tblWork] ([work_id], [task_id], [project_id], [supervisor_id], [employee_id], [work_date], [work_location], [work_desc], [work_status], [work_hrs], [work_mins], [work_time], [worklog_desc], [work_delete], [log_hrs], [log_mins], [log_time], [time_diff], [date_created]) VALUES (2, 2, 3, 1, 1, N'17-May-2021', N'Office', N'To send invitation emails to shareholders & investors for the upcoming seminar.', N'Completed', N'03', N'40', N'03:40', N'The invitations have been sent to the shareholders & investors.', 0, N'02', N'15', N'02:15', N'1 hours, 25 minutes', N'17-May-2021')
INSERT [dbo].[tblWork] ([work_id], [task_id], [project_id], [supervisor_id], [employee_id], [work_date], [work_location], [work_desc], [work_status], [work_hrs], [work_mins], [work_time], [worklog_desc], [work_delete], [log_hrs], [log_mins], [log_time], [time_diff], [date_created]) VALUES (3, 1, 2, 1, 1, N'18-May-2021', N'Wesley Cathedral, Enugu', N'Unplanned Task', N'Completed', N'00', N'00', N'00:00', N'Assign new roll calls to the new arriving batch of entrepreneur.', 0, N'02', N'30', N'02:30', N'0 hours, 0 minutes', N'18-May-2021')
INSERT [dbo].[tblWork] ([work_id], [task_id], [project_id], [supervisor_id], [employee_id], [work_date], [work_location], [work_desc], [work_status], [work_hrs], [work_mins], [work_time], [worklog_desc], [work_delete], [log_hrs], [log_mins], [log_time], [time_diff], [date_created]) VALUES (4, 2, 3, 1, 1, N'18-May-2021', N'Office', N'To send invitation emails to employees and global partners.', N'Completed', N'02', N'20', N'02:20', N'Emails has been sent to all Employees and Global Partners.', 0, N'01', N'13', N'01:13', N'1 hours, 7 minutes', N'18-May-2021')
INSERT [dbo].[tblWork] ([work_id], [task_id], [project_id], [supervisor_id], [employee_id], [work_date], [work_location], [work_desc], [work_status], [work_hrs], [work_mins], [work_time], [worklog_desc], [work_delete], [log_hrs], [log_mins], [log_time], [time_diff], [date_created]) VALUES (5, 3, 2, 1, 1, N'21-May-2021', N'Convocation Arena', N'A Roll Call will be conducted by 1pm by the VC', N'Completed', N'03', N'32', N'03:32', N'The roll call was conducted by the VC by 2pm', 0, N'02', N'00', N'02:00', N'1 hours, 32 minutes', N'21-May-2021')
INSERT [dbo].[tblWork] ([work_id], [task_id], [project_id], [supervisor_id], [employee_id], [work_date], [work_location], [work_desc], [work_status], [work_hrs], [work_mins], [work_time], [worklog_desc], [work_delete], [log_hrs], [log_mins], [log_time], [time_diff], [date_created]) VALUES (1005, 1003, 4, 1, 2, N'26-May-2021', N'Home', N'I will be posting content write up on Facebook social media platforms.', N'Cancelled', N'02', N'17', N'02:17', N'I successfully posted content write-up on Facebook social media platforms', 0, N'01', N'30', N'01:30', N'0 hours, 47 minutes', N'26-May-2021')
INSERT [dbo].[tblWork] ([work_id], [task_id], [project_id], [supervisor_id], [employee_id], [work_date], [work_location], [work_desc], [work_status], [work_hrs], [work_mins], [work_time], [worklog_desc], [work_delete], [log_hrs], [log_mins], [log_time], [time_diff], [date_created]) VALUES (1006, 3, 2, 1, 2, N'26-May-2021', N'Hostel', N'Unplanned Task', N'Completed', N'00', N'00', N'00:00', N'Roll call was done by 8pm and a total number of 52 students were present and 10 was absent!', 0, N'01', N'00', N'01:00', N'0 hours, 0 minutes', N'26-May-2021')
SET IDENTITY_INSERT [dbo].[tblWork] OFF
