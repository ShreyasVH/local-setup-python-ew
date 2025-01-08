CREATE SEQUENCE IF NOT EXISTS user_client_id_seq;

CREATE TABLE IF NOT EXISTS user_client( id bigint NOT NULL, created_date timestamp without time zone, event_flow_id bigint, name character varying(255) COLLATE pg_catalog."default", password character varying(255) COLLATE pg_catalog."default", CONSTRAINT user_client_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS users_id_seq;

CREATE TABLE IF NOT EXISTS users( id bigint NOT NULL, added_by bigint, added_by_type character varying(30) COLLATE pg_catalog."default", address text COLLATE pg_catalog."default", city character varying(100) COLLATE pg_catalog."default", client_id bigint, created_at timestamp without time zone, data_consent boolean NOT NULL DEFAULT false, date_of_birth date, deleted_at timestamp without time zone, deleted_by bigint, deleted_by_type character varying(30) COLLATE pg_catalog."default", father_name character varying(255) COLLATE pg_catalog."default", first_name character varying(255) COLLATE pg_catalog."default", gender character varying(20) COLLATE pg_catalog."default", height integer, is_deleted boolean, key_population character varying COLLATE pg_catalog."default", language character varying(30) COLLATE pg_catalog."default", last_name character varying(255) COLLATE pg_catalog."default", marital_status character varying(64) COLLATE pg_catalog."default", occupation character varying(255) COLLATE pg_catalog."default", pincode integer, socio_economic_status character varying(64) COLLATE pg_catalog."default", updated_at timestamp without time zone, weight integer, CONSTRAINT users_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS user_emails_id_seq;

CREATE TABLE IF NOT EXISTS user_emails( id bigint NOT NULL, created_at timestamp without time zone, email_id character varying(255) COLLATE pg_catalog."default", is_primary boolean, is_verified boolean, stopped_at timestamp without time zone, updated_at timestamp without time zone, user_id bigint, CONSTRAINT user_emails_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS user_mobiles_id_seq;

CREATE TABLE IF NOT EXISTS user_mobiles( id bigint NOT NULL, created_at timestamp without time zone, is_primary boolean, is_verified boolean, "number" character varying(15) COLLATE pg_catalog."default", stopped_at timestamp without time zone, updated_at timestamp without time zone, user_id bigint, CONSTRAINT user_mobiles_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS user_contact_person_id_seq;

CREATE TABLE IF NOT EXISTS user_contact_person( id bigint NOT NULL DEFAULT nextval('user_contact_person_id_seq'::regclass), address character varying(255) COLLATE pg_catalog."default", name character varying(255) COLLATE pg_catalog."default", phone character varying(255) COLLATE pg_catalog."default", user_id bigint, CONSTRAINT user_contact_person_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS user_address_id_seq;

CREATE TABLE IF NOT EXISTS user_address( id bigint NOT NULL DEFAULT nextval('user_address_id_seq'::regclass), area character varying(255) COLLATE pg_catalog."default", landmark character varying(255) COLLATE pg_catalog."default", taluka character varying(255) COLLATE pg_catalog."default", town character varying(255) COLLATE pg_catalog."default", user_id bigint, ward character varying(255) COLLATE pg_catalog."default", CONSTRAINT user_address_pkey PRIMARY KEY (id));

CREATE SEQUENCE IF NOT EXISTS verifications_id_seq;

CREATE TABLE IF NOT EXISTS verifications( id bigint NOT NULL DEFAULT nextval('verifications_id_seq'::regclass), created_at timestamp without time zone, entity_type character varying(25) COLLATE pg_catalog."default", entity_value character varying(25) COLLATE pg_catalog."default", stopped_at timestamp without time zone, transaction_id character varying(50) COLLATE pg_catalog."default", type character varying(25) COLLATE pg_catalog."default", user_id bigint, CONSTRAINT verifications_pkey PRIMARY KEY (id));

create index if not exists idx_user_id_stopped_at on verifications (user_id, stopped_at);

CREATE SEQUENCE IF NOT EXISTS external_ids_id_seq;

CREATE TABLE IF NOT EXISTS external_ids( id bigint NOT NULL DEFAULT nextval('external_ids_id_seq'::regclass), created_at timestamp without time zone, type character varying(25) COLLATE pg_catalog."default", user_id bigint, value character varying(25) COLLATE pg_catalog."default", CONSTRAINT external_ids_pkey PRIMARY KEY (id));

create index if not exists idx_type_value_external_ids on external_ids (type,value);
create index if not exists idx_user_id on external_ids (user_id);

create table if not exists vital( id bigserial constraint vital_pkey primary key, contains_associations boolean not null default false, critical_high_value real, critical_low_value real, high_value real, low_value real, name varchar(255), unit_of_measurement varchar(255));

create table if not exists user_vital_goal( id bigserial constraint user_vital_pkey primary key, end_date timestamp, start_date timestamp, user_id bigint, value real, vital_id bigint);

create index if not exists idx_userid_vitalid_uservitalgoal on user_vital_goal (user_id, vital_id);


create table if not exists user_relation( id bigserial constraint user_relation_pkey primary key, primary_user_id bigint, secondary_user_id bigint, status int, relation varchar(255), role varchar(255), nickname varchar(255), emergency_contact boolean not null default false);

create index if not exists user_relation_primary_secondary on user_relation (primary_user_id, secondary_user_id);
create index if not exists user_relation_primary_status on user_relation (primary_user_id, status);

ALTER TABLE user_relation DROP CONSTRAINT IF EXISTS fk_primary_user_id;
ALTER TABLE user_relation ADD CONSTRAINT fk_primary_user_id FOREIGN KEY(primary_user_id) REFERENCES users(id);

ALTER TABLE user_relation DROP CONSTRAINT IF EXISTS fk_secondary_user_id;
ALTER TABLE user_relation ADD CONSTRAINT fk_secondary_user_id FOREIGN KEY(secondary_user_id) REFERENCES users(id);

