INSERT INTO test_type (id, created_date, display_name, name) VALUES ((SELECT GREATEST(0, MAX(id)) + 1 FROM test_type), 'UTC_DATE_TIME_PLUS_0_DAY', 'Microscopy ZN', 'Microscopy ZN');