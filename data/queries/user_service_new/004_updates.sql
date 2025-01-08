CREATE TABLE abdm_consent_details( id bigserial NOT NULL, consent_id varchar(255) NULL, created_at timestamp NULL, json_data varchar(5000) NULL, updated_at timestamp NULL, CONSTRAINT abdm_consent_details_pkey PRIMARY KEY (id));

alter table abdm_consent_details add column if not exists user_id bigint;

alter table abdm_consent_details add column if not exists consent_type varchar(255);

create table if not exists user_medical_records( id bigserial constraint user_medical_records_pkey primary key, consent_artefact_id varchar(255), consent_request_id varchar(255), transaction_id varchar(255), hip_nonce varchar(255), hip_public_key varchar(255), hiu_private_key varchar(255), encrypted_json varchar(5000), created_at timestamp, updated_at timestamp);

create index if not exists idx_consent_request_id_user_medical_records on user_medical_records (consent_request_id);

CREATE INDEX CONCURRENTLY IF NOT Exists users_created_at_updated_at ON users USING btree (created_at, updated_at);

alter table user_mobiles add owner varchar(255);