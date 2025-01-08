SELECT SETVAL('ins_sms_logs_id_seq', (SELECT MAX(id) FROM ins_sms_logs));
SELECT setval('ins_template_id_seq', (SELECT max(id) FROM ins_template));
SELECT setval('ins_trigger_id_seq', (SELECT max(id) FROM ins_trigger));
SELECT setval('ins_template_map_id_seq', (SELECT max(id) FROM ins_template_map));