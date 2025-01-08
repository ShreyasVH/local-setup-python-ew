INSERT INTO episode (id, client_id, person_id, deleted, disease_id, disease_id_options, created_date, start_date, end_date, last_activity_date, risk_status, current_stage_id, added_by, type_of_episode, updated_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode), (select id from client where name = 'Nikshay'), (SELECT id FROM foreign_persons WHERE first_name = 'Vaccination' AND last_name = 'Followup One'), false, null, '1,2,3', 'UTC_DATE_TIME_PLUS_0_DAY', null, null, 'UTC_DATE_TIME_PLUS_0_DAY', null, (select id from stages where stage_name = 'PRESUMPTIVE_OPEN_PUBLIC'), (SELECT id FROM foreign_user_access WHERE user_name = 'phi-KADHA01-001'), 'IndiaTbPublic', 'UTC_DATE_TIME_PLUS_0_DAY');

INSERT INTO episode_stage (id, episode_id, stage_id, start_date, end_date, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage), (select max(id) from episode), (select id from stages where stage_name = 'PRESUMPTIVE_OPEN_PUBLIC'), 'UTC_DATE_TIME_PLUS_0_DAY', null, 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');

INSERT INTO episode_association (id, episode_id, value, association_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_association), (select max(id) from episode), (SELECT id::text FROM foreign_beneficiary WHERE name = 'Vaccination Followup One'), (select id from supported_relation where name = 'beneficiaryId'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_association (id, episode_id, value, association_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_association), (select max(id) from episode), 'IND', (select id from supported_relation where name = 'deploymentCode'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_association (id, episode_id, value, association_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_association), (select max(id) from episode), '1', (select id from supported_relation where name = 'tbWinReferenceId'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');

INSERT INTO episode_hierarchy_linkage (id, episode_id, hierarchy_id, relation_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_hierarchy_linkage), (select max(id) from episode), (SELECT id FROM foreign_hierarchy WHERE name = 'phi' AND level = '5'), (select id from supported_relation where name = 'enrollment'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_hierarchy_linkage (id, episode_id, hierarchy_id, relation_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_hierarchy_linkage), (select max(id) from episode), (SELECT id FROM foreign_hierarchy WHERE name = 'phi' AND level = '5'), (select id from supported_relation where name = 'current'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_hierarchy_linkage (id, episode_id, hierarchy_id, relation_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_hierarchy_linkage), (select max(id) from episode), (SELECT STRING_AGG(id::text, ', ') FROM foreign_hierarchy WHERE (name = 'India' AND level = 1) OR (name = 'Karnataka' AND level = 2) OR (name = 'Dharwad' AND level = 3) OR (name = 'tu' AND level = 4) OR (name = 'phi' AND level = 5)), (select id from supported_relation where name = 'residence_all'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_hierarchy_linkage (id, episode_id, hierarchy_id, relation_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_hierarchy_linkage), (select max(id) from episode), (SELECT id FROM foreign_hierarchy WHERE name = 'phi' AND level = '5'), (select id from supported_relation where name = 'residence'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');

INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'PRESUMPTIVE_OPEN_PUBLIC')), 'Unknown', (select id from field where key = 'hivTestStatus'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'PRESUMPTIVE_OPEN_PUBLIC')), 'Asymptomatic,', (select id from field where key = 'symptom'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'PRESUMPTIVE_OPEN_PUBLIC')), 'IP', (select id from field where key = 'treatmentPhase'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'PRESUMPTIVE_OPEN_PUBLIC')), 'Passive (Routine programme)', (select id from field where key = 'typeOfCaseFinding'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'PRESUMPTIVE_OPEN_PUBLIC')), 'UTC_DATE_MINUS_30_DAY', (select id from field where key = 'vaccinationDate'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');