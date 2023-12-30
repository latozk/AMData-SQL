CREATE TABLE [dbo].[ref_Time]
(
[TimeKey] [int] NOT NULL,
[TimeAltKey] [int] NOT NULL,
[Time30] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Hour30] [tinyint] NOT NULL,
[MinuteNumber] [tinyint] NOT NULL,
[SecondNumber] [tinyint] NOT NULL,
[TimeInSecond] [int] NOT NULL,
[HourlyBucket] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DayTimeBucketGroupKey] [int] NOT NULL,
[DayTimeBucket] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Shift] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
