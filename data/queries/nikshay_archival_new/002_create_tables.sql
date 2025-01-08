create table _Hierarchy( Id int identity primary key, Level int not null, Name nvarchar(255), Type nvarchar(255), Code nvarchar(255), Sector nvarchar(255), Parent_Id int, Level_1_Id int, Level_1_Name nvarchar(255), Level_1_Type nvarchar(255), Level_1_Code nvarchar(255), Level_2_Id int, Level_2_Name nvarchar(255), Level_2_Type nvarchar(255), Level_2_Code nvarchar(255), Level_3_Id int, Level_3_Name nvarchar(255), Level_3_Type nvarchar(255), Level_3_Code nvarchar(255), Level_4_Id int, Level_4_Name nvarchar(255), Level_4_Type nvarchar(255), Level_4_Code nvarchar(255), Level_5_Id int, Level_5_Name nvarchar(255), Level_5_Type nvarchar(255), Level_5_Code nvarchar(255), Level_6_Id int, Level_6_Name nvarchar(255), Level_6_Type nvarchar(255), Level_6_Code nvarchar(255), SuggestedParent_Id int, SuggestedParent_Name nvarchar(255), SuggestedParent_Type nvarchar(255), SuggestedParent_Code nvarchar(255), DrugRegimen nvarchar(20) constraint DF_drugregimen default 'UNKNOWN' not null, HasMERM bit default 0 not null, HasChildren bit default 0 not null, NikshayId varchar(32), ExtraData nvarchar(max), StartDate date, EndDate date, PfmsAgencyMapping int, HandlePfmsAgencyUpdate bit, IsNotActive bit default 0 not null, IsTribal bit default 0 not null, BeneficiaryId int default NULL, EligibleForIncentive bit default 1 not null, GeoLocation geography, PFMSDistrictCode nvarchar(20), PFMSStateCode nvarchar(20), MobileNumber nvarchar(15), HeadquarterPhi int, MermMappingLevel int, Latitude float, Longitude float, MergeStatus nvarchar(50));
