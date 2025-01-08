UPDATE hierarchy SET has_children = true, updated_at = 'UTC_DATE_TIME_PLUS_9_MINUTE_WITH_MICRO_SECONDS' WHERE level = 2 AND name = 'Karnataka';
INSERT INTO revinfo (rev, revtstmp) VALUES ((SELECT GREATEST(0, MAX(rev)) + 1 FROM revinfo), "TIMESTAMP_DATE_TIME_PLUS_9_MINUTE");
INSERT INTO hierarchy_aud (id, rev, revtype, active, client_id, code, created_at, deployment_id, end_date, has_children, level, level_1_code, level_1_id, level_1_name, level_1_type, level_2_code, level_2_id, level_2_name, level_2_type, level_3_code, level_3_id, level_3_name, level_3_type, level_4_code, level_4_id, level_4_name, level_4_type, level_5_code, level_5_id, level_5_name, level_5_type, level_6_code, level_6_id, level_6_name, level_6_type, merge_status, name, parent_id, start_date, type, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT MAX(rev) from revinfo), 1, true, (SELECT id FROM client WHERE name = 'Nikshay'), 'KA', 'UTC_DATE_TIME_PLUS_5_MINUTE_WITH_MICRO_SECONDS', (SELECT id FROM deployment WHERE code = 'IND'), null, true, 2, (SELECT code FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT name FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT type FROM hierarchy WHERE level = 1 AND name = 'India'), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Karnataka', (SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), null, 'STATE', 'UTC_DATE_TIME_PLUS_9_MINUTE_WITH_MICRO_SECONDS');

INSERT INTO hierarchy (active, client_id, code, created_at, deployment_id, end_date, has_children, level, level_1_code, level_1_id, level_1_name, level_1_type, level_2_code, level_2_id, level_2_name, level_2_type, level_3_code, level_3_id, level_3_name, level_3_type, level_4_code, level_4_id, level_4_name, level_4_type, level_5_code, level_5_id, level_5_name, level_5_type, level_6_code, level_6_id, level_6_name, level_6_type, merge_status, name, parent_id, start_date, type, updated_at) VALUES (true, (SELECT id FROM client WHERE name = 'Nikshay'), '0', 'UTC_DATE_TIME_PLUS_10_MINUTE_WITH_MICRO_SECONDS', (SELECT id FROM deployment WHERE code = 'IND'), null, false, 3, (SELECT code FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT name FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT type FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT code FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT id FROM hierarchy WHERE level = 2 AND name = 'Karnataka') , (SELECT name FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT type FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Dharwad', (SELECT id FROM hierarchy WHERE level = 2 AND name = 'Karnataka') , null, 'DISTRICT', 'UTC_DATE_TIME_PLUS_10_MINUTE_WITH_MICRO_SECONDS');
INSERT INTO revinfo (rev, revtstmp) VALUES ((SELECT GREATEST(0, MAX(rev)) + 1 FROM revinfo), "TIMESTAMP_DATE_TIME_PLUS_10_MINUTE");
INSERT INTO hierarchy_aud (id, rev, revtype, active, client_id, code, created_at, deployment_id, end_date, has_children, level, level_1_code, level_1_id, level_1_name, level_1_type, level_2_code, level_2_id, level_2_name, level_2_type, level_3_code, level_3_id, level_3_name, level_3_type, level_4_code, level_4_id, level_4_name, level_4_type, level_5_code, level_5_id, level_5_name, level_5_type, level_6_code, level_6_id, level_6_name, level_6_type, merge_status, name, parent_id, start_date, type, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT MAX(rev) from revinfo), 0, true, (SELECT id FROM client WHERE name = 'Nikshay'), '0', 'UTC_DATE_TIME_PLUS_10_MINUTE_WITH_MICRO_SECONDS', (SELECT id FROM deployment WHERE code = 'IND'), null, false, 3, (SELECT code FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT name FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT type FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT code FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT id FROM hierarchy WHERE level = 2 AND name = 'Karnataka') , (SELECT name FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT type FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Dharwad', (SELECT id FROM hierarchy WHERE level = 2 AND name = 'Karnataka') , null, 'DISTRICT', 'UTC_DATE_TIME_PLUS_10_MINUTE_WITH_MICRO_SECONDS');

INSERT INTO hierarchy_associations (association_id, hierarchy_id, value, created_at, updated_at) VALUES ((SELECT id FROM associations_master WHERE type = 'eligibleForIncentive'), (SELECT id FROM hierarchy WHERE client_id = (SELECT id FROM client WHERE name = 'Nikshay') AND level = 3 AND name = 'Dharwad'), 'true', 'UTC_DATE_TIME_PLUS_11_MINUTE', 'UTC_DATE_TIME_PLUS_11_MINUTE');
INSERT INTO hierarchy_associations (association_id, hierarchy_id, value, created_at, updated_at) VALUES ((SELECT id FROM associations_master WHERE type = 'mobileNumber'), (SELECT id FROM hierarchy WHERE client_id = (SELECT id FROM client WHERE name = 'Nikshay') AND level = 3 AND name = 'Dharwad'), '9999999996', 'UTC_DATE_TIME_PLUS_11_MINUTE', 'UTC_DATE_TIME_PLUS_11_MINUTE');
INSERT INTO hierarchy_associations (association_id, hierarchy_id, value, created_at, updated_at) VALUES ((SELECT id FROM associations_master WHERE type = 'extraData'), (SELECT id FROM hierarchy WHERE client_id = (SELECT id FROM client WHERE name = 'Nikshay') AND level = 3 AND name = 'Dharwad'), '{"DtoName":"","Email":"mail.two@gmail.com","PhoneOffice":"9999999995","MobileNo":"9999999996","DtcAddress":"","DtcPincode":"999999","PfmsDistrictCode":0,"UpdatedBy":"india-all","UpdatedDate":"DATE_TIME_PLUS_10_MINUTE"}', 'UTC_DATE_TIME_PLUS_11_MINUTE', 'UTC_DATE_TIME_PLUS_11_MINUTE');
INSERT INTO hierarchy_associations (association_id, hierarchy_id, value, created_at, updated_at) VALUES ((SELECT id FROM associations_master WHERE type = 'drugRegimen'), (SELECT id FROM hierarchy WHERE client_id = (SELECT id FROM client WHERE name = 'Nikshay') AND level = 3 AND name = 'Dharwad'), 'UNKNOWN', 'UTC_DATE_TIME_PLUS_11_MINUTE', 'UTC_DATE_TIME_PLUS_11_MINUTE');
INSERT INTO revinfo (rev, revtstmp) VALUES ((SELECT GREATEST(0, MAX(rev)) + 1 FROM revinfo), "TIMESTAMP_DATE_TIME_PLUS_11_MINUTE");
INSERT INTO hierarchy_associations_aud (id, rev, revtype, value) VALUES ((SELECT id FROM hierarchy_associations WHERE hierarchy_id = (SELECT id FROM hierarchy WHERE level = 3 AND name = 'Dharwad') AND association_id = (SELECT id FROM associations_master WHERE type = 'eligibleForIncentive')), (SELECT MAX(rev) from revinfo), 0, 'true');
INSERT INTO hierarchy_associations_aud (id, rev, revtype, value) VALUES ((SELECT id FROM hierarchy_associations WHERE hierarchy_id = (SELECT id FROM hierarchy WHERE level = 3 AND name = 'Dharwad') AND association_id = (SELECT id FROM associations_master WHERE type = 'mobileNumber')), (SELECT MAX(rev) from revinfo), 0, '9999999996');
INSERT INTO hierarchy_associations_aud (id, rev, revtype, value) VALUES ((SELECT id FROM hierarchy_associations WHERE hierarchy_id = (SELECT id FROM hierarchy WHERE level = 3 AND name = 'Dharwad') AND association_id = (SELECT id FROM associations_master WHERE type = 'extraData')), (SELECT MAX(rev) from revinfo), 0, '{"DtoName":"dtoName","Email":"mail.two@gmail.com","PhoneOffice":"9999999995","MobileNo":"9999999996","DtcAddress":"dtoAddress","DtcPincode":"999999","MDDSDistrictCode":"4567","UpdatedBy":"india-all","UpdatedDate":"DATE_TIME_PLUS_10_MINUTE"}');
INSERT INTO hierarchy_associations_aud (id, rev, revtype, value) VALUES ((SELECT id FROM hierarchy_associations WHERE hierarchy_id = (SELECT id FROM hierarchy WHERE level = 3 AND name = 'Dharwad') AND association_id = (SELECT id FROM associations_master WHERE type = 'drugRegimen')), (SELECT MAX(rev) from revinfo), 0, 'UNKNOWN');

INSERT INTO hierarchy_associations (association_id, hierarchy_id, value, created_at, updated_at) VALUES ((SELECT id FROM associations_master WHERE type = 'pfmsDistrictCode'), (SELECT id FROM hierarchy WHERE client_id = (SELECT id FROM client WHERE name = 'Nikshay') AND level = 3 AND name = 'Dharwad'), '536', 'UTC_DATE_TIME_PLUS_7_MINUTE', 'UTC_DATE_TIME_PLUS_7_MINUTE');
INSERT INTO revinfo (rev, revtstmp) VALUES ((SELECT GREATEST(0, MAX(rev)) + 1 FROM revinfo), "TIMESTAMP_DATE_TIME_PLUS_8_MINUTE");
INSERT INTO hierarchy_associations_aud (id, rev, revtype, value) VALUES ((SELECT id FROM hierarchy_associations WHERE hierarchy_id = (SELECT id FROM hierarchy WHERE level = 3 AND name = 'Dharwad') AND association_id = (SELECT id FROM associations_master WHERE type = 'pfmsDistrictCode')), (SELECT MAX(rev) from revinfo), 0, '536');

UPDATE hierarchy SET code = 'DHA', updated_at = 'UTC_DATE_TIME_PLUS_12_MINUTE_WITH_MICRO_SECONDS' WHERE level = 3 AND name = 'Dharwad';
INSERT INTO revinfo (rev, revtstmp) VALUES ((SELECT GREATEST(0, MAX(rev)) + 1 FROM revinfo), "TIMESTAMP_DATE_TIME_PLUS_12_MINUTE");
INSERT INTO hierarchy_aud (id, rev, revtype, active, client_id, code, created_at, deployment_id, end_date, has_children, level, level_1_code, level_1_id, level_1_name, level_1_type, level_2_code, level_2_id, level_2_name, level_2_type, level_3_code, level_3_id, level_3_name, level_3_type, level_4_code, level_4_id, level_4_name, level_4_type, level_5_code, level_5_id, level_5_name, level_5_type, level_6_code, level_6_id, level_6_name, level_6_type, merge_status, name, parent_id, start_date, type, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT MAX(rev) from revinfo), 1, true, (SELECT id FROM client WHERE name = 'Nikshay'), 'DHA', 'UTC_DATE_TIME_PLUS_12_MINUTE_WITH_MICRO_SECONDS', (SELECT id FROM deployment WHERE code = 'IND'), null, false, 3, (SELECT code FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT name FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT type FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT code FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT id FROM hierarchy WHERE level = 2 AND name = 'Karnataka') , (SELECT name FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT type FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Dharwad', (SELECT id FROM hierarchy WHERE level = 2 AND name = 'Karnataka') , null, 'DISTRICT', 'UTC_DATE_TIME_PLUS_12_MINUTE_WITH_MICRO_SECONDS');

INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'AboutUs'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'ActiveCaseMappingsummary'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'AddTestGlobal'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'AdherenceSummary'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'Admin'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'AdverseEventReportingSystem'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'CONTRACT_MANAGEMENT'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'Deduplication'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'Dispensation'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'EVRIMED_METRICS'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'facility_administration'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'GeneExpert'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'INVENTORY_MANAGEMENT'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'Invoices'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'MappingDetailsActivityReports'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'merge_health_facility'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'my_profile'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'NewEnrollment'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'dashboards'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'reports'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'Others'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'Overview'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'PatientManagement'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = '_reset_password'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'SearchSample'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'SOE'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'StaffManagement'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'TaskLists'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'TaskListStats'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'TransferInOut'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'UserManagement'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'TB_MUKT_PANCHAYAT'), true, 'DISTRICT', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (select id from sidebar_item where name = 'TBMP_REPORT'), true, 'DISTRICT', 'sidebar', false, false, false, false);

INSERT INTO staff (client_id, person_id, designation, added_by, selective_episode_mapping, active, added_on, last_updated_on, visible) VALUES ((SELECT id FROM client WHERE name = 'Nikshay'), (SELECT id FROM foreign_persons WHERE first_name = 'dto-KADHA'), 'ADMIN', null, false, true, 'UTC_DATE_TIME_PLUS_15_MINUTE', 'UTC_DATE_TIME_PLUS_15_MINUTE', false);

INSERT INTO user_access (active, hierarchy_id, selective_hierarchy_mapping, sso_id, username, client_id, staff_id, description, view_only, can_delete_patients, visible, restricted_view, created_at, updated_at) VALUES (true, (SELECT id FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), false, (SELECT id FROM foreign_sso_users WHERE user_name = 'dto-kadha'), 'dto-KADHA', (SELECT id FROM client WHERE name = 'Nikshay'), (SELECT id FROM staff WHERE person_id = (select id FROM foreign_persons WHERE first_name = 'dto-KADHA')), 'Dharwad DISTRICT Login', false, true, true, false, 'DATE_TIME_PLUS_26_MINUTE', 'DATE_TIME_PLUS_26_MINUTE');
INSERT INTO user_access_hierarchy_map (created_at, hierarchy_id, last_updated_by, relation, updated_at, user_id) VALUES ('UTC_DATE_TIME_PLUS_26_MINUTE', (SELECT id FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), 0, 'Direct', 'UTC_DATE_TIME_PLUS_26_MINUTE', (SELECT id FROM user_access WHERE username = 'dto-KADHA'));

#tab permissions
    INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, created_at, updated_at, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (SELECT id FROM foreign_supported_tab WHERE name = 'Tests'), true, 'DISTRICT', null, null, 'patient_tab', true, true, true, true);
    INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, created_at, updated_at, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (SELECT id FROM foreign_supported_tab WHERE name = 'Basic Details'), true, 'DISTRICT', null, null, 'patient_tab', true, true, true, false);
    INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, created_at, updated_at, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (SELECT id FROM foreign_supported_tab WHERE name = 'Health Facilities'), true, 'DISTRICT', null, null, 'patient_tab', true, false, true, false);
    INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, created_at, updated_at, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (SELECT id FROM foreign_supported_tab WHERE name = 'Treatment Details'), true, 'DISTRICT', null, null, 'patient_tab', true, true, true, false);
    INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, created_at, updated_at, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (SELECT id FROM foreign_supported_tab WHERE name = 'Outcomes'), true, 'DISTRICT', null, null, 'patient_tab', true, true, true, false);
    INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, created_at, updated_at, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'ADMIN', (SELECT id FROM foreign_supported_tab WHERE name = 'DBT'), true, 'DISTRICT', null, null, 'patient_tab', true, true, true, false);

INSERT INTO hierarchy_config_map (hierarchy_id, config_mapping_id, value, active, created_at, updated_at) VALUES ((select id from hierarchy where level = 3 and name = 'Dharwad'), (SELECT id FROM config WHERE Name = 'OverviewPage'), 'OverallStats', true, 'UTC_DATE_TIME_PLUS_12_MINUTE', 'DATE_TIME_PLUS_12_MINUTE');