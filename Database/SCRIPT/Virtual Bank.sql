
CREATE DATABASE [Bank_Accounts]
GO
USE [Bank_Accounts]
GO
/****** Object:  Table [dbo].[Person_Accounts]    Script Date: 7/17/2015 9:00:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person_Accounts](
	[Account_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Expiration_Date] [date] NULL,
	[Card_Code] [nvarchar](20) NULL,
	[CVV/CSC] [nvarchar](3) NULL,
	[Total_Amount] [float] NULL,
	[Username] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
 CONSTRAINT [PK_Person_Accounts] PRIMARY KEY CLUSTERED 
(
	[Account_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Person_Accounts] ON 

INSERT [dbo].[Person_Accounts] ([Account_ID], [Name], [Expiration_Date], [Card_Code], [CVV/CSC], [Total_Amount], [Username], [Password]) VALUES (1, N'username', CAST(N'2017-01-10' AS Date), N'code123456', N'cod', 999998974.5, N'username', N'1234567')
INSERT [dbo].[Person_Accounts] ([Account_ID], [Name], [Expiration_Date], [Card_Code], [CVV/CSC], [Total_Amount], [Username], [Password]) VALUES (3, N'admin1', CAST(N'2017-01-10' AS Date), N'admi123456', N'adm', 1000000, N'admin1', N'1234567')
INSERT [dbo].[Person_Accounts] ([Account_ID], [Name], [Expiration_Date], [Card_Code], [CVV/CSC], [Total_Amount], [Username], [Password]) VALUES (4, N'admin', CAST(N'2017-05-05' AS Date), N'adm12345678910', N'adm', 1000001025.5, N'admin', N'15935789')
SET IDENTITY_INSERT [dbo].[Person_Accounts] OFF
