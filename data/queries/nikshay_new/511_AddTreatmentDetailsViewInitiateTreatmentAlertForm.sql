INSERT INTO _Form (FormLabel, FormName, SaveEndpoint, SaveText) VALUES (N'Treatment Details - Initiate Treatment Alter', N'TreatmentDetailsViewInitiateTreatmentAlert', N'', N'');

INSERT INTO _FormPart (PartName, PartLabel, PartType, Position, AllowRowOpen, AllowRowDelete) VALUES (N'TreatmentDetails', N'', N'vertical-form-part', 1, 0, 0);

INSERT INTO _Field (FieldName, Label, Component, IsDisabled, IsVisible, IsRequired, RowNumber) VALUES (N'AlertField', N'alert_field', N'app-input-field', 1, 1, 0, 1);

INSERT INTO _FieldCustomizations (FieldId, AttributeName, AttributeValue) VALUES ((SELECT Id FROM _Field WHERE FieldName = 'AlertField' AND Component = 'app-input-field'), N'LabelKey', N'initiate_treatment_alert');

INSERT INTO _FormItemsMap (DeploymentCode, FormName, ItemType, ItemId, ParentType, ParentId) VALUES (N'DEFAULT', N'TreatmentDetailsViewInitiateTreatmentAlert', N'PART', (SELECT Id FROM _FormPart WHERE PartName = 'TreatmentDetails'), N'FORM', (SELECT Id FROM _Form WHERE FormName = 'TreatmentDetailsViewInitiateTreatmentAlert'));
INSERT INTO _FormItemsMap (DeploymentCode, FormName, ItemType, ItemId, ParentType, ParentId) VALUES (N'DEFAULT', N'TreatmentDetailsViewInitiateTreatmentAlert', N'FIELD', (SELECT Id FROM _Field WHERE FieldName = 'AlertField' AND Component = 'app-input-field'), N'PART', (SELECT Id FROM _FormPart WHERE PartName = 'TreatmentDetails'));
INSERT INTO _FormItemsMap (DeploymentCode, FormName, ItemType, ItemId, ParentType, ParentId) VALUES (N'DEFAULT', N'TreatmentDetailsViewInitiateTreatmentAlert', N'CUSTOMIZATION', (SELECT Id FROM _FieldCustomizations WHERE FieldId = (SELECT Id FROM _Field WHERE FieldName = 'AlertField' AND Component = 'app-input-field') AND AttributeName = 'LabelKey' AND AttributeValue = 'initiate_treatment_alert'), N'FIELD', (SELECT Id FROM _Field WHERE FieldName = 'AlertField' AND Component = 'app-input-field'));