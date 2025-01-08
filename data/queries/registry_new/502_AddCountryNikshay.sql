INSERT INTO hierarchy (active, client_id, code, created_at, deployment_id, end_date, has_children, level, level_1_code, level_1_id, level_1_name, level_1_type, level_2_code, level_2_id, level_2_name, level_2_type, level_3_code, level_3_id, level_3_name, level_3_type, level_4_code, level_4_id, level_4_name, level_4_type, level_5_code, level_5_id, level_5_name, level_5_type, level_6_code, level_6_id, level_6_name, level_6_type, merge_status, name, parent_id, start_date, type, updated_at) VALUES (true, (SELECT id FROM client WHERE name = 'Nikshay'), 'IND', null, (SELECT id FROM deployment WHERE code = 'IND'), null, true, 1, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'India', null, null, 'COUNTRY', null);

INSERT INTO staff (client_id, person_id, designation, added_by, selective_episode_mapping, active, added_on, last_updated_on, visible) VALUES ((SELECT id FROM client WHERE name = 'Nikshay'), (SELECT id FROM foreign_persons WHERE first_name = 'india-all'), 'ADMIN', null, false, true, 'UTC_DATE_TIME_PLUS_15_MINUTE', 'UTC_DATE_TIME_PLUS_15_MINUTE', false);
INSERT INTO user_access (active, hierarchy_id, selective_hierarchy_mapping, sso_id, username, client_id, staff_id, description) VALUES (true, (SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), false, (SELECT id FROM foreign_sso_users WHERE user_name = 'india-all'), 'india-all', (SELECT id FROM client WHERE name = 'Nikshay'), (SELECT id FROM staff WHERE person_id = (select id FROM foreign_persons WHERE first_name = 'india-all')), null);
INSERT INTO user_access_hierarchy_map (created_at, hierarchy_id, last_updated_by, relation, updated_at, user_id) VALUES ('UTC_DATE_TIME_PLUS_26_MINUTE', (SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), 0, 'Direct', 'UTC_DATE_TIME_PLUS_26_MINUTE', (SELECT id FROM user_access WHERE username = 'india-all'));

INSERT INTO staff (client_id, person_id, designation, added_by, selective_episode_mapping, active, added_on, last_updated_on, visible) VALUES ((SELECT id FROM client WHERE name = 'Nikshay'), (SELECT id FROM foreign_persons WHERE first_name = 'testlogin'), 'ADMIN', null, false, true, 'UTC_DATE_TIME_PLUS_15_MINUTE', 'UTC_DATE_TIME_PLUS_15_MINUTE', false);
INSERT INTO user_access (active, hierarchy_id, selective_hierarchy_mapping, sso_id, username, client_id, staff_id, description) VALUES (true, (SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), false, (SELECT id FROM foreign_sso_users WHERE user_name = 'testlogin'), 'testlogin', (SELECT id FROM client WHERE name = 'Nikshay'), (SELECT id FROM staff WHERE person_id = (select id FROM foreign_persons WHERE first_name = 'testlogin')), null);
INSERT INTO user_access_hierarchy_map (created_at, hierarchy_id, last_updated_by, relation, updated_at, user_id) VALUES ('UTC_DATE_TIME_PLUS_26_MINUTE', (SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), 0, 'Direct', 'UTC_DATE_TIME_PLUS_26_MINUTE', (SELECT id FROM user_access WHERE username = 'testlogin'));

INSERT INTO hierarchy_config_map (hierarchy_id, config_mapping_id, value, active, created_at, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM config WHERE name = 'DiagnosticsEnabled'), 'true', true, 'UTC_DATE_PLUS_0_DAY', 'DATE_PLUS_0_DAY');
INSERT INTO hierarchy_config_map (hierarchy_id, config_mapping_id, value, active, created_at, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM config WHERE name = 'AadhaarOtpVerificationEnabled'), 'true', true, 'UTC_DATE_PLUS_0_DAY', 'DATE_PLUS_0_DAY');
INSERT INTO hierarchy_config_map (hierarchy_id, config_mapping_id, value, active, created_at, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM config WHERE name = 'PhoneNumberVerificationEnabled'), 'true', true, 'UTC_DATE_PLUS_0_DAY', 'DATE_PLUS_0_DAY');
INSERT INTO hierarchy_config_map (hierarchy_id, config_mapping_id, value, active, created_at, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM config WHERE name = 'DataConsentEnabled'), 'true', true, 'UTC_DATE_PLUS_0_DAY', 'DATE_PLUS_0_DAY');

INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'AboutUs'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'ActiveCaseMappingsummary'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'add_facility'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'AddTestGlobal'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'Admin'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'Dispensation'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'facility_administration'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'GeneExpert'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'MappingDetailsActivityReports'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'merge_health_facility'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'NewEnrollment'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'dashboards'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'reports'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'Others'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'Overview'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'PatientManagement'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = '_reset_password'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'SearchSample'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'StaffManagement'), true, 'COUNTRY', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'UserManagement'), true, 'COUNTRY', 'sidebar', false, false, false, false);

INSERT INTO hierarchy_config_map (hierarchy_id, config_mapping_id, value, active, created_at, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM config WHERE name = 'DbtPurposeCodeNSList'), '["2769","10501","7942","8420","8933","10144","2773","10144","8849","11079","10936","8809","6674","8306","9495","7642","7175","8371","10746","6290","8341","8371","10183","7942","8371","2769","2769","8368","7942","8949","2769","10274","7662","7632","7858","8420","8922"]', true, 'UTC_DATE_PLUS_0_DAY', 'DATE_PLUS_0_DAY');
INSERT INTO hierarchy_config_map (hierarchy_id, config_mapping_id, value, active, created_at, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM config WHERE name = 'DbtPurposeCodeNSOldList'), '["8371","10795","2769","2769","7662","2769","8804"]', true, 'UTC_DATE_PLUS_0_DAY', 'DATE_PLUS_0_DAY');
INSERT INTO hierarchy_config_map (hierarchy_id, config_mapping_id, value, active, created_at, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM config WHERE name = 'DbtBeneficiaryTypeCodeTSList'), '["968","6123","4786","5232","5855","5994","1325","6373","5359","4803","5540","4395","4283","4365","3573","4978","5006","6013","4781","5050","5274","5322","4959","5699","4376","4055","4291","4685","6204"]', true, 'UTC_DATE_PLUS_0_DAY', 'DATE_PLUS_0_DAY');
INSERT INTO hierarchy_config_map (hierarchy_id, config_mapping_id, value, active, created_at, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM config WHERE name = 'DbtBeneficiaryTypeCodePSNList'), '["970","6126","4784","5247","5871","5992","1331","6306","5384","6375","1339","5362","4802","4949","5550","4394","4281","5413","3568","4976","5010","6012","4782","5046","5275","5321","5008","4960","5433","5700","4378","4054","4288","4698","6242","6201"]', true, 'UTC_DATE_PLUS_0_DAY', 'DATE_PLUS_0_DAY');
INSERT INTO hierarchy_config_map (hierarchy_id, config_mapping_id, value, active, created_at, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM config WHERE name = 'DbtPurposeCodeNPYList'), '["2769", "10501", "7942", "8420", "8933", "10144", "2773", "10144", "8849", "11079", "10936", "8809", "6674", "8306", "9495", "7642", "7175", "8371", "10746", "6290", "8341", "8371", "10183", "7942", "8371", "2769", "2769", "8368", "7942", "8949", "2769", "10274", "7662", "7632", "7858", "8420", "8922"]', true, 'UTC_DATE_PLUS_0_DAY', 'DATE_PLUS_0_DAY');
INSERT INTO hierarchy_config_map (hierarchy_id, config_mapping_id, value, active, created_at, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM config WHERE name = 'DbtPurposeCodeNPYOldList'), '["2769", "8804", "10795", "8371", "2769", "7662", "2769"]', true, 'UTC_DATE_PLUS_0_DAY', 'DATE_PLUS_0_DAY');
INSERT INTO hierarchy_config_map (hierarchy_id, config_mapping_id, value, active, created_at, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM config WHERE name = 'DbtPurposeCodePSNList'), '["1402","10500","7943","8526","8938","10145","2772","10748","8857","11084","10933","8813","6289","8305","9513","2558","7174","8913","6289","8342","8382","10181","7943","8381","6289","8526","8377","8316","8953","8923","10275","7663","7630","7857","10748","8526"]', true, 'UTC_DATE_PLUS_0_DAY', 'DATE_PLUS_0_DAY');
INSERT INTO hierarchy_config_map (hierarchy_id, config_mapping_id, value, active, created_at, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM config WHERE name = 'DbtPurposeCodePSNOldList'), '["1402","8923","8953","8381","1402","8344","7663","7663","1402"]', true, 'UTC_DATE_PLUS_0_DAY', 'DATE_PLUS_0_DAY');
INSERT INTO hierarchy_config_map (hierarchy_id, config_mapping_id, value, active, created_at, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM config WHERE name = 'NotifiedStages'), '[3,4,5,6,8]', true, 'UTC_DATE_PLUS_0_DAY', 'UTC_DATE_PLUS_0_DAY');
INSERT INTO hierarchy_config_map (hierarchy_id, config_mapping_id, value, active, created_at, updated_at) VALUES ((select id from hierarchy where level = 1 and name = 'India'), (SELECT id FROM config WHERE Name = 'OverviewPage'), 'Slider', true, 'UTC_DATE_PLUS_0_DAY', 'DATE_PLUS_0_DAY');
INSERT INTO hierarchy_config_map (hierarchy_id, config_mapping_id, value, active, created_at, updated_at) VALUES ((select id from hierarchy where level = 1 and name = 'India'), (SELECT id FROM config WHERE Name = 'TypesOfStats'), '["TaskListStats","MiscStats"]', true, 'UTC_DATE_PLUS_0_DAY', 'DATE_PLUS_0_DAY');