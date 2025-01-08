INSERT INTO _UserAccess (HierarchyMapping, Description, PrimaryNumber, SecondaryNumber, EmailAddress, AddedBy, AddedOn, Username, Salt, Hash, NumberLogins, LastLogin, TypeOfPatientsAdded, tempOldUserId, ViewOnly, CanDeletePatients, Deleted, Access_Default, Access_IndiaTbPublic, Access_IndiaTbPrivate, PasswordLastRefreshedOn, StaffId, TypeOfStaffAllowedToAdd, AccessType, IsSelectivePatientMapping, IsSelectiveHierarchyMapping, IsActive) VALUES (4, N'tu TU Login', N'9999999994', null, N'mail.three@gmail.com', (SELECT Id FROM _UserAccess WHERE Username = 'india-all'), 'DATE_TIME_PLUS_15_MINUTE', N'tbu-KADHA01', N'salt', N'fZ9DjgjBHlx5PzKM9SduSnjsVTndYy9JkqzvuKOIbhw=', 0, null, N'IndiaTbPublic,IndiaTbPrivate', null, 0, 1, 0, 0, 1, 1, 'DATE_TIME_PLUS_15_MINUTE', null, N'IndiaTbPublic,IndiaTbPrivate', N'ADMIN', 0, 0, 1);

INSERT INTO _UserPermission (UserId, Resource, ResourceType, Operation) VALUES ((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01'), N'Hierarchy', N'COUNTRY', N'READ');
INSERT INTO _UserPermission (UserId, Resource, ResourceType, Operation) VALUES ((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01'), N'Hierarchy', N'STATE', N'READ');
INSERT INTO _UserPermission (UserId, Resource, ResourceType, Operation) VALUES ((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01'), N'Hierarchy', N'DISTRICT', N'READ');
INSERT INTO _UserPermission (UserId, Resource, ResourceType, Operation) VALUES ((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01'), N'Hierarchy', N'TU', N'READ');
INSERT INTO _UserPermission (UserId, Resource, ResourceType, Operation) VALUES ((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01'), N'Hierarchy', N'PHI', N'READ');
INSERT INTO _UserPermission (UserId, Resource, ResourceType, Operation) VALUES ((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01'), N'Hierarchy', N'NGO', N'READ');
INSERT INTO _UserPermission (UserId, Resource, ResourceType, Operation) VALUES ((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01'), N'Hierarchy', N'ART', N'READ');

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'HierarchyMapping', null, N'4', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'Description', null, N'tu TU Login', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'PrimaryNumber', null, N'9999999994', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'EmailAddress', null, N'mail.three@gmail.com', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'AddedBy', null, CAST((SELECT Id FROM _UserAccess WHERE Username = 'india-all') AS nvarchar(50)), N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'AddedOn', null, N'DATE_TIME_PLUS_15_MINUTE_DATE_FIRST', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'Username', null, N'tbu-KADHA01', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'Salt', null, N'salt', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'Hash', null, N'fZ9DjgjBHlx5PzKM9SduSnjsVTndYy9JkqzvuKOIbhw=', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'TypeOfPatientsAdded', null, N'IndiaTbPublic,IndiaTbPrivate', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'ViewOnly', null, N'False', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'CanDeletePatients', null, N'True', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'Deleted', null, N'False', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'Access_Default', null, N'False', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'Access_IndiaTbPublic', null, N'True', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'Access_IndiaTbPrivate', null, N'True', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'PasswordLastRefreshedOn', null, N'DATE_TIME_PLUS_15_MINUTE_DATE_FIRST', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'AccessType', null, N'ADMIN', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'IsSelectivePatientMapping', null, N'False', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'TypeOfStaffAllowedToAdd', null, N'IndiaTbPublic,IndiaTbPrivate', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'IsSelectiveHierarchyMapping', null, N'False', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserAccess', CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'IsActive', null, N'True', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'COUNTRY' AND Operation = 'READ') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'COUNTRY' AND Operation = 'READ') as nvarchar(50)), N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'COUNTRY' AND Operation = 'READ') as nvarchar(50)), N'UserId', null, CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'COUNTRY' AND Operation = 'READ') as nvarchar(50)), N'Resource', null, N'Hierarchy', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'COUNTRY' AND Operation = 'READ') as nvarchar(50)), N'ResourceType', null, N'COUNTRY', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'COUNTRY' AND Operation = 'READ') as nvarchar(50)), N'Operation', null, N'READ', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'STATE' AND Operation = 'READ') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'STATE' AND Operation = 'READ') as nvarchar(50)), N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'STATE' AND Operation = 'READ') as nvarchar(50)), N'UserId', null, CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'STATE' AND Operation = 'READ') as nvarchar(50)), N'Resource', null, N'Hierarchy', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'STATE' AND Operation = 'READ') as nvarchar(50)), N'ResourceType', null, N'STATE', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'STATE' AND Operation = 'READ') as nvarchar(50)), N'Operation', null, N'READ', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'DISTRICT' AND Operation = 'READ') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'DISTRICT' AND Operation = 'READ') as nvarchar(50)), N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'DISTRICT' AND Operation = 'READ') as nvarchar(50)), N'UserId', null, CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'DISTRICT' AND Operation = 'READ') as nvarchar(50)), N'Resource', null, N'Hierarchy', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'DISTRICT' AND Operation = 'READ') as nvarchar(50)), N'ResourceType', null, N'DISTRICT', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'DISTRICT' AND Operation = 'READ') as nvarchar(50)), N'Operation', null, N'READ', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'TU' AND Operation = 'READ') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'TU' AND Operation = 'READ') as nvarchar(50)), N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'TU' AND Operation = 'READ') as nvarchar(50)), N'UserId', null, CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'TU' AND Operation = 'READ') as nvarchar(50)), N'Resource', null, N'Hierarchy', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'TU' AND Operation = 'READ') as nvarchar(50)), N'ResourceType', null, N'TU', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'TU' AND Operation = 'READ') as nvarchar(50)), N'Operation', null, N'READ', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'PHI' AND Operation = 'READ') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'PHI' AND Operation = 'READ') as nvarchar(50)), N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'PHI' AND Operation = 'READ') as nvarchar(50)), N'UserId', null, CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'PHI' AND Operation = 'READ') as nvarchar(50)), N'Resource', null, N'Hierarchy', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'PHI' AND Operation = 'READ') as nvarchar(50)), N'ResourceType', null, N'PHI', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'PHI' AND Operation = 'READ') as nvarchar(50)), N'Operation', null, N'READ', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'NGO' AND Operation = 'READ') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'NGO' AND Operation = 'READ') as nvarchar(50)), N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'NGO' AND Operation = 'READ') as nvarchar(50)), N'UserId', null, CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'NGO' AND Operation = 'READ') as nvarchar(50)), N'Resource', null, N'Hierarchy', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'NGO' AND Operation = 'READ') as nvarchar(50)), N'ResourceType', null, N'NGO', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'NGO' AND Operation = 'READ') as nvarchar(50)), N'Operation', null, N'READ', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');

INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'ART' AND Operation = 'READ') as nvarchar(50)), N'Id', null, CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'ART' AND Operation = 'READ') as nvarchar(50)), N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'ART' AND Operation = 'READ') as nvarchar(50)), N'UserId', null, CAST((SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') as nvarchar(50)), N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'ART' AND Operation = 'READ') as nvarchar(50)), N'Resource', null, N'Hierarchy', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'ART' AND Operation = 'READ') as nvarchar(50)), N'ResourceType', null, N'ART', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');
INSERT INTO _AuditLog (EntityTypeName, EntityId, PropertyName, OldValue, NewValue, CreatedBy, UtcTimestamp) VALUES (N'C_UserPermission', CAST((SELECT Id FROM _UserPermission WHERE UserId = (SELECT Id FROM _UserAccess WHERE Username = 'tbu-KADHA01') AND Resource = 'Hierarchy' AND ResourceType = 'ART' AND Operation = 'READ') as nvarchar(50)), N'Operation', null, N'READ', N'india-all', N'UTC_DATE_TIME_PLUS_15_MINUTE');