INSERT INTO users (id, added_by, added_by_type, address, city, client_id, created_at, data_consent, date_of_birth, deleted_at, deleted_by, deleted_by_type, father_name, first_name, gender, height, is_deleted, key_population, language, last_name, marital_status, occupation, pincode, socio_economic_status, updated_at, weight) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM users), null, null, 'address', null, (SELECT id FROM user_client WHERE name = 'Nikshay'), 'UTC_DATE_TIME_PLUS_20_MINUTE', false, null, null, null, null, null, 'phi-KADHA01-008', null, null, false, null, null, null, null, null, null, null, 'UTC_DATE_TIME_PLUS_20_MINUTE', null);
INSERT INTO user_mobiles (id, created_at, is_primary, is_verified, number, stopped_at, updated_at, user_id) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM user_mobiles), 'UTC_DATE_TIME_PLUS_20_MINUTE', true, false, '9999999980', null, 'UTC_DATE_TIME_PLUS_20_MINUTE', (SELECT id FROM users WHERE first_name = 'phi-KADHA01-008'));
INSERT INTO user_address (id, area, landmark, taluka, town, user_id, ward) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM user_address), null, null, null, null, (SELECT id FROM users WHERE first_name = 'phi-KADHA01-008'), null);