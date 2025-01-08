ALTER TABLE client DROP CONSTRAINT if exists client_fk_default_deployment_id;

ALTER TABLE client ADD CONSTRAINT client_fk_default_deployment_id FOREIGN KEY(default_deployment_id) REFERENCES deployment(id);

ALTER TABLE client ADD if not exists share_merm_event boolean DEFAULT false;

ALTER TABLE client ADD if not exists external_episode_enabled boolean DEFAULT false;

ALTER TABLE deployment ADD registry_enabled boolean DEFAULT false;

alter table client add column if not exists smart_payments_client_id text;
alter table client add column if not exists smart_payments_client_secret text;

ALTER TABLE user_access ADD if not exists view_only boolean DEFAULT false;
ALTER TABLE user_access ADD if not exists can_delete_patients boolean DEFAULT false;

create table if not exists contracts( id uuid not null constraint contracts_pkey primary key, state varchar(255), district varchar(255), contract_number bigint, reporting_unit_id varchar(255), name_of_partnership varchar(255), contract_reference_id varchar(255), signed_date timestamp, operation_start_date timestamp, expected_operation_start_date timestamp, operation_start_date_penalty bigint, ineligible_claim_penalty bigint, yearly_mou_cost bigint, is_manual_verification_required boolean default false, manual_verification_percent integer, is_advance_paid boolean default false, paid_advance_amount bigint, end_date timestamp, renewal_date timestamp, invoicing_period integer, authorisation_rule integer, payment_date timestamp, created_at timestamp, created_by_id bigint constraint "FK_contracts.created_by_id" references user_access, updated_at timestamp, updated_by_id bigint constraint "FK_contracts.updated_by_id" references user_access, deleted_at timestamp, deleted_by_id bigint constraint "FK_contracts.deleted_by_id" references user_access);

create table if not exists contract_hierarchy_map( id bigserial primary key, contract_id uuid, state_id bigint constraint "FK_contracts.state_hierarchy_id" references hierarchy, district_id bigint constraint "FK_contracts.district_hierarchy_id" references hierarchy, reporting_unit_id varchar(255), hierarchy_id bigint constraint "FK_contracts.hierarchy_id" references hierarchy);

ALTER TABLE sidebar_permission ADD COLUMN if NOT EXISTS hierarchy_type varchar;

create index if not exists sidebar_permission_deployment_id_hierarchy_type_designation_is_active on sidebar_permission (deployment_id, hierarchy_type, designation, is_active);

ALTER TABLE user_access ADD if not exists visible boolean DEFAULT true;
ALTER TABLE staff ADD if not exists visible boolean DEFAULT true;

CREATE INDEX idx_deployment_task_list_id ON task_list_filter_map(deployment_task_list_id);

CREATE INDEX idx_deployment_id ON deployment_task_list(deployment_id);

CREATE INDEX idx_task_deployment ON deployment_task_list(task_list_id, deployment_id);

drop index if exists hierarchy_level_5_id;

ALTER TABLE user_access ADD COLUMN if NOT EXISTS can_delete_patients boolean DEFAULT true;

ALTER TABLE user_access ADD COLUMN if NOT EXISTS restricted_view boolean DEFAULT false;

ALTER TABLE hierarchy_associations DROP CONSTRAINT if exists hierarchy_associations_fk_hierarchy_id;
ALTER TABLE hierarchy_associations DROP CONSTRAINT if exists hierarchy_associations_fk_association_id;
ALTER TABLE hierarchy_config_map DROP CONSTRAINT if exists hierarchy_config_map_fk_hierarchy_id;
ALTER TABLE hierarchy_config_map DROP CONSTRAINT if exists hierarchy_config_map_fk_config_mapping_id;
ALTER TABLE user_access DROP CONSTRAINT if exists user_access_fk_hierarchy_id;
ALTER TABLE user_access_hierarchy_map DROP CONSTRAINT if exists user_access_hierarchy_map_fk_hierarchy_mapping;
ALTER TABLE user_access_hierarchy_map DROP CONSTRAINT if exists user_access_hierarchy_map_fk_userid;
ALTER TABLE client DROP CONSTRAINT if exists client_fk_default_deployment_id;

CREATE INDEX idx_trigger_hierarchy_id_event_name_client_id_cron_time_active ON trigger(hierarchy_id, event_name, client_id, cron_time, active);

Alter table contract_hierarchy_map Drop column IF EXISTS state_id;
Alter table contract_hierarchy_map Drop column IF EXISTS district_id;
Create table if not exists contract_staff_map( id bigserial primary key, contract_id uuid constraint "FK_contract_staff_map.contractId" references contracts, staff_id bigint constraint "FK_contract_staff_map.staffId" references staff, created_by bigint constraint "FK_contract_staff_map.createdBy" references user_access, created_on timestamp);
alter table contracts add column if not exists total_mou_cost bigint;



create table if not exists hierarchy_request_logs( id bigserial not null, request_data text, user_email varchar(255), created_at timestamp, primary key (id));

alter table hierarchy_config_map alter column value type text;

ALTER TABLE deployment ADD COLUMN IF NOT EXISTS base_url VARCHAR(255);

CREATE TABLE IF NOT EXISTS hierarchy_AUD( id bigint not null, REV integer not null, REVTYPE smallint, active boolean not null, client_id bigint, code varchar(255), created_at timestamp, deployment_id bigint, end_date timestamp, has_children boolean not null, level bigint, level_1_code varchar(255), level_1_id bigint, level_1_name varchar(255), level_1_type varchar(255), level_2_code varchar(255), level_2_id bigint, level_2_name varchar(255), level_2_type varchar(255), level_3_code varchar(255), level_3_id bigint, level_3_name varchar(255), level_3_type varchar(255), level_4_code varchar(255), level_4_id bigint, level_4_name varchar(255), level_4_type varchar(255), level_5_code varchar(255), level_5_id bigint, level_5_name varchar(255), level_5_type varchar(255), level_6_code varchar(255), level_6_id bigint, level_6_name varchar(255), level_6_type varchar(255), merge_status varchar(255), name varchar(255), parent_id bigint, start_date timestamp, type varchar(255), updated_at timestamp, geolocation geography, primary key (id, REV));
CREATE SEQUENCE if not exists hibernate_sequence START 1;
create table if not exists REVINFO( REV integer generated by default as identity, REVTSTMP bigint, primary key (REV));

CREATE TABLE IF NOT EXISTS hierarchy_associations_AUD( id bigint not null, REV integer not null, REVTYPE smallint, value text, primary key (id, REV));

ALTER TABLE IF EXISTS hierarchy_associations ADD COLUMN IF NOT EXISTS created_at timestamp;

ALTER TABLE IF EXISTS hierarchy_associations ADD COLUMN IF NOT EXISTS updated_at timestamp;

CREATE TABLE IF NOT EXISTS deployment_config_map( id bigserial not null, deployment_id bigint, config_mapping_id bigint, value text, active boolean DEFAULT true, created_at timestamp, updated_at timestamp, primary key (id));

create table if not exists engagement( id bigserial not null, hierarchy_id bigint, default_lang bigint, default_time text, languages text, dose_timings text, consent_mandatory boolean, disabled_languages text, notification_type text, primary key (id));

ALTER TABLE deployment ADD COLUMN IF NOT EXISTS client_id bigint;

update deployment set client_id = (SELECT id FROM client WHERE name = 'Hub') WHERE code = 'UNK';
update deployment set client_id = (SELECT id FROM client WHERE name = 'Nikshay') WHERE code = 'IND';

CREATE TABLE IF NOT EXISTS deployment_config_map_AUD( id bigint not null, REV integer not null, REVTYPE smallint, active boolean, value text, primary key (id, REV));

