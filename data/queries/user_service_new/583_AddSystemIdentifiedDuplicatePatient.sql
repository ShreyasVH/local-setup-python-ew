INSERT INTO users (id, added_by, added_by_type, address, city, client_id, created_at, data_consent, date_of_birth, deleted_at, deleted_by, deleted_by_type, father_name, first_name, gender, height, is_deleted, key_population, language, last_name, marital_status, occupation, pincode, socio_economic_status, updated_at, weight) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM users), (SELECT id FROM foreign_user_access WHERE user_name = 'phi-KADHA01-001'), 'USER_ACCESS', 'Address', null, (SELECT id FROM user_client WHERE name = 'Nikshay'), 'UTC_DATE_TIME_PLUS_0_DAY', false, '2000-01-01', null, null, null, null, 'System Identified', 'Male', null, false, 'Not Applicable', null, 'Duplicate', 'Unknown', 'Unknown', 999999, 'Unknown', 'UTC_DATE_TIME_PLUS_0_DAY', null);
INSERT INTO user_mobiles (id, created_at, is_primary, is_verified, number, stopped_at, updated_at, user_id) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM user_mobiles), 'UTC_DATE_TIME_PLUS_0_DAY', true, false, '9999999957', null, 'UTC_DATE_TIME_PLUS_0_DAY', (SELECT id FROM users WHERE first_name = 'System Identified' AND last_name = 'Duplicate'));
INSERT INTO user_address (id, area, landmark, taluka, town, user_id, ward) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM user_address), 'Unknown', null, null, null, (SELECT id FROM users WHERE first_name = 'System Identified' AND last_name = 'Duplicate'), null);

UPDATE users SET height = 100, weight = 50 WHERE id = (SELECT id FROM users WHERE first_name = 'System Identified' AND last_name = 'Duplicate');