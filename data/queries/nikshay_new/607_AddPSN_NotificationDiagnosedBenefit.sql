#add patient
    INSERT INTO _Beneficiary (BankAccountNo, BankId, PfmsStatus, PfmsId, LastUpdatedManuallyBy, LastUpdatedManuallyAt, ValidatedBeneficiaryName, StateCode, DistrictCode, AddedbyDbtMigration, TempBeneficiaryType, TempNikshayBeneficiaryId, PfmsStatusTribal, BeneficiaryName, ValidatingPfmsAgency, CurrentPfmsAgency, LastBenefitSentToPfmsOn, TempNikshayId, TempMigrationId, PfmsIdTribal, EntityType, IsDeleted, DuplicateCount, StatusBeforeApproval, NewBankId, NewBankAccountNo, IsVerifiedDuplicate, PfmsStatusInformant, PfmsIdInformant, PhotoProof, AccountOwner) VALUES (null, null, N'EMPTY', null, null, null, null, N'29', N'536', 0, null, null, N'EMPTY', N'PSN Notification Diagnosed', null, null, null, null, null, null, N'C_Patient', 0, 0, null, null, null, 0, N'EMPTY', null, null, null);
    INSERT INTO _BeneficiaryEntityLinkage (BeneficiaryId, EntityId, EntityType) VALUES ((SELECT id FROM _Beneficiary WHERE BeneficiaryName = 'PSN Notification Diagnosed'), 40, N'Person');

    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'PSN Notification Diagnosed') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'PSN Notification Diagnosed') as nvarchar(50)), N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'PSN Notification Diagnosed') as nvarchar(50)), N'PfmsStatus', null, N'EMPTY', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'PSN Notification Diagnosed') as nvarchar(50)), N'StateCode', null, N'29', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'PSN Notification Diagnosed') as nvarchar(50)), N'DistrictCode', null, N'536', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'PSN Notification Diagnosed') as nvarchar(50)), N'AddedbyDbtMigration', null, N'False', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'PSN Notification Diagnosed') as nvarchar(50)), N'PfmsStatusTribal', null, N'EMPTY', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'PSN Notification Diagnosed') as nvarchar(50)), N'BeneficiaryName', null, N'PSN Notification Diagnosed', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'PSN Notification Diagnosed') as nvarchar(50)), N'EntityType', null, N'C_Patient', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'PSN Notification Diagnosed') as nvarchar(50)), N'IsDeleted', null, N'False', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'PSN Notification Diagnosed') as nvarchar(50)), N'DuplicateCount', null, N'0', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'PSN Notification Diagnosed') as nvarchar(50)), N'IsVerifiedDuplicate', null, N'False', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'PSN Notification Diagnosed') as nvarchar(50)), N'PfmsStatusInformant', null, N'EMPTY', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_0_DAY');

#add test
    INSERT INTO _DiagnosticsSample (DiagSampleId, SampleCollectionSite, SampleReferralSite, AddedOn, LastUpdatedOn, SampleReferralDate) VALUES (16, N'5', null, 'DATE_TIME_PLUS_5_MINUTE', null, null);

    INSERT INTO _TestResult (PatientId, Type, Specimen, VisualAppearanceSputum, ReportedBy, DateTested, DateReported, HierarchyMapping, TestingFacilityName, TestData, Valid, Positive, AddedBy, LastUpdatedBy, AddedOn, LastUpdatedOn, Stage, Status, Reason, SubReason, PredominantSymptom, PredominantSymptomDuration, HCPVisited, PreviousATT, NikshaySourceTable, NikshaySourceId, DateSpecimenCollected, DiagRequestId, keep, duplicateOf) VALUES (34, N'Microscopy ZN and Fluorescent', N'Sputum', N'Mucopurulent', null, null, 'DATE_MINUS_3_DAY', 41, N'private microscopy lab', N'{"FinalInterpretation":"Positive","Remarks":null}', 0, 1, (SELECT Id FROM _UserAccess WHERE Username = 'phi-kadha01-001'), (SELECT Id FROM _UserAccess WHERE Username = 'phi-kadha01-001'), 'DATE_TIME_PLUS_5_MINUTE', 'DATE_TIME_PLUS_5_MINUTE', null, N'Results Available', N'Diagnosis of DSTB', N'', null, null, null, 0, null, null, 'DATE_MINUS_4_DAY', 16, 1, null);

    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'Id', null, CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'PatientId', null, N'34', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'Type', null, N'Microscopy ZN and Fluorescent', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'Specimen', null, N'Sputum', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'VisualAppearanceSputum', null, N'Mucopurulent', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'DateReported', null, 'DATE_MINUS_3_DAY_DATE_FIRST', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'HierarchyMapping', null, N'41', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'TestingFacilityName', null, N'private microscopy lab', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'TestData', null, N'{"FinalInterpretation":"Positive","Remarks":null}', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'Valid', null, N'False', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'Positive', null, N'True', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'AddedBy', null, CAST((SELECT Id FROM _UserAccess WHERE Username = 'phi-KADHA01-001') as nvarchar(50)), N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'LastUpdatedBy', null, CAST((SELECT Id FROM _UserAccess WHERE Username = 'phi-KADHA01-001') as nvarchar(50)), N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'AddedOn', null, 'DATE_TIME_PLUS_5_MINUTE_DATE_FIRST', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'LastUpdatedOn', null, 'DATE_TIME_PLUS_5_MINUTE_DATE_FIRST', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'Status', null, N'Results Available', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'Reason', null, N'Diagnosis of DSTB', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'PreviousATT', null, N'False', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'DateSpecimenCollected', null, 'DATE_MINUS_4_DAY_DATE_FIRST', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_TestResult', CAST((SELECT MAX(Id) FROM _TestResult) as nvarchar(50)), N'DiagRequestId', null, N'16', N'phi-KADHA01-001', 'UTC_DATE_TIME_PLUS_5_MINUTE');

#generate NS benefit job new
    INSERT INTO _Benefit (BeneficiaryId, HierarchyMapping, Scheme, IncentiveNumber, Status, Amount, Log, CreatedAt, LastUpdatedManuallyBy, LastUpdatedManuallyAt, ProcessingAccountNo, ProcessingIfscCode, ProcessingAgencyCode, Purpose, EpisodeId, IsDeleted) VALUES ((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'PSN Notification Diagnosed'), 4, N'NS', 1, N'MAKER_PENDING', 1500.00, N'[{"userName":"NIKSHAY","action":"COMMENT","comment":"First Benefit. Date of Notification: DATE_MINUS_4_DAY_DDMMYYYY_HYPHENATED","timestamp":"UTC_DATE_TIME_PLUS_18_MINUTE"}]', 'UTC_DATE_TIME_PLUS_18_MINUTE', null, null, null, null, null, N'7175', 34, 0);

#generate PSN Notification benefit job
    INSERT INTO _Benefit (BeneficiaryId, HierarchyMapping, Scheme, IncentiveNumber, Status, Amount, Log, CreatedAt, LastUpdatedManuallyBy, LastUpdatedManuallyAt, ProcessingAccountNo, ProcessingIfscCode, ProcessingAgencyCode, Purpose, EpisodeId, IsDeleted) VALUES ((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'private microscopy lab'), 4, N'PSN', 2, N'MAKER_PENDING', 500.00, N'[{"UserName":"NIKSHAY","Action":"COMMENT","Comment":"Private Provider Notification Incentive for Episode Id : 34. Date of Notification: DATE_MINUS_3_DAY_DDMMYY_HYPHENATED","Timestamp":"DATE_TIME_PLUS_18_MINUTE"}]', 'DATE_TIME_PLUS_18_MINUTE', null, null, null, null, null, N'7174', 34, 0);

#DBT maker approval
    UPDATE _Benefit SET Status = 'APPROVER_PENDING', Log = '[{"UserName":"9999999938","Action":"SEND_TO_APPROVER","Comment":null,"Timestamp":"DATE_TIME_PLUS_20_MINUTE_WITH_TIMEZONE_SEPARATION"},{"UserName":"NIKSHAY","Action":"COMMENT","Comment":"Private Provider Notification Incentive for Episode Id : 34. Date of Notification: DATE_MINUS_3_DAY_DDMMYY_HYPHENATED","Timestamp":"DATE_TIME_PLUS_18_MINUTE"}]', LastUpdatedManuallyBy = (SELECT Id FROM _UserAccess WHERE Username = '9999999938'), LastUpdatedManuallyAt = 'DATE_TIME_PLUS_20_MINUTE' WHERE BeneficiaryId = (SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'private microscopy lab') And Scheme = 'PSN' AND IncentiveNumber = 2;

#DBT checker approval
    UPDATE _Benefit SET Status = 'PFMS_PENDING', Log = '[{"UserName":"9999999947","Action":"APPROVE_BY_APPROVER","Comment":null,"Timestamp":"DATE_TIME_PLUS_21_MINUTE_WITH_TIMEZONE_SEPARATION"},{"UserName":"9999999938","Action":"SEND_TO_APPROVER","Comment":null,"Timestamp":"DATE_TIME_PLUS_20_MINUTE_WITH_TIMEZONE_SEPARATION"},{"UserName":"NIKSHAY","Action":"COMMENT","Comment":"Private Provider Notification Incentive for Episode Id : 34. Date of Notification: DATE_MINUS_3_DAY_DDMMYY_HYPHENATED","Timestamp":"DATE_TIME_PLUS_18_MINUTE"}]', LastUpdatedManuallyBy = (SELECT Id FROM _UserAccess WHERE Username = '9999999947'), LastUpdatedManuallyAt = 'DATE_TIME_PLUS_21_MINUTE' WHERE BeneficiaryId = (SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'private microscopy lab') And Scheme = 'PSN' AND IncentiveNumber = 2;

# generate and upload benefit job
    INSERT INTO _BenefitsBatch (RequestUniqueMessageId, BatchId, BatchDate, DaySerialNo, RequestMessageDateTime, RequestRecordCount, RequestControlSum, DataSource, Destination, InitiatingPartyName, InitiatingPartyCode, BatchFileCreated, UploadedToPfms, UploadedToPfmsAt, AckReceived, AckReadAt, AckMessageId, AckNoOfRecords, AckBatchStatus, Responses, NoOfResponsesReceived, LastUpdatedAt, PfmsAgencyMapping, CentreAuthorityCode, AckMessageDateTime, AckRejectionCode, AckRejectionNarration, NoOfRetires, IsSigned, RequiredSignatureCount, Scheme, LastReviewedAt, ApprovalStatus, SchemeCode) VALUES (N'0038DBTPAYREQDATE_PLUS_0_DAY_DDMMYYYY10', N'CP0038DATE_PLUS_0_DAY_DDMMYY0010', N'DATE_ONLY_YEAR_FIRST_PLUS_0_DAY', 10, N'DATE_TIME_PLUS_22_MINUTE', 1, 500.00, N'0038', N'CPSMS', N'Agency Name', (SELECT Code FROM _PfmsAgency WHERE Name = 'Agency Name'), 1, 1, N'DATE_TIME_PLUS_22_MINUTE', 0, null, null, null, null, null, 0, N'DATE_TIME_PLUS_22_MINUTE', (SELECT Id FROM _PfmsAgency WHERE Name = 'Agency Name'), N'E4308', null, null, null, null, 0, null, N'PSN', null, null, N'KA182');
    INSERT INTO _BenefitTransaction (BenefitId, BeneficiaryId, BankName, BranchCode, PfmsBeneficiaryCode, BeneficiaryName, BeneficiaryType, DistrictCode, BankAccountNo, Amount, PaymentFromDate, PaymentToDate, Status, AckStatus, AckRejectReasonCode, AckRejectReasonNarration, PfmsTransactionId, PfmsTransactionStatus, CreditDate, RejectionReasonCode, RejectionReasonNarration, BankAccountHolderDetails, ResponseInMessageId, CreatedAt, LastUpdatedAt, PaymentPurpose, HierarchyMapping, StateCode, InstructionId, TempNikshayBeneficiaryId, RequestMessageId, IsGroupTransaction, GroupId) VALUES ((SELECT Id FROM _Benefit WHERE BeneficiaryId = (SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'private microscopy lab') And Scheme = 'PSN' AND IncentiveNumber = 2), (SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'private microscopy lab'), (SELECT bp.BankName FROM _Beneficiary b INNER JOIN _BankPfms bp ON b.BankId = bp.Id AND b.BeneficiaryName = 'private microscopy lab'), (SELECT bp.IfscCode FROM _Beneficiary b INNER JOIN _BankPfms bp ON b.BankId = bp.Id AND b.BeneficiaryName = 'private microscopy lab'), CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'private microscopy lab') AS nvarchar(50)), N'private microscopy lab', N'4281', N'536', (SELECT BankAccountNo FROM _Beneficiary WHERE BeneficiaryName = 'private microscopy lab'), 500.00, 'DATE_ONLY_YEAR_FIRST_PLUS_0_DAY', 'DATE_ONLY_YEAR_FIRST_PLUS_0_DAY', N'SENT_TO_PFMS', null, null, null, null, null, null, null, null, null, null, 'DATE_TIME_PLUS_22_MINUTE', 'DATE_TIME_PLUS_22_MINUTE', N'7174', 4, N'29', null, null, N'0038DBTPAYREQDATE_PLUS_0_DAY_DDMMYYYY10', null, null);
    INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_Beneficiary', CAST((SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'private microscopy lab') as nvarchar(50)), N'LastBenefitSentToPfmsOn', null, N'DATE_PLUS_0_DAY_DATE_FIRST', N'Unknown', 'UTC_DATE_TIME_PLUS_23_MINUTE');
    UPDATE _Beneficiary SET LastBenefitSentToPfmsOn = 'DATE_ONLY_YEAR_FIRST_PLUS_0_DAY' WHERE BeneficiaryName = 'private microscopy lab';
    UPDATE _Benefit SET Status = 'PFMS_SENT', Log = '[{"UserName":"NIKSHAY","Action":"SEND_TO_PFMS","Comment":"Sent to PFMS in 0038DBTPAYREQDATE_PLUS_0_DAY_DDMMYYYY10","Timestamp":"DATE_TIME_PLUS_22_MINUTE_WITH_TIMEZONE_SEPARATION"},{"UserName":"9999999947","Action":"APPROVE_BY_APPROVER","Comment":null,"Timestamp":"DATE_TIME_PLUS_21_MINUTE_WITH_TIMEZONE_SEPARATION"},{"UserName":"9999999938","Action":"SEND_TO_APPROVER","Comment":null,"Timestamp":"DATE_TIME_PLUS_20_MINUTE_WITH_TIMEZONE_SEPARATION"},{"UserName":"NIKSHAY","Action":"COMMENT","Comment":"Private Provider Notification Incentive for Episode Id : 34. Date of Notification: DATE_MINUS_3_DAY_DDMMYY_HYPHENATED","Timestamp":"DATE_TIME_PLUS_18_MINUTE"}]', ProcessingAccountNo = (SELECT BankAccountNo FROM _Beneficiary WHERE BeneficiaryName = 'private microscopy lab'), ProcessingIfscCode =  (SELECT bp.IfscCode FROM _Beneficiary b INNER JOIN _BankPfms bp on bp.Id = b.BankId and b.BeneficiaryName = 'private microscopy lab'), ProcessingAgencyCode = (SELECT Code FROM _PfmsAgency WHERE Name = 'Agency Name') WHERE BeneficiaryId = (SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'private microscopy lab') AND Scheme = 'PSN' AND IncentiveNumber = 2;

# download and read benefits job
    UPDATE _BenefitsBatch SET AckReceived = 1, AckReadAt = 'DATE_TIME_PLUS_23_MINUTE', AckMessageId = '0038DBTPAYRESDATE_PLUS_0_DAY_DDMMYYYY10', AckNoOfRecords = 1, AckBatchStatus = 'ACPT', AckMessageDateTime = 'DATE_TIME_PLUS_23_MINUTE' WHERE RequestUniqueMessageId = '0038DBTPAYREQDATE_PLUS_0_DAY_DDMMYYYY10';
    UPDATE _BenefitTransaction SET Status = 'ACKNOWLEDGED_BY_PFMS', AckStatus = 'ACPT' WHERE RequestMessageId = '0038DBTPAYREQDATE_PLUS_0_DAY_DDMMYYYY10';
    UPDATE _Benefit SET Status = 'PFMS_ACCEPTED', Log = '[{"UserName":"PFMS","Action":"COMMENT","Comment":"Benefit Accepted. Payment Response in 0038DBTPAYRESDATE_PLUS_0_DAY_DDMMYYYY10","Timestamp":"DATE_TIME_PLUS_23_MINUTE"},{"UserName":"NIKSHAY","Action":"SEND_TO_PFMS","Comment":"Sent to PFMS in 0038DBTPAYREQDATE_PLUS_0_DAY_DDMMYYYY10","Timestamp":"DATE_TIME_PLUS_22_MINUTE_WITH_TIMEZONE_SEPARATION"},{"UserName":"9999999947","Action":"APPROVE_BY_APPROVER","Comment":null,"Timestamp":"DATE_TIME_PLUS_21_MINUTE_WITH_TIMEZONE_SEPARATION"},{"UserName":"9999999938","Action":"SEND_TO_APPROVER","Comment":null,"Timestamp":"DATE_TIME_PLUS_20_MINUTE_WITH_TIMEZONE_SEPARATION"},{"UserName":"NIKSHAY","Action":"COMMENT","Comment":"Private Provider Notification Incentive for Episode Id : 34. Date of Notification: DATE_MINUS_3_DAY_DDMMYY_HYPHENATED","Timestamp":"DATE_TIME_PLUS_18_MINUTE"}]' WHERE BeneficiaryId = (SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'private microscopy lab') AND Scheme = 'PSN' AND IncentiveNumber = 2;
    
    UPDATE _BenefitsBatch SET NoOfResponsesReceived = 1, Responses = '[{"MessageId":"0038DBTPAYSTSDATE_PLUS_0_DAY_DDMMYYYY10","MessageDateTime":"DATE_TIME_PLUS_25_MINUTE","RecordCount":1,"DebitAdviceNo":"","ReadAt":"DATE_TIME_PLUS_23_MINUTE_WITH_TIMEZONE_SEPARATION"}]' WHERE RequestUniqueMessageId = '0038DBTPAYREQDATE_PLUS_0_DAY_DDMMYYYY10';
    UPDATE _BenefitTransaction SET Status = 'PFMS_RESPONDED', PfmsTransactionId = CAST((SELECT Id FROM _BenefitTransaction WHERE RequestMessageId = '0038DBTPAYREQDATE_PLUS_0_DAY_DDMMYYYY10') AS nvarchar(50)), PfmsTransactionStatus = 'ACCP', CreditDate = 'DATE_TIME_PLUS_24_MINUTE', ResponseInMessageId = '0038DBTPAYSTSDATE_PLUS_0_DAY_DDMMYYYY10', InstructionId = CAST((SELECT Id FROM _BenefitTransaction WHERE RequestMessageId = '0038DBTPAYREQDATE_PLUS_0_DAY_DDMMYYYY10') AS nvarchar(50)) WHERE RequestMessageId = '0038DBTPAYREQDATE_PLUS_0_DAY_DDMMYYYY10';
    UPDATE _Benefit SET Status = 'PAID', Log = '[{"UserName":"PFMS","Action":"PFMS_RESPONSE","Comment":"Benefit Credited on DATE_ONLY_PLUS_0_DAY.PFMS Transaction Id - 12. Payment Status in 0038DBTPAYSTSDATE_PLUS_0_DAY_DDMMYYYY10","Timestamp":"DATE_TIME_PLUS_24_MINUTE_WITH_TIMEZONE_SEPARATION"},{"UserName":"PFMS","Action":"COMMENT","Comment":"Benefit Accepted. Payment Response in 0038DBTPAYRESDATE_PLUS_0_DAY_DDMMYYYY10","Timestamp":"DATE_TIME_PLUS_23_MINUTE"},{"UserName":"NIKSHAY","Action":"SEND_TO_PFMS","Comment":"Sent to PFMS in 0038DBTPAYREQDATE_PLUS_0_DAY_DDMMYYYY10","Timestamp":"DATE_TIME_PLUS_22_MINUTE_WITH_TIMEZONE_SEPARATION"},{"UserName":"9999999947","Action":"APPROVE_BY_APPROVER","Comment":null,"Timestamp":"DATE_TIME_PLUS_21_MINUTE_WITH_TIMEZONE_SEPARATION"},{"UserName":"9999999938","Action":"SEND_TO_APPROVER","Comment":null,"Timestamp":"DATE_TIME_PLUS_20_MINUTE_WITH_TIMEZONE_SEPARATION"},{"UserName":"NIKSHAY","Action":"COMMENT","Comment":"Private Provider Notification Incentive for Episode Id : 34. Date of Notification: DATE_MINUS_3_DAY_DDMMYY_HYPHENATED","Timestamp":"DATE_TIME_PLUS_18_MINUTE"}]' WHERE BeneficiaryId = (SELECT Id FROM _Beneficiary WHERE BeneficiaryName = 'private microscopy lab') AND Scheme = 'PSN' AND IncentiveNumber = 2;