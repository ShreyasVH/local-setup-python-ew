INSERT INTO iam_registration (id, adtech_id, adh_string, created_date, end_date, last_dosage, last_missed_dosage, scheduletype_id, start_date, unique_identifier, updated_date) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM iam_registration), (SELECT id FROM iam_adhtech WHERE name = 'None'), '666666666666666666666666666666666666666666666666666666666666', 'UTC_DATE_TIME_PLUS_10_MINUTE', null, null, null, (SELECT id FROM iam_schedule_type WHERE name = 'Daily'), 'UTC_DATE_MINUS_59_DAY', (SELECT id::text FROM foreign_episode WHERE first_name = 'NS' AND last_name = 'New Benefit'), 'UTC_DATE_TIME_PLUS_10_MINUTE');
INSERT INTO iam_access_mapping (id, active, client_id, entity_id, iam_id) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM iam_access_mapping), true, (SELECT id FROM iam_caccess WHERE name = 'Nikshay'), (SELECT id::text FROM foreign_episode WHERE first_name = 'NS' AND last_name = 'New Benefit'), (SELECT MAX(id) FROM iam_registration));