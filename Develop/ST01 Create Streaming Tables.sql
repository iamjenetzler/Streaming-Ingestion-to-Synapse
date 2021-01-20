IF NOT EXISTS (SELECT * FROM sysobjects WHERE NAME='dwgranular' and xtype='U')
CREATE TABLE [dbo].[dwgranular]
( 
    [Pkey] [float]  NULL,
    [Time] [nvarchar](4000)  NULL,
    [Dspl] [nvarchar](4000)  NULL,
    [Dspl2] [nvarchar](4000)  NULL,
    [Temp] [float]  NULL,
    [Hmdt] [float]  NULL,
    [EventProcessedUtcTime] [datetime]  NULL,
    [PartitionId] [float]  NULL,
    [EventEnqueuedUtcTime] [datetime]  NULL
)
GO 

IF NOT EXISTS (SELECT * FROM sysobjects WHERE NAME='dwaggregate' and xtype='U')
CREATE TABLE [dbo].[dwaggregate]
( 
    [Dspl] [nvarchar](4000)  NULL,
    [AvgTemp] [float]  NULL,
    [MaxHmdt] [float]  NULL,
    [PartitionId] [float]  NULL
)
GO