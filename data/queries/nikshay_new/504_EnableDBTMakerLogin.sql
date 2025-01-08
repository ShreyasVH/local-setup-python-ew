INSERT INTO _AccessGroup (Name, Type) VALUES (N'PFMS-AGENCY-SIGNATORY-GROUP', N'SPECIAL-USER-GROUP');

INSERT INTO _DeploymentTrigger (HierarchyId, TriggerId, DefaultTemplateId, TemplateIds, CronTime, EventName, EventType, Mandatory, EntityTimeRelated, NotificationType) VALUES ((SELECT Id FROM Foreign_Hierarchies WHERE Name = 'India' AND Level = 1), (SELECT Id FROM Foreign_Ins_Triggers WHERE Name = 'Password DBT Maker'), (SELECT Id FROM Foreign_Ins_Templates WHERE Content = 'Your new Nikshay login password is %(password), please reset your password after login. CTD-MoHFW www.nikshay.in'), null, null, N'New_Staff_Login_Notification', null, 1, 0, N'DEFAULT');

INSERT INTO _DeploymentTrigger (HierarchyId, TriggerId, DefaultTemplateId, TemplateIds, CronTime, EventName, EventType, Mandatory, EntityTimeRelated, NotificationType) VALUES ((SELECT Id FROM Foreign_Hierarchies WHERE Name = 'India' AND Level = 1), (SELECT Id FROM Foreign_Ins_Triggers WHERE Name = 'OTP DBT maker'), (SELECT Id FROM Foreign_Ins_Templates WHERE Content = '%(otp) is the OTP for - %(user) . Treat this as confidential. Do not share the OTP with anyone for security reasons. CTD -MoHFW www.nikshay.in'), null, null, N'OTP_DBT_Maker', null, 1, 0, N'DEFAULT');