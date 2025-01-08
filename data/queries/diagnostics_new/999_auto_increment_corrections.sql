SELECT SETVAL('test_request_id_seq', (SELECT MAX(id) FROM test_request));
SELECT SETVAL('sample_id_seq', (SELECT MAX(id) FROM sample));
SELECT SETVAL('test_result_id_seq', (SELECT MAX(id) FROM test_result));
SELECT SETVAL('test_result_mapping_id_seq', (SELECT MAX(id) FROM test_result_mapping));
SELECT SETVAL('test_result_mapping_sample_id_seq', (SELECT MAX(id) FROM test_result_mapping_sample));
SELECT SETVAL('microscopy_zn_id_seq', (SELECT MAX(id) FROM microscopy_zn));