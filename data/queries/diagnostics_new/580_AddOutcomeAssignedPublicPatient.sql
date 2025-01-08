INSERT INTO test_request (created_date, entity_id, previous_att, reason, status, subreason, updated_date, nikshay_source_id, client_id) VALUES ('UTC_DATE_TIME_PLUS_5_MINUTE', (SELECT id FROM foreign_episode WHERE first_name = 'Outcome' AND last_name = 'Assigned Public'), false, 'Diagnosis', (SELECT id FROM foreign_diagnostics_test_type WHERE name = 'Results Available'), '{"predominantSymptom":null,"predominantSymptomDuration":"","hcpVisits":"","diagnosisOfTB":""}', 'UTC_DATE_TIME_PLUS_5_MINUTE', null, (SELECT id FROM client WHERE name = 'Nikshay'));

INSERT INTO sample (collection_date, created_date, details, result, sample_serial_id, type, updated_date, rejection_reason, rejection_reason_text, sample_status, sputum_collection_detail, qr_code_id, client_id) VALUES ('UTC_DATE_MINUS_4_DAY', 'UTC_DATE_TIME_PLUS_5_MINUTE', 'Mucopurulent', null, null, 'Sputum', 'UTC_DATE_TIME_PLUS_5_MINUTE', null, null, null, 'Early Morning', null, (SELECT id FROM client WHERE name = 'Nikshay'));

INSERT INTO test_result (created_at, final_interpretation, interpretation_data, lab_serial_number, positive, remarks, reported_date, tested_date, updated_at) VALUES ('UTC_DATE_TIME_PLUS_5_MINUTE', 'Positive', null, null, true, null, 'UTC_DATE_MINUS_3_DAY', null, 'UTC_DATE_TIME_PLUS_5_MINUTE');

INSERT INTO test_result_mapping (created_date, deleted, test_request_id, test_result_id, test_type, updated_date) VALUES ('UTC_DATE_TIME_PLUS_5_MINUTE', 0, (SELECT max(id) from test_request), (SELECT max(id) from test_result), 'Microscopy ZN', 'UTC_DATE_TIME_PLUS_5_MINUTE');

INSERT INTO test_result_mapping_sample (created_date, deleted, test_result_mapping_id, test_sample_id, updated_date) VALUES ('UTC_DATE_TIME_PLUS_5_MINUTE', 0, (SELECT max(id) from test_result_mapping), (SELECT max(id) from sample), 'UTC_DATE_TIME_PLUS_5_MINUTE');

INSERT INTO microscopy_zn (count_of_bacilli, lab_serial_number, result, test_result_id, sample_id, created_date, updated_date) VALUES (null, null, null, (SELECT max(id) from test_result), (SELECT max(id) from sample), 'UTC_DATE_TIME_PLUS_5_MINUTE', 'UTC_DATE_TIME_PLUS_5_MINUTE');