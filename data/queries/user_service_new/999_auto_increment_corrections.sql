SELECT SETVAL('users_id_seq', (SELECT MAX(id) FROM users));
SELECT SETVAL('user_mobiles_id_seq', (SELECT MAX(id) FROM user_mobiles));
SELECT SETVAL('user_contact_person_id_seq', (SELECT MAX(id) FROM user_contact_person));
SELECT SETVAL('user_address_id_seq', (SELECT MAX(id) FROM user_address));
SELECT SETVAL('user_emails_id_seq', (SELECT MAX(id) FROM user_emails));