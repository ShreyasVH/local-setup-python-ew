UPDATE hierarchy SET has_children = true, updated_at = 'UTC_DATE_TIME_PLUS_19_MINUTE' WHERE level = 4 AND name = 'tu';
INSERT INTO revinfo (rev, revtstmp) VALUES ((SELECT GREATEST(0, MAX(rev)) + 1 FROM revinfo), "TIMESTAMP_DATE_TIME_PLUS_19_MINUTE");
INSERT INTO hierarchy_aud (id, rev, revtype, active, client_id, code, created_at, deployment_id, end_date, has_children, level, level_1_code, level_1_id, level_1_name, level_1_type, level_2_code, level_2_id, level_2_name, level_2_type, level_3_code, level_3_id, level_3_name, level_3_type, level_4_code, level_4_id, level_4_name, level_4_type, level_5_code, level_5_id, level_5_name, level_5_type, level_6_code, level_6_id, level_6_name, level_6_type, merge_status, name, parent_id, start_date, type, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT MAX(rev) from revinfo), 1, true, (SELECT id FROM client WHERE name = 'Nikshay'), '01', 'UTC_DATE_TIME_PLUS_15_MINUTE_WITH_MICRO_SECONDS', (SELECT id FROM deployment WHERE code = 'IND'), null, true, 4, (SELECT code FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT name FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT type FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT code FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT id FROM hierarchy WHERE level = 2 AND name = 'Karnataka') , (SELECT name FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT type FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT code FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT id FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT name FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT type FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), null, null, null, null, null, null, null, null, null, null, null, null, null, 'tu', (SELECT id FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), null, 'TU', 'UTC_DATE_TIME_PLUS_19_MINUTE_WITH_MICRO_SECONDS');

INSERT INTO hierarchy (active, client_id, code, created_at, deployment_id, end_date, has_children, level, level_1_code, level_1_id, level_1_name, level_1_type, level_2_code, level_2_id, level_2_name, level_2_type, level_3_code, level_3_id, level_3_name, level_3_type, level_4_code, level_4_id, level_4_name, level_4_type, level_5_code, level_5_id, level_5_name, level_5_type, level_6_code, level_6_id, level_6_name, level_6_type, merge_status, name, parent_id, start_date, type, updated_at) VALUES (true, (SELECT id FROM client WHERE name = 'Nikshay'), '0', 'UTC_DATE_TIME_PLUS_20_MINUTE_WITH_MICRO_SECONDS', (SELECT id FROM deployment WHERE code = 'IND'), null, false, 5, (SELECT code FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT name FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT type FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT code FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT id FROM hierarchy WHERE level = 2 AND name = 'Karnataka') , (SELECT name FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT type FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT code FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT id FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT name FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT type FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT code FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT id FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT name FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT type FROM hierarchy WHERE level = 4 AND name = 'tu'), null, null, null, null, null, null, null, null, null, 'phi', (SELECT id FROM hierarchy WHERE level = 4 AND name = 'tu'), null, 'PHI', 'UTC_DATE_TIME_PLUS_20_MINUTE_WITH_MICRO_SECONDS');
INSERT INTO revinfo (rev, revtstmp) VALUES ((SELECT GREATEST(0, MAX(rev)) + 1 FROM revinfo), "TIMESTAMP_DATE_TIME_PLUS_20_MINUTE");
INSERT INTO hierarchy_aud (id, rev, revtype, active, client_id, code, created_at, deployment_id, end_date, has_children, level, level_1_code, level_1_id, level_1_name, level_1_type, level_2_code, level_2_id, level_2_name, level_2_type, level_3_code, level_3_id, level_3_name, level_3_type, level_4_code, level_4_id, level_4_name, level_4_type, level_5_code, level_5_id, level_5_name, level_5_type, level_6_code, level_6_id, level_6_name, level_6_type, merge_status, name, parent_id, start_date, type, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 5 AND name = 'phi'), (SELECT MAX(rev) from revinfo), 0, true, (SELECT id FROM client WHERE name = 'Nikshay'), '0', 'UTC_DATE_TIME_PLUS_20_MINUTE_WITH_MICRO_SECONDS', (SELECT id FROM deployment WHERE code = 'IND'), null, false, 5, (SELECT code FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT name FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT type FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT code FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT id FROM hierarchy WHERE level = 2 AND name = 'Karnataka') , (SELECT name FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT type FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT code FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT id FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT name FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT type FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT code FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT id FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT name FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT type FROM hierarchy WHERE level = 4 AND name = 'tu'), null, null, null, null, null, null, null, null, null, 'phi', (SELECT id FROM hierarchy WHERE level = 4 AND name = 'tu'), null, 'PHI', 'UTC_DATE_TIME_PLUS_20_MINUTE_WITH_MICRO_SECONDS');

INSERT INTO hierarchy_associations (association_id, hierarchy_id, value, created_at, updated_at) VALUES ((SELECT id FROM associations_master WHERE type = 'eligibleForIncentive'), (SELECT id FROM hierarchy WHERE client_id = (SELECT id FROM client WHERE name = 'Nikshay') AND level = 5 AND name = 'phi'), 'true', 'UTC_DATE_TIME_PLUS_21_MINUTE', 'UTC_DATE_TIME_PLUS_21_MINUTE');
INSERT INTO hierarchy_associations (association_id, hierarchy_id, value, created_at, updated_at) VALUES ((SELECT id FROM associations_master WHERE type = 'mobileNumber'), (SELECT id FROM hierarchy WHERE client_id = (SELECT id FROM client WHERE name = 'Nikshay') AND level = 5 AND name = 'phi'), '9999999991', 'UTC_DATE_TIME_PLUS_21_MINUTE', 'UTC_DATE_TIME_PLUS_21_MINUTE');
INSERT INTO hierarchy_associations (association_id, hierarchy_id, value, created_at, updated_at) VALUES ((SELECT id FROM associations_master WHERE type = 'extraData'), (SELECT id FROM hierarchy WHERE client_id = (SELECT id FROM client WHERE name = 'Nikshay') AND level = 5 AND name = 'phi'), '{"DmcNin":"","HFRegNo":"","ContactPersonName":"","ContactPersonDesg":"","ContactPersonEmail":"","MobileNo":"9999999991","Address":"address","FacilityType":"PHI","IsAfterLogin":true,"UpdatedBy":"india-all","UpdatedDate":"DATE_TIME_PLUS_20_MINUTE"}', 'UTC_DATE_TIME_PLUS_21_MINUTE', 'UTC_DATE_TIME_PLUS_21_MINUTE');
INSERT INTO hierarchy_associations (association_id, hierarchy_id, value, created_at, updated_at) VALUES ((SELECT id FROM associations_master WHERE type = 'drugRegimen'), (SELECT id FROM hierarchy WHERE client_id = (SELECT id FROM client WHERE name = 'Nikshay') AND level = 5 AND name = 'phi'), 'UNKNOWN', 'UTC_DATE_TIME_PLUS_21_MINUTE', 'UTC_DATE_TIME_PLUS_21_MINUTE');
INSERT INTO revinfo (rev, revtstmp) VALUES ((SELECT GREATEST(0, MAX(rev)) + 1 FROM revinfo), "TIMESTAMP_DATE_TIME_PLUS_21_MINUTE");
INSERT INTO hierarchy_associations_aud (id, rev, revtype, value) VALUES ((SELECT id FROM hierarchy_associations WHERE hierarchy_id = (SELECT id FROM hierarchy WHERE level = 5 AND name = 'phi') AND association_id = (SELECT id FROM associations_master WHERE type = 'eligibleForIncentive')), (SELECT MAX(rev) from revinfo), 0, 'true');
INSERT INTO hierarchy_associations_aud (id, rev, revtype, value) VALUES ((SELECT id FROM hierarchy_associations WHERE hierarchy_id = (SELECT id FROM hierarchy WHERE level = 5 AND name = 'phi') AND association_id = (SELECT id FROM associations_master WHERE type = 'mobileNumber')), (SELECT MAX(rev) from revinfo), 0, '9999999991');
INSERT INTO hierarchy_associations_aud (id, rev, revtype, value) VALUES ((SELECT id FROM hierarchy_associations WHERE hierarchy_id = (SELECT id FROM hierarchy WHERE level = 5 AND name = 'phi') AND association_id = (SELECT id FROM associations_master WHERE type = 'extraData')), (SELECT MAX(rev) from revinfo), 0, '{"DmcNin":"123","HFRegNo":"456","ContactPersonName":"contactPersonName","ContactPersonDesg":"contactPersonDesignation","ContactPersonEmail":"mail.four@gmail.com","MobileNo":"9999999991","Address":"address","FacilityType":"PHI","IsAfterLogin":true,"UpdatedBy":"india-all","UpdatedDate":"DATE_TIME_PLUS_20_MINUTE"}');
INSERT INTO hierarchy_associations_aud (id, rev, revtype, value) VALUES ((SELECT id FROM hierarchy_associations WHERE hierarchy_id = (SELECT id FROM hierarchy WHERE level = 5 AND name = 'phi') AND association_id = (SELECT id FROM associations_master WHERE type = 'drugRegimen')), (SELECT MAX(rev) from revinfo), 0, 'UNKNOWN');


UPDATE hierarchy SET code = '001', updated_at = 'UTC_DATE_TIME_PLUS_22_MINUTE_WITH_MICRO_SECONDS' WHERE level = 5 AND name = 'phi';
INSERT INTO revinfo (rev, revtstmp) VALUES ((SELECT GREATEST(0, MAX(rev)) + 1 FROM revinfo), "TIMESTAMP_DATE_TIME_PLUS_22_MINUTE");
INSERT INTO hierarchy_aud (id, rev, revtype, active, client_id, code, created_at, deployment_id, end_date, has_children, level, level_1_code, level_1_id, level_1_name, level_1_type, level_2_code, level_2_id, level_2_name, level_2_type, level_3_code, level_3_id, level_3_name, level_3_type, level_4_code, level_4_id, level_4_name, level_4_type, level_5_code, level_5_id, level_5_name, level_5_type, level_6_code, level_6_id, level_6_name, level_6_type, merge_status, name, parent_id, start_date, type, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 5 AND name = 'phi'), (SELECT MAX(rev) from revinfo), 1, true, (SELECT id FROM client WHERE name = 'Nikshay'), '001', 'UTC_DATE_TIME_PLUS_20_MINUTE_WITH_MICRO_SECONDS', (SELECT id FROM deployment WHERE code = 'IND'), null, false, 5, (SELECT code FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT name FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT type FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT code FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT id FROM hierarchy WHERE level = 2 AND name = 'Karnataka') , (SELECT name FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT type FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT code FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT id FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT name FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT type FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT code FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT id FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT name FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT type FROM hierarchy WHERE level = 4 AND name = 'tu'), null, null, null, null, null, null, null, null, null, 'phi', (SELECT id FROM hierarchy WHERE level = 4 AND name = 'tu'), null, 'PHI', 'UTC_DATE_TIME_PLUS_22_MINUTE_WITH_MICRO_SECONDS');

INSERT INTO hierarchy_config_map (hierarchy_id, config_mapping_id, value, active, created_at, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 5 AND name = 'phi'), (SELECT id FROM config WHERE name = 'MermMappingLevel'), '3', true, 'UTC_DATE_TIME_PLUS_22_MINUTE', 'DATE_TIME_PLUS_22_MINUTE');

INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'AboutUs'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'ActiveCaseMappingsummary'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'AddTestGlobal'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'AdherenceSummary'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'Admin'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'AdverseEventReportingSystem'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'Diagnostics'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'Dispensation'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'EVRIMED_METRICS'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'GeneExpert'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'INVENTORY_MANAGEMENT'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'MappingDetailsActivityReports'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'my_profile'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'NewEnrollment'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'reports'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'Others'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'Overview'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'PatientManagement'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = '_reset_password'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'SearchSample'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'StaffManagement'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'TaskLists'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'TaskListStats'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'TransferInOut'), true, 'PHI', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'UserManagement'), true, 'PHI', 'sidebar', false, false, false, false);

INSERT INTO staff (client_id, person_id, designation, added_by, selective_episode_mapping, active, added_on, last_updated_on, visible) VALUES ((SELECT id FROM client WHERE name = 'Nikshay'), (SELECT id FROM foreign_persons WHERE first_name = 'phi-KADHA01-001'), 'ADMIN', null, false, true, 'UTC_DATE_TIME_PLUS_15_MINUTE', 'UTC_DATE_TIME_PLUS_15_MINUTE', false);

INSERT INTO user_access (active, hierarchy_id, selective_hierarchy_mapping, sso_id, username, client_id, staff_id, description, view_only, can_delete_patients, visible, restricted_view, created_at, updated_at) VALUES (true, (SELECT id FROM hierarchy WHERE level = 5 AND name = 'phi'), false, (SELECT id FROM foreign_sso_users WHERE user_name = 'phi-kadha01-001'), 'phi-KADHA01-001', (SELECT id FROM client WHERE name = 'Nikshay'), (SELECT id FROM staff WHERE person_id = (select id FROM foreign_persons WHERE first_name = 'phi-KADHA01-001')), 'phi PHI Login', false, true, true, false, 'DATE_TIME_PLUS_26_MINUTE', 'DATE_TIME_PLUS_26_MINUTE');
INSERT INTO user_access_hierarchy_map (created_at, hierarchy_id, last_updated_by, relation, updated_at, user_id) VALUES ('UTC_DATE_TIME_PLUS_26_MINUTE', (SELECT id FROM hierarchy WHERE level = 5 AND name = 'phi'), 0, 'Direct', 'UTC_DATE_TIME_PLUS_26_MINUTE', (SELECT id FROM user_access WHERE username = 'phi-KADHA01-001'));

#tab permissions
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, created_at, updated_at, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (SELECT id FROM foreign_supported_tab WHERE name = 'Tests'), true, 'PHI', null, null, 'patient_tab', true, true, true, true);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, created_at, updated_at, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (SELECT id FROM foreign_supported_tab WHERE name = 'Basic Details'), true, 'PHI', null, null, 'patient_tab', true, true, true, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, created_at, updated_at, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (SELECT id FROM foreign_supported_tab WHERE name = 'Health Facilities'), true, 'PHI', null, null, 'patient_tab', true, false, true, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, created_at, updated_at, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (SELECT id FROM foreign_supported_tab WHERE name = 'Treatment Details'), true, 'PHI', null, null, 'patient_tab', true, true, true, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, created_at, updated_at, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (SELECT id FROM foreign_supported_tab WHERE name = 'Outcomes'), true, 'PHI', null, null, 'patient_tab', true, true, true, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, created_at, updated_at, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (SELECT id FROM foreign_supported_tab WHERE name = 'DBT'), true, 'PHI', null, null, 'patient_tab', true, true, true, false);