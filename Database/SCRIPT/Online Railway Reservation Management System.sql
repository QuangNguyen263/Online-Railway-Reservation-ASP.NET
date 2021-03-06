CREATE DATABASE [Online Railway reservation system]
GO
USE [Online Railway reservation system]
GO
/****** Object:  Table [dbo].[Coaches]    Script Date: 7/18/2015 12:54:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coaches](
	[Coach_ID] [int] IDENTITY(1,1) NOT NULL,
	[Coach_Type] [nvarchar](50) NULL,
	[Train_ID] [int] NULL,
	[Number_Of_Seats] [int] NULL,
	[Price] [float] NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Coach_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Passengers]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passengers](
	[PNR] [nvarchar](50) NOT NULL,
	[Passenger_Name] [nvarchar](100) NULL,
	[Date_Of_Birth] [date] NULL,
	[Card_Code] [nvarchar](20) NULL,
	[Gender] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone_Number] [nvarchar](20) NULL,
	[Address] [nvarchar](200) NULL,
 CONSTRAINT [PK__Passenge__C5773DD253EDE422] PRIMARY KEY CLUSTERED 
(
	[PNR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Role_ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stations]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stations](
	[Station_ID] [int] IDENTITY(1,1) NOT NULL,
	[Station_Name] [nvarchar](50) NULL,
	[Latitude] [float] NULL,
	[Longtitude] [float] NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Station_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[Ticket_ID] [int] IDENTITY(1,1) NOT NULL,
	[PNR] [nvarchar](50) NULL,
	[Passenger_type] [nvarchar](30) NULL,
	[Status] [nvarchar](20) NULL,
	[Train_ID] [int] NULL,
	[Departure_Date] [date] NULL,
	[Departure_Time] [time](7) NULL,
	[Coach_Type] [nvarchar](30) NULL,
	[Price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Ticket_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Timetables]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetables](
	[Timetable_ID] [int] IDENTITY(1,1) NOT NULL,
	[Departure_Date] [date] NULL,
	[Departure_Time] [time](7) NULL,
	[Arrival_Date] [date] NULL,
	[Arrival_Time] [time](7) NULL,
	[Distance] [float] NULL,
	[Train_ID] [int] NULL,
 CONSTRAINT [PK_Timetables] PRIMARY KEY CLUSTERED 
(
	[Timetable_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trains]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trains](
	[Train_ID] [int] IDENTITY(1,1) NOT NULL,
	[Train_Name] [nvarchar](50) NOT NULL,
	[Origin_Station_ID] [int] NOT NULL,
	[Destination_Station_ID] [int] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[Train_Type] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK__Trains__10A3065C82E0C09B] PRIMARY KEY CLUSTERED 
(
	[Train_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone_Number] [nvarchar](20) NULL,
	[Gender] [nvarchar](20) NULL,
	[Security_Code] [nvarchar](50) NULL,
	[Role_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Coaches] ON 

INSERT [dbo].[Coaches] ([Coach_ID], [Coach_Type], [Train_ID], [Number_Of_Seats], [Price], [Status]) VALUES (24, N'AC 1', 12, 4, 20, N'Active')
INSERT [dbo].[Coaches] ([Coach_ID], [Coach_Type], [Train_ID], [Number_Of_Seats], [Price], [Status]) VALUES (25, N'Sleeper', 13, 22, 43, N'Active')
INSERT [dbo].[Coaches] ([Coach_ID], [Coach_Type], [Train_ID], [Number_Of_Seats], [Price], [Status]) VALUES (27, N'AC 1', 15, 20, 22, N'Active')
INSERT [dbo].[Coaches] ([Coach_ID], [Coach_Type], [Train_ID], [Number_Of_Seats], [Price], [Status]) VALUES (28, N'AC 1', 16, 25, 17, N'Active')
INSERT [dbo].[Coaches] ([Coach_ID], [Coach_Type], [Train_ID], [Number_Of_Seats], [Price], [Status]) VALUES (29, N'AC 1', 11, 25, 17, N'Active')
INSERT [dbo].[Coaches] ([Coach_ID], [Coach_Type], [Train_ID], [Number_Of_Seats], [Price], [Status]) VALUES (33, N'AC 1', 14, 18, 18, N'Active')
INSERT [dbo].[Coaches] ([Coach_ID], [Coach_Type], [Train_ID], [Number_Of_Seats], [Price], [Status]) VALUES (37, N'AC 1', 10, 3, 45, N'Active')
INSERT [dbo].[Coaches] ([Coach_ID], [Coach_Type], [Train_ID], [Number_Of_Seats], [Price], [Status]) VALUES (38, N'Sleeper', 11, 20, 34, N'Active')
INSERT [dbo].[Coaches] ([Coach_ID], [Coach_Type], [Train_ID], [Number_Of_Seats], [Price], [Status]) VALUES (39, N'Sleeper', 12, 28, 45, N'Active')
INSERT [dbo].[Coaches] ([Coach_ID], [Coach_Type], [Train_ID], [Number_Of_Seats], [Price], [Status]) VALUES (40, N'AC 1', 13, 23, 24, N'Active')
INSERT [dbo].[Coaches] ([Coach_ID], [Coach_Type], [Train_ID], [Number_Of_Seats], [Price], [Status]) VALUES (41, N'Sleeper', 14, 18, 46, N'Active')
INSERT [dbo].[Coaches] ([Coach_ID], [Coach_Type], [Train_ID], [Number_Of_Seats], [Price], [Status]) VALUES (42, N'Sleeper', 15, 39, 46, N'Active')
INSERT [dbo].[Coaches] ([Coach_ID], [Coach_Type], [Train_ID], [Number_Of_Seats], [Price], [Status]) VALUES (43, N'Sleeper', 16, 17, 67, N'Active')
INSERT [dbo].[Coaches] ([Coach_ID], [Coach_Type], [Train_ID], [Number_Of_Seats], [Price], [Status]) VALUES (44, N'Sleeper', 17, 24, 50, N'Active')
INSERT [dbo].[Coaches] ([Coach_ID], [Coach_Type], [Train_ID], [Number_Of_Seats], [Price], [Status]) VALUES (45, N'AC 1', 17, 23, 19.5, N'Active')
INSERT [dbo].[Coaches] ([Coach_ID], [Coach_Type], [Train_ID], [Number_Of_Seats], [Price], [Status]) VALUES (46, N'Sleeper', 11, 20, 36.8, N'Active')
INSERT [dbo].[Coaches] ([Coach_ID], [Coach_Type], [Train_ID], [Number_Of_Seats], [Price], [Status]) VALUES (48, N'AC 1', 11, 20, 20, N'Active')
SET IDENTITY_INSERT [dbo].[Coaches] OFF
INSERT [dbo].[Passengers] ([PNR], [Passenger_Name], [Date_Of_Birth], [Card_Code], [Gender], [Email], [Phone_Number], [Address]) VALUES (N'T194194', N'dkjsfhjk dskjfksdh', CAST(N'1995-06-06' AS Date), N'code123456', N'Male', N'thanhnamvt2011@gmail.com', N'3546476767', N'fxcvxcvxcv')
INSERT [dbo].[Passengers] ([PNR], [Passenger_Name], [Date_Of_Birth], [Card_Code], [Gender], [Email], [Phone_Number], [Address]) VALUES (N'T328328', N'Nguyen Van Quang', CAST(N'1995-03-08' AS Date), N'code123456', N'Male', N'nguyenvanquang263@gmail.com', N'2435678897', N'sedfghkkhjgfhdgxsdfghkjlhhddfhgkjlhgjfhgjkhgjfhghjjkhhgfgjhkjhgfhjhggkhjgjfhjkgjfhgjhjgfghjgfghjghgfdsedfghkkhjgfhdgxsdfghkjlhhddfhgkjlhgjfhgjkhgjfhghjjkhhgfgjhkjhgfhjhggkhjgjfhjkgjfhgjhjgfghjgfghjghg')
INSERT [dbo].[Passengers] ([PNR], [Passenger_Name], [Date_Of_Birth], [Card_Code], [Gender], [Email], [Phone_Number], [Address]) VALUES (N'T532532', N'Nguyen Quang', CAST(N'1995-07-13' AS Date), N'code123456', N'Male', N'thanhnamvt2011@gmail.com', N'632640845', N'dsgdhjgkh')
INSERT [dbo].[Passengers] ([PNR], [Passenger_Name], [Date_Of_Birth], [Card_Code], [Gender], [Email], [Phone_Number], [Address]) VALUES (N'T780780', N'nam thanh tran', CAST(N'1995-10-29' AS Date), N'code123456', N'Male', N'thanhnamvt2011@gmail.com', N'012345678', N'd2')
INSERT [dbo].[Passengers] ([PNR], [Passenger_Name], [Date_Of_Birth], [Card_Code], [Gender], [Email], [Phone_Number], [Address]) VALUES (N'T859859', N'mamam nam', CAST(N'1995-10-29' AS Date), N'code123456', N'Male', N'thanhnamvt2011@gmail.com', N'1234567890', N'dfghjkl')
INSERT [dbo].[Passengers] ([PNR], [Passenger_Name], [Date_Of_Birth], [Card_Code], [Gender], [Email], [Phone_Number], [Address]) VALUES (N'T897897', N'nam hyuhh', CAST(N'1995-10-29' AS Date), N'code123456', N'Male', N'thanhnamvt2011@gmail.com', N'1234567890', N'vfgbhnjk,l')
INSERT [dbo].[Passengers] ([PNR], [Passenger_Name], [Date_Of_Birth], [Card_Code], [Gender], [Email], [Phone_Number], [Address]) VALUES (N'T922922', N'nam thanh tran', CAST(N'1995-10-29' AS Date), NULL, NULL, N'nguyenvanquang263@gmail.com', N'0128518527', NULL)
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Role_ID], [Role_Name]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([Role_ID], [Role_Name]) VALUES (2, N'Ticketing Staff')
INSERT [dbo].[Roles] ([Role_ID], [Role_Name]) VALUES (3, N'Train Staff')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Stations] ON 

INSERT [dbo].[Stations] ([Station_ID], [Station_Name], [Latitude], [Longtitude], [Status]) VALUES (19, N'Ha Noi', 21.023811, 105.840343, N'Active')
INSERT [dbo].[Stations] ([Station_ID], [Station_Name], [Latitude], [Longtitude], [Status]) VALUES (20, N'Sai Gon', 10.782682, 106.677203, N'Active')
INSERT [dbo].[Stations] ([Station_ID], [Station_Name], [Latitude], [Longtitude], [Status]) VALUES (21, N'Da Nang', 16.072022, 108.208495, N'Active')
INSERT [dbo].[Stations] ([Station_ID], [Station_Name], [Latitude], [Longtitude], [Status]) VALUES (22, N'Da Lat', 11.947906, 108.464046, N'Active')
INSERT [dbo].[Stations] ([Station_ID], [Station_Name], [Latitude], [Longtitude], [Status]) VALUES (23, N'Hai Phong', 20.856355, 106.687461, N'Active')
INSERT [dbo].[Stations] ([Station_ID], [Station_Name], [Latitude], [Longtitude], [Status]) VALUES (24, N'ACB', 124.45, 12345.67, N'Active')
SET IDENTITY_INSERT [dbo].[Stations] OFF
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([Ticket_ID], [PNR], [Passenger_type], [Status], [Train_ID], [Departure_Date], [Departure_Time], [Coach_Type], [Price]) VALUES (51, N'T532532', N'Adult', N'Block', 10, CAST(N'2015-07-18' AS Date), CAST(N'03:00:00' AS Time), N'AC 1', 45)
INSERT [dbo].[Tickets] ([Ticket_ID], [PNR], [Passenger_type], [Status], [Train_ID], [Departure_Date], [Departure_Time], [Coach_Type], [Price]) VALUES (54, N'T897897', N'Adult', N'active', 13, CAST(N'2015-07-20' AS Date), CAST(N'06:00:00' AS Time), N'AC 1', 24)
INSERT [dbo].[Tickets] ([Ticket_ID], [PNR], [Passenger_type], [Status], [Train_ID], [Departure_Date], [Departure_Time], [Coach_Type], [Price]) VALUES (55, N'T859859', N'Adult', N'active', 11, CAST(N'2015-07-24' AS Date), CAST(N'09:00:00' AS Time), N'AC 1', 17)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
SET IDENTITY_INSERT [dbo].[Timetables] ON 

INSERT [dbo].[Timetables] ([Timetable_ID], [Departure_Date], [Departure_Time], [Arrival_Date], [Arrival_Time], [Distance], [Train_ID]) VALUES (18, CAST(N'2015-07-24' AS Date), CAST(N'09:00:00' AS Time), CAST(N'2015-07-25' AS Date), CAST(N'12:00:00' AS Time), 24000, 11)
INSERT [dbo].[Timetables] ([Timetable_ID], [Departure_Date], [Departure_Time], [Arrival_Date], [Arrival_Time], [Distance], [Train_ID]) VALUES (19, CAST(N'2015-07-26' AS Date), CAST(N'10:00:00' AS Time), CAST(N'2015-07-27' AS Date), CAST(N'11:00:00' AS Time), 30000, 14)
SET IDENTITY_INSERT [dbo].[Timetables] OFF
SET IDENTITY_INSERT [dbo].[Trains] ON 

INSERT [dbo].[Trains] ([Train_ID], [Train_Name], [Origin_Station_ID], [Destination_Station_ID], [Status], [Train_Type]) VALUES (10, N'Bac Nam', 19, 20, N'Active', N'Daily')
INSERT [dbo].[Trains] ([Train_ID], [Train_Name], [Origin_Station_ID], [Destination_Station_ID], [Status], [Train_Type]) VALUES (11, N'Thong Nhat', 20, 22, N'Active', N'Daily')
INSERT [dbo].[Trains] ([Train_ID], [Train_Name], [Origin_Station_ID], [Destination_Station_ID], [Status], [Train_Type]) VALUES (12, N'Ha Nang', 19, 21, N'Active', N'Daily')
INSERT [dbo].[Trains] ([Train_ID], [Train_Name], [Origin_Station_ID], [Destination_Station_ID], [Status], [Train_Type]) VALUES (13, N'Bac Nam 2', 20, 19, N'Active', N'Daily')
INSERT [dbo].[Trains] ([Train_ID], [Train_Name], [Origin_Station_ID], [Destination_Station_ID], [Status], [Train_Type]) VALUES (14, N'Thong Nhat 2', 22, 20, N'Active', N'Daily')
INSERT [dbo].[Trains] ([Train_ID], [Train_Name], [Origin_Station_ID], [Destination_Station_ID], [Status], [Train_Type]) VALUES (15, N'Ha Nang 2', 21, 19, N'Active', N'Daily')
INSERT [dbo].[Trains] ([Train_ID], [Train_Name], [Origin_Station_ID], [Destination_Station_ID], [Status], [Train_Type]) VALUES (16, N'Nang Lat', 21, 22, N'Active', N'Daily')
INSERT [dbo].[Trains] ([Train_ID], [Train_Name], [Origin_Station_ID], [Destination_Station_ID], [Status], [Train_Type]) VALUES (17, N'Nang Lat 2', 22, 21, N'Active', N'Daily')
INSERT [dbo].[Trains] ([Train_ID], [Train_Name], [Origin_Station_ID], [Destination_Station_ID], [Status], [Train_Type]) VALUES (19, N'ABCD', 19, 20, N'Active', N'Special')
SET IDENTITY_INSERT [dbo].[Trains] OFF
INSERT [dbo].[Users] ([Username], [Password], [Email], [Phone_Number], [Gender], [Security_Code], [Role_ID]) VALUES (N'admin', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'thanhnamvt2011@gmail.com', N'123456789', N'Male', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', 1)
INSERT [dbo].[Users] ([Username], [Password], [Email], [Phone_Number], [Gender], [Security_Code], [Role_ID]) VALUES (N'admin2', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'thanhnamvt2011@gmail.com', N'098765432', N'Other', N'307CDDE1BF3D756FE651AF6D27546687D5207993', 2)
INSERT [dbo].[Users] ([Username], [Password], [Email], [Phone_Number], [Gender], [Security_Code], [Role_ID]) VALUES (N'admin3', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'thanhnamvt2011@gmail.com', N'123456789', N'Female', N'0483F1EF3E84E0A017FFF3F51DFD579CEC42B3E0', 3)
INSERT [dbo].[Users] ([Username], [Password], [Email], [Phone_Number], [Gender], [Security_Code], [Role_ID]) VALUES (N'asdfgh', N'6A62BCD3487C1F74F8E943DFDB5E1005E249171B', N'nguyenvanquang263@gmail.com', N'234567890-', N'Male', N'6A62BCD3487C1F74F8E943DFDB5E1005E249171B', 2)
INSERT [dbo].[Users] ([Username], [Password], [Email], [Phone_Number], [Gender], [Security_Code], [Role_ID]) VALUES (N'demo', N'0EC9BAA6AA3729F0AE83483B4400130D79943652', N'thanhnamvt2011@gmail.com', N'1234567890', N'Male', N'0EC9BAA6AA3729F0AE83483B4400130D79943652', 2)
INSERT [dbo].[Users] ([Username], [Password], [Email], [Phone_Number], [Gender], [Security_Code], [Role_ID]) VALUES (N'demo2', N'C5B8C90FF7E4E3914752A70FE53BFB33DBCA3548', N'thanhnamvt2011@gmail.com', N'987654325678', N'Other', N'C5B8C90FF7E4E3914752A70FE53BFB33DBCA3548', 2)
INSERT [dbo].[Users] ([Username], [Password], [Email], [Phone_Number], [Gender], [Security_Code], [Role_ID]) VALUES (N'demo3', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'thanhnamvt2011@gmail.com', N'123456789', N'Male', N'C847766CDB71FD03329F3EF3693C229652701D98', 2)
ALTER TABLE [dbo].[Coaches]  WITH CHECK ADD  CONSTRAINT [FK_Coaches_Trains] FOREIGN KEY([Train_ID])
REFERENCES [dbo].[Trains] ([Train_ID])
GO
ALTER TABLE [dbo].[Coaches] CHECK CONSTRAINT [FK_Coaches_Trains]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Passengers] FOREIGN KEY([PNR])
REFERENCES [dbo].[Passengers] ([PNR])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Passengers]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Trains] FOREIGN KEY([Train_ID])
REFERENCES [dbo].[Trains] ([Train_ID])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Trains]
GO
ALTER TABLE [dbo].[Timetables]  WITH CHECK ADD  CONSTRAINT [FK_Timetables_Trains] FOREIGN KEY([Train_ID])
REFERENCES [dbo].[Trains] ([Train_ID])
GO
ALTER TABLE [dbo].[Timetables] CHECK CONSTRAINT [FK_Timetables_Trains]
GO
ALTER TABLE [dbo].[Trains]  WITH CHECK ADD  CONSTRAINT [FK_Trains_Stations] FOREIGN KEY([Destination_Station_ID])
REFERENCES [dbo].[Stations] ([Station_ID])
GO
ALTER TABLE [dbo].[Trains] CHECK CONSTRAINT [FK_Trains_Stations]
GO
ALTER TABLE [dbo].[Trains]  WITH CHECK ADD  CONSTRAINT [FK_Trains_Stations1] FOREIGN KEY([Origin_Station_ID])
REFERENCES [dbo].[Stations] ([Station_ID])
GO
ALTER TABLE [dbo].[Trains] CHECK CONSTRAINT [FK_Trains_Stations1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Roles] ([Role_ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[Add_Coaches]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Add_Coaches]
@Coach_Type nvarchar(50),
@Train_ID int,
@Number_Of_Seats int,
@Price float,
@Status nvarchar(20)
as
begin
insert into [dbo].[Coaches]([Coach_Type],[Train_ID],[Number_Of_Seats],[Price],[Status])
values (@Coach_Type,@Train_ID,@Number_Of_Seats,@Price,@Status)
end


GO
/****** Object:  StoredProcedure [dbo].[Add_Passengers]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Passengers]
@PNR nvarchar(50),
@Passenger_Name nvarchar(100),
@Date_Of_Birth date,
@Card_Code nvarchar(20),
@Gender nvarchar(20),
@Email nvarchar(100),
@Phone_Number nvarchar(20),
@Address nvarchar(200)
as
begin
insert into [dbo].[Passengers]([PNR],[Passenger_Name],[Date_Of_Birth],[Card_Code],[Gender],[Email],[Phone_Number],[Address])
values (@PNR,@Passenger_Name,@Date_Of_Birth,@Card_Code,@Gender,@Email,@Phone_Number,@Address)
end


GO
/****** Object:  StoredProcedure [dbo].[Add_Roles]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Roles]
@Role_Name nvarchar(50)
as
begin
insert into [dbo].[Roles]([Role_Name])
values (@Role_Name)
end


GO
/****** Object:  StoredProcedure [dbo].[Add_Stations]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Stations]
@Station_Name nvarchar(50),
@Latitude float,
@Longtitude float,
@Status nvarchar(20)
as
begin
insert into [dbo].[Stations]([Station_Name],[Latitude],[Longtitude],[Status])
values (@Station_Name,@Latitude,@Longtitude,@Status)
end


GO
/****** Object:  StoredProcedure [dbo].[Add_Tickets]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Tickets]
@PNR nvarchar(50),
@Passenger_Type nvarchar(50),
@Status nvarchar(20),
@Train_ID int,
@Departure_Date date,
@Departure_Time time(5),
@Coach_type nvarchar(30),
@Price float
as
begin
insert into [dbo].[Tickets]([PNR],[Passenger_type],[Status],[Train_ID],[Departure_Date],[Departure_Time],[Coach_Type],[Price])
values (@PNR,@Passenger_Type,@Status,@Train_ID,@Departure_Date,@Departure_Time,@Coach_type,@Price)
end
GO
/****** Object:  StoredProcedure [dbo].[Add_Timetables]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Add_Timetables]
@Departure_Date date,
@Departure_Time time(7),
@Arrival_Date date,
@Arrival_Time time(7),
@Distance float,
@Train_ID int
as
begin
insert into [dbo].[Timetables]([Departure_Date],[Departure_Time],[Arrival_Date],[Arrival_Time],[Distance],[Train_ID])
values (@Departure_Date,@Departure_Time,@Arrival_Date,@Arrival_Time,@Distance,@Train_ID)
end


GO
/****** Object:  StoredProcedure [dbo].[Add_Trains]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Trains]
@Train_Name nvarchar(50),
@Origin_Station_ID int,
@Destination_Station_ID int,
@Status nvarchar(20),
@Train_Type nvarchar(20)
as
begin
insert into [dbo].[Trains]([Train_Name],[Origin_Station_ID],[Destination_Station_ID],[Status],[Train_Type])
values (@Train_Name,@Origin_Station_ID,@Destination_Station_ID,@Status,@Train_Type)
end


GO
/****** Object:  StoredProcedure [dbo].[Add_Users]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Users]
@Username nvarchar(100),
@Password nvarchar(100),
@Email nvarchar(100),
@Phone_Number nvarchar(20),
@Gender nvarchar(20),
@Security_Code nvarchar(50),
@Role_ID int
as
begin
insert into [dbo].[Users]([Username],[Password],[Email],[Phone_Number],[Gender],[Security_Code],[Role_ID])
values (@Username,@Password,@Email,@Phone_Number,@Gender,@Security_Code,@Role_ID)
end


GO
/****** Object:  StoredProcedure [dbo].[Cancel_Ticket]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Cancel_Ticket]
@Ticket_ID int,
@Status nvarchar(20)
as
begin
update [dbo].[Tickets]
set [Status]=@Status
where Ticket_ID=@Ticket_ID
end
GO
/****** Object:  StoredProcedure [dbo].[Delete_Coaches]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Delete_Coaches]
@Coach_ID int
as
begin
delete from [dbo].[Coaches] where Coach_ID=@Coach_ID
end


GO
/****** Object:  StoredProcedure [dbo].[Delete_Passengers]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Delete_Passengers]
@PNR nvarchar(50)
as
begin
delete from [dbo].[Passengers] 
where PNR=@PNR
end


GO
/****** Object:  StoredProcedure [dbo].[Delete_Roles]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_Roles] 
@Role_ID int
as
begin
delete from [dbo].[Roles] 
where Role_ID=@Role_ID
end


GO
/****** Object:  StoredProcedure [dbo].[Delete_Stations]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_Stations]
@Station_ID int
as
begin
delete from [dbo].[Stations] 
where Station_ID=@Station_ID
end


GO
/****** Object:  StoredProcedure [dbo].[Delete_Tickets]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Delete_Tickets]
@Ticket_ID int
as
begin
delete from [dbo].[Tickets] 
where Ticket_ID=@Ticket_ID
end



GO
/****** Object:  StoredProcedure [dbo].[Delete_Timetables]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_Timetables]
@Timetable_ID int
as
begin
delete from [dbo].[Timetables] 
where Timetable_ID=@Timetable_ID
end


GO
/****** Object:  StoredProcedure [dbo].[Delete_Trains]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_Trains]
@Train_ID int
as
begin
delete from [dbo].[Trains] 
where Train_ID=@Train_ID
end


GO
/****** Object:  StoredProcedure [dbo].[Delete_Users]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Delete_Users]
@Username nvarchar(100)
as
begin
delete from [dbo].[Users] 
where Username=@Username
end


GO
/****** Object:  StoredProcedure [dbo].[Get_All_Coaches]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Get_All_Coaches]
as
select co.*, tr.Train_Name from Coaches co, Trains tr where co.Train_ID = tr.Train_ID 


GO
/****** Object:  StoredProcedure [dbo].[Get_All_Ticket_v2]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Get_All_Ticket_v2]
as
select tk.*, (select tr.Train_Name from Trains tr where tk.Train_ID = tr.Train_ID) as Train_Name
from Tickets tk
GO
/****** Object:  StoredProcedure [dbo].[get_All_Timetables_v2]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_All_Timetables_v2]
as
begin
	select tr.Train_Name, tm.*, 
	(select st.Station_Name from Stations st where tr.Origin_Station_ID = st.Station_ID) as origin_station,
	(select st.Station_Name from Stations st where tr.Destination_Station_ID = st.Station_ID) as destination_station
	from Trains tr, Timetables tm
	where tr.Train_ID = tm.Train_ID
end
GO
/****** Object:  StoredProcedure [dbo].[Get_All_Train_v2]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Get_All_Train_v2]
as
select
tr.*, 
(select Stations.Station_Name from Stations where Stations.Station_ID = tr.Origin_Station_ID) as 'origin_station',
(select Stations.Station_Name from Stations where Stations.Station_ID = tr.Destination_Station_ID) as 'destin_station'
from Trains tr
GO
/****** Object:  StoredProcedure [dbo].[Get_All_User_v2]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Get_All_User_v2]
as
select Users.*, Roles.Role_Name from Users, Roles where Users.Role_ID = Roles.Role_ID
GO
/****** Object:  StoredProcedure [dbo].[get_Coach_By_ID]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_Coach_By_ID]
@Coach_ID int
as
begin 
select * from [dbo].[Coaches]
where Coach_ID=@Coach_ID
end


GO
/****** Object:  StoredProcedure [dbo].[Get_Coach_By_Train]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Get_Coach_By_Train]
(@trainid int)
as
select Coaches.*, Trains.Train_Name from Coaches, Trains where Coaches.Train_ID = @Trainid and Trains.Train_ID = Coaches.Train_ID
GO
/****** Object:  StoredProcedure [dbo].[Get_Coach_By_Train_ID]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Get_Coach_By_Train_ID]
(@Train_id int)
as
select Coaches.*, Trains.Train_Name from Coaches, Trains where Coaches.Train_ID = @Train_id and Trains.Train_ID = Coaches.Train_ID

GO
/****** Object:  StoredProcedure [dbo].[get_Passenger_By_Email]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_Passenger_By_Email]
@Email nvarchar(100),
@Phone_Number nvarchar(20)
as
begin 
select * from [dbo].[Passengers]
where Email=@Email and Phone_Number=@Phone_Number
end
GO
/****** Object:  StoredProcedure [dbo].[get_Passenger_By_PNR]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_Passenger_By_PNR]
@PNR nvarchar(50)
as
begin 
select * from [dbo].[Passengers]
where PNR=@PNR
end



GO
/****** Object:  StoredProcedure [dbo].[get_Role_By_ID]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_Role_By_ID]
@Role_ID int
as
begin 
select * from [dbo].[Roles]
where Role_ID=@Role_ID
end


GO
/****** Object:  StoredProcedure [dbo].[get_Station_By_ID]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Get Station by ID*/

create procedure [dbo].[get_Station_By_ID]
@Station_ID int
as
begin 
select * from [dbo].[Stations]
where Station_ID=@Station_ID
end


GO
/****** Object:  StoredProcedure [dbo].[get_Station_By_Status]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[get_Station_By_Status]
@Status nvarchar(20)
as
begin 
select * from [dbo].[Stations]
where [Status]=@Status
end
GO
/****** Object:  StoredProcedure [dbo].[Get_Station_By_Train_ID]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Get_Station_By_Train_ID]
(@train_id int)
as
select 
	(select st.Station_Name from Stations st where st.Station_ID = tr.Origin_Station_ID) as Origin_name,
	(select st.Station_Name from Stations st where st.Station_ID = tr.Destination_Station_ID) as Destin_name
from Trains tr where tr.Train_ID = @train_id
GO
/****** Object:  StoredProcedure [dbo].[get_Ticket_By_ID]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_Ticket_By_ID]
@Ticket_ID int
as
begin 
select * from [dbo].[Tickets]
where Ticket_ID=@Ticket_ID
end



GO
/****** Object:  StoredProcedure [dbo].[Get_Ticket_By_ID_v2]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Get_Ticket_By_ID_v2]
(@id int)
as
select tk.*, (select Train_Name from Trains where tk.Train_ID = Trains.Train_ID) as Train_Name
from Tickets tk where tk.Ticket_ID = @id
GO
/****** Object:  StoredProcedure [dbo].[get_Ticket_By_PNR]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_Ticket_By_PNR]
@PNR nvarchar(50)
as
begin 
select [dbo].[Tickets].*,[dbo].[Trains].Train_Name,(select [dbo].[Stations].Station_Name from [dbo].[Stations] where [dbo].[Stations].Station_ID = [dbo].[Trains].Destination_Station_ID) as 'Destination_Station', (select [dbo].[Stations].Station_Name from [dbo].[Stations] where [dbo].[Stations].Station_ID = [dbo].[Trains].Origin_Station_ID) as 'Origin_Station'
from [dbo].[Tickets],[dbo].[Trains]
where [dbo].[Tickets].PNR=@PNR and [dbo].[Tickets].Train_ID=[dbo].[Trains].Train_ID
end
GO
/****** Object:  StoredProcedure [dbo].[get_Ticket_By_TrainID]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_Ticket_By_TrainID]
@Train_ID int,
@Coach_Type nvarchar(50)
as
begin 
select * from [dbo].[Tickets]
where [dbo].[Tickets].Train_ID=@Train_ID and [dbo].[Tickets].Coach_Type=@Coach_Type
end
GO
/****** Object:  StoredProcedure [dbo].[get_Timetable_By_ID]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_Timetable_By_ID]
@Timetable_ID int
as
begin 
select * from [dbo].[Timetables]
where Timetable_ID=@Timetable_ID
end


GO
/****** Object:  StoredProcedure [dbo].[Get_Timetable_By_Train_ID]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Get_Timetable_By_Train_ID](@train_id int)as
select tr.Train_Name, tm.*, 
	(select st.Station_Name from Stations st where tr.Origin_Station_ID = st.Station_ID) as origin_station,
	(select st.Station_Name from Stations st where tr.Destination_Station_ID = st.Station_ID) as destination_station
	from Trains tr, Timetables tm
	where tr.Train_ID = tm.Train_ID and tr.Train_ID=@train_id
GO
/****** Object:  StoredProcedure [dbo].[get_Train_By_ID]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_Train_By_ID]
@Train_ID int
as
begin 
select * from [dbo].[Trains]
where Train_ID=@Train_ID
end


GO
/****** Object:  StoredProcedure [dbo].[Get_train_By_OS]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Get_train_By_OS]
@Origin_Station_ID int
as
begin 
select [dbo].[Trains].* from [dbo].[Trains],[dbo].[Stations]
where [dbo].[Trains].Origin_Station_ID=@Origin_Station_ID and [dbo].[Trains].[Status] = 'active' and [dbo].[Stations].[Status]='active'
and [dbo].[Trains].Destination_Station_ID=[dbo].[Stations].Station_ID
end
GO
/****** Object:  StoredProcedure [dbo].[Get_Train_By_Time_Sche]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Get_Train_By_Time_Sche]
@Train_id int,
@Departure_Date date
as
begin 
select [dbo].[Trains].Train_ID,[dbo].[Trains].Train_Name,[dbo].[Trains].Train_Type,
[dbo].[Timetables].Timetable_ID,[dbo].[Timetables].Departure_Date,[dbo].[Timetables].Departure_Time,[dbo].[Timetables].Distance,
[dbo].[Stations].Station_ID,[Stations].Station_Name
from [dbo].[Trains],[dbo].[Timetables],[dbo].[Stations]
where [dbo].[Trains].Train_ID = @Train_id
and [dbo].[Timetables].Departure_Date=@Departure_Date 
and [dbo].[Trains].Train_ID = [dbo].[Timetables].Train_ID 
and  [dbo].[Trains].Destination_Station_ID = [dbo].[Stations].Station_ID
end
GO
/****** Object:  StoredProcedure [dbo].[Get_Train_By_Time_Sche2]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Get_Train_By_Time_Sche2] 
@Train_id int,
@Departure_Date date
as
begin 
select [dbo].[Trains].Train_ID,[dbo].[Trains].Train_Name,[dbo].[Trains].Train_Type,
[dbo].[Timetables].Timetable_ID,[dbo].[Timetables].Departure_Date,[dbo].[Timetables].Departure_Time,[dbo].[Timetables].Distance,
[dbo].[Stations].Station_ID,[Stations].Station_Name
from [dbo].[Trains],[dbo].[Timetables],[dbo].[Stations]
where [dbo].[Trains].Train_ID = @Train_id
and [dbo].[Timetables].Departure_Date>@Departure_Date 
and [dbo].[Trains].Train_ID = [dbo].[Timetables].Train_ID 
and  [dbo].[Trains].Destination_Station_ID = [dbo].[Stations].Station_ID
end
GO
/****** Object:  StoredProcedure [dbo].[Get_Train_Des]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Get_Train_Des]
@Origin_Station_ID int,
@Departure_Date date
as
begin 
select [dbo].[Trains].*,[dbo].[Timetables].Timetable_ID,[dbo].[Timetables].Departure_Date,[dbo].[Timetables].Departure_Time,[dbo].[Timetables].Distance,[dbo].[Stations].Station_ID,[Stations].Station_Name,[Stations].[Status]  from [dbo].[Trains],[dbo].[Timetables],[dbo].[Stations]
where Origin_Station_ID=@Origin_Station_ID and [dbo].[Trains].[Status]='active' and [dbo].[Stations].[Status]='active'
and Departure_Date=@Departure_Date and [dbo].[Trains].Train_ID = [dbo].[Timetables].Train_ID and  [dbo].[Trains].Destination_Station_ID = [dbo].[Stations].Station_ID
end
GO
/****** Object:  StoredProcedure [dbo].[Get_Train_Des_Schedule]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Get_Train_Des_Schedule]
@Origin_Station_ID int,
@Departure_Date date
as
begin 
select [dbo].[Trains].*,[dbo].[Timetables].Timetable_ID,[dbo].[Timetables].Departure_Date,[dbo].[Timetables].Departure_Time,[dbo].[Timetables].Distance,[dbo].[Stations].Station_ID,[Stations].Station_Name,[Stations].[Status]  from [dbo].[Trains],[dbo].[Timetables],[dbo].[Stations]
where Origin_Station_ID=@Origin_Station_ID and [dbo].[Trains].[Status]='active' and [dbo].[Stations].[Status]='active'
and Departure_Date=@Departure_Date and [dbo].[Trains].Train_ID = [dbo].[Timetables].Train_ID and  [dbo].[Trains].Destination_Station_ID = [dbo].[Stations].Station_ID
end
GO
/****** Object:  StoredProcedure [dbo].[Get_Train_Des2]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Get_Train_Des2]
@Origin_Station_ID int,
@Departure_Date date
as
begin 
select [dbo].[Trains].*,[dbo].[Timetables].Timetable_ID,[dbo].[Timetables].Departure_Date,[dbo].[Timetables].Departure_Time,[dbo].[Timetables].Arrival_Date,[dbo].[Timetables].Arrival_Time,[dbo].[Timetables].Distance,[dbo].[Stations].Station_ID,[Stations].Station_Name,[Stations].[Status]  from [dbo].[Trains],[dbo].[Timetables],[dbo].[Stations]
where Origin_Station_ID=@Origin_Station_ID and [dbo].[Trains].[Status]='active' and [dbo].[Stations].[Status]='active'
and Departure_Date>@Departure_Date and [dbo].[Trains].Train_ID = [dbo].[Timetables].Train_ID and  [dbo].[Trains].Destination_Station_ID = [dbo].[Stations].Station_ID
end
GO
/****** Object:  StoredProcedure [dbo].[get_User_By_Username]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_User_By_Username]
@Username nvarchar(100)
as
begin 
select * from [dbo].[Users]
where Username=@Username
end


GO
/****** Object:  StoredProcedure [dbo].[Get_User_By_UserName_v2]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Get_User_By_UserName_v2]
(@username nvarchar(50))
as
select Users.*, Roles.Role_Name from Users, Roles where Users.Role_ID = Roles.Role_ID and Users.Username = @username
GO
/****** Object:  StoredProcedure [dbo].[getAll_Coaches]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Procedure for Coaches table*/
/*Get all coach from database*/
create procedure [dbo].[getAll_Coaches]
as
begin 
select * from [dbo].[Coaches]
end


GO
/****** Object:  StoredProcedure [dbo].[getAll_Passengers]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*Procedure for Passengers table*/
/*Get all passenger from database*/
create procedure [dbo].[getAll_Passengers]
as
begin 
select * from [dbo].[Passengers]
end


GO
/****** Object:  StoredProcedure [dbo].[getAll_Roles]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAll_Roles]
as
begin 
select * from [dbo].[Roles]
end


GO
/****** Object:  StoredProcedure [dbo].[getAll_Stations]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getAll_Stations]
as
begin 
select * from [dbo].[Stations]
end

GO
/****** Object:  StoredProcedure [dbo].[getAll_Tickets]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAll_Tickets]
as
begin 
select * from [dbo].[Tickets]
end


GO
/****** Object:  StoredProcedure [dbo].[getAll_Timetables]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAll_Timetables]
as
begin 
select * from [dbo].[Timetables]
end



GO
/****** Object:  StoredProcedure [dbo].[getAll_Trains]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAll_Trains]
as
begin 
select * from [dbo].[Trains]
end


GO
/****** Object:  StoredProcedure [dbo].[getAll_Users]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAll_Users]
as
begin 
select * from [dbo].[Users]
end


GO
/****** Object:  StoredProcedure [dbo].[login]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[login](
	@username nvarchar(50),
	@password nvarchar(100)
)as
select * from Users where Users.Username=@username and Users.Password=@password
GO
/****** Object:  StoredProcedure [dbo].[Search_Coach_Type]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Search_Coach_Type] 
@Train_ID int,
@Coach_Type nvarchar(50)
as
begin 
select * from [dbo].[Coaches]
where Train_ID=@Train_ID and Coach_Type=@Coach_Type and [Status]='active'
end
GO
/****** Object:  StoredProcedure [dbo].[Search_Station]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Search_Station]
@Station_Name nvarchar(50)
as
begin 
select * from [dbo].[Stations]
where Station_Name=@Station_Name
end



GO
/****** Object:  StoredProcedure [dbo].[Search_Ticket_By_PNR]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Search_Ticket_By_PNR]
(@pnr nvarchar(50))
as
select tk.*, (select tr.Train_Name from Trains tr where tk.Train_ID = tr.Train_ID) as Train_Name
from Tickets tk where tk.PNR = @pnr
GO
/****** Object:  StoredProcedure [dbo].[Search_Timetable]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Search_Timetable]
@Train_ID int
as
begin 
select * from [dbo].[Timetables]
where Train_ID=@Train_ID
end



GO
/****** Object:  StoredProcedure [dbo].[Search_Train]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Search_Train]
@Origin_Station_ID int,
@Destination_Station_ID int
as
begin 
select * from [dbo].[Trains]
where Origin_Station_ID=@Origin_Station_ID and Destination_Station_ID=@Destination_Station_ID
end


GO
/****** Object:  StoredProcedure [dbo].[Search_Train_By_DestST]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[Search_Train_By_DestST]
@Origin_Station_ID int,
@Departure_Date date
as
begin 
select [dbo].[Trains].*,[dbo].[Timetables].Timetable_ID,[dbo].[Timetables].Departure_Date,[dbo].[Timetables].Departure_Time,[dbo].[Timetables].Arrival_Date,[dbo].[Timetables].Arrival_Time,[dbo].[Timetables].Distance,[dbo].[Stations].Station_ID,[Stations].Station_Name,[Stations].[Status]  from [dbo].[Trains],[dbo].[Timetables],[dbo].[Stations]
where Origin_Station_ID=@Origin_Station_ID and [dbo].[Trains].[Status]='active' and [dbo].[Stations].[Status]='active'
and Departure_Date>@Departure_Date and [dbo].[Trains].Train_ID = [dbo].[Timetables].Train_ID and  [dbo].[Trains].Destination_Station_ID = [dbo].[Stations].Station_ID
end
GO
/****** Object:  StoredProcedure [dbo].[Search_Train_By_Train_id]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Search_Train_By_Train_id]
(@train_id int)
as
select
tr.*, 
(select Stations.Station_Name from Stations where Stations.Station_ID = tr.Origin_Station_ID) as 'origin_station',
(select Stations.Station_Name from Stations where Stations.Station_ID = tr.Destination_Station_ID) as 'destin_station'
from Trains tr where tr.Train_ID = @train_id
GO
/****** Object:  StoredProcedure [dbo].[Search_Train_Information]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Search_Train_Information]
@Origin_Station_ID int,
@Destination_Station_ID int,
@Departure_Date date
as
begin 
select [dbo].[Trains].*,[dbo].[Timetables].* from [dbo].[Trains],[dbo].[Timetables]
where Origin_Station_ID=@Origin_Station_ID and Destination_Station_ID=@Destination_Station_ID
and Departure_Date=@Departure_Date and [dbo].[Trains].Train_ID = [dbo].[Timetables].Train_ID
end
GO
/****** Object:  StoredProcedure [dbo].[Search_Train_TimeTable]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Search_Train_TimeTable]
@Origin_Station_ID int,
@Destination_Station_ID int,
@Departure_Date date
as
begin 
select [dbo].[Trains].*,[dbo].[Timetables].Timetable_ID,[dbo].[Timetables].Departure_Date,[dbo].[Timetables].Departure_Time,[dbo].[Timetables].Arrival_Date,[dbo].[Timetables].Arrival_Time,[dbo].[Timetables].Distance from [dbo].[Trains],[dbo].[Timetables]
where Origin_Station_ID=@Origin_Station_ID and Destination_Station_ID=@Destination_Station_ID and [Status]='active'
and Departure_Date=@Departure_Date and [dbo].[Trains].Train_ID = [dbo].[Timetables].Train_ID
end
GO
/****** Object:  StoredProcedure [dbo].[Search_Username_By_ID]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Search_Username_By_ID](
@username nvarchar(50)
)
as begin
select Users.*,(select Roles.Role_Name from Roles where Roles.Role_ID = Users.Role_ID)
as 'Rolename'
from Users where Users.Username = @username
end
GO
/****** Object:  StoredProcedure [dbo].[Update_Coaches]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Update_Coaches]
@Coach_ID int,
@Coach_Type nvarchar(50),
@Train_ID int,
@Number_Of_Seats int,
@Price float,
@Status nvarchar(20)
as
begin
update [dbo].[Coaches]
set Coach_Type=@Coach_Type,
Train_ID=@Train_ID,
Number_Of_Seats=@Number_Of_Seats,
Price=@Price,
[Status]=@Status
where Coach_ID=@Coach_ID
end


GO
/****** Object:  StoredProcedure [dbo].[Update_Info]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Update_Info](
@username nvarchar(100),
@email nvarchar(100),
@phone nvarchar(20),
@gender nvarchar(20)
)
as begin 
update Users
set Email=@email, Phone_Number=@phone, Gender=@gender
where Username=@username
end
GO
/****** Object:  StoredProcedure [dbo].[Update_Passengers]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Update_Passengers]
@PNR nvarchar(50),
@Passenger_Name nvarchar(100),
@Date_Of_Birth date,
@Card_Code nvarchar(20),
@Gender nvarchar(20),
@Email nvarchar(100),
@Phone_Number nvarchar(20),
@Address nvarchar(200)
as
begin
update [dbo].[Passengers]
set Passenger_Name=@Passenger_Name,
Date_Of_Birth=@Date_Of_Birth,
Card_Code=@Card_Code,
Gender=@Gender,
Email=@Email,
Phone_Number=@Phone_Number,
[Address]=@Address
where PNR=@PNR
end


GO
/****** Object:  StoredProcedure [dbo].[Update_Password]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Update_Password](
@username nvarchar(100),
@password nvarchar(100)
)
as begin
update Users 
set Password=@password 
where Username=@username
end
GO
/****** Object:  StoredProcedure [dbo].[Update_Roles]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Update_Roles]
@Role_ID int,
@Role_Name nvarchar(50)
as
begin
update [dbo].[Roles] set Role_Name=@Role_Name
where Role_ID=@Role_ID
end



GO
/****** Object:  StoredProcedure [dbo].[Update_Stations]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Update_Stations]
@Station_ID int,
@Station_Name nvarchar(50),
@Latitude float,
@Longtitude float,
@Status nvarchar(20)
as
begin
update [dbo].[Stations]
set Station_Name=@Station_Name,
Latitude=@Latitude,
Longtitude=@Longtitude,
[Status]=@Status
where Station_ID=@Station_ID
end


GO
/****** Object:  StoredProcedure [dbo].[Update_Tickets]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Update_Tickets]
@Ticket_ID int,
@PNR nvarchar(50),
@Passenger_Type nvarchar(50),
@Status nvarchar(20),
@Train_ID int,
@Departure_Date date,
@Departure_Time time(5),
@Coach_Type nvarchar(50),
@Price float
as
begin
update [dbo].[Tickets]
set PNR=@PNR,
Passenger_type=@Passenger_Type,
[Status]=@Status,
Train_ID=@Train_ID,
Departure_Date=@Departure_Date,
Departure_Time=@Departure_Time,
Coach_Type=@Coach_Type,
Price=@Price
where Ticket_ID=@Ticket_ID
end
GO
/****** Object:  StoredProcedure [dbo].[Update_Timetables]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Update_Timetables]
@Timetable_ID int,
@Departure_Date date,
@Departure_Time time(7),
@Arrival_Date date,
@Arrival_Time time(7),
@Distance float,
@Train_ID int
as
begin
update [dbo].[Timetables]
set Departure_Date=@Departure_Date,
Departure_Time=@Departure_Time,
Arrival_Date=@Arrival_Date,
Arrival_Time=@Arrival_Time,
Distance=@Distance,
Train_ID=@Train_ID
where Timetable_ID=@Timetable_ID
end



GO
/****** Object:  StoredProcedure [dbo].[Update_Trains]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Update_Trains]
@Train_ID int,
@Train_Name nvarchar(50),
@Origin_Station_ID int,
@Destination_Station_ID int,
@Status nvarchar(20),
@Train_Type nvarchar(20)
as
begin
update [dbo].[Trains]
set Train_Name=@Train_Name,
Origin_Station_ID=@Origin_Station_ID,
Destination_Station_ID=@Destination_Station_ID,
[Status]=@Status,
Train_Type=@Train_Type
where Train_ID=@Train_ID
end


GO
/****** Object:  StoredProcedure [dbo].[Update_Users]    Script Date: 7/18/2015 12:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Update_Users]
@Username nvarchar(100),
@Password nvarchar(100),
@Email nvarchar(100),
@Phone_Number nvarchar(20),
@Gender nvarchar(20),
@Security_Code nvarchar(50),
@Role_ID int
as
begin
update [dbo].[Users]
set [Password]=@Password,
Email=@Email,
Phone_Number=@Phone_Number,
Gender=@Gender,
Security_Code=@Security_Code,
Role_ID=@Role_ID
where Username=@Username
end
GO
