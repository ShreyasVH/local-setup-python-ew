INSERT INTO client (auth_token_for_proxy, created_at, failure_email, password, updated_at, client_name, accessible_client, ip) VALUES (null, 'UTC_DATE_TIME_PLUS_1_MINUTE', 'shreyas@everwell.org', '$2a$10$8lNS9OlqXiKO5GvFnfFIsegVgLNaLiVmuWkJf55YlMp4aJSy3my7y', 'UTC_DATE_TIME_PLUS_1_MINUTE', 'abdm-client', null, null);
INSERT INTO event_client (client_id, event_id, response_type, active) VALUES ((SELECT id FROM client WHERE client_name = 'abdm-client'), (SELECT id FROM event WHERE event_name = 'abdm-add-update-consent'), 'SIMPLE_JSON_RESPONSE', true);
INSERT INTO subscriber_url (created_at, is_enabled, updated_at, url, event_client_id, request_method) VALUES ('UTC_DATE_TIME_PLUS_2_MINUTE', true, 'UTC_DATE_TIME_PLUS_2_MINUTE', 'https://my-web-hook.playframework.com/api', (SELECT id FROM event_client WHERE client_id = (SELECT id FROM client WHERE client_name = 'abdm-client') AND event_id = (SELECT id FROM event WHERE event_name = 'abdm-add-update-consent')), 'POST');
