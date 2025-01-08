INSERT INTO staff (client_id, person_id, designation, added_by, selective_episode_mapping, active, added_on, last_updated_on, visible) VALUES ((SELECT id FROM client WHERE name = 'Nikshay'), (SELECT id FROM foreign_persons WHERE first_name = 'DBT Maker'), 'DBT Maker', (SELECT id FROM user_access WHERE username = 'dto-KADHA'), true, true, 'UTC_DATE_TIME_PLUS_15_MINUTE', 'UTC_DATE_TIME_PLUS_15_MINUTE', true);

INSERT INTO user_access (active, hierarchy_id, selective_hierarchy_mapping, sso_id, username, client_id, staff_id, description, view_only, can_delete_patients, visible, restricted_view, created_at, updated_at) VALUES (true, (SELECT id FROM hierarchy WHERE level = 4 AND name = 'tu'), false, (SELECT id FROM foreign_sso_users WHERE user_name = '9999999938'), '9999999938', (SELECT id FROM client WHERE name = 'Nikshay'), (SELECT id FROM staff WHERE person_id = (select id FROM foreign_persons WHERE first_name = 'DBT Maker')), null, false, false, true, false, 'DATE_TIME_PLUS_26_MINUTE', 'DATE_TIME_PLUS_26_MINUTE');
INSERT INTO user_access_hierarchy_map (created_at, hierarchy_id, last_updated_by, relation, updated_at, user_id) VALUES ('UTC_DATE_TIME_PLUS_26_MINUTE', (SELECT id FROM hierarchy WHERE level = 4 AND name = 'tu'), 0, 'Direct', 'UTC_DATE_TIME_PLUS_26_MINUTE', (SELECT id FROM user_access WHERE username = '9999999938'));

INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'DBT Maker', (select id from sidebar_item where name = 'DBT'), true, 'TU', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'DBT Maker', (select id from sidebar_item where name = 'AdverseEventReportingSystem'), true, 'TU', 'sidebar', false, false, false, false);
INSERT INTO module_permission (deployment_id, designation, item_id, is_active, hierarchy_type, item_type, view, add, edit, delete) VALUES ((select id from deployment where code = 'IND'), 'DBT Maker', (select id from sidebar_item where name = 'TaskListStats'), true, 'TU', 'sidebar', false, false, false, false);