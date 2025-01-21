INSERT INTO _UserAccess (HierarchyMapping, Description, PrimaryNumber, SecondaryNumber, EmailAddress, AddedBy, AddedOn, Username, Salt, Hash, NumberLogins, LastLogin, TypeOfPatientsAdded, tempOldUserId, ViewOnly, CanDeletePatients, Deleted, Access_Default, Access_IndiaTbPublic, Access_IndiaTbPrivate, StaffId, IsSelectivePatientMapping, PasswordLastRefreshedOn, TypeOfStaffAllowedToAdd, AccessType, IsSelectiveHierarchyMapping, IsActive) VALUES (4, null, N'9999999938', N'', N'', (SELECT Id FROM _UserAccess WHERE Username = 'dto-KADHA'), 'DATE_TIME_PLUS_20_MINUTE', N'9999999938', N'salt', N'fZ9DjgjBHlx5PzKM9SduSnjsVTndYy9JkqzvuKOIbhw=', 0, N'1900-01-01 00:00:00.000', N'IndiaTbPublic,IndiaTbPrivate', null, 0, 1, 0, 0, 1, 1, null, 0, 'DATE_TIME_MINUS_35_DAY', N'IndiaTbPublic,IndiaTbPrivate', N'STAFF', 0, 1);

SET IDENTITY_INSERT _FieldStaff ON;INSERT INTO _FieldStaff (Id, Name, Designation, PrimaryNumber, SecondaryNumber, EmailAddress, AddedBy, AddedTimestamp, Status, isActive, ReceiveSMS, SMSFrequency, ReceiveEmail, EmailFrequency, HierarchyMapping, AlertFrequency, ReceiveWeeklySummary, ReceiveARTAdditionUpdate, ReceiveRNTCPAdditionUpdate, LinkSomePatients, Type, DesignationOther, IsTreatmentSupporter, IsEligibleForHonorarium, BeneficiaryId, PaymentTUId, PersonId, IsInformant) VALUES ((SELECT Id FROM _UserAccess WHERE Username = '9999999938'), N'DBT Maker', N'DBT Maker', N'9999999938', null, null, (SELECT Id FROM _UserAccess WHERE Username = 'dto-KADHA'), 'UTC_DATE_TIME_PLUS_20_MINUTE', N'ACTIVE', 1, null, null, null, null, 4, null, null, 0, 0, 1, N'IndiaTbPublic,IndiaTbPrivate', null, 0, 0, null, null, (SELECT Id FROM Foreign_Persons WHERE FirstName = 'DBT Maker'), 0);SET IDENTITY_INSERT _FieldStaff OFF;

UPDATE _UserAccess SET StaffId = (SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') WHERE Username = '9999999938';

INSERT INTO _UserPermission (UserId, Resource, ResourceType, Operation) VALUES ((SELECT Id FROM _UserAccess WHERE Username = '9999999938'), N'Hierarchy', N'COUNTRY', N'READ');
INSERT INTO _UserPermission (UserId, Resource, ResourceType, Operation) VALUES ((SELECT Id FROM _UserAccess WHERE Username = '9999999938'), N'Hierarchy', N'STATE', N'READ');
INSERT INTO _UserPermission (UserId, Resource, ResourceType, Operation) VALUES ((SELECT Id FROM _UserAccess WHERE Username = '9999999938'), N'Hierarchy', N'DISTRICT', N'READ');
INSERT INTO _UserPermission (UserId, Resource, ResourceType, Operation) VALUES ((SELECT Id FROM _UserAccess WHERE Username = '9999999938'), N'Hierarchy', N'TU', N'READ');
INSERT INTO _UserPermission (UserId, Resource, ResourceType, Operation) VALUES ((SELECT Id FROM _UserAccess WHERE Username = '9999999938'), N'Hierarchy', N'PHI', N'READ');
INSERT INTO _UserPermission (UserId, Resource, ResourceType, Operation) VALUES ((SELECT Id FROM _UserAccess WHERE Username = '9999999938'), N'Hierarchy', N'NGO', N'READ');
INSERT INTO _UserPermission (UserId, Resource, ResourceType, Operation) VALUES ((SELECT Id FROM _UserAccess WHERE Username = '9999999938'), N'Hierarchy', N'ART', N'READ');

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_FieldStaff', CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_FieldStaff', CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'Name', null, N'DBT Maker', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_FieldStaff', CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'Designation', null, N'DBT Maker', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_FieldStaff', CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'PrimaryNumber', null, N'9999999938', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_FieldStaff', CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'AddedBy', null, CAST((SELECT Id FROM _UserAccess WHERE Username = 'dto-KADHA') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_FieldStaff', CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'AddedTimestamp', null, 'UTC_DATE_TIME_PLUS_20_MINUTE_DATE_FIRST', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_FieldStaff', CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'Status', null, N'ACTIVE', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_FieldStaff', CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'isActive', null, N'True', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_FieldStaff', CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'HierarchyMapping', null, N'4', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_FieldStaff', CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'ReceiveARTAdditionUpdate', null, N'False', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_FieldStaff', CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'ReceiveRNTCPAdditionUpdate', null, N'False', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_FieldStaff', CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'LinkSomePatients', null, N'True', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_FieldStaff', CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'Type', null, N'IndiaTbPublic,IndiaTbPrivate', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_FieldStaff', CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'IsTreatmentSupporter', null, N'False', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_FieldStaff', CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'IsEligibleForHonorarium', null, N'False', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_FieldStaff', CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'PersonId', null, CAST((SELECT Id FROM Foreign_Persons WHERE FirstName = 'DBT Maker') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_FieldStaff', CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'IsInformant', null, N'False', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'COUNTRY' AND Operation = 'READ') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'COUNTRY' AND Operation = 'READ') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'COUNTRY' AND Operation = 'READ') as nvarchar(50)), N'UserId', null, CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'COUNTRY' AND Operation = 'READ') as nvarchar(50)), N'Resource', null, N'Hierarchy', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'COUNTRY' AND Operation = 'READ') as nvarchar(50)), N'ResourceType', null, N'COUNTRY', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'COUNTRY' AND Operation = 'READ') as nvarchar(50)), N'Operation', null, N'READ', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'STATE' AND Operation = 'READ') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'STATE' AND Operation = 'READ') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'STATE' AND Operation = 'READ') as nvarchar(50)), N'UserId', null, CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'STATE' AND Operation = 'READ') as nvarchar(50)), N'Resource', null, N'Hierarchy', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'STATE' AND Operation = 'READ') as nvarchar(50)), N'ResourceType', null, N'STATE', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'STATE' AND Operation = 'READ') as nvarchar(50)), N'Operation', null, N'READ', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'DISTRICT' AND Operation = 'READ') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'DISTRICT' AND Operation = 'READ') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'DISTRICT' AND Operation = 'READ') as nvarchar(50)), N'UserId', null, CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'DISTRICT' AND Operation = 'READ') as nvarchar(50)), N'Resource', null, N'Hierarchy', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'DISTRICT' AND Operation = 'READ') as nvarchar(50)), N'ResourceType', null, N'DISTRICT', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'DISTRICT' AND Operation = 'READ') as nvarchar(50)), N'Operation', null, N'READ', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'TU' AND Operation = 'READ') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'TU' AND Operation = 'READ') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'TU' AND Operation = 'READ') as nvarchar(50)), N'UserId', null, CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'TU' AND Operation = 'READ') as nvarchar(50)), N'Resource', null, N'Hierarchy', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'TU' AND Operation = 'READ') as nvarchar(50)), N'ResourceType', null, N'TU', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'TU' AND Operation = 'READ') as nvarchar(50)), N'Operation', null, N'READ', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'PHI' AND Operation = 'READ') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'PHI' AND Operation = 'READ') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'PHI' AND Operation = 'READ') as nvarchar(50)), N'UserId', null, CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'PHI' AND Operation = 'READ') as nvarchar(50)), N'Resource', null, N'Hierarchy', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'PHI' AND Operation = 'READ') as nvarchar(50)), N'ResourceType', null, N'PHI', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'PHI' AND Operation = 'READ') as nvarchar(50)), N'Operation', null, N'READ', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'NGO' AND Operation = 'READ') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'NGO' AND Operation = 'READ') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'NGO' AND Operation = 'READ') as nvarchar(50)), N'UserId', null, CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'NGO' AND Operation = 'READ') as nvarchar(50)), N'Resource', null, N'Hierarchy', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'NGO' AND Operation = 'READ') as nvarchar(50)), N'ResourceType', null, N'NGO', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'NGO' AND Operation = 'READ') as nvarchar(50)), N'Operation', null, N'READ', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'ART' AND Operation = 'READ') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'ART' AND Operation = 'READ') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'ART' AND Operation = 'READ') as nvarchar(50)), N'UserId', null, CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'ART' AND Operation = 'READ') as nvarchar(50)), N'Resource', null, N'Hierarchy', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'ART' AND Operation = 'READ') as nvarchar(50)), N'ResourceType', null, N'ART', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = '9999999938') AND Resource = 'Hierarchy' AND ResourceType = 'ART' AND Operation = 'READ') as nvarchar(50)), N'Operation', null, N'READ', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'HierarchyMapping', null, N'4', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'PrimaryNumber', null, N'9999999938', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'AddedBy', null, CAST((SELECT Id FROM _UserAccess WHERE Username = 'dto-KADHA') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'AddedOn', null, N'DATE_TIME_PLUS_20_MINUTE_DATE_FIRST', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'Username', null, N'9999999938', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'Salt', null, N'salt', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'Hash', null, N'fZ9DjgjBHlx5PzKM9SduSnjsVTndYy9JkqzvuKOIbhw=', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'TypeOfPatientsAdded', null, N'IndiaTbPublic,IndiaTbPrivate', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'ViewOnly', null, N'False', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'CanDeletePatients', null, N'True', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'Deleted', null, N'False', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'Access_Default', null, N'False', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'Access_IndiaTbPublic', null, N'True', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'Access_IndiaTbPrivate', null, N'True', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'PasswordLastRefreshedOn', null, 'DATE_TIME_MINUS_35_DAY_DATE_FIRST', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'StaffId', null, CAST((SELECT Id FROM _FieldStaff WHERE Name = 'DBT Maker') as nvarchar(50)), N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'AccessType', null, N'STAFF', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'IsSelectivePatientMapping', null, N'False', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'TypeOfStaffAllowedToAdd', null, N'IndiaTbPublic,IndiaTbPrivate', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'IsSelectiveHierarchyMapping', null, N'False', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = '9999999938') as nvarchar(50)), N'IsActive', null, N'True', N'dto-KADHA', 'UTC_DATE_TIME_PLUS_20_MINUTE');