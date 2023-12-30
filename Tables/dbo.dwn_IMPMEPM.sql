CREATE TABLE [dbo].[dwn_IMPMEPM]
(
[IMPPRE] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IMPBAS] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IMPSUF] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IMSOH] [float] NOT NULL,
[IMONOR] [float] NOT NULL,
[IMCOMM] [float] NOT NULL,
[IMBOQT] [float] NOT NULL,
[IMLNEN] [float] NOT NULL,
[IMLNSH] [float] NOT NULL,
[IMMEBR] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IMSTDC] [float] NOT NULL,
[IMFILX] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
