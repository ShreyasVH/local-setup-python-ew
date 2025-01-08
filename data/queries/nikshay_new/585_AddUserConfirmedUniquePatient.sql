INSERT INTO _Beneficiary (BankAccountNo, BankId, PfmsStatus, PfmsId, LastUpdatedManuallyBy, LastUpdatedManuallyAt, ValidatedBeneficiaryName, StateCode, DistrictCode, AddedbyDbtMigration, TempBeneficiaryType, TempNikshayBeneficiaryId, PfmsStatusTribal, BeneficiaryName, ValidatingPfmsAgency, CurrentPfmsAgency, LastBenefitSentToPfmsOn, TempNikshayId, TempMigrationId, PfmsIdTribal, EntityType, IsDeleted, DuplicateCount, StatusBeforeApproval, NewBankId, NewBankAccountNo, IsVerifiedDuplicate, PfmsStatusInformant, PfmsIdInformant, PhotoProof, AccountOwner, CreatedAt, UpdatedAt) VALUES (null, null, N'EMPTY', null, null, null, null, N'29', N'536', (SELECT Id FROM Foreign_Booleans WHERE Name = 'false'), null, null, N'EMPTY', N'User Confirmed Unique', null, null, null, null, null, null, N'C_Patient', (SELECT Id FROM Foreign_Booleans WHERE Name = 'false'), 0, null, null, null, (SELECT Id FROM Foreign_Booleans WHERE Name = 'false'), N'EMPTY', null, null, null, 'DATE_TIME_PLUS_0_DAY', 'DATE_TIME_PLUS_0_DAY');
INSERT INTO _BeneficiaryEntityLinkage (BeneficiaryId, EntityId, EntityType) VALUES ((SELECT id FROM _Beneficiary WHERE BeneficiaryName = 'User Confirmed Unique'), (SELECT Id FROM Foreign_Persons WHERE FirstName = 'User Confirmed' AND LastName = 'Unique'), N'Person');

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'User Confirmed Unique') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'User Confirmed Unique') as nvarchar(50)), N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'User Confirmed Unique') as nvarchar(50)), N'PfmsStatus', null, N'EMPTY', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'User Confirmed Unique') as nvarchar(50)), N'CreatedAt', null, N'DATE_TIME_PLUS_0_DAY_DATE_FIRST', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'User Confirmed Unique') as nvarchar(50)), N'UpdatedAt', null, N'DATE_TIME_PLUS_0_DAY_DATE_FIRST', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'User Confirmed Unique') as nvarchar(50)), N'StateCode', null, N'29', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'User Confirmed Unique') as nvarchar(50)), N'DistrictCode', null, N'536', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'User Confirmed Unique') as nvarchar(50)), N'AddedbyDbtMigration', null, N'False', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'User Confirmed Unique') as nvarchar(50)), N'PfmsStatusTribal', null, N'EMPTY', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'User Confirmed Unique') as nvarchar(50)), N'BeneficiaryName', null, N'User Confirmed Unique', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'User Confirmed Unique') as nvarchar(50)), N'EntityType', null, N'C_Patient', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'User Confirmed Unique') as nvarchar(50)), N'IsDeleted', null, N'False', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'User Confirmed Unique') as nvarchar(50)), N'DuplicateCount', null, N'0', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'User Confirmed Unique') as nvarchar(50)), N'IsVerifiedDuplicate', null, N'False', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'User Confirmed Unique') as nvarchar(50)), N'PfmsStatusInformant', null, N'EMPTY', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');

INSERT INTO _DiagnosticsSample (DiagSampleId, SampleCollectionSite, SampleReferralSite, AddedOn, LastUpdatedOn, SampleReferralDate) VALUES ((SELECT Id FROM Foreign_Diagnostics_Samples WHERE FirstName = 'User Confirmed' AND LastName = 'Unique' AND Number = 1), CAST((SELECT Id FROM Foreign_Hierarchies WHERE Name = 'phi' AND Level = 5) as nvarchar(50)), null, 'DATE_TIME_PLUS_5_MINUTE', null, null);

INSERT INTO _TestResult (PatientId, Type, Specimen, VisualAppearanceSputum, ReportedBy, DateTested, DateReported, HierarchyMapping, TestingFacilityName, TestData, Valid, Positive, AddedBy, LastUpdatedBy, AddedOn, LastUpdatedOn, Stage, Status, Reason, SubReason, PredominantSymptom, PredominantSymptomDuration, HCPVisited, PreviousATT, NikshaySourceTable, NikshaySourceId, DateSpecimenCollected, DiagRequestId, keep, duplicateOf) VALUES ((Select Id FROM Foreign_Episodes WHERE FirstName = 'User Confirmed' AND LastName = 'Unique'), N'Microscopy ZN and Fluorescent', N'Sputum', N'Mucopurulent', null, null, 'DATE_MINUS_3_DAY', (SELECT Id FROM Foreign_Hierarchies WHERE Name = 'dmc lab' AND Level = 5), N'dmc lab', N'{"FinalInterpretation":"Positive","Remarks":null}', (SELECT Id FROM Foreign_Booleans WHERE Name = 'false'), null, (SELECT Id FROM _UserAccess WHERE Username = 'phi-kadha01-001'), (SELECT Id FROM _UserAccess WHERE Username = 'phi-kadha01-001'), 'DATE_TIME_PLUS_5_MINUTE', 'DATE_TIME_PLUS_5_MINUTE', null, N'Results Available', N'Diagnosis of DSTB', N'', null, null, null, (SELECT Id FROM Foreign_Booleans WHERE Name = 'false'), null, null, 'DATE_MINUS_4_DAY', (SELECT Id FROM Foreign_Diagnostics_Requests WHERE FirstName = 'User Confirmed' AND LastName = 'Unique' AND Number = 1), (SELECT Id FROM Foreign_Booleans WHERE Name = 'true'), null);

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'Id', null, CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'PatientId', null, CAST((SELECT Id FROM Foreign_Episodes WHERE FirstName = 'User Confirmed' AND LastName = 'Unique') as nvarchar(50)), N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'Type', null, N'Microscopy ZN and Fluorescent', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'Specimen', null, N'Sputum', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'VisualAppearanceSputum', null, N'Mucopurulent', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'DateReported', null, 'DATE_MINUS_3_DAY_DATE_FIRST', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'HierarchyMapping', null, CAST((SELECT Id FROM Foreign_Hierarchies WHERE Name = 'dmc lab' AND Level = 5) as nvarchar(50)), N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'TestingFacilityName', null, N'dmc lab', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'TestData', null, N'{"FinalInterpretation":"Positive","Remarks":null}', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'Valid', null, N'False', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'AddedBy', null, CAST((SELECT Id FROM _UserAccess WHERE Username = 'phi-KADHA01-001') as nvarchar(50)), N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'LastUpdatedBy', null, CAST((SELECT Id FROM _UserAccess WHERE Username = 'phi-KADHA01-001') as nvarchar(50)), N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'AddedOn', null, 'DATE_TIME_PLUS_5_MINUTE_DATE_FIRST', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'LastUpdatedOn', null, 'DATE_TIME_PLUS_5_MINUTE_DATE_FIRST', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'Status', null, N'Results Available', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'Reason', null, N'Diagnosis of DSTB', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'PreviousATT', null, N'False', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'DateSpecimenCollected', null, 'DATE_MINUS_4_DAY_DATE_FIRST', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'DiagRequestId', null, CAST((SELECT Id FROM Foreign_Diagnostics_Requests WHERE FirstName = 'User Confirmed' AND LastName = 'Unique' AND Number = 1) as nvarchar(50)), N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');

INSERT INTO _Benefit (BeneficiaryId, HierarchyMapping, Scheme, IncentiveNumber, Status, Amount, Log, CreatedAt, LastUpdatedManuallyBy, LastUpdatedManuallyAt, ProcessingAccountNo, ProcessingIfscCode, ProcessingAgencyCode, Purpose, EpisodeId, IsDeleted) VALUES ((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'User Confirmed Unique'), 4, N'NS', 1, N'MAKER_PENDING', 3000.00, N'[{"userName":"NIKSHAY","action":"COMMENT","comment":"First Benefit. Date of Notification: DATE_MINUS_4_DAY_DDMMYYYY_HYPHENATED","timestamp":"DATE_TIME_PLUS_18_MINUTE"}]', 'DATE_TIME_PLUS_18_MINUTE', null, null, null, null, null, N'7175', (SELECT Id FROM Foreign_Episodes WHERE FirstName = 'User Confirmed' AND LastName = 'Unique'), 0);

# benefit removal by DBT maker
    UPDATE _Benefit SET Status = 'REMOVED', Log = '[{"UserName":"9999999938","Action":"REMOVE","Comment":"Removing","Timestamp":"DATE_TIME_PLUS_19_MINUTE"},{"UserName":"NIKSHAY","Action":"COMMENT","Comment":"First Benefit. Date of Notification: DATE_MINUS_3_DAY_DDMMYYYY_HYPHENATED","Timestamp":"DATE_TIME_PLUS_18_MINUTE"}]', LastUpdatedManuallyBy = (SELECT Id FROM _UserAccess WHERE Username = '9999999938'), LastUpdatedManuallyAt = 'DATE_TIME_PLUS_19_MINUTE', UpdatedAt = 'DATE_TIME_PLUS_19_MINUTE' WHERE BeneficiaryId = (SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'User Confirmed Unique') AND Scheme = 'NS' AND IncentiveNumber = 1;