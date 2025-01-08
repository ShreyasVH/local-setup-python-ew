CREATE TABLE IF NOT EXISTS iam_adhtech (id bigint NOT NULL, created_date date, name character varying(255) COLLATE pg_catalog."default", CONSTRAINT iam_adhtech_pkey PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS iam_caccess (id bigint NOT NULL, access_token character varying(255) COLLATE pg_catalog."default", created_date timestamp without time zone, event_flow_id bigint, name character varying(255) COLLATE pg_catalog."default", next_refresh bigint, password character varying(255) COLLATE pg_catalog."default", updated_date timestamp without time zone, CONSTRAINT iam_caccess_pkey PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS iam_schedule (id bigint NOT NULL, scheduletype_id bigint, value character varying(255) COLLATE pg_catalog."default", CONSTRAINT iam_schedule_pkey PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS iam_schedule_type (id bigint NOT NULL, created_date date, name character varying(255) COLLATE pg_catalog."default", CONSTRAINT iam_schedule_type_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS iam_access_mapping_id_seq;

CREATE TABLE IF NOT EXISTS iam_access_mapping( id bigint NOT NULL DEFAULT nextval('iam_access_mapping_id_seq'::regclass), active boolean, client_id bigint, entity_id character varying(255) COLLATE pg_catalog."default", iam_id bigint, CONSTRAINT iam_access_mapping_pkey PRIMARY KEY (id));

create index if not exists iam_access_mapping_iam_id_client_id_active_idx on iam_access_mapping (iam_id, client_id, active);

CREATE SEQUENCE IF NOT EXISTS iam_adhstring_log_id_seq;

CREATE TABLE IF NOT EXISTS iam_adhstring_log( id bigint NOT NULL DEFAULT nextval('iam_adhstring_log_id_seq'::regclass), created_date date, iam_id bigint, record_date timestamp without time zone, updated_date timestamp without time zone, value character(1) COLLATE pg_catalog."default", CONSTRAINT iam_adhstring_log_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS iam_call_logs_id_seq;

CREATE TABLE IF NOT EXISTS iam_call_logs( id bigint NOT NULL DEFAULT nextval('iam_call_logs_id_seq'::regclass), added_on timestamp without time zone, caller character varying(255) COLLATE pg_catalog."default", client_time timestamp without time zone, number_dialled character varying(255) COLLATE pg_catalog."default", post_body character varying(255) COLLATE pg_catalog."default", CONSTRAINT iam_call_logs_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS iam_imei_map_id_seq;

CREATE TABLE IF NOT EXISTS iam_imei_map( id bigint NOT NULL DEFAULT nextval('iam_imei_map_id_seq'::regclass), created_date timestamp without time zone, iam_id bigint, imei character varying(255) COLLATE pg_catalog."default", start_date timestamp without time zone, stop_date timestamp without time zone, CONSTRAINT iam_imei_map_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS iam_merm_logs_id_seq;

CREATE TABLE IF NOT EXISTS iam_merm_logs( id bigint NOT NULL DEFAULT nextval('iam_merm_logs_id_seq'::regclass), client_time timestamp without time zone, created_date timestamp without time zone, imei character varying(255) COLLATE pg_catalog."default", CONSTRAINT iam_merm_logs_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS iam_phone_map_id_seq;

CREATE TABLE IF NOT EXISTS iam_phone_map( id bigint NOT NULL DEFAULT nextval('iam_phone_map_id_seq'::regclass), added_on timestamp without time zone, iam_id bigint, phone_number character varying(255) COLLATE pg_catalog."default", stop_date timestamp without time zone, CONSTRAINT iam_phone_map_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS iam_registration_id_seq;

CREATE TABLE IF NOT EXISTS iam_registration( id bigint NOT NULL DEFAULT nextval('iam_registration_id_seq'::regclass), adtech_id bigint, adh_string text COLLATE pg_catalog."default", created_date timestamp without time zone, end_date timestamp without time zone, last_dosage timestamp without time zone, last_missed_dosage timestamp without time zone, scheduletype_id bigint, start_date timestamp without time zone, unique_identifier character varying(255) COLLATE pg_catalog."default", updated_date timestamp without time zone, CONSTRAINT iam_registration_pkey PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS iam_schedule_map( id bigint NOT NULL, active boolean, created_date timestamp without time zone, end_date timestamp without time zone, first_dose_offset bigint, iam_id bigint, negative_sensitivity bigint, positive_sensitivity bigint, schedule_id bigint, start_date timestamp without time zone, CONSTRAINT iam_schedule_map_pkey PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS video_entity_mapping( id bigint NOT NULL, iam_id bigint, status integer, upload_date timestamp without time zone, video_id character varying(255) COLLATE pg_catalog."default", CONSTRAINT video_entity_mapping_pkey PRIMARY KEY (id));

create table if not exists iam_schedule_time_map( id bigserial not null constraint iam_schedule_time_map_pkey primary key, created_date date, active boolean not null default false, schedule_map_id bigint, FOREIGN KEY (schedule_map_id) REFERENCES iam_schedule_map(id), dose_time TIME not null);