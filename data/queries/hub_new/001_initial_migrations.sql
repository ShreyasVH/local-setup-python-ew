create table SchemaVersions( Id int identity constraint PK_SchemaVersions_Id primary key, ScriptName nvarchar(255) not null, Applied datetime not null);