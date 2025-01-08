SELECT SETVAL('client_id_seq', (SELECT MAX(id) FROM client));
SELECT SETVAL('episode_id_seq', (SELECT MAX(id) FROM episode));
SELECT SETVAL('episode_stage_id_seq', (SELECT MAX(id) FROM episode_stage));
SELECT SETVAL('episode_association_id_seq', (SELECT MAX(id) FROM episode_association));
SELECT SETVAL('episode_hierarchy_linkage_id_seq', (SELECT MAX(id) FROM episode_hierarchy_linkage));
SELECT SETVAL('episode_stage_data_id_seq', (SELECT MAX(id) FROM episode_stage_data));
SELECT SETVAL('episode_log_id_seq', (SELECT MAX(id) FROM episode_log));
SELECT SETVAL('episode_tag_id_seq', (SELECT MAX(id) FROM episode_tag));
SELECT SETVAL('episode_tag_store_id_seq', (SELECT MAX(id) FROM episode_tag_store));
SELECT SETVAL('regimen_id_seq', (SELECT MAX(id) FROM regimen));
SELECT SETVAL('disease_stage_key_mapping_id_seq', (SELECT MAX(id) FROM disease_stage_key_mapping));
SELECT SETVAL('trigger_id_seq', (SELECT MAX(id) FROM trigger));