INSERT INTO episode (id, client_id, person_id, deleted, disease_id, disease_id_options, created_date, start_date, end_date, last_activity_date, risk_status, current_stage_id, added_by, type_of_episode, updated_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode), (select id from client where name = 'Nikshay'), (SELECT id FROM foreign_persons WHERE first_name = 'Diagnosed' AND last_name = 'On Treatment Public'), FALSE, null, (SELECT STRING_AGG(id::text, ',') FROM disease_template WHERE disease_name in ('Drug Sensitive Tuberculosis', 'Drug Resistant Tuberculosis')), 'UTC_DATE_TIME_PLUS_0_DAY', null, null, 'UTC_DATE_TIME_PLUS_0_DAY', null, (select id from stages where stage_name = 'PRESUMPTIVE_OPEN_PUBLIC'), (SELECT id FROM foreign_user_access WHERE user_name = 'phi-KADHA01-001'), 'IndiaTbPublic', 'UTC_DATE_TIME_PLUS_0_DAY');

INSERT INTO episode_stage (id, episode_id, stage_id, start_date, end_date, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage), (select max(id) from episode), (select id from stages where stage_name = 'PRESUMPTIVE_OPEN_PUBLIC'), 'UTC_DATE_TIME_PLUS_0_DAY', null, 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');

INSERT INTO episode_association (id, episode_id, value, association_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_association), (select max(id) from episode), (SELECT id::text FROM foreign_beneficiary WHERE name = 'Diagnosed On Treatment Public'), (select id from supported_relation where name = 'beneficiaryId'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_association (id, episode_id, value, association_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_association), (select max(id) from episode), 'IND', (select id from supported_relation where name = 'deploymentCode'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');

INSERT INTO episode_hierarchy_linkage (id, episode_id, hierarchy_id, relation_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_hierarchy_linkage), (select max(id) from episode), (SELECT id FROM foreign_hierarchy WHERE name = 'phi' AND level = '5'), (select id from supported_relation where name = 'enrollment'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_hierarchy_linkage (id, episode_id, hierarchy_id, relation_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_hierarchy_linkage), (select max(id) from episode), (SELECT id FROM foreign_hierarchy WHERE name = 'phi' AND level = '5'), (select id from supported_relation where name = 'current'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_hierarchy_linkage (id, episode_id, hierarchy_id, relation_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_hierarchy_linkage), (select max(id) from episode), (SELECT STRING_AGG(id::text, ', ') FROM foreign_hierarchy WHERE (name = 'India' AND level = 1) OR (name = 'Karnataka' AND level = 2) OR (name = 'Dharwad' AND level = 3) OR (name = 'tu' AND level = 4) OR (name = 'phi' AND level = 5)), (select id from supported_relation where name = 'residence_all'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_hierarchy_linkage (id, episode_id, hierarchy_id, relation_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_hierarchy_linkage), (select max(id) from episode), (SELECT id FROM foreign_hierarchy WHERE name = 'phi' AND level = '5'), (select id from supported_relation where name = 'residence'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');

INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'PRESUMPTIVE_OPEN_PUBLIC')), 'Unknown', (select id from field where key = 'hivTestStatus'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'PRESUMPTIVE_OPEN_PUBLIC')), 'Asymptomatic,', (select id from field where key = 'symptom'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'PRESUMPTIVE_OPEN_PUBLIC')), 'IP', (select id from field where key = 'treatmentPhase'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'PRESUMPTIVE_OPEN_PUBLIC')), 'Passive (Routine programme)', (select id from field where key = 'typeOfCaseFinding'), 'UTC_DATE_TIME_PLUS_0_DAY', 'UTC_DATE_TIME_PLUS_0_DAY');

UPDATE episode SET current_stage_id = (SELECT id FROM stages WHERE stage_name = 'DIAGNOSED_NOT_ON_TREATMENT') WHERE id = (SELECT MAX(id) FROM episode);
UPDATE episode_stage SET end_date = 'UTC_DATE_TIME_PLUS_5_MINUTE' WHERE id = (SELECT MAX(id) FROM episode_stage);

INSERT INTO episode_association (id, episode_id, value, association_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_association), (SELECT MAX(id) FROM episode), (SELECT id::text FROM foreign_diagnostics_requests WHERE first_name = 'Diagnosed' AND last_name = 'On Treatment Public' AND number = 1), (SELECT id FROM supported_relation WHERE name = 'notificationTestId'), 'UTC_DATE_TIME_PLUS_5_MINUTE', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO episode_hierarchy_linkage (id, episode_id, hierarchy_id, relation_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_hierarchy_linkage), (SELECT MAX(id) FROM episode), (SELECT id FROM foreign_hierarchy WHERE name = 'dmc lab' AND level = '5'), (SELECT id FROM supported_relation WHERE name = 'diagnosed'), 'UTC_DATE_TIME_PLUS_5_MINUTE', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO episode_stage (id, episode_id, stage_id, start_date, end_date, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage), (select max(id) from episode), (select id from stages where stage_name = 'DIAGNOSED_NOT_ON_TREATMENT'), 'UTC_DATE_TIME_PLUS_5_MINUTE', null, 'UTC_DATE_TIME_PLUS_5_MINUTE', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'PRESUMPTIVE_OPEN_PUBLIC')), 'UTC_DATE_MINUS_3_DAY', (select id from field where key = 'diagnosisDate'), 'UTC_DATE_TIME_PLUS_5_MINUTE', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'PRESUMPTIVE_OPEN_PUBLIC')), null, (select id from field where key = 'monthsOfTreatment'), 'UTC_DATE_TIME_PLUS_5_MINUTE', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'PRESUMPTIVE_OPEN_PUBLIC')), null, (select id from field where key = 'monthsSinceEpisode'), 'UTC_DATE_TIME_PLUS_5_MINUTE', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'PRESUMPTIVE_OPEN_PUBLIC')), 'New', (select id from field where key = 'typeOfCase'), 'UTC_DATE_TIME_PLUS_5_MINUTE', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO episode_log (id, action_taken, added_by, added_on, category, comments, episode_id, sub_category, date_of_action, updated_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_log), 'Duplicate status Updated by System', 2, 'UTC_DATE_TIME_PLUS_5_MINUTE', 'Duplicate_Status_Updated', 'Duplicate status changed from null to SYSTEM_IDENTIFIED_UNIQUE', (SELECT MAX(id) FROM episode), null, null, 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'DIAGNOSED_NOT_ON_TREATMENT')), 'Microscopy ZN', (select id from field where key = 'diagnosisBasis'), 'UTC_DATE_TIME_PLUS_5_MINUTE', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'DIAGNOSED_NOT_ON_TREATMENT')), 'Unknown', (select id from field where key = 'drugResistance'), 'UTC_DATE_TIME_PLUS_5_MINUTE', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'DIAGNOSED_NOT_ON_TREATMENT')), 'SYSTEM_IDENTIFIED_UNIQUE', (select id from field where key = 'duplicateStatus'), 'UTC_DATE_TIME_PLUS_5_MINUTE', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'DIAGNOSED_NOT_ON_TREATMENT')), (SELECT id::text FROM foreign_diagnostics_requests WHERE first_name = 'Diagnosed' AND last_name = 'On Treatment Public' AND number = 1), (select id from field where key = 'notificationTestId'), 'UTC_DATE_TIME_PLUS_5_MINUTE', 'UTC_DATE_TIME_PLUS_5_MINUTE');
INSERT INTO episode_log (id, action_taken, added_by, added_on, category, comments, episode_id, sub_category, date_of_action, updated_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_log), 'Patient Treatment Stage Changed', (SELECT id FROM foreign_user_access WHERE user_name = 'phi-KADHA01-001'), 'UTC_DATE_TIME_PLUS_5_MINUTE', 'TreatmentStage_Changed', 'Treatment Stage changed to Diagnosed But Pending Treatment (Notified) from Presumptive (Open)', (SELECT MAX(id) FROM episode), null, null, 'UTC_DATE_TIME_PLUS_5_MINUTE');

INSERT INTO episode_stage (id, episode_id, stage_id, start_date, end_date, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage), (select max(id) from episode), (select id from stages where stage_name = 'DIAGNOSED_ON_TREATMENT_PUBLIC'), 'UTC_DATE_TIME_PLUS_10_MINUTE', null, 'UTC_DATE_TIME_PLUS_10_MINUTE', 'UTC_DATE_TIME_PLUS_10_MINUTE');
INSERT INTO episode_hierarchy_linkage (id, episode_id, hierarchy_id, relation_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_hierarchy_linkage), (SELECT MAX(id) FROM episode), (SELECT id FROM foreign_hierarchy WHERE name = 'phi' AND level = '5'), (SELECT id FROM supported_relation WHERE name = 'initiation'), 'UTC_DATE_TIME_PLUS_5_MINUTE', 'UTC_DATE_TIME_PLUS_10_MINUTE');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'DIAGNOSED_NOT_ON_TREATMENT')), '', (select id from field where key = 'epSite'), 'UTC_DATE_TIME_PLUS_10_MINUTE', 'UTC_DATE_TIME_PLUS_10_MINUTE');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'DIAGNOSED_NOT_ON_TREATMENT')), '2HRZE/4HRE', (select id from field where key = 'regimenType'), 'UTC_DATE_TIME_PLUS_10_MINUTE', 'UTC_DATE_TIME_PLUS_10_MINUTE');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'DIAGNOSED_NOT_ON_TREATMENT')), 'Pulmonary', (select id from field where key = 'siteOfDisease'), 'UTC_DATE_TIME_PLUS_10_MINUTE', 'UTC_DATE_TIME_PLUS_10_MINUTE');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'DIAGNOSED_NOT_ON_TREATMENT')), 'UTC_DATE_MINUS_2_DAY', (select id from field where key = 'treatmentStartTimeStamp'), 'UTC_DATE_TIME_PLUS_10_MINUTE', 'UTC_DATE_TIME_PLUS_10_MINUTE');
INSERT INTO episode_stage_data (id, episode_stage_id, value, field_id, updated_on, created_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_stage_data), (SELECT id FROM episode_stage WHERE episode_id = (SELECT MAX(id) FROM episode) and stage_id = (SELECT id FROM stages WHERE stage_name = 'DIAGNOSED_NOT_ON_TREATMENT')), '', (select id from field where key = 'typeOfDOT'), 'UTC_DATE_TIME_PLUS_10_MINUTE', 'UTC_DATE_TIME_PLUS_10_MINUTE');

UPDATE episode SET disease_id = (SELECT id FROM disease_template WHERE disease_name = 'Drug Sensitive Tuberculosis'), start_date = 'UTC_DATE_MINUS_2_DAY', end_date = 'UTC_DATE_PLUS_166_DAY', current_stage_id = (SELECT id FROM stages WHERE stage_name = 'DIAGNOSED_ON_TREATMENT_PUBLIC') WHERE id = (SELECT MAX(id) FROM episode);
UPDATE episode_stage SET end_date = 'UTC_DATE_TIME_PLUS_10_MINUTE' WHERE id = (SELECT es.id FROM episode_stage es INNER JOIN stages s on s.id = es.stage_id AND es.episode_id = (SELECT MAX(id) FROM episode) AND s.stage_name = 'DIAGNOSED_NOT_ON_TREATMENT');
INSERT INTO episode_log (id, action_taken, added_by, added_on, category, comments, episode_id, sub_category, date_of_action, updated_on) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM episode_log), 'Patient Treatment Stage Changed', (SELECT id FROM foreign_user_access WHERE user_name = 'phi-KADHA01-001'), 'UTC_DATE_TIME_PLUS_5_MINUTE', 'TreatmentStage_Changed', 'Treatment Stage changed to On Treatment (Notified) from Diagnosed But Pending Treatment (Notified)', (SELECT MAX(id) FROM episode), null, null, 'UTC_DATE_TIME_PLUS_5_MINUTE');