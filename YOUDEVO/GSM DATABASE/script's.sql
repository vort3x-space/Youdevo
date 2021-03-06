USE [gsm]
GO
/****** Object:  Table [dbo].[bills]    Script Date: 18.10.2019 21:25:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bills](
	[id] [int] NOT NULL,
	[minute_amount] [int] NULL,
	[sms_amount] [int] NULL,
	[last_payment] [date] NULL,
	[subscribers_id] [int] NOT NULL,
 CONSTRAINT [PK_bills] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company_employees]    Script Date: 18.10.2019 21:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company_employees](
	[id] [int] NOT NULL,
	[staff_name] [char](20) NULL,
	[staff_surname] [char](20) NULL,
	[staff_province] [char](20) NULL,
	[staff_adress] [char](30) NULL,
	[staff_phone] [char](11) NULL,
	[staff_fax] [char](20) NULL,
	[staff_dealership_id] [int] NOT NULL,
 CONSTRAINT [PK_company_employees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regional_dealerships]    Script Date: 18.10.2019 21:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regional_dealerships](
	[id] [int] NOT NULL,
	[region_name] [char](20) NULL,
	[region_city] [char](20) NULL,
	[region_adress] [char](20) NULL,
 CONSTRAINT [PK_regional_dealerships] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sub_dealerships]    Script Date: 18.10.2019 21:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sub_dealerships](
	[id] [int] NOT NULL,
	[sub_region_name] [char](20) NULL,
	[sub_region_adress] [char](20) NULL,
	[regional_dealerships_id] [int] NOT NULL,
 CONSTRAINT [PK_sub_dealerships] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subscriber_web]    Script Date: 18.10.2019 21:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subscriber_web](
	[id] [char](20) NOT NULL,
	[user_name] [char](20) NULL,
	[password] [char](20) NULL,
	[last_entry] [char](20) NULL,
	[number_of_entries] [char](20) NULL,
	[subscriber_id] [int] NOT NULL,
 CONSTRAINT [PK_subscriber_web] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subscribers]    Script Date: 18.10.2019 21:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subscribers](
	[id] [int] NOT NULL,
	[subscriber_name] [char](20) NULL,
	[subscriber_surname] [char](20) NULL,
	[subscriber_home_adress] [char](30) NULL,
	[subscriber_job_adress] [char](30) NULL,
	[subscriber_province] [char](30) NULL,
	[subscriber__recipe_id] [char](20) NULL,
	[subscriber_dealership_id] [int] NULL,
	[subscriber_dateof_membership] [char](20) NULL,
	[subscriber_phone] [char](20) NULL,
	[subscriber_overseas_knowledge] [char](20) NULL,
 CONSTRAINT [PK_subscribers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tariff]    Script Date: 18.10.2019 21:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tariff](
	[id] [char](20) NOT NULL,
	[tariff_name] [char](20) NULL,
	[tariff_minute_bills] [char](20) NULL,
	[tariff_sms_bills] [char](20) NULL,
 CONSTRAINT [PK_tariff] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bills]  WITH CHECK ADD  CONSTRAINT [FK_bills_subscribers] FOREIGN KEY([subscribers_id])
REFERENCES [dbo].[subscribers] ([id])
GO
ALTER TABLE [dbo].[bills] CHECK CONSTRAINT [FK_bills_subscribers]
GO
ALTER TABLE [dbo].[company_employees]  WITH CHECK ADD  CONSTRAINT [FK_company_employees_regional_dealerships1] FOREIGN KEY([staff_dealership_id])
REFERENCES [dbo].[regional_dealerships] ([id])
GO
ALTER TABLE [dbo].[company_employees] CHECK CONSTRAINT [FK_company_employees_regional_dealerships1]
GO
ALTER TABLE [dbo].[sub_dealerships]  WITH CHECK ADD  CONSTRAINT [FK_sub_dealerships_regional_dealerships] FOREIGN KEY([regional_dealerships_id])
REFERENCES [dbo].[regional_dealerships] ([id])
GO
ALTER TABLE [dbo].[sub_dealerships] CHECK CONSTRAINT [FK_sub_dealerships_regional_dealerships]
GO
ALTER TABLE [dbo].[subscriber_web]  WITH CHECK ADD  CONSTRAINT [FK_subscriber_web_subscribers] FOREIGN KEY([subscriber_id])
REFERENCES [dbo].[subscribers] ([id])
GO
ALTER TABLE [dbo].[subscriber_web] CHECK CONSTRAINT [FK_subscriber_web_subscribers]
GO
ALTER TABLE [dbo].[subscribers]  WITH CHECK ADD  CONSTRAINT [FK_subscribers_regional_dealerships] FOREIGN KEY([subscriber_dealership_id])
REFERENCES [dbo].[regional_dealerships] ([id])
GO
ALTER TABLE [dbo].[subscribers] CHECK CONSTRAINT [FK_subscribers_regional_dealerships]
GO
ALTER TABLE [dbo].[subscribers]  WITH CHECK ADD  CONSTRAINT [FK_subscribers_tariff] FOREIGN KEY([subscriber__recipe_id])
REFERENCES [dbo].[tariff] ([id])
GO
ALTER TABLE [dbo].[subscribers] CHECK CONSTRAINT [FK_subscribers_tariff]
GO
