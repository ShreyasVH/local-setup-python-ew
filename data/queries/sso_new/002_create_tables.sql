CREATE SEQUENCE IF NOT EXISTS client_token_entity_id_seq;

CREATE TABLE IF NOT EXISTS client_token_entity( id bigint NOT NULL DEFAULT nextval('client_token_entity_id_seq'::regclass), access_token character varying(255) COLLATE pg_catalog."default", base_url character varying(255) COLLATE pg_catalog."default", client_name character varying(255) COLLATE pg_catalog."default", created_at timestamp without time zone, next_refresh bigint, password character varying(255) COLLATE pg_catalog."default", referer_text character varying(255) COLLATE pg_catalog."default", referer_url character varying(255) COLLATE pg_catalog."default", updated_at timestamp without time zone, CONSTRAINT client_token_entity_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS sso_user_id_seq;

CREATE TABLE IF NOT EXISTS sso_user( id bigint NOT NULL DEFAULT nextval('sso_user_id_seq'::regclass), created_at timestamp without time zone, password character varying(255) COLLATE pg_catalog."default", password_last_updated timestamp without time zone, salt character varying(255) COLLATE pg_catalog."default", updated_at timestamp without time zone, user_name character varying(255) COLLATE pg_catalog."default", CONSTRAINT sso_user_pkey PRIMARY KEY (id));


CREATE SEQUENCE IF NOT EXISTS sso_session_id_seq;

CREATE TABLE IF NOT EXISTS sso_session( id bigint NOT NULL DEFAULT nextval('sso_session_id_seq'::regclass), created_at timestamp without time zone, device_id character varying(255) COLLATE pg_catalog."default", end_session timestamp without time zone, ip_address character varying(255) COLLATE pg_catalog."default", is_active boolean, last_activity_date timestamp without time zone, referrer character varying(512) COLLATE pg_catalog."default", source character varying(255) COLLATE pg_catalog."default", updated_at timestamp without time zone, user_agent character varying(255) COLLATE pg_catalog."default", sso_user_id bigint NOT NULL, CONSTRAINT sso_session_pkey PRIMARY KEY (id), CONSTRAINT fkdeb5ck2w9sxsopl13snivfuth FOREIGN KEY (sso_user_id) REFERENCES sso_user (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION);

