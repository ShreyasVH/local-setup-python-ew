INSERT INTO episode (id, client_id, person_id, deleted, disease_id, disease_id_options, created_date, start_date, end_date, last_activity_date, risk_status, current_stage_id, added_by, type_of_episode, updated_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode), (select id from client where name = 'Hub'), 11, FALSE, (SELECT id FROM disease_template WHERE disease_name = 'DS-TB DEMOC'), (SELECT id::text FROM disease_template WHERE disease_name = 'DS-TB DEMOC'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_MINUS_3_DAY', 'UTC_DATE_PLUS_166_DAY', 'UTC_DATE_TIME_PLUS_0_DAY', null, (select id from stages where stage_name = 'ON_TREATMENT'), 1, 'PublicPrivatePartnership', 'UTC_DATE_TIME_PLUS_0_DAY');

INSERT INTO episode_stage (id, episode_id, stage_id, start_date, end_date, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage), (select max(id) from episode), (select id from stages where stage_name = 'ON_TREATMENT'), 'UTC_DATE_TIME_PLUS_0_DAY', null, 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');

INSERT INTO episode_association (id, episode_id, value, association_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_association), (select max(id) from episode), 'DEMOC', (select id from supported_relation where name = 'deploymentCode'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');

INSERT INTO episode_hierarchy_linkage (id, episode_id, hierarchy_id, relation_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_hierarchy_linkage), (select max(id) from episode), 38, (select id from supported_relation where name = 'current'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_hierarchy_linkage (id, episode_id, hierarchy_id, relation_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_hierarchy_linkage), (select max(id) from episode), 38, (select id from supported_relation where name = 'initiation'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_hierarchy_linkage (id, episode_id, hierarchy_id, relation_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_hierarchy_linkage), (select max(id) from episode), 38, (select id from supported_relation where name = 'residence'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');

INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'ON_TREATMENT')), 'true', (select id from field where key = 'isIAMEnabled'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'ON_TREATMENT')), 'UTC_DATE_MINUS_2_DAY', (select id from field where key = 'treatmentStartTimeStamp'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'ON_TREATMENT')), '2', (select id from field where key = 'weightBand' and module = 'Episode'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');

INSERT INTO episode_tag (id, added_on, episode_id, tag_name, tag_date, sticky, updated_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_tag), 'UTC_DATE_TIME_PLUS_0_DAY', (SELECT MAX(id) FROM episode), 'New_Enrollment', null, true, 'UTC_DATE_TIME_PLUS_0_DAY');

INSERT INTO episode_log (id, action_taken, added_by, added_on, category, comments, episode_id, sub_category, date_of_action, updated_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_log), 'Created HHC PIN for this Patient', 1, 'UTC_DATE_TIME_PLUS_0_DAY', 'LOGIN_PIN_CREATED', 'Login Credential for Health Hub Companion: [10] PIN[1234]', (SELECT MAX(id) FROM episode), null, 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');