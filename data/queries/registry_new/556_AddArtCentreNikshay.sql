INSERT INTO hierarchy (active, client_id, code, created_at, deployment_id, end_date, has_children, level, level_1_code, level_1_id, level_1_name, level_1_type, level_2_code, level_2_id, level_2_name, level_2_type, level_3_code, level_3_id, level_3_name, level_3_type, level_4_code, level_4_id, level_4_name, level_4_type, level_5_code, level_5_id, level_5_name, level_5_type, level_6_code, level_6_id, level_6_name, level_6_type, merge_status, name, parent_id, start_date, type, updated_at) VALUES (true, (SELECT id FROM client WHERE name = 'Nikshay'), '0', 'UTC_DATE_TIME_PLUS_20_MINUTE_WITH_MICRO_SECONDS', (SELECT id FROM deployment WHERE code = 'IND'), null, false, 5, (SELECT code FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT name FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT type FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT code FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT id FROM hierarchy WHERE level = 2 AND name = 'Karnataka') , (SELECT name FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT type FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT code FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT id FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT name FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT type FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT code FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT id FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT name FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT type FROM hierarchy WHERE level = 4 AND name = 'tu'), null, null, null, null, null, null, null, null, null, 'art centre', (SELECT id FROM hierarchy WHERE level = 4 AND name = 'tu'), null, 'PHI', 'UTC_DATE_TIME_PLUS_20_MINUTE_WITH_MICRO_SECONDS');
INSERT INTO revinfo (rev, revtstmp) VALUES ((SELECT GREATEST(0, MAX(rev)) + 1 FROM revinfo), "TIMESTAMP_DATE_TIME_PLUS_20_MINUTE");
INSERT INTO hierarchy_aud (id, rev, revtype, active, client_id, code, created_at, deployment_id, end_date, has_children, level, level_1_code, level_1_id, level_1_name, level_1_type, level_2_code, level_2_id, level_2_name, level_2_type, level_3_code, level_3_id, level_3_name, level_3_type, level_4_code, level_4_id, level_4_name, level_4_type, level_5_code, level_5_id, level_5_name, level_5_type, level_6_code, level_6_id, level_6_name, level_6_type, merge_status, name, parent_id, start_date, type, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 5 AND name = 'art centre'), (SELECT MAX(rev) from revinfo), 0, true, (SELECT id FROM client WHERE name = 'Nikshay'), '0', 'UTC_DATE_TIME_PLUS_20_MINUTE_WITH_MICRO_SECONDS', (SELECT id FROM deployment WHERE code = 'IND'), null, false, 5, (SELECT code FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT name FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT type FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT code FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT id FROM hierarchy WHERE level = 2 AND name = 'Karnataka') , (SELECT name FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT type FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT code FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT id FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT name FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT type FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT code FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT id FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT name FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT type FROM hierarchy WHERE level = 4 AND name = 'tu'), null, null, null, null, null, null, null, null, null, 'art centre', (SELECT id FROM hierarchy WHERE level = 4 AND name = 'tu'), null, 'PHI', 'UTC_DATE_TIME_PLUS_20_MINUTE_WITH_MICRO_SECONDS');

INSERT INTO hierarchy_associations (association_id, hierarchy_id, value, created_at, updated_at) VALUES ((SELECT id FROM associations_master WHERE type = 'eligibleForIncentive'), (SELECT id FROM hierarchy WHERE client_id = (SELECT id FROM client WHERE name = 'Nikshay') AND level = 5 AND name = 'art centre'), 'true', 'UTC_DATE_TIME_PLUS_21_MINUTE', 'UTC_DATE_TIME_PLUS_21_MINUTE');
INSERT INTO hierarchy_associations (association_id, hierarchy_id, value, created_at, updated_at) VALUES ((SELECT id FROM associations_master WHERE type = 'isART'), (SELECT id FROM hierarchy WHERE client_id = (SELECT id FROM client WHERE name = 'Nikshay') AND level = 5 AND name = 'art centre'), 'true', 'UTC_DATE_TIME_PLUS_21_MINUTE', 'UTC_DATE_TIME_PLUS_21_MINUTE');
INSERT INTO hierarchy_associations (association_id, hierarchy_id, value, created_at, updated_at) VALUES ((SELECT id FROM associations_master WHERE type = 'mobileNumber'), (SELECT id FROM hierarchy WHERE client_id = (SELECT id FROM client WHERE name = 'Nikshay') AND level = 5 AND name = 'art centre'), '9999999974', 'UTC_DATE_TIME_PLUS_21_MINUTE', 'UTC_DATE_TIME_PLUS_21_MINUTE');
INSERT INTO hierarchy_associations (association_id, hierarchy_id, value, created_at, updated_at) VALUES ((SELECT id FROM associations_master WHERE type = 'extraData'), (SELECT id FROM hierarchy WHERE client_id = (SELECT id FROM client WHERE name = 'Nikshay') AND level = 5 AND name = 'art centre'), '{"Dmc":null,"Irl":null,"Cbnaat":null,"Ndrtb":null,"Ddrtb":null,"DmcNin":"","MedicalCollege":null,"ArtCentre":true,"IctcFictc":null,"CdstLabIncludingLpa":null,"Ngo":null,"PediatricCareFacility":null,"PhiHealthAndWellnessCentre":null,"PhiHealthAndWellnessCentreType":null,"PhiParentPhi":null,"PhiTuForParentPhi":null,"IsDrugStore":null,"HFRegNo":"","ContactPersonName":"","ContactPersonDesg":"","ContactPersonEmail":"","IsTruNat":null,"IsXray":null,"IsDMScreen":null,"IsTobaccoClinic":null,"IsANCClinic":null,"IsNutriRehabCenter":null,"IsDeAddictCenter":null,"IsPrision":null,"IsNUHMFacility":null,"IsCGHSCoal":null,"IfYesCGHSCoal":null,"MobileNo":"9999999974","Address":"address","FacilityType":"PHI","MicroscopyService":null,"IsAfterLogin":true,"UpdatedBy":"india-all","UpdatedDate":"DATE_TIME_PLUS_20_MINUTE_NO_PADDING"}', 'UTC_DATE_TIME_PLUS_21_MINUTE', 'UTC_DATE_TIME_PLUS_21_MINUTE');
INSERT INTO hierarchy_associations (association_id, hierarchy_id, value, created_at, updated_at) VALUES ((SELECT id FROM associations_master WHERE type = 'drugRegimen'), (SELECT id FROM hierarchy WHERE client_id = (SELECT id FROM client WHERE name = 'Nikshay') AND level = 5 AND name = 'art centre'), 'UNKNOWN', 'UTC_DATE_TIME_PLUS_21_MINUTE', 'UTC_DATE_TIME_PLUS_21_MINUTE');
INSERT INTO revinfo (rev, revtstmp) VALUES ((SELECT GREATEST(0, MAX(rev)) + 1 FROM revinfo), "TIMESTAMP_DATE_TIME_PLUS_21_MINUTE");
INSERT INTO hierarchy_associations_aud (id, rev, revtype, value) VALUES ((SELECT id FROM hierarchy_associations WHERE hierarchy_id = (SELECT id FROM hierarchy WHERE level = 5 AND name = 'art centre') AND association_id = (SELECT id FROM associations_master WHERE type = 'eligibleForIncentive')), (SELECT MAX(rev) from revinfo), 0, 'true');
INSERT INTO hierarchy_associations_aud (id, rev, revtype, value) VALUES ((SELECT id FROM hierarchy_associations WHERE hierarchy_id = (SELECT id FROM hierarchy WHERE level = 5 AND name = 'art centre') AND association_id = (SELECT id FROM associations_master WHERE type = 'isART')), (SELECT MAX(rev) from revinfo), 0, 'true');
INSERT INTO hierarchy_associations_aud (id, rev, revtype, value) VALUES ((SELECT id FROM hierarchy_associations WHERE hierarchy_id = (SELECT id FROM hierarchy WHERE level = 5 AND name = 'art centre') AND association_id = (SELECT id FROM associations_master WHERE type = 'mobileNumber')), (SELECT MAX(rev) from revinfo), 0, '9999999974');
INSERT INTO hierarchy_associations_aud (id, rev, revtype, value) VALUES ((SELECT id FROM hierarchy_associations WHERE hierarchy_id = (SELECT id FROM hierarchy WHERE level = 5 AND name = 'art centre') AND association_id = (SELECT id FROM associations_master WHERE type = 'extraData')), (SELECT MAX(rev) from revinfo), 0, '{"Dmc":null,"Irl":null,"Cbnaat":null,"Ndrtb":null,"Ddrtb":null,"DmcNin":"","MedicalCollege":null,"ArtCentre":true,"IctcFictc":null,"CdstLabIncludingLpa":null,"Ngo":null,"PediatricCareFacility":null,"PhiHealthAndWellnessCentre":null,"PhiHealthAndWellnessCentreType":null,"PhiParentPhi":null,"PhiTuForParentPhi":null,"IsDrugStore":null,"HFRegNo":"","ContactPersonName":"","ContactPersonDesg":"","ContactPersonEmail":"","IsTruNat":null,"IsXray":null,"IsDMScreen":null,"IsTobaccoClinic":null,"IsANCClinic":null,"IsNutriRehabCenter":null,"IsDeAddictCenter":null,"IsPrision":null,"IsNUHMFacility":null,"IsCGHSCoal":null,"IfYesCGHSCoal":null,"MobileNo":"9999999974","Address":"address","FacilityType":"PHI","MicroscopyService":null,"IsAfterLogin":true,"UpdatedBy":"india-all","UpdatedDate":"DATE_TIME_PLUS_20_MINUTE_NO_PADDING"}');
INSERT INTO hierarchy_associations_aud (id, rev, revtype, value) VALUES ((SELECT id FROM hierarchy_associations WHERE hierarchy_id = (SELECT id FROM hierarchy WHERE level = 5 AND name = 'art centre') AND association_id = (SELECT id FROM associations_master WHERE type = 'drugRegimen')), (SELECT MAX(rev) from revinfo), 0, 'UNKNOWN');


UPDATE hierarchy SET code = '014', updated_at = 'UTC_DATE_TIME_PLUS_22_MINUTE_WITH_MICRO_SECONDS' WHERE level = 5 AND name = 'art centre';
INSERT INTO revinfo (rev, revtstmp) VALUES ((SELECT GREATEST(0, MAX(rev)) + 1 FROM revinfo), "TIMESTAMP_DATE_TIME_PLUS_22_MINUTE");
INSERT INTO hierarchy_aud (id, rev, revtype, active, client_id, code, created_at, deployment_id, end_date, has_children, level, level_1_code, level_1_id, level_1_name, level_1_type, level_2_code, level_2_id, level_2_name, level_2_type, level_3_code, level_3_id, level_3_name, level_3_type, level_4_code, level_4_id, level_4_name, level_4_type, level_5_code, level_5_id, level_5_name, level_5_type, level_6_code, level_6_id, level_6_name, level_6_type, merge_status, name, parent_id, start_date, type, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 5 AND name = 'art centre'), (SELECT MAX(rev) from revinfo), 1, true, (SELECT id FROM client WHERE name = 'Nikshay'), '014', 'UTC_DATE_TIME_PLUS_20_MINUTE_WITH_MICRO_SECONDS', (SELECT id FROM deployment WHERE code = 'IND'), null, false, 5, (SELECT code FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT id FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT name FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT type FROM hierarchy WHERE level = 1 AND name = 'India'), (SELECT code FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT id FROM hierarchy WHERE level = 2 AND name = 'Karnataka') , (SELECT name FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT type FROM hierarchy WHERE level = 2 AND name = 'Karnataka'), (SELECT code FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT id FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT name FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT type FROM hierarchy WHERE level = 3 AND name = 'Dharwad'), (SELECT code FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT id FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT name FROM hierarchy WHERE level = 4 AND name = 'tu'), (SELECT type FROM hierarchy WHERE level = 4 AND name = 'tu'), null, null, null, null, null, null, null, null, null, 'art centre', (SELECT id FROM hierarchy WHERE level = 4 AND name = 'tu'), null, 'PHI', 'UTC_DATE_TIME_PLUS_20_MINUTE_WITH_MICRO_SECONDS');

INSERT INTO hierarchy_config_map (hierarchy_id, config_mapping_id, value, active, created_at, updated_at) VALUES ((SELECT id FROM hierarchy WHERE level = 5 AND name = 'art centre'), (SELECT id FROM config WHERE name = 'MermMappingLevel'), '3', true, 'UTC_DATE_TIME_PLUS_22_MINUTE', 'DATE_TIME_PLUS_22_MINUTE');

INSERT INTO staff (client_id, person_id, designation, added_by, selective_episode_mapping, active, added_on, last_updated_on, visible) VALUES ((SELECT id FROM client WHERE name = 'Nikshay'), (SELECT id FROM foreign_persons WHERE first_name = 'phi-KADHA01-014'), 'ADMIN', null, false, true, 'UTC_DATE_TIME_PLUS_15_MINUTE', 'UTC_DATE_TIME_PLUS_15_MINUTE', false);

INSERT INTO user_access (active, hierarchy_id, selective_hierarchy_mapping, sso_id, username, client_id, staff_id, description, view_only, can_delete_patients, visible, restricted_view, created_at, updated_at) VALUES (true, (SELECT id FROM hierarchy WHERE level = 5 AND name = 'art centre'), false, (SELECT id FROM foreign_sso_users WHERE user_name = 'phi-kadha01-014'), 'phi-KADHA01-014', (SELECT id FROM client WHERE name = 'Nikshay'), (SELECT id FROM staff WHERE person_id = (select id FROM foreign_persons WHERE first_name = 'phi-KADHA01-014')), 'art centre PHI Login', false, true, true, false, 'DATE_TIME_PLUS_26_MINUTE', 'DATE_TIME_PLUS_26_MINUTE');
INSERT INTO user_access_hierarchy_map (created_at, hierarchy_id, last_updated_by, relation, updated_at, user_id) VALUES ('UTC_DATE_TIME_PLUS_26_MINUTE', (SELECT id FROM hierarchy WHERE level = 5 AND name = 'art centre'), 0, 'Direct', 'UTC_DATE_TIME_PLUS_26_MINUTE', (SELECT id FROM user_access WHERE username = 'phi-KADHA01-014'));