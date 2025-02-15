SELECT SETVAL('client_id_seq', (SELECT MAX(id) FROM client));
SELECT SETVAL('language_id_seq', (SELECT MAX(id) FROM language));
SELECT SETVAL('deployment_id_seq', (SELECT MAX(id) FROM deployment));
SELECT SETVAL('deployment_language_map_id_seq', (SELECT MAX(id) FROM deployment_language_map));
SELECT SETVAL('task_list_id_seq', (SELECT MAX(id) FROM task_list));
SELECT SETVAL('task_list_column_id_seq', (SELECT MAX(id) FROM task_list_column));
SELECT SETVAL('filters_id_seq', (SELECT MAX(id) FROM filters));
SELECT SETVAL('filter_values_id_seq', (SELECT MAX(id) FROM filter_values));
SELECT SETVAL('hierarchy_id_seq', (SELECT MAX(id) FROM hierarchy));
SELECT SETVAL('config_id_seq', (SELECT MAX(id) FROM config));
SELECT SETVAL('associations_master_id_seq', (SELECT MAX(id) FROM associations_master));
SELECT SETVAL('hierarchy_associations_id_seq', (SELECT MAX(id) FROM hierarchy_associations));
SELECT SETVAL('hierarchy_config_map_id_seq', (SELECT MAX(id) FROM hierarchy_config_map));
SELECT SETVAL('user_access_id_seq', (SELECT MAX(id) FROM user_access));
SELECT SETVAL('sidebar_item_id_seq', (SELECT MAX(id) FROM sidebar_item));
SELECT SETVAL('sidebar_permission_id_seq', (SELECT MAX(id) FROM module_permission));
SELECT SETVAL('sidebar_permission_sidebar_id_seq', (SELECT MAX(id) FROM module_permission));
SELECT SETVAL('staff_id_seq', (SELECT MAX(id) FROM staff));
SELECT SETVAL('user_access_hierarchy_map_id_seq', (SELECT MAX(id) FROM user_access_hierarchy_map));
SELECT SETVAL('form_id_seq', (SELECT MAX(id) FROM form));
SELECT SETVAL('form_part_id_seq', (SELECT MAX(id) FROM form_part));
SELECT SETVAL('field_id_seq', (SELECT MAX(id) FROM field));
SELECT SETVAL('field_customizations_id_seq', (SELECT MAX(id) FROM field_customizations));
SELECT SETVAL('field_dependency_id_seq', (SELECT MAX(id) FROM field_dependency));
SELECT SETVAL('form_items_map_id_seq', (SELECT MAX(id) FROM form_items_map));
SELECT SETVAL('dynamic_form_validation_id_seq', (SELECT MAX(id) FROM dynamic_form_validation));
SELECT SETVAL('hibernate_sequence', (SELECT MAX(rev) FROM revinfo));
SELECT SETVAL('trigger_id_seq', (SELECT MAX(id) FROM trigger));
SELECT SETVAL('vendor_mapping_id_seq', (SELECT MAX(id) FROM vendor_mapping));