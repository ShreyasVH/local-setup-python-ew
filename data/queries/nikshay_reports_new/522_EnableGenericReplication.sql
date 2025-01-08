CREATE TABLE IndexTable( Id bigint IDENTITY(1,1) NOT NULL, DatabaseName nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, IndexType nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, TableName nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, IndexName nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, IndexScript nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL, CONSTRAINT PK__IndexTable PRIMARY KEY (Id));


CREATE TABLE [_Lateral_Login]( ID int IDENTITY(1,1) NOT NULL, UserName nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL, Hierarchycode nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL, Hierarchy_ID int NOT NULL, H_Type varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL, isDeleted int NULL, LastUpdated datetime NULL, CONSTRAINT PK___Lateral__3214EC2780685316 PRIMARY KEY (ID));

CREATE FUNCTION [dbo].[GetLateralUser]( @userName nchar(500)) RETURNS varchar(50) AS BEGIN DECLARE @isExist int if (select (case when count(ID)>0 then 1 else 0 end) from _Lateral_Login where username=@userName)=1 SET @isExist=1 RETURN @isExist END;

