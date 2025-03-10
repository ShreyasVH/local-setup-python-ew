#start treatment
    INSERT INTO iam_registration (id, adtech_id, adh_string, created_date, end_date, last_dosage, last_missed_dosage, scheduletype_id, start_date, unique_identifier, updated_date) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM iam_registration), 5, '666', 'UTC_DATE_TIME_PLUS_10_MINUTE', null, null, null, 1, 'UTC_DATE_MINUS_2_DAY', '35', 'UTC_DATE_TIME_PLUS_10_MINUTE');
    INSERT INTO iam_access_mapping (id, active, client_id, entity_id, iam_id) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM iam_access_mapping), true, (SELECT id FROM iam_caccess WHERE name = 'Nikshay'), '35', (SELECT MAX(id) FROM iam_registration));

#close case
    UPDATE iam_access_mapping SET active = false WHERE id = (SELECT MAX(id) FROM iam_access_mapping);
    UPDATE iam_registration SET end_date = 'UTC_DATE_PLUS_0_DAY', adh_string = '66' WHERE id = (SELECT MAX(id) FROM iam_registration);