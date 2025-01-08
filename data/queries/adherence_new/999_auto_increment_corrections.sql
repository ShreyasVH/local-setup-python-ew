SELECT SETVAL('iam_registration_id_seq', (SELECT MAX(id) FROM iam_registration));
SELECT SETVAL('iam_access_mapping_id_seq', (SELECT MAX(id) FROM iam_access_mapping));