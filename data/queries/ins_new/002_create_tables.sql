CREATE SEQUENCE IF NOT EXISTS ins_client_id_seq;

CREATE TABLE IF NOT EXISTS ins_client( id bigint NOT NULL DEFAULT nextval('ins_client_id_seq'::regclass), event_flow_id bigint, created_date timestamp without time zone, name character varying(255) COLLATE pg_catalog."default", password character varying(255) COLLATE pg_catalog."default", CONSTRAINT ins_client_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS ins_language_id_seq;

CREATE TABLE IF NOT EXISTS ins_language( id bigint NOT NULL DEFAULT nextval('ins_language_id_seq'::regclass), language character varying(255) COLLATE pg_catalog."default", CONSTRAINT ins_language_pkey PRIMARY KEY (id));

INSERT INTO ins_language (id, language) VALUES (1, 'ENGLISH');

CREATE SEQUENCE IF NOT EXISTS ins_type_id_seq;

CREATE TABLE IF NOT EXISTS ins_type( id bigint NOT NULL DEFAULT nextval('ins_type_id_seq'::regclass), type character varying(255) COLLATE pg_catalog."default", CONSTRAINT ins_type_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS ins_vendor_id_seq;

CREATE TABLE IF NOT EXISTS ins_vendor( id bigint NOT NULL DEFAULT nextval('ins_vendor_id_seq'::regclass), config text COLLATE pg_catalog."default", credential_type character varying(255) COLLATE pg_catalog."default", credentials text COLLATE pg_catalog."default", gateway character varying(255) COLLATE pg_catalog."default", reconciliation_type text COLLATE pg_catalog."default", CONSTRAINT ins_vendor_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS ins_email_logs_id_seq;

CREATE TABLE IF NOT EXISTS ins_email_logs( id bigint NOT NULL DEFAULT nextval('ins_email_logs_id_seq'::regclass), added_on timestamp without time zone, body text COLLATE pg_catalog."default", recipient text COLLATE pg_catalog."default", sender text COLLATE pg_catalog."default", sendgrid_response text COLLATE pg_catalog."default", subject text COLLATE pg_catalog."default", template_id bigint, trigger_id bigint, vendor_id bigint, CONSTRAINT ins_email_logs_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS ins_email_template_id_seq;

CREATE TABLE IF NOT EXISTS ins_email_template( id bigint NOT NULL DEFAULT nextval('ins_email_template_id_seq'::regclass), body text COLLATE pg_catalog."default", body_parameters text COLLATE pg_catalog."default", language_id bigint, subject text COLLATE pg_catalog."default", subject_parameters text COLLATE pg_catalog."default", type_id bigint, CONSTRAINT ins_email_template_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS ins_email_trigger_id_seq;

CREATE TABLE IF NOT EXISTS ins_email_trigger( id bigint NOT NULL DEFAULT nextval('ins_email_trigger_id_seq'::regclass), parameters text COLLATE pg_catalog."default", template_id bigint, trigger text COLLATE pg_catalog."default", trigger_name text COLLATE pg_catalog."default", CONSTRAINT ins_email_trigger_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS ins_engagement_id_seq;

CREATE TABLE IF NOT EXISTS ins_engagement( id bigint NOT NULL DEFAULT nextval('ins_engagement_id_seq'::regclass), consent boolean, entity_id character varying COLLATE pg_catalog."default", language_id bigint, "time" time without time zone, type_id bigint, CONSTRAINT ins_engagement_pkey PRIMARY KEY (id), CONSTRAINT fk_lang FOREIGN KEY (language_id) REFERENCES ins_language (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT fk_type FOREIGN KEY (type_id) REFERENCES ins_type (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION);

CREATE SEQUENCE IF NOT EXISTS ins_pn_logs_id_seq;

CREATE TABLE IF NOT EXISTS ins_pn_logs( id bigint NOT NULL DEFAULT nextval('ins_pn_logs_id_seq'::regclass), added_on timestamp without time zone, device_id text COLLATE pg_catalog."default", entity_id character varying(255) COLLATE pg_catalog."default", firebase_response text COLLATE pg_catalog."default", message character varying(255) COLLATE pg_catalog."default", status character varying(255) COLLATE pg_catalog."default", template_id bigint, trigger_id bigint, vendor_id bigint, CONSTRAINT ins_pn_logs_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS ins_pn_template_id_seq;

CREATE TABLE IF NOT EXISTS ins_pn_template( id bigint NOT NULL DEFAULT nextval('ins_pn_template_id_seq'::regclass), class_intent text COLLATE pg_catalog."default", content text COLLATE pg_catalog."default", content_parameters text COLLATE pg_catalog."default", heading text COLLATE pg_catalog."default", heading_parameters text COLLATE pg_catalog."default", image bytea, intent_extras text COLLATE pg_catalog."default", language_id bigint, time_to_live bigint, type_id bigint, CONSTRAINT ins_pn_template_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS ins_template_id_seq;

CREATE TABLE IF NOT EXISTS ins_template( id bigint NOT NULL DEFAULT nextval('ins_template_id_seq'::regclass), content text COLLATE pg_catalog."default", language_id bigint, parameters text COLLATE pg_catalog."default", type_id bigint, unicode boolean DEFAULT false, CONSTRAINT ins_template_pkey PRIMARY KEY (id), CONSTRAINT fk_lang FOREIGN KEY (language_id) REFERENCES ins_language (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT fk_type FOREIGN KEY (type_id) REFERENCES ins_type (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION);

CREATE SEQUENCE IF NOT EXISTS ins_sms_logs_id_seq;

CREATE TABLE IF NOT EXISTS ins_sms_logs( id bigint NOT NULL DEFAULT nextval('ins_sms_logs_id_seq'::regclass), added_on timestamp without time zone, api_response text COLLATE pg_catalog."default", entity_id character varying COLLATE pg_catalog."default", message text COLLATE pg_catalog."default", message_id character varying(255) COLLATE pg_catalog."default", phone_number character varying(255) COLLATE pg_catalog."default", status character varying(255) COLLATE pg_catalog."default", template_id bigint, trigger_id bigint, vendor_id bigint, CONSTRAINT ins_sms_logs_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS ins_pn_trigger_id_seq;

CREATE TABLE IF NOT EXISTS ins_pn_trigger( id bigint NOT NULL DEFAULT nextval('ins_pn_trigger_id_seq'::regclass), parameters text COLLATE pg_catalog."default", template_id bigint, trigger text COLLATE pg_catalog."default", trigger_name text COLLATE pg_catalog."default", CONSTRAINT ins_pn_trigger_pkey PRIMARY KEY (id), CONSTRAINT fk_type FOREIGN KEY (template_id) REFERENCES ins_pn_template (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION);

CREATE SEQUENCE IF NOT EXISTS ins_template_map_id_seq;

CREATE TABLE IF NOT EXISTS ins_template_map( id bigint NOT NULL DEFAULT nextval('ins_template_map_id_seq'::regclass), template_id bigint, vendor_template_id character varying(255) COLLATE pg_catalog."default", CONSTRAINT ins_template_map_pkey PRIMARY KEY (id), CONSTRAINT fk_type FOREIGN KEY (template_id) REFERENCES ins_template (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION);

CREATE SEQUENCE IF NOT EXISTS ins_trigger_id_seq;

CREATE TABLE IF NOT EXISTS ins_trigger( id bigint NOT NULL DEFAULT nextval('ins_trigger_id_seq'::regclass), parameters text COLLATE pg_catalog."default", template_id bigint, trigger text COLLATE pg_catalog."default", trigger_name text COLLATE pg_catalog."default", CONSTRAINT ins_trigger_pkey PRIMARY KEY (id), CONSTRAINT fk_type FOREIGN KEY (template_id) REFERENCES ins_template (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION);

create table if not exists episode_notification( id bigserial not null constraint episode_notification_pkey primary key, pn_log_id bigint, client_id bigint, created_on timestamp, read boolean not null default false, status varchar, extras jsonb);
create index if not exists episode_notification_pn_log_id_client_id on episode_notification(pn_log_id, client_id);
create index if not exists ins_pn_logs_entity_id on ins_pn_logs(entity_id);


