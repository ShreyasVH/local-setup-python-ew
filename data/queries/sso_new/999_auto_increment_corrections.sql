SELECT SETVAL('client_token_entity_id_seq', (SELECT MAX(id) FROM client_token_entity));
SELECT SETVAL('sso_user_id_seq', (SELECT MAX(id) FROM sso_user));