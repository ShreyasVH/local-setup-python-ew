INSERT INTO staff (client_id, person_id, designation, added_by, selective_episode_mapping, active, added_on, last_updated_on, visible) VALUES ((SELECT id FROM client WHERE name = 'Nikshay'), (SELECT id FROM foreign_persons WHERE first_name = 'PSN Benefit Informant'), 'Informal Provider', null, true, true, 'UTC_DATE_TIME_PLUS_15_MINUTE', 'UTC_DATE_TIME_PLUS_15_MINUTE', true);

INSERT INTO user_access (active, hierarchy_id, selective_hierarchy_mapping, sso_id, username, client_id, staff_id, description, view_only, can_delete_patients, visible, restricted_view, created_at, updated_at) VALUES (true, (SELECT id FROM hierarchy WHERE level = 5 AND name = 'phi'), false, (SELECT id FROM foreign_sso_users WHERE user_name = '9999999918'), '9999999918', (SELECT id FROM client WHERE name = 'Nikshay'), (SELECT id FROM staff WHERE person_id = (select id FROM foreign_persons WHERE first_name = 'PSN Benefit Informant')), null, false, false, true, false, 'DATE_TIME_PLUS_26_MINUTE', 'DATE_TIME_PLUS_26_MINUTE');
INSERT INTO user_access_hierarchy_map (created_at, hierarchy_id, last_updated_by, relation, updated_at, user_id) VALUES ('UTC_DATE_TIME_PLUS_26_MINUTE', (SELECT id FROM hierarchy WHERE level = 5 AND name = 'phi'), 0, 'Direct', 'UTC_DATE_TIME_PLUS_26_MINUTE', (SELECT id FROM user_access WHERE username = '9999999918'));